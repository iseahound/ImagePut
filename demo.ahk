#include *i ImagePut%A_TrayMenu%.ahk
#include *i ImagePut (for v%true%).ahk
#singleinstance force

; Show image in window.
hwnd := ImagePutWindow("https://picsum.photos/1000/200", "Thank you for trying ImagePut ♥")

; Save image to file.
filepath := ImagePutFile("https://i.imgur.com/cCyb8bq.gif")

; Display images without borders. Right click image to close.
ImageShow(filepath)