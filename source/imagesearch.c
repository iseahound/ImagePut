unsigned int * imagesearch(unsigned int * Scan0, unsigned int width, unsigned int height, unsigned int * image, unsigned int w, unsigned int h) {
    unsigned int * start = Scan0;
    unsigned int * end = Scan0 + width * height;

    // Start off searching with pointers.
    while (start < end) {

        int x, y, offset;
        int max_w = width - w;
        int max_h = height - h;
        unsigned int * s;
        unsigned int * e;
        unsigned int * current;

        // Dereference pointers to check first pixel of subimage.
        if (*start == *image) {
            // Convert pointer to (x, y).
            offset = start - Scan0;
            x = offset % width;
            y = offset / width;

            // Subimage loop.
            current = start;
            s = image;
            e = image + w;

            // Check if (x, y) exceeds bounds.
            if (x < max_w && y < max_h) {
                for (int i = 0; i < h; i++) {
                    while (s < e) {
                        if (*s != *current)
                            goto next;
                        current++;
                        s++;
                    }
                    current += height;
                    s += h;
                }
                return start;
            }
        }
        next:
        start++;
    }
    return end;
}
