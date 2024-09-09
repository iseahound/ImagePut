// 0.5x slower. Searches for a range of pixels from a list.
unsigned int * pixelsearch4(unsigned int * start, unsigned int * end, unsigned int * high, unsigned int * low, unsigned int length) {
    unsigned char r, g, b, rh, gh, bh, rl, gl, bl;
    while (start < end) {

        r = *((unsigned char *) start + 2);
        g = *((unsigned char *) start + 1);
        b = *((unsigned char *) start + 0);

        for (int i = 0; i < length; i++) {

            rh = *((unsigned char *) high + 4*i + 2);
            gh = *((unsigned char *) high + 4*i + 1);
            bh = *((unsigned char *) high + 4*i + 0);
            rl = *((unsigned char *) low + 4*i + 2);
            gl = *((unsigned char *) low + 4*i + 1);
            bl = *((unsigned char *) low + 4*i + 0);

            if (rh >= r && r >= rl && gh >= g && g >= gl && bh >= b && b >= bl)
                return start;
        }
        start++;
    }
    return start; // start == end if no match.
}