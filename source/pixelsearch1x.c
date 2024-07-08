#include <emmintrin.h>

// The number of vector registors to utilize in each innermost loop
#define NR_VEC 4

unsigned int * pixelsearch1x(unsigned int * start, unsigned int * end, unsigned int color) {
    // The number of elements in each vector register
    size_t nr_elems_in_vec = sizeof(__m128i) / sizeof(*start);

    // Create a vector of four copies of the target color.
    __m128i vcolor = _mm_set1_epi32(color);

    // Loop over start pointer with a step of four unsigned integers.
    while ( start <  end - (nr_elems_in_vec * NR_VEC) + 1 ) {
        __m128i vcmp[NR_VEC];

        for ( int i = 0; i < NR_VEC; i++ ) {
            // Load four unsigned integers from start into a vector.
            __m128i vstart = _mm_loadu_si128( ((__m128i *) start) + i );

            // Compare vstart and vcolor for equality.
            vcmp[i] = _mm_cmpeq_epi32(vstart, vcolor);
        }

        // Use POR because it has a big throughput
        __m128i vmask = _mm_or_si128(vcmp[0], vcmp[1]);
        for ( int i = 2; i < NR_VEC; i++ ) {
            vmask = _mm_or_si128(vmask, vcmp[i]);
        }

        // If the result is nonzero, there is at least one match.
        // This combination of MOVMSKBPS + TEST can be replaced with a PTEST when SSE4.1 is available.
        if ( _mm_movemask_ps((__m128) vmask) ) {
            int mask = 0;
            for ( int i = 0; i < NR_VEC; i++ ) {
                // Create a mask from each dword (using the most significant bit) in vcmp.
                mask |= _mm_movemask_ps((__m128) vcmp[i]) << nr_elems_in_vec * i;
            }

            // Return the pointer to the pixel with matching color.
            // _tzcnt_u32 can be used instead of __builtin_ctz since they're almost identical.
            return start + __builtin_ctz(mask);
        }

        // Increment start for the next batch.
        start += nr_elems_in_vec * NR_VEC;
    }

    // Clean up any remaining elements.
    while (start < end) {
        if (*start == color)
            return start;
        start++;
    }

    return start; // start == end if no match.
}
