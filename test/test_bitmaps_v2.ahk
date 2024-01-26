#include ..\ImagePut.ahk
test_image := "https://i.pinimg.com/474x/9a/ba/60/9aba6040f5c0af8c93b388f5df24c121.jpg"
ImagePut.gdiplusStartup()
MsgBox "Ready?"


Start:

for i, type1 in ["clipboard_png", "url", "file", "RandomAccessStream", "stream", "hex", "base64", "cursor", "hIcon", "hBitmap", "bitmap", "desktop", "window", "clipboard"] {

   ; Create the image to compare!
   image1 := (type1 = "url") ? test_image : ImagePut(type1, {url: test_image})

   for j, type2 in ["stream", "RandomAccessStream", "hex", "base64", "file", "cursor", "hIcon", "hBitmap", "bitmap", "desktop", "window", "clipboard"] {

      ; Log the conversion.
      FileAppend type1 " to " type2 "`n", "log.txt"

      ; Do the conversion.
      image2 := ImagePut(type2, image1)

      o1 := {}
      o1.%type1% := image1
      o2 := {}
      o2.%type2% := image2

      if !ImageEqual(o1, o2)
         FileAppend "-----------> not equal <-----------`n", "log.txt"

      if !(type1 = "cursor" && type2 = "cursor")
         ImagePut.Destroy.Destroy(type2, image2)
   }

   ImagePut.Destroy.Destroy(type1, image1)
}

if not ImagePut.decode {
   ImagePut.decode := True
   goto Start
}


if !WinExist("log ahk_class Notepad")
   Run "notepad log.txt"
WinWait "log ahk_class Notepad"
WinActivate "log ahk_class Notepad"
ExitApp
