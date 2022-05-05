void colorkey(unsigned int * start, unsigned int * end, unsigned int key, unsigned int value) {
    while (start < end) {
        if (*start == key)
            *start = value;
        start++;
    }
}