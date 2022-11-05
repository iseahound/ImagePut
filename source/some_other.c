#include <stdint.h>
#include <xmmintrin.h>
#include <tmmintrin.h>
#include <emmintrin.h>

void main() {
    int32_t __attribute__ ((aligned(16))) vector1[4] = { 1, 2, 3, 4 };
    int32_t __attribute__ ((aligned(16))) vector2[4] = { 1, 2, 2, 2 };
    int32_t __attribute__ ((aligned(16))) result[4];

    __m128i v1 = _mm_load_si128((__m128i *)vector1);
    __m128i v2 = _mm_load_si128((__m128i *)vector2);
    __m128i vcmp = _mm_cmpeq_epi32(v1, v2);
}