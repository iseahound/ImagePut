#include *i ImagePut%A_TrayMenu%.ahk
#include *i ImagePut (for v%true%).ahk
#singleinstance force

; This script runs on both AutoHotkey v1 and v2. 
hwnd := ImagePutWindow("https://picsum.photos/500", "Thank you for trying ImagePut ♥")

; Save the image as a file.
ImagePutFile(hwnd)

; Copy the window handle to the clipboard.
ImagePutClipboard(hwnd)
