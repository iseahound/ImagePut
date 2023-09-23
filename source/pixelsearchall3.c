unsigned int pixelsearchall3(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int * colors, unsigned int length) {
    unsigned int count = 0;
    while (start < end) {
        for (int i = 0; i < length; i++)
            if (*start == colors[i]) {
                if (count < limit)
                    *(result + count) = start;
                count++;
            }
        start++;
    }
    return count;
}