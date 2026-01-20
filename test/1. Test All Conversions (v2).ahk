#include ..\ImagePut.ahk

try FileDelete   "log.txt"
test_image := "https://picsum.photos/id/" Random(300) "/600"
ImagePut.gdiplusStartup()
MsgBox "The screen and cursor may flash during testing"


Start:

; The only worlds that can be comprehensively tested are the inputs intersected with the outputs
worlds := []
for _, codomain in ImagePut.codomains
   for _, domain in ImagePut.domains
      if (codomain == domain) and not domain ~= "^(?i:screenshot|sharedbuffer|url|wallpaper)$"
         worlds.push(codomain)

; Iterate and test that each world is accessible from every other world.
for _, domain in worlds {

   ; Create input images
   coimage := ImagePut(domain, {url: test_image})

   ; Test that the input → output image conversion is equal to the input.
   for _, codomain in worlds {

      ; Special exemptions for when the codomain and the domain overlap.
      if (domain == codomain)
         continue

      ; Log
      FileAppend   domain " to " codomain "`n", "log.txt"

      ; Convert
      image := ImagePut(codomain, coimage)

      ; Debug
      ; msgbox   imagetype(image) ", " image

      ; Skip when criteria are not met (such as ImagePutExplorer)
      if not image {
         FileAppend   " (skipped, don't worry)", "log.txt"
         continue
      }

      ; Type the images
      o1 := {}
      o1.%domain% := coimage
      o2 := {}
      o2.%codomain% := image

      ; Test for equality
      if not ImageEqual(o1, o2)
         FileAppend   "-----------> not equal <-----------`n", "log.txt"

      ; Special exemptions for when the codomain and the domain overlap.
      if (domain == codomain)
         if (codomain = "cursor")
            continue
      
      ; Cleanup the image   
      ImagePut.Destroy(codomain, image)
   }

   ; Cleanup the coimage   
   ImagePut.Destroy(domain, coimage)
}

; Let's try again! The first time used a stream intermediate, now let's use a bitmap instead.
if not ImagePut.decode {
   ImagePut.decode := True
   goto Start
}


if !WinExist("log ahk_class Notepad")
   Run "notepad log.txt"
WinWait "log ahk_class Notepad"
WinActivate "log ahk_class Notepad"
ExitApp