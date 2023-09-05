#include <emmintrin.h>

unsigned int * pixelsearch1(unsigned int * start, unsigned int * end, unsigned int color) { 

    // Create a vector of four copies of color.
    __m128i vcolor = _mm_set1_epi32(color);

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
        if (*start == color)
            return start;
        start++;
    }

    return start; // start == end if no match.
}