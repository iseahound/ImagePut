#include <emmintrin.h>

#define _mm_cmpge_epu8(a, b) _mm_cmpeq_epi8(_mm_max_epu8(a, b), a)
#define _mm_cmple_epu8(a, b) _mm_cmpge_epu8(b, a)
#define _mm_cmpgt_epu8(a, b) _mm_xor_si128(_mm_cmple_epu8(a, b), _mm_set1_epi8(-1))
#define _mm_cmplt_epu8(a, b) _mm_cmpgt_epu8(b, a)

unsigned int * pixelsearch4(unsigned int * start, unsigned int * end, unsigned int * high, unsigned int * low, unsigned int length) {

    // Save the starting pointer position.
    unsigned int * current = start;

    // Offset of pointer to stored colors.
    int i = 0;

    // Number of colors left.
    int n;

    // Comparison mask for unsigned integers.
    __m128i vmask = _mm_set1_epi32(0xFFFFFFFF);

    // Determine how many matches to be run in sequence.
    enter:
    n = length - i;
    if (n == 0)
        return end; // Somehow goto exit creates a bigger binary in mcodeforgcc (not here though).
    if (n == 1)
        goto init_1;
    if (n == 2)
        goto init_2;
    if (n > 2)
        goto init_3; // Segue into next label.

    // Create vectors.
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

    // Somehow there are diminishing returns past running 3 checks at once.
    if (n == 1)
        goto check_1;
    if (n == 2)
        goto check_2;
    if (n > 2)
        goto check_3;  // Segue into next label.

    check_3:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1)))) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh2),
                _mm_cmpge_epu8(vstart, vl2)))) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh3),
                _mm_cmpge_epu8(vstart, vl3)))) != 0)
            goto exit;

        start += 4;
    }
    i += 3;
    goto enter;

    check_2:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1)))) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh2),
                _mm_cmpge_epu8(vstart, vl2)))) != 0)
            goto exit;

        start += 4;
    }
    i += 2;
    goto enter;

    check_1:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);

        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vmask,
            _mm_and_si128(
                _mm_cmple_epu8(vstart, vh1),
                _mm_cmpge_epu8(vstart, vl1)))) != 0)
            goto exit;

        start += 4;
    }
    i += 1;
    goto enter;

    exit:
    // Clean up any remaining elements.
    unsigned char r, g, b, rh, gh, bh, rl, gl, bl;
    while (start < end) {

        r = *((unsigned char *) start + 2);
        g = *((unsigned char *) start + 1);
        b = *((unsigned char *) start + 0);

        for (int i = 0; i < length; i++) {

            rh = *((unsigned char *) high + 4*i + 2);
            gh = *((unsigned char *) high + 4*i + 1);
            bh = *((unsigned char *) high + 4*i + 0);
            rl = *((unsigned char *) low + 4*i + 2);
            gl = *((unsigned char *) low + 4*i + 1);
            bl = *((unsigned char *) low + 4*i + 0);

            if (rh >= r && r >= rl && gh >= g && g >= gl && bh >= b && b >= bl)
                return start;
        }
        start++;
    }

    return start; // start == end if no match.
}