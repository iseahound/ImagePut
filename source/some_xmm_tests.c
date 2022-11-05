#include <xmmintrin.h>
#include <tmmintrin.h>
#include <emmintrin.h>

int main(unsigned int * start) {
    __m128i input = _mm_loadu_si128(*start);
    const __m128i populated_0th_byte = _mm_shuffle_epi8(input, _mm_setzero_si128());
    const __m128i eq = _mm_cmpeq_epi8(input, populated_0th_byte);

    return (_mm_movemask_epi8(eq) == 0xffff);
}