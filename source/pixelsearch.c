unsigned int * pixelsearch(unsigned int * start, unsigned int * end, unsigned int color) {
    unsigned int * current = start;
    while (current < end) {
        if (*current == color)
            return current;
        current++;
    }
    return end;
}