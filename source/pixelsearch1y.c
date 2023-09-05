#include <immintrin.h>

unsigned int * pixelsearch1(unsigned int * start, unsigned int * end, unsigned int color) { 
    
    // Create a vector of eight copies of color.
    __m256i vcolor = _mm256_set1_epi32(color);

    // Loop over start pointer with a step of eight unsigned integers.
    while (start < end - 7) {

        // Load eight unsigned integers from start into a vector.
        __m256i vstart = _mm256_loadu_si256((__m256i *) start);

        // Compare vstart and vcolor for equality.
        __m256i vcmp = _mm256_cmpeq_epi32(vstart, vcolor);

        // Create a mask from each byte (using the most significant bit) in vcmp.
        int mask = _mm256_movemask_epi8(vcmp);

        // If the mask is nonzero, there is at least one match.
        if (mask != 0)
            break;

        // Increment start by eight unsigned integers.
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