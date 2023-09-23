#include <emmintrin.h>

unsigned int pixelsearchall3(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int * colors, unsigned int length) {

    // Number of 32-bit integers the register can hold.
    int pack = 4;

    // Track number of matching searches.
    unsigned int count = 0;

    // Save the starting pointer position.
    unsigned int * current = start;

    // Offset of pointer to stored colors.
    int i = 0;

    // Number of colors left.
    int n;

    // Determine how many matches to be run in sequence.
    enter:
    n = length - i;
    if (n == 0)
        return count; // Somehow goto exit creates a bigger binary in mcodeforgcc (not here though).
    if (n == 1)
        goto init_1;
    if (n == 2)
        goto init_2;
    if (n > 2)
        goto init_3; // Segue into next label.

    // Create vectors from pointer to stored colors.
    init_3:
    __m128i vcolor3 = _mm_set1_epi32(*(colors + i + 2));
    init_2:
    __m128i vcolor2 = _mm_set1_epi32(*(colors + i + 1));
    init_1:
    __m128i vcolor1 = _mm_set1_epi32(*(colors + i + 0));

    // Restore starting pointer for each run.
    start = current;

    loop:
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
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor2, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor3, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 3;
    goto enter;

    check_2:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor2, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 2;
    goto enter;

    check_1:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 1;
    goto enter;

    exit:
    // Clean up any remaining elements.
    while (start < end) {
        if (pack > 0) {
            for (int i = 0; i < length; i++)
                if (*start == colors[i]) {
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