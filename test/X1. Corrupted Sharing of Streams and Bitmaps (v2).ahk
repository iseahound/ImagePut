#include *i ..\ImagePut.ahk
#singleinstance force

; Control Image
stream := ImagePutStream("https://i.imgur.com/cCyb8bq.gif")
ImagePut.gdiplusstartup()

; Experiment 1: Can GdipImageForceValidation can alleviate corruption. (No)
DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", stream, "ptr*", &b1:=0)
DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", stream, "ptr*", &b2:=0)
DllCall("gdiplus\GdipImageForceValidation", "ptr", b2)
ImagePut.BitmapToWindow(b1, "(1). Control. Close (2, 5)")
ImagePut.BitmapToWindow(b2, "(2). Validated. Close (1, 5)")

; Experiment 2: Can creating clones of streams allow multiple reads? (Yes)
s3 := CloneStream(stream)
s4 := CloneStream(stream)
DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", s3, "ptr*", &b3:=0)
DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", s4, "ptr*", &b4:=0)
ImagePut.BitmapToWindow(b3, "(3). One bitmap per stream! Close (5)")
ImagePut.BitmapToWindow(b4, "(4). One bitmap per stream!")

; Experiment 3: Does GdipCloneImage do anything? (No.)
b5 := CloneBitmap(b1)
ImagePut.BitmapToWindow(b5, "(5). Clone of (1). Close (1, 2)")

b6 := CloneBitmap(b3)
ImagePut.BitmapToWindow(b6, "(6). Clone of (3). Close (3)")


Esc:: ExitApp

CloneStream(s) {
   return ImagePut.StreamToStream(s)
}

CloneBitmap(b) {
   DllCall("gdiplus\GdipCloneImage", "ptr", b, "ptr*", &pBitmap:=0)
   DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap) ; Disable copy-on-read
   return pBitmap
}