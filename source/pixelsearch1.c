unsigned int * pixelsearch1(unsigned int * start, unsigned int * end, unsigned int color) {
    while (start < end) {
        if (*start == color)
            return start;
        start++;
    }
    return start; // start == end if no match.
}