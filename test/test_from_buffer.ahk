#include *i ImagePut%A_TrayMenu%.ahk
#include *i ImagePut (for v%true%).ahk
#singleinstance force

/*

pStream := ImagePutStream("https://picsum.photos/800")
DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "ptr*", &hMemory:=0)
size   := DllCall("GlobalSize", "ptr", hMemory, "uptr")
ptr    := DllCall("GlobalLock", "ptr", hMemory, "ptr")

*/

; Perfect Information

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800, height: 800, stride:800*4}, 1)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, width: 800, height: 800}, 2)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, height: 800, stride:800*4}, 3)


; Guessing the missing pieces from the buffer size

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 800}, 4)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, height: 800}, 5)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, stride:800*4}, 6)


; Messing with stride (should be halved!)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 300, height: 800, stride:800*4}, 7)

buf := ImagePutBuffer("https://picsum.photos/800")
ImagePutWindow({ptr: buf.ptr, size: buf.size, width: 300, stride:800*4}, 8)