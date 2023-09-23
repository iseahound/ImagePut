#include <emmintrin.h>

unsigned int pixelsearchall3x(unsigned int ** result, unsigned int limit, unsigned int * start, unsigned int * end, unsigned int * colors, unsigned int length) {

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

    // Somehow there are diminishing returns past running 3 checks at once.
    int check;

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
    __m128i vcolor3 = _mm_set1_epi32(*(colors + i + 2));
    init_2:
    __m128i vcolor2 = _mm_set1_epi32(*(colors + i + 1));
    init_1:
    __m128i vcolor1 = _mm_set1_epi32(*(colors + i + 0));

    // Restore starting pointer for each run.
    start = current;

    // Loop over start pointer with a step of four unsigned integers.
    loop:
    if (n == 1)
        goto check_1;
    if (n == 2)
        goto check_2;
    if (n > 2)
        goto check_3;  // Segue into next label.

    check_3:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);
        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart));
        int mask2 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor2, vstart));
        int mask3 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor3, vstart));
        if (mask1 != 0 || mask2 != 0 || mask3 != 0)
            goto exit;
        start += 4;
    }
    i += 3;
    goto enter;

    check_2:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);
        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart));
        int mask2 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor2, vstart));
        if (mask1 != 0 || mask2 != 0)
            goto exit;
        start += 4;
    }
    i += 2;
    goto enter;

    check_1:
    while (start < end - 3) {
        __m128i vstart = _mm_loadu_si128((__m128i *) start);
        int mask1 = _mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart));
        if (mask1 != 0)
            goto exit;
        start += 4;
    }
    i += 1;
    goto enter;

    // Clean up any remaining elements.
    exit:
    while (start < end) {
        if (pack > 0) {
            for (int j = 0; j < check; j++)
                if (*start == colors[i + j]) {
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