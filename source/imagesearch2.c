__attribute__((ms_abi))  // Tells GCC we want to compile for Windows.
__attribute__ ((target ("sse4.2")))  // According to godbolt.org it doesn't do anything even with
                                     // __builtin_assume_aligned(ptr, 16) and -Ofast -msse4.2.
                                     // You might want to study SIMD instructions and if there is a good instruction to
                                     // take advantage of, go with inline assembly.
unsigned int imagesearch2(unsigned int * restrict result, unsigned int * start, unsigned int width, unsigned int height, unsigned int * s, unsigned int w, unsigned int h, unsigned int coord_focus, unsigned short variation) {
    // width, height, start, current, end, color refer to the haystack (main image)
    // x, y, w, h, s, c, e, cf refer to the needle (search image)
    // The location of the focused pixel
    unsigned short x;
    unsigned short y;

    if ( coord_focus ) {
        x = coord_focus >> sizeof(x)*8;
        y = coord_focus & 0x0000ffff;
        goto focus_determined;
    }

    // Try to locate the focused pixel in the middle of the sprite
    unsigned int * c = s + w/4 + h/4 * w;
    unsigned int * last_pixel = s + h * w;
    while(c < last_pixel) {
        for (unsigned int * e = c + w / 2; c < e; c++) {
            if ( *((unsigned char *) c + 3) ) {
                unsigned int offset = (c - s);
                x = offset % w;
                y = offset / w;
                goto focus_determined;
            }
        }
        c += w / 2;
    }

    // If every pixel in the middle was transparent
    // try to find a non-transparent pixel on the left-hand side.

    // This falls into an infinite loop if somehow the sprite doesn't have any
    // non-transparent pixel in the leftmost quarter.
    c = s + (w/4-1) + (h-1) * w;
    while(-1) {
        for (unsigned int * e = c - w / 4; c > e; c--) {
            if ( *((unsigned char *) c + 3) ) {
                unsigned int offset = (c - s);
                x = offset % w;
                y = offset / w;
                goto focus_determined;
            }
        }
        c -= w - w / 4;
    }

    focus_determined:;

    // Stash the coordinates of the focused pixel
    *(result + 2) = x << sizeof(x)*8 | y;



    // Prepare the search.

    // The color on the focused pixel
    unsigned int cf = *(s + x + y * w);

    // We don't need to search in the narrow edge on the right-hand side
    unsigned int range_width = width - w;
    // Remaining area must be greater than search height
    unsigned int range_height = height - h;

    unsigned int * current = start;
    unsigned int * end = start + width * range_height + width;

    // Start the search.
    unsigned int left = 0;
    while ( current < end ) {

        unsigned int offset = current - start;
        //unsigned int left = offset % width;
        // TODO Remove the comment below
        // I believe div is worse than cmov'ing one constant number.
        // The code loses some readability though.
        unsigned int top = offset / width;  // optimized away

        // Checks before subimage loop.

        // X-Range Check
        if ( left > range_width ) {
            current += w - 1;
            left = 0;
            continue;
        }
        // 

        // Focused Pixel
        unsigned int * color;
        color = current + x + y * width;
        if ( variation == 0 ) {
            if ( cf != *color ) {
                current++;
                left++;
                goto next;
            }
        } else {
            for (int b = 0; b < 3; b++) {
                unsigned short diff = *((unsigned char *)&cf + b) - *((unsigned char *)color + b);
                if ( diff > variation && diff < (unsigned short)(0 - variation) ) {
                    current++;
                    left++;
                    goto next;
                }
            }
        }

        // Subimage loop.
        c = s;
        color = current;
        for (int i = 0; i < h; i++) {
            unsigned int * e = c + w;
            while (c < e) {
                if ( *((unsigned char *) c + 3) ) {  // Skip transparent pixels
                    if ( variation == 0 ) {
                        if ( *c != *color ) {
                            current++;
                            left++;
                            goto next;
                        }
                    } else {
                        for (int b = 0; b < 3; b++) {
                            unsigned short diff = *((unsigned char *) c + b) - *((unsigned char *) color + b);
                            if ( diff > variation && diff < (unsigned short)(0 - variation) ) {
                                current++;
                                left++;
                                goto next;
                            }
                        }
                    }
                }
                c++;  // Iterate over the needle image
                color++;  // Iterate over the haystack image
            }
            color = color - w + width;  // Reset pointer for each scanline
        }

        // Found a matching image!
        *(result) = (current - start) % width;
        *(result + 1) = (current - start) / width;
        return 1;

        next:
        if ( left >= width ) {
            left = 0;
        }
    }

// TODO Remove the comment below for clean code
//
// This is how I checked the input data, writing the first few pixels at s or start
// and then ImagePutClipboard and check each pixel's color in GIMP.
//
// It seems loading with ({sprite: fpath}) gives you the right buffer but
// loading with (fpath, transparent_color) gives a buffer with no transparent pixels
// even if the file had pixels with the matching transparent_color.
//
//for ( unsigned int k = 0; k < w*h/2; k++ ) {
//  *(result+k) = *(s + k%32);
//}
//return (w*h)/2/2;
//

    return 0;
}
