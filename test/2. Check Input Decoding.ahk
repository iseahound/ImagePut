#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

images := StrSplit(Trim(RegExReplace("
( Comments
; 64 bpp (will be blank on 32-bit systems and < 24H2)
shore_64_bpp.avif

; zero delay
sphere_zero_delay.webp

; hdr
grass_hdr.avif

; avif
grass.avif

; bmp
colors.bmp

; cur
help.cur

; dds
; dxt5.dds

; gif
cat.gif

; heic
sealand.heic

; ico
bunny.ico

; jpg
blowup.jpg

; pdf
pepper-creative-brochure.pdf

; png
insta.png

; svg
compass.svg

; tif
lena_std.tif

; webp
crosshair.webp
)", "\v+", "✿"), "✿"), "✿")

for i, image in images {
   ImagePutWindow("https://raw.githubusercontent.com/iseahound/test_images/main/" image, "(" i "/15) " image)
}

Esc:: ExitApp