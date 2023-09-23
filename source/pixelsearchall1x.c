#include <emmintrin.h>

unsigned int pixelsearchall1(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int color) {

    // Number of 32-bit integers the register can hold.
    int pack = 4;

    // Track number of matching searches.
    unsigned int count = 0;

    // Create a vector of four copies of color.
    __m128i vcolor = _mm_set1_epi32(color);

    loop:
    // Loop over start pointer with a step of four unsigned integers.
    while (start < end - 3) {

        // Load four unsigned integers from start into a vector.
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        // Compare vstart and vcolor for equality.
        __m128i vcmp = _mm_cmpeq_epi32(vstart, vcolor);

        // Create a mask from each byte (using the most significant bit) in vcmp.
        int mask = _mm_movemask_epi8(vcmp);

        // If the mask is nonzero, there is at least one match.
        if (mask != 0)
            break;

        // Increment start by four unsigned integers.
        start += 4;
    }

    // Clean up any remaining elements.
    while (start < end) {
        if (pack > 0) {
            if (*start == color) {
                if (count < limit)
                    *(result + count) = start;
                count++;
            }
            pack--;
        }
        else {
            pack = 4;
            goto loop;
        }
        start++;
    }

    return count;
}