void from_sprite(unsigned int * start, unsigned int * end, unsigned int key) {
    while (start < end) {
        if (*start == key)
            *start = 0x00000000;
        start++;
    }
}