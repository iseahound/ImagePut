unsigned int * pixelsearch3(unsigned int * start, unsigned int * end, unsigned int * colors, unsigned int length) {
    while (start < end) {
        for (int i = 0; i < length; i++)
            if (*start == colors[i])
                return start;
        start++;
    }
    return start; // start == end if no match.
}