#include <emmintrin.h>

unsigned int * pixelsearch3(unsigned int * start, unsigned int * end, unsigned int * colors, unsigned int length) {

    unsigned int * current = start;
    __m128i vstart, vcolor0, vcolor1, vcolor2;
    
    int i = 0;

    enter:
    start = current; // Reset pointer for each run.
    if (length - i > 2)
        goto check_3;
    else if (length - i > 1)
        goto check_2;
    else if (length - i > 0)
        goto check_1;
    else
        goto exit;

    check_3:
    vcolor0 = _mm_set1_epi32(*(colors + i + 0));
    vcolor1 = _mm_set1_epi32(*(colors + i + 1));
    vcolor2 = _mm_set1_epi32(*(colors + i + 2));

    while (start < end - 3) {
        vstart = _mm_loadu_si128((__m128i *) start);
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor0, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor2, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 3;
    goto enter;

    check_2:
    vcolor0 = _mm_set1_epi32(*(colors + i + 0));
    vcolor1 = _mm_set1_epi32(*(colors + i + 1));

    while (start < end - 3) {
        vstart = _mm_loadu_si128((__m128i *) start);
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor0, vstart)) != 0)
            goto exit;
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor1, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 2;
    goto enter;

    check_1:
    vcolor0 = _mm_set1_epi32(*(colors + i + 0));

    while (start < end - 3) {
        vstart = _mm_loadu_si128((__m128i *) start);
        if (_mm_movemask_epi8(_mm_cmpeq_epi32(vcolor0, vstart)) != 0)
            goto exit;
        start += 4;
    }
    i += 1;
    goto enter;

    exit:
    // Clean up any remaining elements.
    while (start < end) {
        for (int i = 0; i < length; i++)
            if (*start == colors[i])
                return start;
        start++;
    }

    return start; // start == end if no match.
}