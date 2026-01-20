#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

a := ImagePutBuffer("https://picsum.photos/800")
b := ImagePutBuffer("https://picsum.photos/800")
a.show("Control")
a.ptr := b.ptr
a.show("Pointer Swapped")
a.height //= 3
a.show("1/3 Height")
a.width //= 3
a.show("1/3 Width")

Esc:: ExitApp