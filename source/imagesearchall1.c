unsigned int imagesearchall1(unsigned int ** result, unsigned int capacity, unsigned int * start, unsigned int width, unsigned int height, unsigned int * s, unsigned int w, unsigned int h) {
    // width, height, start, current, end refer to the haystack (main image)
    // x, y, w, h, s, c, e refer to the needle (search image)
    unsigned int count = 0;
    unsigned int * current = start;
    unsigned int * end = start + width * (height - h); // Remaining area must be greater than search height

    int range_x = width - w;
    int range_y = height - h; // optimized away

    int x, y, offset;
    unsigned int * c;
    unsigned int * e;
    unsigned int * p;

    // Start off searching with pointers.
    while (current < end) {

        // Check if the current pixel matches the first pixel of subimage.
        if (*current == *s || *((unsigned char *) s + 3) == 0) { // just continue if search image is transparent

            // Convert current pointer to (x, y).
            offset = current - start;
            x = offset % width;
            y = offset / width; // optimized away

            // Check if (x, y) exceeds bounds.
            if (x > range_x) // range_y check is done above
                goto next;

            // Subimage loop.
            c = s;
            for (int i = 0; i < h; i++) {
                p = current + width * i;
                e = c + w;
                while (c < e) {
                    if (*((unsigned char *) c + 3)) { // skip transparent pixels in search image
                        if (*c != *p)
                            goto next;
                    }
                    c++; // Here simply incrementing will interate the entire image
                    p++; // Will be reset each run
                }
            }
                
            // Found matching image!
            if (count < capacity)
                *(result + count) = current;
            count++;
        }
        next:
        current++;
    }
    return count;
}