#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

image := "https://raw.githubusercontent.com/iseahound/test_images/main/bunny.ico"

ImagePutWindow({image: image}, "1. Original Size")
ImagePutWindow({image: image, scale: 2}, "2. 2x Scale")
ImagePutWindow({image: image, scale: ["auto", 480]}, "3. Scale to 480p")
ImagePutWindow({image: image, scale: [1280, 720]}, "4. Scale to 1280x720")
ImagePutWindow({image: image, upscale: [800, 800]}, "5. Upscale to 800x800")
ImagePutWindow({image: image, downscale: [800, 800]}, "6. Downscale to 800x800")
ImagePutWindow({image: image, minsize: [800, 800]}, "7. Minimum size: 800x800")
ImagePutWindow({image: image, maxsize: [800, 800]}, "8. Maximum size: 800x800")
ImagePutWindow({image: image, scale: 3, maxsize: [800, 800]}, "9. Scale 3x and Maximum size: 800x800")

Esc:: ExitApp