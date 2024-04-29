void transcolor(unsigned int * start, unsigned int * end, unsigned int color, unsigned char alpha) {
    while (start < end) {
        if ((*start & 0xFFFFFF) == (color & 0xFFFFFF))
            *((unsigned char *) start + 3) = alpha;
        start++;
    }
}
