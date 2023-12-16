unsigned int * imagesearch1(unsigned int * start, unsigned int width, unsigned int height, unsigned int * s, unsigned int w, unsigned int h, unsigned int x, unsigned int y) {
    // source: left, top, width, height, start, current, end refer to the haystack (main image)
    // target: x, y, w, h, s, c, e refer to the needle (search or template image)

    int trans = (*((unsigned char *) s + 3) == 0);  // Check if top-left pixel is transparent

    unsigned int c1 = *(s);                         // ↓ Top-left pixel
    unsigned int c2 = *(s + x);                     // c1 — c2
    unsigned int c3 = *(s + y * w);                 // |     |
    unsigned int c4 = *(s + x + y * w);             // c3 — c4 ← Focused pixel

    unsigned int x_domain = width - w;              // Avoid search of the narrow edge on the right-hand side
    unsigned int y_domain = height - h + 1;         // Add 1 to search at least one row

    unsigned int * end = start + width * y_domain;  // Remaining area must be greater than search height
    unsigned int * current = start;

    // Start off searching with pointers.
    while (current < end) {

        unsigned int offset = current - start;      // Don't need to divide by 4 here.
        unsigned int left = offset % width;         // Get x coordinate of source image
        unsigned int top = offset / width;          // optimized away

        // Rank Reasoning
        // 1. The focused pixel has the most entropy and is least likely to match the source.
        //    CANNOT BE TRANSPARENT.
        // 2. The top-left pixel may match the source.
        // 3. The x-domain check determines if the match is too far to the right.
        //    Advancing the pointer by w - 1 makes little difference.
        if (c4 == *(current + x + y * width))       // Rank 1 - Focused Pixel
        if (trans || c1 == *(current))              // Rank 2 - Top-left Pixel
        if (left <= x_domain)                       // Rank 3 - X-Domain Check
        {
            // Subimage matching loop.
            unsigned int * c = s;
            for (int i = 0; i < h; i++) {
                unsigned int * p = current + width * i;
                unsigned int * e = c + w;
                while (c < e) {                     // Scan line-by-line
                    if (*((unsigned char *) c + 3)) // Skip transparent pixels
                        if (*c != *p)
                            goto next;

                    c++; // Iterate over the template image
                    p++; // Reset pointer for each scanline
                }
            }
            return current;
        }

        next:
        current++;
    }

    return start + width * height; // real end
}