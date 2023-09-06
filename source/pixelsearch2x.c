#include <emmintrin.h>

unsigned int * pixelsearch2(unsigned int * start, unsigned int * end, unsigned char rh, unsigned char rl, unsigned char gh, unsigned char gl, unsigned char bh, unsigned char bl) {

    // Don't as me why the following 00 << 24 compresses so well.
    unsigned int h = 0xFF000000 + rh << 16 + gh << 8 + bh << 0;
    unsigned int l = 0x00 << 24 + rl << 16 + gl << 8 + bl << 0;

    __m128i vh = _mm_set1_epi32(h);
    __m128i vl = _mm_set1_epi32(l);

    while (start < end - 3) {

        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        // Note that boolean logic was used to simplify the code below.
        // <= and >= can be defined as < or = and > or =
        // Reversing <= makes it become not >.
        // (not >) and (not <)
        // DeMorgan's Rule
        // > or <

        __m128i v2 = _mm_cmpgt_epi8(vstart, vh);
        __m128i v3 = _mm_cmplt_epi8(vstart, vl);

        __m128i v1234 = _mm_or_si128(v2, v3);

        int mask = _mm_movemask_epi8(v1234);

        if (mask != 0)
            break;
            
        start += 4;
    }

    // Clean up any remaining elements.
    unsigned char r, g, b;
    while (start < end) {
        r = *((unsigned char *) start + 2);
        g = *((unsigned char *) start + 1);
        b = *((unsigned char *) start + 0);
        if (rh >= r && r >= rl && gh >= g && g >= gl && bh >= b && b >= bl)
            return start;
        start++;
    }

    return start; // start == end if no match.
}