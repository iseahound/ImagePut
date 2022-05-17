unsigned int * pixelsearch(unsigned int * start, unsigned int * end, unsigned int color) {
    while (start < end) {
        if (*start == color)
            return start;
        start++;
    }
    return end;
}
