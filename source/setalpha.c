void setalpha(unsigned int * start, unsigned int * end, unsigned char alpha) {
    while (start < end) {
        *((char *) start + 3) = alpha;
        start++;
    }
}
