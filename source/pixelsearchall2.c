unsigned int pixelsearchall2(unsigned int ** result, unsigned int capacity, unsigned int * start, unsigned int * end, unsigned char rh, unsigned char rl, unsigned char gh, unsigned char gl, unsigned char bh, unsigned char bl) {
    unsigned int count = 0;
    unsigned char r, g, b;
    while (start < end) {
        r = *((unsigned char *) start + 2);
        g = *((unsigned char *) start + 1);
        b = *((unsigned char *) start + 0);
        if (rh >= r && r >= rl && gh >= g && g >= gl && bh >= b && b >= bl) {
            if (count < capacity)
                *(result + count) = start;
            count++;
        }
        start++;
    }
    return count;
}