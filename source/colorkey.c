void colorkey(unsigned int * Scan0, unsigned int size, unsigned int key) {
    unsigned int * start = Scan0;
    unsigned int * end = Scan0 + size;
    while (start < end) {
        if (*start == key)
            *start = 0x00000000;
        start++;
    }
}