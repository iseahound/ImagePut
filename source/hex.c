#include <stdio.h>

void hex(char * hex, unsigned char * bin, size_t size, char * str, size_t length) {
    unsigned char * start = bin;
    unsigned char * end = bin + size;
    char high, low;
    char * s = str;

    while(start < end) {
        high = (*start >> 4) & 0xF;
        *s = *(hex + high);
        low = *start & 0xF;
        *(s + 1) = *(hex + low);
        start += 1;
        s += 2;
    }
}