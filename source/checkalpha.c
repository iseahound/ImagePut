int checkalpha(unsigned int * start, unsigned int * end) {
    while (start < end) {
        if (*((char *) start + 3) > 0)
            return 1;
        start++;
    }
    return 0;
}
