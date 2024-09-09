// 2.5x faster. Uses loop unrolling to search 8 pixels at once.
#include <emmintrin.h>

unsigned int * pixelsearch1x2(unsigned int * start, unsigned int * end, unsigned int color) {

    // Create a vector of four copies of the target color.
    __m128i vcolor = _mm_set1_epi32(color);

    // Loop over start pointer with a step of four unsigned integers.
    while (start < end - 7) {

        // Load four unsigned integers from start into a vector.
        __m128i vstart1 = _mm_loadu_si128((__m128i *) start);
        __m128i vstart2 = _mm_loadu_si128((__m128i *) start + 4);

        // Compare vstart and vcolor for equality.
        __m128i vcmp1 = _mm_cmpeq_epi32(vstart1, vcolor);
        __m128i vcmp2 = _mm_cmpeq_epi32(vstart2, vcolor);

        // Create a mask from each byte (using the most significant bit) in vcmp.
        int mask1 = _mm_movemask_epi8(vcmp1);
        int mask2 = _mm_movemask_epi8(vcmp2);

        // If the mask is nonzero, there is at least one match.
        if (mask1 != 0 || mask2 != 0)
            break;

        // Increment start by four unsigned integers.
        start += 8;
    }

    // Clean up any remaining elements.
    while (start < end) {
        if (*start == color)
            return start;
        start++;
    }

    return start; // start == end if no match.
}