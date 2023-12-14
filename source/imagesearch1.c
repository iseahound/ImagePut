unsigned int * imagesearch1(unsigned int * start, unsigned int width, unsigned int height, unsigned int * s, unsigned int w, unsigned int h, unsigned int x, unsigned int y) {
    // width, height, start, current, end refer to the haystack (main image)
    // x, y, w, h, s, c, e refer to the needle (search image)

    // Colors to be matched.
    // c1 — c2
    // |     |
    // c3 — c4
    unsigned int c1 = *(s);
    unsigned int c2 = *(s + x);
    unsigned int c3 = *(s + y * w);
    unsigned int c4 = *(s + x + y * w);

    // Search up to the first row of the remaining height. 
    unsigned int * end = start + width * (height - h + 1); // y_domain
    unsigned int * current = start;
    unsigned int x_domain = width - w;

    // Start off searching with pointers.
    while (current < end) {

        unsigned int offset = current - start; // Don't need to divide by 4 here.
        unsigned int left = offset % width;
        unsigned int top = offset / width; // optimized away

        // Checks before subimage loop.
        if (c4 == *(current + x + y * width) // Rank 1 - Focused Pixel
        && (c1 == *(current))                // Rank 3 - First Pixel
        && (left <= x_domain)                // Rank 2 - X-Range Check (Note: Assembly says this is 2nd)
        // && c2 == *(current + x)
        // && c3 == *(current + y * width)
        ) {

            // Subimage loop.
            unsigned int * c = s;
            for (int i = 0; i < h; i++) {
                unsigned int * p = current + width * i;
                unsigned int * e = c + w;
                while (c < e) {
                    if (*((unsigned char *) c + 3)) { // Skip transparent pixels
                        if (*c != *p)
                            goto next;
                    }
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