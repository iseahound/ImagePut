#include ImagePut.ahk
#include ImageEqual.ahk

; Download a sample image from the internet and store it as base64 data.
str := ImagePutBase64("https://i.imgur.com/PBy1WBT.png", "png") ; Use PNG to preserve transparency. 

; Save as file. 
ImagePutFile(str, "camera.png") ; Name of file is camera.png

; Check if the file 'hearts.png' is the same as the image stored on 'https://i.imgur.com/PBy1WBT.png'.
MsgBox % "Test if images are equal`n" ImageEqual("camera.png", "https://i.imgur.com/PBy1WBT.png")

; Display file in window. 
ImagePutWindow("camera.png", "Output")

Sleep 20000

; If you want, you can just display the file directly from the internet. 
ImagePutWindow("https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png", "Show image from the internet.")

; The functions accept ANY data. All of the following work!
ImagePutFile("https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png", "1. AutoHotkey Logo (url).png")
ImagePutFile("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAALEgAACxIB0t1+/AAAANFJREFUOE+dkLENwjAURD0AoqKM6JGChIRETQt1CkZgASoaJmAJalZAYhM2+fj9+FvGyImVk073ndzdj+NKuB23AvO5CphFnDKfg6UMTJ9L04derp+9cmYeLEm3mblr56qx1LNYEgv8xjRsal9SLAC8ZFseRuuvMPULYoHnpH8Afsx+o85h8+gVDJjSbekcLP/Yn5di5IwZNuuZ6mAYEHy8d3J9bqQ9LNRM2KimIRAiTJGVEDQNtjIwnu6reA3IM7SqABCwUFqABksdrGj8/s59AcjQF3n6czb9AAAAAElFTkSuQmCC", "2. sunflower (base64).png")
ImagePutFile(A_Cursor, "3. Arrow (mouse cursor).png")
ImagePutFile([0,0,A_ScreenWidth,A_ScreenHeight], "4. Screenshot (screen coordinates).png")
ImagePutFile("wallpaper", "5. current wallpaper.png")
ImagePutFile("A", "6. Active Window.png") ; see https://www.autohotkey.com/docs/misc/WinTitle.htm