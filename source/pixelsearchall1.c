unsigned int pixelsearchall1(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int color) {
    unsigned int count = 0;
    while (start < end) {
        if (*start == color) {
            if (count < limit)
                *(result + count) = start;
            count++;
        }
        start++;
    }
    return count;
}