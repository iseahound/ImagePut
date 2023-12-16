#include <emmintrin.h>

#define _mm_cmpge_epu8(a, b) _mm_cmpeq_epi8(_mm_max_epu8(a, b), a)
#define _mm_cmple_epu8(a, b) _mm_cmpge_epu8(b, a)
#define _mm_cmpgt_epu8(a, b) _mm_xor_si128(_mm_cmple_epu8(a, b), _mm_set1_epi8(-1))
#define _mm_cmplt_epu8(a, b) _mm_cmpgt_epu8(b, a)

unsigned int pixelsearchall4x(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int * high, unsigned int * low, unsigned int length) {

    // Number of 32-bit integers the register can iterate over.
    int iter = 4;

    // Track number of matching searches.
    unsigned int count = 0;

    // Save the starting pointer position.
    unsigned int * current = start;

    // Offset of pointer to stored colors.
    int i = 0;

    // Number of colors left.
    int n;

    // Somehow there are diminishing returns past running 3 checks at once.
    int check;

    // Comparison mask for unsigned integers.
    __m128i vmask = _mm_set1_epi32(0xFFFFFFFF);

    // Determine how many matches to be run in sequence.
    enter:
    n = length - i;
    if (n == 0)
        return count; // Somehow goto exit creates a bigger binary in mcodeforgcc.
    if (n == 1) {
        check = 1;
        goto init_1;
    }
    if (n == 2) {
        check = 2;
        goto init_2;
    }
    if (n > 2) {
        check = 3;
        goto init_3; // Segue into next label.
    }

    // Create a vector of four copies of the target color.
    init_3:
    __m128i vh3 = _mm_set1_epi32(*(high + i + 2));
    __m128i vl3 = _mm_set1_epi32(*(low + i + 2));
    init_2:
    __m128i vh2 = _mm_set1_epi32(*(high + i + 1));
    __m128i vl2 = _mm_set1_epi32(*(low + i + 1));
    init_1:
    __m128i vh1 = _mm_set1_epi32(*(high + i + 0));
    __m128i vl1 = _mm_set1_epi32(*(low + i + 0));

    // Restore starting pointer for each run.
    start = current;

    // Loop over start pointer with a step of four unsigned integers.
    loop:
    if (n == 1)
        goto check_1;
    if (n == 2)
        goto check_2;
    if (n > 2)
        goto check_3; // Segue into next label.

    check_3:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1))));
        int mask2 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh2),
                _mm_cmpge_epu8(vstart, vl2))));
        int mask3 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh3),
                _mm_cmpge_epu8(vstart, vl3))));

        if (mask1 != 0 || mask2 != 0 || mask3 != 0)
            goto exit;

        start += 4;
    }
    i += 3;
    goto enter;

    check_2:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1))));
        int mask2 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh2),
                _mm_cmpge_epu8(vstart, vl2))));

        if (mask1 != 0 || mask2 != 0)
            goto exit;

        start += 4;
    }
    i += 2;
    goto enter;

    check_1:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1))));

        if (mask1 != 0)
            goto exit;

        start += 4;
    }
    i += 1;
    goto enter;

    // Clean up any remaining elements.
    exit:
    unsigned char r, g, b, rh, gh, bh, rl, gl, bl;
    while (start < end) {
        if (iter > 0) {
            r = *((unsigned char *) start + 2);
            g = *((unsigned char *) start + 1);
            b = *((unsigned char *) start + 0);

            for (int j = 0; j < check; j++) {

                rh = *((unsigned char *) high + 4*(i + j) + 2);
                gh = *((unsigned char *) high + 4*(i + j) + 1);
                bh = *((unsigned char *) high + 4*(i + j) + 0);
                rl = *((unsigned char *) low + 4*(i + j) + 2);
                gl = *((unsigned char *) low + 4*(i + j) + 1);
                bl = *((unsigned char *) low + 4*(i + j) + 0);

                if (rh >= r && r >= rl && gh >= g && g >= gl && bh >= b && b >= bl) {
                    if (count < limit)
                        *(result + count) = start;
                    count++;
                }
            }
            iter--;
        }
        else {
            iter = 4;
            goto loop;
        }
        start++;
    }

    return count;
}