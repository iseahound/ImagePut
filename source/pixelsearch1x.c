#include <emmintrin.h>

// The number of vector registors to utilize in each innermost loop
#define NR_VEC 2

unsigned int * pixelsearch1x(unsigned int * start, unsigned int * end, unsigned int color) {
    // The number of elements in each vector register
    size_t nr_elems_in_vec = sizeof(__m128i) / sizeof(*start);

    // Create a vector of four copies of the target color.
    __m128i vcolor = _mm_set1_epi32(color);

    // Loop over start pointer with a step of four unsigned integers.
    while ( start <  end - (nr_elems_in_vec * NR_VEC) + 1 ) {
        int mask[NR_VEC];

        for ( int i = 0; i < NR_VEC; i++ ) {
            // Load four unsigned integers from start into a vector.
            __m128i vstart = _mm_loadu_si128( ((__m128i *) start) + i );

            // Compare vstart and vcolor for equality.
            __m128i vcmp = _mm_cmpeq_epi32(vstart, vcolor);

            // Create a mask from each byte (using the most significant bit) in vcmp.
            mask[i] = _mm_movemask_epi8(vcmp);
        }

        for ( int i = 0; i < NR_VEC; i++ ) {
            // If the mask is nonzero, there is at least one match.
            if (mask[i] != 0)
                goto end_vector_loop;
        }

        // Increment start for the next batch.
        start += nr_elems_in_vec * NR_VEC;
    }
end_vector_loop:

    // Clean up any remaining elements.
    while (start < end) {
        if (*start == color)
            return start;
        start++;
    }

    return start; // start == end if no match.
}
