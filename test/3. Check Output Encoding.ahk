#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

image := "https://picsum.photos/600"

for i, extension in ImagePut.outputs {
   buf := ImagePutEncodedBuffer(image, extension)
   ImagePutWindow(buf, "(" i "/14) " extension)
}

Esc:: ExitApp