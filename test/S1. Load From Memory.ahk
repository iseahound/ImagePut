; SUCCESS: Generates 12 different images. Images 7, 8 have a smaller width.
; FAIL:    Less than 8 images or corrupted.

#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force


; Perfect Information

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800, height: 800, stride:800*4}, 1)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, width: 800, height: 800}, 2)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, height: 800, stride: 800*4}, 3)


; Guessing the missing pieces from the buffer size

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800}, 4)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, height: 800}, 5)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, stride: 800*4}, 6)


; Setting an incorrect width should override other calculations.

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 300, pitch: 800*4}, 7)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 300, stride: 800*4}, 8)


; Test Negative Stride and Negative Height
buf := ImagePutBuffer("https://picsum.photos/800")

stride := 800*4
Scan0 := buf.ptr + stride*(800-1)

ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800, height: 800, stride:800*4}, "9. Control Image")
ImagePutWindow({ptr: Scan0, size: buf.size, width: 800, height: 800, stride:-800*4}, "10. Negative Stride (upside down)")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800, height: -800, stride:800*4}, "11. Negative Height (upside down)")
ImagePutWindow({ptr: Scan0, size: buf.size, width: 800, height: -800, stride:-800*4}, "12. Negative Stride & Height")

Esc:: ExitApp