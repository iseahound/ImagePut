; Script:    ImagePut.ahk
; License:   MIT License
; Author:    Edison Hua (iseahound)
; Github:    https://github.com/iseahound/ImagePut
; Date:      2022-01-01
; Version:   1.6.0

#Requires AutoHotkey v1.1.33+


; Puts the image into a file format and returns a base64 encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutBase64(image, extension := "", quality := "") {
   return ImagePut("base64", image, extension, quality)
}

; Puts the image into a GDI+ Bitmap and returns a pointer.
ImagePutBitmap(image) {
   return ImagePut("bitmap", image)
}

; Puts the image into a GDI+ Bitmap and returns a buffer object with GDI+ scope.
ImagePutBuffer(image) {
   return ImagePut("buffer", image)
}

; Puts the image onto the clipboard and returns an empty string.
ImagePutClipboard(image) {
   return ImagePut("clipboard", image)
}

; Puts the image as the cursor and returns the variable A_Cursor.
;   xHotspot   -  X Click Point           |  pixel    ->   0 - width
;   yHotspot   -  Y Click Point           |  pixel    ->   0 - height
ImagePutCursor(image, xHotspot := "", yHotspot := "") {
   return ImagePut("cursor", image, xHotspot, yHotspot)
}

; Puts the image onto a device context and returns the handle.
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutDC(image, alpha := "") {
   return ImagePut("dc", image, alpha)
}

; Puts the image behind the desktop icons and returns the string "desktop".
ImagePutDesktop(image) {
   return ImagePut("desktop", image)
}

; Puts the image into a file and returns its filepath.
;   filepath   -  Filepath + Extension    |  string   ->   *.bmp, *.gif, *.jpg, *.png, *.tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutFile(image, filepath := "", quality := "") {
   return ImagePut("file", image, filepath, quality)
}

; Puts the image into a device independent bitmap and returns the handle.
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutHBitmap(image, alpha := "") {
   return ImagePut("hBitmap", image, alpha)
}

; Puts the image into a file format and returns a hexadecimal encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutHex(image, extension := "", quality := "") {
   return ImagePut("hex", image, extension, quality)
}

; Puts the image into an icon and returns the handle.
ImagePutHIcon(image) {
   return ImagePut("hIcon", image)
}

; Puts the image into a file format and returns a pointer to a RandomAccessStream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutRandomAccessStream(image, extension := "", quality := "") {
   return ImagePut("RandomAccessStream", image, extension, quality)
}

; Puts the image on the shared screen device context and returns an array of coordinates.
;   screenshot -  Screen Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutScreenshot(image, screenshot := "", alpha := "") {
   return ImagePut("screenshot", image, screenshot, alpha)
}

; Puts the image into a file format and returns a pointer to a stream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutStream(image, extension := "", quality := "") {
   return ImagePut("stream", image, extension, quality)
}

; Puts the image as the desktop wallpaper and returns the string "wallpaper".
ImagePutWallpaper(image) {
   return ImagePut("wallpaper", image)
}

; Puts the image in a window and returns a handle to a window.
;   title      -  Window Title            |  string   ->   MyTitle
;   pos        -  Window Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   style      -  Window Style            |  uint     ->   WS_VISIBLE
;   styleEx    -  Window Extended Style   |  uint     ->   WS_EX_LAYERED
;   parent     -  Window Parent           |  ptr      ->   hwnd
ImagePutWindow(image, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "") {
   return ImagePut("window", image, title, pos, style, styleEx, parent)
}


;   title      -  Window Title            |  string   ->   MyTitle
;   pos        -  Window Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   style      -  Window Style            |  uint     ->   WS_VISIBLE
;   styleEx    -  Window Extended Style   |  uint     ->   WS_EX_LAYERED
;   parent     -  Window Parent           |  ptr      ->   hwnd
ImageShow(image, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "") {
   return ImagePut("show", image, title, pos, style, styleEx, parent)
}

ImageDestroy(image) {
   return ImagePut.Destroy.call(image)
}

ImageWidth(image) {
   return ImagePut.Dimensions(image)[1]
}

ImageHeight(image) {
   return ImagePut.Dimensions(image)[2]
}

ImagePut(cotype, image, p*) {
   return ImagePut.call(cotype, image, p*)
}

ImageEqual(images*) {
   return ImageEqual.call(images*)
}


class ImagePut {

   static decode := False   ; Forces conversion using a bitmap. The original file encoding will be lost.
   static validate := False ; Always copies image data into memory instead of passing references.

   ; ImagePut() - Puts an image from anywhere to anywhere.
   ;   cotype     -  Output Type             |  string   ->   Case Insensitive. Read documentation.
   ;   image      -  Input Image             |  image    ->   Anything. Refer to ImageType().
   ;   crop       -  Crop Coordinates        |  array    ->   [x,y,w,h] could be negative or percent.
   ;   scale      -  Scale Factor            |  real     ->   2.0
   ;   p*         -  Additional Parameters   |  variadic ->   Extra parameters found in BitmapToCoimage().
   call(cotype, image, p*) {

      ; Extract parameters.
      if IsObject(image) {
         crop := ObjHasKey(image, "crop") ? image.crop : False
         scale := ObjHasKey(image, "scale") ? image.scale : False
         decode := ObjHasKey(image, "decode") ? image.decode : this.decode
         validate := ObjHasKey(image, "validate") ? image.validate : this.validate

         index := ObjHasKey(image, "index") ? image.index : 0

         ; Dereference the image unknown.
         if ObjHasKey(image, "image")
            image := image.image

      } else {
         crop := scale := False
         decode := this.decode
         validate := this.validate

         index := 0
      }

      ; Start!
      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>95% accuracy!)
      try type := this.DontVerifyImageType(image)
      catch
         type := this.ImageType(image)

      ; #1 - Stream intermediate.
      if not decode and not crop and not scale
         and (type ~= "^(?i:clipboard_png|pdf|url|file|stream|RandomAccessStream|hex|base64)$")
         and (cotype ~= "^(?i:file|stream|RandomAccessStream|hex|base64)$")
         and (p[1] == "") { ; For now, disallow any specification of extensions.

         ; Convert via stream intermediate.
         if !(pStream := this.ToStream(type, image, index))
            throw Exception("pStream cannot be zero.")
         coimage := this.StreamToCoimage(cotype, pStream, p*)

         ; Prevents the stream object from being freed.
         if (cotype = "stream")
            ObjAddRef(pStream)

         ; Free the temporary stream object.
         ObjRelease(pStream)

         return coimage
      }

      ; #2 - Fallback to GDI+ bitmap as the intermediate.
      else {
         ; GdipImageForceValidation must be called immediately or it fails without any errors.
         ; It load the image pixels to the bitmap buffer, increasing memory usage and prevents
         ; changes to the pixels while bypassing any copy-on-write and copy on LockBits(read) behavior.

         ; Convert via GDI+ bitmap intermediate.
         if !(pBitmap := this.ToBitmap(type, image, index))
            throw Exception("pBitmap cannot be zero.")
         (validate) ? DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap) : {}
         (crop) ? this.BitmapCrop(pBitmap, crop) : {}
         (scale) ? this.BitmapScale(pBitmap, scale) : {}
         coimage := this.BitmapToCoimage(cotype, pBitmap, p*)

         ; Clean up the pBitmap copy. Export raw pointers if requested.
         if !(cotype = "bitmap" || cotype = "buffer")
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      ; Check for dangling pointers.
      this.gdiplusShutdown(cotype)

      return coimage
   }

   DontVerifyImageType(ByRef image) {

      if !IsObject(image)
         throw Exception("Must be an object.")

      ; Check for image type declarations.
      ; Assumes that the user is telling the truth.

      if ObjHasKey(image, "clipboard_png") {
         image := image.clipboard_png
         return "clipboard_png"
      }

      if ObjHasKey(image, "clipboard") {
         image := image.clipboard
         return "clipboard"
      }

      if ObjHasKey(image, "object") {
         image := image.object
         return "object"
      }

      if ObjHasKey(image, "buffer") {
         image := image.buffer
         return "buffer"
      }

      if ObjHasKey(image, "screenshot") {
         image := image.screenshot
         return "screenshot"
      }

      if ObjHasKey(image, "window") {
         image := image.window
         return "window"
      }

      if ObjHasKey(image, "desktop") {
         image := image.desktop
         return "desktop"
      }

      if ObjHasKey(image, "wallpaper") {
         image := image.wallpaper
         return "wallpaper"
      }

      if ObjHasKey(image, "cursor") {
         image := image.cursor
         return "cursor"
      }

      if ObjHasKey(image, "pdf") {
         image := image.pdf
         return "pdf"
      }

      if ObjHasKey(image, "url") {
         image := image.url
         return "url"
      }

      if ObjHasKey(image, "file") {
         image := image.file
         return "file"
      }

      if ObjHasKey(image, "hex") {
         image := image.hex
         return "hex"
      }

      if ObjHasKey(image, "base64") {
         image := image.base64
         return "base64"
      }

      if ObjHasKey(image, "monitor") {
         image := image.monitor
         return "monitor"
      }

      if ObjHasKey(image, "dc") {
         image := image.dc
         return "dc"
      }

      if ObjHasKey(image, "hBitmap") {
         image := image.hBitmap
         return "hBitmap"
      }

      if ObjHasKey(image, "hIcon") {
         image := image.hIcon
         return "hIcon"
      }

      if ObjHasKey(image, "bitmap") {
         image := image.bitmap
         return "bitmap"
      }

      if ObjHasKey(image, "stream") {
         image := image.stream
         return "stream"
      }

      if ObjHasKey(image, "RandomAccessStream") {
         image := image.RandomAccessStream
         return "RandomAccessStream"
      }

      if ObjHasKey(image, "sprite") {
         image := image.sprite
         return "sprite"
      }

      throw Exception("Invalid type.")
   }

   ImageType(image) {
      ; Throw if the image is an empty string.
      if (image == "") {




            ; A "clipboard_png" is a pointer to a PNG stream saved as the "png" clipboard format.
            if DllCall("IsClipboardFormatAvailable", "uint", DllCall("RegisterClipboardFormat", "str", "png", "uint"))
               return "clipboard_png"

            ; A "clipboard" is a handle to a GDI bitmap saved as CF_BITMAP.
            if DllCall("IsClipboardFormatAvailable", "uint", 2)
               return "clipboard"

            throw Exception("Image data is an empty string.")
         }
      if IsObject(image) {
         ; A "object" has a pBitmap property that points to an internal GDI+ bitmap.
         if image.HasKey("pBitmap")
            return "object"

         ; A "buffer" is an object with ptr and size properties.
         if image.HasKey("ptr") && image.HasKey("size")
            return "buffer"

         ; A "screenshot" is an array of 4 numbers.
         if (image[1] ~= "^-?\d+$" && image[2] ~= "^-?\d+$" && image[3] ~= "^-?\d+$" && image[4] ~= "^-?\d+$")
            return "screenshot"
      }
         ; A "window" is anything considered a Window Title including ahk_class and "A".
         if WinExist(image) || DllCall("IsWindow", "ptr", image)
            return "window"

         ; A "desktop" is a hidden window behind the desktop icons created by ImagePutDesktop.
         if (image = "desktop")
            return "desktop"

         ; A "wallpaper" is the desktop wallpaper.
         if (image = "wallpaper")
            return "wallpaper"

         ; A "cursor" is the name of a known cursor name.
         if (image ~= "(?i)^A_Cursor|Unknown|(IDC_)?(AppStarting|Arrow|Cross|Hand(writing)?|"
         . "Help|IBeam|No|Pin|Person|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait)$")
            return "cursor"

         ; A "pdf" is either a file or url with a .pdf extension.
         if (image ~= "\.pdf$") && (FileExist(image) || this.is_url(image))
            return "pdf"

         ; A "url" satisfies the url format.
         if this.is_url(image)
            return "url"

         ; A "file" is stored on the disk or network.
         if FileExist(image)
            return "file"

         ; A "hex" string is binary image data encoded into text using hexadecimal.
         if (StrLen(image) >= 48) && (image ~= "^\s*(?:[A-Fa-f0-9]{2})*+\s*$")
            return "hex"

         ; A "base64" string is binary image data encoded into text using standard 64 characters.
         if (StrLen(image) >= 32) && (image ~= "^\s*(?:data:image\/[a-z]+;base64,)?"
         . "(?:[A-Za-z0-9+\/]{4})*+(?:[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{2}==)?\s*$")
            return "base64"

      if (image ~= "^-?\d+$") {
         SysGet MonitorGetCount, MonitorCount ; A non-zero "monitor" number identifies each display uniquely; and 0 refers to the entire virtual screen.
         if (image >= 0 && image <= MonitorGetCount)
            return "monitor"

         ; A "dc" is a handle to a GDI device context.
         if (DllCall("GetObjectType", "ptr", image, "uint") == 3 || DllCall("GetObjectType", "ptr", image, "uint") == 10)
            return "dc"

         ; An "hBitmap" is a handle to a GDI Bitmap.
         if (DllCall("GetObjectType", "ptr", image, "uint") == 7)
            return "hBitmap"

         ; An "hIcon" is a handle to a GDI icon.
         if DllCall("DestroyIcon", "ptr", DllCall("CopyIcon", "ptr", image, "ptr"))
            return "hIcon"

         ; A "bitmap" is a pointer to a GDI+ Bitmap.
         try if !DllCall("gdiplus\GdipGetImageType", "ptr", image, "ptr*", type:=0) && (type == 1)
            return "bitmap"

         ; Note 1: All GDI+ functions add 1 to the reference count of COM objects.
         ; Note 2: GDI+ pBitmaps that are queried cease to stay pBitmaps.
         ; Note 3: Critical error for ranges 0-4095 on v1 and 0-65535 on v2.
         ObjRelease(image) ; Therefore do not move this, it has been tested.

         ; A "stream" is a pointer to the IStream interface.
         try if ComObjQuery(image, "{0000000C-0000-0000-C000-000000000046}")
            return "stream", ObjRelease(image)

         ; A "RandomAccessStream" is a pointer to the IRandomAccessStream interface.
         try if ComObjQuery(image, "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}")
            return "RandomAccessStream", ObjRelease(image)
      }


      ; For more helpful error messages: Catch file names without extensions!
      for extension in ["bmp","dib","rle","jpg","jpeg","jpe","jfif","gif","tif","tiff","png","ico","exe","dll"]
         if FileExist(image "." extension)
            throw Exception("A ." extension " file extension is required!")

      throw Exception("Image type could not be identified.")
   }

   ToBitmap(type, image, index := 0) {

      if (type = "clipboard_png")
         return this.from_clipboard_png()

      if (type = "clipboard")
         return this.from_clipboard()

      if (type = "object")
         return this.from_object(image)

      if (type = "buffer")
         return this.from_buffer(image)

      if (type = "screenshot")
         return this.from_screenshot(image)

      if (type = "window")
         return this.from_window(image)

      if (type = "desktop")
         return this.from_desktop()

      if (type = "wallpaper")
         return this.from_wallpaper()

      if (type = "cursor")
         return this.from_cursor()

      if (type = "pdf")
         return this.from_pdf(image, index)

      if (type = "url")
         return this.from_url(image)

      if (type = "file")
         return this.from_file(image)

      if (type = "hex")
         return this.from_hex(image)

      if (type = "base64")
         return this.from_base64(image)

      if (type = "monitor")
         return this.from_monitor(image)

      if (type = "dc")
         return this.from_dc(image)

      if (type = "hBitmap")
         return this.from_hBitmap(image)

      if (type = "hIcon")
         return this.from_hIcon(image)

      if (type = "bitmap")
         return this.from_bitmap(image)

      if (type = "stream")
         return this.from_stream(image)

      if (type = "RandomAccessStream")
         return this.from_RandomAccessStream(image)

      if (type = "sprite")
         return this.from_sprite(image)

      throw Exception("Conversion from " type " to bitmap is not supported.")
   }

   BitmapToCoimage(cotype, pBitmap, p1:="", p2:="", p3:="", p4:="", p5:="", p*) {
      ; BitmapToCoimage("clipboard", pBitmap)
      if (cotype = "clipboard" || cotype = "clipboard_png")
         return this.put_clipboard(pBitmap)

      ; BitmapToCoimage("buffer", pBitmap)
      if (cotype = "buffer")
         return this.put_buffer(pBitmap)

      ; BitmapToCoimage("screenshot", pBitmap, screenshot, alpha)
      if (cotype = "screenshot")
         return this.put_screenshot(pBitmap, p1, p2)

      ; BitmapToCoimage("show", pBitmap, title, pos, style, styleEx, parent)
      if (cotype = "show")
         return this.show(pBitmap, p1, p2, p3, p4, p5)

      ; BitmapToCoimage("window", pBitmap, title, pos, style, styleEx, parent)
      if (cotype = "window")
         return this.put_window(pBitmap, p1, p2, p3, p4, p5)

      ; BitmapToCoimage("desktop", pBitmap)
      if (cotype = "desktop")
         return this.put_desktop(pBitmap)

      ; BitmapToCoimage("wallpaper", pBitmap)
      if (cotype = "wallpaper")
         return this.put_wallpaper(pBitmap)

      ; BitmapToCoimage("cursor", pBitmap, xHotspot, yHotspot)
      if (cotype = "cursor")
         return this.put_cursor(pBitmap, p1, p2)

      ; BitmapToCoimage("url", pBitmap)
      if (cotype = "url")
         return this.put_url(pBitmap)

      ; BitmapToCoimage("file", pBitmap, filepath, quality)
      if (cotype = "file")
         return this.put_file(pBitmap, p1, p2)

      ; BitmapToCoimage("hex", pBitmap, extension, quality)
      if (cotype = "hex")
         return this.put_hex(pBitmap, p1, p2)

      ; BitmapToCoimage("base64", pBitmap, extension, quality)
      if (cotype = "base64")
         return this.put_base64(pBitmap, p1, p2)

      ; BitmapToCoimage("dc", pBitmap, alpha)
      if (cotype = "dc")
         return this.put_dc(pBitmap, p1)

      ; BitmapToCoimage("hBitmap", pBitmap, alpha)
      if (cotype = "hBitmap")
         return this.put_hBitmap(pBitmap, p1)

      ; BitmapToCoimage("hIcon", pBitmap)
      if (cotype = "hIcon")
         return this.put_hIcon(pBitmap)

      ; BitmapToCoimage("bitmap", pBitmap)
      if (cotype = "bitmap")
         return pBitmap

      ; BitmapToCoimage("stream", pBitmap, extension, quality)
      if (cotype = "stream")
         return this.put_stream(pBitmap, p1, p2)

      ; BitmapToCoimage("RandomAccessStream", pBitmap, extension, quality)
      if (cotype = "RandomAccessStream")
         return this.put_RandomAccessStream(pBitmap, p1, p2)

      throw Exception("Conversion from bitmap to " cotype " is not supported.")
   }

   ToStream(type, image, index := 0) {

      if (type = "clipboard_png")
         return this.get_clipboard_png()

      if (type = "pdf")
         return this.get_pdf(image, index)

      if (type = "url")
         return this.get_url(image)

      if (type = "file")
         return this.get_file(image)

      if (type = "hex")
         return this.get_hex(image)

      if (type = "base64")
         return this.get_base64(image)

      if (type = "stream")
         return this.get_stream(image)

      if (type = "RandomAccessStream")
         return this.get_RandomAccessStream(image)

      throw Exception("Conversion from " type " to stream is not supported.")
   }

   StreamToCoimage(cotype, pStream, p1 := "", p2 := "", p*) {
      ; StreamToCoimage("file", pStream, filepath)
      if (cotype = "file")
         return this.set_file(pStream, p1)

      ; StreamToCoimage("hex", pStream)
      if (cotype = "hex")
         return this.set_hex(pStream)

      ; StreamToCoimage("base64", pStream)
      if (cotype = "base64")
         return this.set_base64(pStream)

      ; StreamToCoimage("stream", pStream)
      if (cotype = "stream")
         return pStream

      ; StreamToCoimage("RandomAccessStream", pStream)
      if (cotype = "RandomAccessStream")
         return this.set_RandomAccessStream(pStream)

      throw Exception("Conversion from stream to " cotype " is not supported.")
   }

   BitmapCrop(ByRef pBitmap, crop) {
      if not (IsObject(crop)
      && crop[1] ~= "^-?\d+(\.\d*)?%?$" && crop[2] ~= "^-?\d+(\.\d*)?%?$"
      && crop[3] ~= "^-?\d+(\.\d*)?%?$" && crop[4] ~= "^-?\d+(\.\d*)?%?$")
         throw Exception("Invalid crop.")

      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "int*", format:=0)

      ; Abstraction Shift.
      ; Previously, real values depended on abstract values.
      ; Now, real values have been resolved, and abstract values depend on reals.

      ; Are the numbers percentages?
      crop[1] := (crop[1] ~= "%$") ? SubStr(crop[1], 1, -1) * 0.01 *  width : crop[1]
      crop[2] := (crop[2] ~= "%$") ? SubStr(crop[2], 1, -1) * 0.01 * height : crop[2]
      crop[3] := (crop[3] ~= "%$") ? SubStr(crop[3], 1, -1) * 0.01 *  width : crop[3]
      crop[4] := (crop[4] ~= "%$") ? SubStr(crop[4], 1, -1) * 0.01 * height : crop[4]

      ; If numbers are negative, subtract the values from the edge.
      crop[1] := Abs(crop[1])
      crop[2] := Abs(crop[2])
      crop[3] := (crop[3] < 0) ?  width - Abs(crop[3]) - Abs(crop[1]) : crop[3]
      crop[4] := (crop[4] < 0) ? height - Abs(crop[4]) - Abs(crop[2]) : crop[4]

      ; Round to the nearest integer. Reminder: width and height are distances, not coordinates.
      safe_x := Round(crop[1])
      safe_y := Round(crop[2])
      safe_w := Round(crop[1] + crop[3]) - Round(crop[1])
      safe_h := Round(crop[2] + crop[4]) - Round(crop[2])

      ; Minimum size is 1 x 1. Ensure that coordinates can never exceed the expected Bitmap area.
      safe_x := (safe_x >= width) ? 0 : safe_x                                      ; Default x is zero.
      safe_y := (safe_y >= height) ? 0 : safe_y                                     ; Default y is zero.
      safe_w := (safe_w = 0 || safe_x + safe_w > width) ? width - safe_x : safe_w   ; Default w is max width.
      safe_h := (safe_h = 0 || safe_y + safe_h > height) ? height - safe_y : safe_h ; Default h is max height.

      ; Avoid cropping if no changes are detected.
      if (safe_x = 0 && safe_y = 0 && safe_w = width && safe_h = height)
         return pBitmap

      ; Clone
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", safe_x
               ,    "int", safe_y
               ,    "int", safe_w
               ,    "int", safe_h
               ,    "int", format
               ,    "ptr", pBitmap
               ,   "ptr*", pBitmapCrop:=0)

      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      return pBitmap := pBitmapCrop
   }

   BitmapScale(ByRef pBitmap, scale) {
      if not (IsObject(scale) && ((scale[1] ~= "^\d+$") || (scale[2] ~= "^\d+$")) || (scale ~= "^\d+(\.\d+)?$"))
         throw Exception("Invalid scale.")

      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "int*", format:=0)

      if IsObject(scale) {
         safe_w := (scale[1] ~= "^\d+$") ? scale[1] : Round(width / height * scale[2])
         safe_h := (scale[2] ~= "^\d+$") ? scale[2] : Round(height / width * scale[1])
      } else {
         safe_w := Ceil(width * scale)
         safe_h := Ceil(height * scale)
      }

      ; Avoid drawing if no changes detected.
      if (safe_w = width && safe_h = height)
         return pBitmap

      ; Create a new bitmap and get the graphics context.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", safe_w, "int", safe_h, "int", 0, "int", format, "ptr", 0, "ptr*", pBitmapScale:=0)
      DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", pBitmapScale, "ptr*", pGraphics:=0)

      ; Set settings in graphics context.
      DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
      DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
      DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

      ; Draw Image.
      DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", ImageAttr:=0)
      DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", ImageAttr, "int", 3) ; WrapModeTileFlipXY
      DllCall("gdiplus\GdipDrawImageRectRectI"
               ,    "ptr", pGraphics
               ,    "ptr", pBitmap
               ,    "int", 0, "int", 0, "int", safe_w, "int", safe_h ; destination rectangle
               ,    "int", 0, "int", 0, "int",  width, "int", height ; source rectangle
               ,    "int", 2
               ,    "ptr", ImageAttr
               ,    "ptr", 0
               ,    "ptr", 0)
      DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)

      ; Clean up the graphics context.
      DllCall("gdiplus\GdipDeleteGraphics", "ptr", pGraphics)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      return pBitmap := pBitmapScale
   }

   is_url(url) {
      ; Thanks dperini - https://gist.github.com/dperini/729294
      ; Also see for comparisons: https://mathiasbynens.be/demo/url-regex
      ; Modified to be compatible with AutoHotkey. \u0000 -> \x{0000}.
      ; Force the declaration of the protocol because WinHttp requires it.
      return url ~= "^(?i)"
         . "(?:(?:https?|ftp):\/\/)" ; protocol identifier (FORCE)
         . "(?:\S+(?::\S*)?@)?" ; user:pass BasicAuth (optional)
         . "(?:"
            ; IP address exclusion
            ; private & local networks
            . "(?!(?:10|127)(?:\.\d{1,3}){3})"
            . "(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})"
            . "(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})"
            ; IP address dotted notation octets
            ; excludes loopback network 0.0.0.0
            ; excludes reserved space >= 224.0.0.0
            ; excludes network & broadcast addresses
            ; (first & last IP address of each class)
            . "(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])"
            . "(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}"
            . "(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))"
         . "|"
            ; host & domain names, may end with dot
            ; can be replaced by a shortest alternative
            ; (?![-_])(?:[-\\w\\u00a1-\\uffff]{0,63}[^-_]\\.)+
            . "(?:(?:[a-z0-9\x{00a1}-\x{ffff}][a-z0-9\x{00a1}-\x{ffff}_-]{0,62})?[a-z0-9\x{00a1}-\x{ffff}]\.)+"
            ; TLD identifier name, may end with dot
            . "(?:[a-z\x{00a1}-\x{ffff}]{2,}\.?)"
         . ")"
         . "(?::\d{2,5})?" ; port number (optional)
         . "(?:[/?#]\S*)?$" ; resource path (optional)
   }

   from_clipboard() {
      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; Fallback to CF_BITMAP. This format does not support transparency even with put_hBitmap().
      if !DllCall("IsClipboardFormatAvailable", "uint", 2)
         throw Exception("Clipboard does not have CF_BITMAP data.")

      if !(hbm := DllCall("GetClipboardData", "uint", 2, "ptr"))
         throw Exception("Shared clipboard data has been deleted.")

      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", pBitmap:=0)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("CloseClipboard")
      return pBitmap
   }

   from_clipboard_png() {
      pStream := this.get_clipboard_png()
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_clipboard_png() {
      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      png := DllCall("RegisterClipboardFormat", "str", "png", "uint")
      if !DllCall("IsClipboardFormatAvailable", "uint", png)
         throw Exception("Clipboard does not have PNG stream data.")

      if !(hData := DllCall("GetClipboardData", "uint", png, "ptr"))
         throw Exception("Shared clipboard data has been deleted.")

      ; Allow the stream to be freed while leaving the hData intact.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210930-00/?p=105745
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", False, "ptr*", pStream:=0, "uint")
      DllCall("CloseClipboard")
      return pStream
   }

   from_object(image) {
      return this.from_bitmap(image.pBitmap)
   }

   from_buffer(image) {
      ; to do
   }

   from_screenshot(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut( image[3], bi,  4,   "uint") ; Width
         NumPut(-image[4], bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Retrieve the device context for the screen.
      sdc := DllCall("GetDC", "ptr", 0, "ptr")

      ; Copies a portion of the screen to a new device context.
      DllCall("gdi32\BitBlt"
               , "ptr", hdc, "int", 0, "int", 0, "int", image[3], "int", image[4]
               , "ptr", sdc, "int", image[1], "int", image[2], "uint", 0x00CC0020 | 0x40000000) ; SRCCOPY | CAPTUREBLT

      ; Release the device context to the screen.
      DllCall("ReleaseDC", "ptr", 0, "ptr", sdc)

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_window(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; Get the handle to the window.
      image := (hwnd := WinExist(image)) ? hwnd : image

      ; Restore the window if minimized! Must be visible for capture.
      if DllCall("IsIconic", "ptr", image)
         DllCall("ShowWindow", "ptr", image, "int", 4)

      ; Check window DPI awareness.
      ; PROCESS_DPI_UNAWARE = 0, PROCESS_SYSTEM_DPI_AWARE = 1, PROCESS_PER_MONITOR_DPI_AWARE = 2
      DPI_AWARENESS := True ; Assume dpi aware if process cannot be opened.
      DllCall("GetWindowThreadProcessId", "ptr", image, "ptr*", pid:=0, "ptr")
      if hProcess := DllCall("OpenProcess", "uint", 0x0400, "int", False, "uint", pid, "ptr") {
         DllCall("Shcore\GetProcessDpiAwareness", "ptr", hProcess, "int*", DPI_AWARENESS)
         DllCall("CloseHandle", "ptr", hProcess)
      }

      ; Get the width and height of the client window.
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", DPI_AWARENESS ? -3 : -5, "ptr")
      DllCall("GetClientRect", "ptr", image, "ptr", &Rect := VarSetCapacity(Rect, 16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Print the window onto the hBitmap using an undocumented flag. https://stackoverflow.com/a/40042587
      DllCall("user32\PrintWindow", "ptr", image, "ptr", hdc, "uint", 0x3) ; PW_RENDERFULLCONTENT | PW_CLIENTONLY
      ; Additional info on how this is implemented: https://www.reddit.com/r/windows/comments/8ffr56/altprintscreen/

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_desktop() {
      ; Find the child window.
      WinGet windows, List, ahk_class WorkerW
      if (windows == 0)
         throw Exception("The hidden desktop window has not been initalized. Call ImagePutDesktop() first.")

      Loop % windows
         hwnd := windows%A_Index%
      until DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "SHELLDLL_DefView", "ptr", 0)

      ; Maybe this hack gets patched. Tough luck!
      if !(WorkerW := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "WorkerW", "ptr", 0, "ptr"))
         throw Exception("Could not locate hidden window behind desktop.")

      ; Get the width and height of the client window.
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      DllCall("GetClientRect", "ptr", WorkerW, "ptr", &Rect := VarSetCapacity(Rect, 16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; Get device context of spawned window.
      sdc := DllCall("GetDCEx", "ptr", WorkerW, "ptr", 0, "int", 0x403, "ptr") ; LockWindowUpdate | Cache | Window

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Copies a portion of the hidden window to a new device context.
      DllCall("gdi32\BitBlt"
               , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
               , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      ; Release device context of spawned window.
      DllCall("ReleaseDC", "ptr", 0, "ptr", sdc)

      return pBitmap
   }

   from_wallpaper() {
      ; Get the width and height of all monitors.
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      width  := DllCall("GetSystemMetrics", "int", 78, "int")
      height := DllCall("GetSystemMetrics", "int", 79, "int")
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Paints the wallpaper.
      DllCall("user32\PaintDesktop", "ptr", hdc)

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_cursor() {
      ; Thanks 23W - https://stackoverflow.com/a/13295280

      ; struct CURSORINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-cursorinfo
      VarSetCapacity(ci, size := 16+A_PtrSize, 0) ; sizeof(CURSORINFO) = 20, 24
         NumPut(size, ci, "int")
      DllCall("GetCursorInfo", "ptr", &ci)
         ; cShow   := NumGet(ci,  4, "int") ; 0x1 = CURSOR_SHOWING, 0x2 = CURSOR_SUPPRESSED
         , hCursor := NumGet(ci,  8, "ptr")
         ; xCursor := NumGet(ci,  8+A_PtrSize, "int")
         ; yCursor := NumGet(ci, 12+A_PtrSize, "int")

      ; Cursors are the same as icons!
      pBitmap := this.from_hIcon(hCursor)

      ; Cleanup the handle to the cursor. Same as DestroyIcon.
      DllCall("DestroyCursor", "ptr", hCursor)

      return pBitmap
   }

   from_pdf(image, index := 0) {
      pStream := this.get_pdf(image, index)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_pdf(image, index := 0) {
      ; Thanks malcev - https://www.autohotkey.com/boards/viewtopic.php?t=80735

      ; Create a stream from either a url or a file.
      pStream := this.is_url(image) ? this.get_url(image) : this.get_file(image)

      ; Compare the signature of the file with the PDF magic string "%PDF".
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", &signature := VarSetCapacity(signature, 4), "uint", 4, "uint")
      StrPut("%PDF", &magic := VarSetCapacity(magic, 4), "CP0")
      if 4 > DllCall("ntdll\RtlCompareMemory", "ptr", &signature, "ptr", &magic, "uptr", 4, "uptr")
         throw Exception("Invalid PDF.")

      ; Create a RandomAccessStream with BSOS_PREFERDESTINATIONSTREAM.
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall("ShCore\CreateRandomAccessStreamOverStream", "ptr", pStream, "uint", 1, "ptr", &CLSID, "ptr*", pRandomAccessStream:=0, "uint")

      ; Create the "Windows.Data.Pdf.PdfDocument" class using IPdfDocumentStatics.
      DllCall("combase\WindowsCreateString", "wstr", "Windows.Data.Pdf.PdfDocument", "uint", 28, "ptr*", hString:=0, "uint")
      DllCall("ole32\CLSIDFromString", "wstr", "{433A0B5F-C007-4788-90F2-08143D922599}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall("combase\RoGetActivationFactory", "ptr", hString, "ptr", &CLSID, "ptr*", PdfDocumentStatics:=0, "uint")
      DllCall("combase\WindowsDeleteString", "ptr", hString, "uint")

      ; Create the PDF document.
      DllCall(IPdfDocumentStatics_LoadFromStreamAsync := NumGet(NumGet(PdfDocumentStatics+0)+8*A_PtrSize), "ptr", PdfDocumentStatics, "ptr", pRandomAccessStream, "ptr*", PdfDocument:=0)
      this.WaitForAsync(PdfDocument)

      ; Get Page
      DllCall(IPdfDocument_GetPage := NumGet(NumGet(PdfDocument+0)+7*A_PtrSize), "ptr", PdfDocument, "uint*", count:=0)
      index := (index > 0) ? index - 1 : (index < 0) ? count + index : 0 ; Zero indexed.
      if (index > count || index < 0) {
         ObjRelease(PdfDocument)
         ObjRelease(PdfDocumentStatics)
         this.ObjReleaseClose(pRandomAccessStream)
         ObjRelease(pStream)
         throw Exception("The maximum number of pages in this pdf is " count ".")
      }
      DllCall(IPdfDocument_GetPage := NumGet(NumGet(PdfDocument+0)+6*A_PtrSize), "ptr", PdfDocument, "uint", index, "ptr*", PdfPage:=0)

      ; Render the page to an output stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "uint", True, "ptr*", pStreamOut:=0)
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall("ShCore\CreateRandomAccessStreamOverStream", "ptr", pStreamOut, "uint", BSOS_DEFAULT := 0, "ptr", &CLSID, "ptr*", pRandomAccessStreamOut:=0)
      DllCall(IPdfPage_RenderToStreamAsync := NumGet(NumGet(PdfPage+0)+6*A_PtrSize), "ptr", PdfPage, "ptr", pRandomAccessStreamOut, "ptr*", AsyncInfo:=0)
      this.WaitForAsync(AsyncInfo)

      ; Cleanup
      this.ObjReleaseClose(pRandomAccessStreamOut)
      this.ObjReleaseClose(PdfPage)

      ObjRelease(PdfDocument)
      ObjRelease(PdfDocumentStatics)

      this.ObjReleaseClose(pRandomAccessStream)
      ObjRelease(pStream)

      return pStreamOut
   }

   WaitForAsync(ByRef Object) {
      AsyncInfo := ComObjQuery(Object, IAsyncInfo := "{00000036-0000-0000-C000-000000000046}")
      while !DllCall(IAsyncInfo_Status := NumGet(NumGet(AsyncInfo+0)+7*A_PtrSize), "ptr", AsyncInfo, "uint*", status:=0)
         and (status = 0)
            Sleep 10

      if (status != 1) {
         DllCall(IAsyncInfo_ErrorCode := NumGet(NumGet(AsyncInfo+0)+8*A_PtrSize), "ptr", AsyncInfo, "uint*", ErrorCode:=0)
         throw Exception("AsyncInfo status error: " ErrorCode)
      }

      DllCall(NumGet(NumGet(Object+0)+8*A_PtrSize), "ptr", Object, "ptr*", ObjectResult:=0) ; GetResults
      ObjRelease(Object)
      Object := ObjectResult

      DllCall(IAsyncInfo_Close := NumGet(NumGet(AsyncInfo+0)+10*A_PtrSize), "ptr", AsyncInfo)
      ObjRelease(AsyncInfo)
   }

   ObjReleaseClose(ByRef Object) {
      if Object {
         if (Close := ComObjQuery(Object, IClosable := "{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}")) {
            DllCall(IClosable_Close := NumGet(NumGet(Close+0)+6*A_PtrSize), "ptr", Close)
            ObjRelease(Close)
         }
         refcount := ObjRelease(Object)
         Object := ""
         return refcount
      }
   }

   from_url(image) {
      pStream := this.get_url(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_url(image) {
      req := ComObjCreate("WinHttp.WinHttpRequest.5.1")
      req.Open("GET", image, True)
      req.Send()
      req.WaitForResponse()
      pStream := ComObjQuery(req.ResponseStream, "{0000000C-0000-0000-C000-000000000046}")
      return pStream
   }

   from_file(image) {
      ; This is faster than GdipCreateBitmapFromFile and does not lock the file.
      pStream := this.get_file(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_file(image) {
      file := FileOpen(image, "r")
      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", file.length, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      file.RawRead(pData+0, file.length)
      DllCall("GlobalUnlock", "ptr", hData)
      file.Close()
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", pStream:=0, "uint")
      return pStream
   }

   from_hex(image) {
      pStream := this.get_hex(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_hex(image) {
      image := Trim(image)
      image := RegExReplace(image, "^(0[xX])")
      return this.get_string(image, 0xC) ; CRYPT_STRING_HEXRAW
   }

   from_base64(image) {
      pStream := this.get_base64(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_base64(image) {
      image := Trim(image)
      image := RegExReplace(image, "^data:image\/[a-z]+;base64,")
      return this.get_string(image, 0x1) ; CRYPT_STRING_BASE64
   }

   get_string(image, flags) {
      ; Ask for the size. Then allocate movable memory, copy to the buffer, unlock, and create stream.
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", &image, "uint", 0, "uint", flags, "ptr", 0, "uint*", size:=0, "ptr", 0, "ptr", 0)

      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")

      DllCall("crypt32\CryptStringToBinary"
               , "ptr", &image, "uint", 0, "uint", flags, "ptr", pData, "uint*", size, "ptr", 0, "ptr", 0)

      DllCall("GlobalUnlock", "ptr", hData)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", pStream:=0, "uint")

      return pStream
   }

   from_monitor(image) {
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      if (image > 0) {
         SysGet _, Monitor, % image
         x := _Left
         y := _Top
         w := _Right - _Left
         h := _Bottom - _Top
      } else {
         x := DllCall("GetSystemMetrics", "int", 76, "int")
         y := DllCall("GetSystemMetrics", "int", 77, "int")
         w := DllCall("GetSystemMetrics", "int", 78, "int")
         h := DllCall("GetSystemMetrics", "int", 79, "int")
      }
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
      return this.from_screenshot([x,y,w,h])
   }

   from_dc(image) {
      ; An application cannot select a single bitmap into more than one DC at a time.
      if !(sbm := DllCall("GetCurrentObject", "ptr", image, "uint", 7))
         throw Exception("The device context has no bitmap selected.")

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      VarSetCapacity(dib, size := 64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", sbm, "int", size, "ptr", &dib)
         , width  := NumGet(dib, 4, "uint")
         , height := NumGet(dib, 8, "uint")
         , bpp    := NumGet(dib, 18, "ushort")
         , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

      ; Fallback to built-in method if pixels are not 32-bit ARGB or hBitmap is a device dependent bitmap.
      if (pBits = 0 || bpp != 32) { ; This built-in version is 120% faster but ignores transparency.
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", sbm, "ptr", 0, "ptr*", pBitmap:=0)
         return pBitmap
      }

      ; Create a device independent bitmap with negative height. All DIBs use the screen pixel format (pARGB).
      ; Use hbm to buffer the image such that top-down and bottom-up images are mapped to this top-down buffer.
      ; pBits is the pointer to (top-down) pixel values. The Scan0 will point to the pBits.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     pBits, BitmapData, 16,    "ptr") ; Scan0

      ; Use LockBits to create a writable buffer that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.

      ; Copies the image (hBitmap) to a top-down bitmap. Removes bottom-up-ness if present.
      DllCall("gdi32\BitBlt"
               , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
               , "ptr", image, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_hBitmap(image) {
      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      VarSetCapacity(dib, size := 64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", image, "int", size, "ptr", &dib)
         , width  := NumGet(dib, 4, "uint")
         , height := NumGet(dib, 8, "uint")
         , bpp    := NumGet(dib, 18, "ushort")
         , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

      ; Fallback to built-in method if pixels are not 32-bit ARGB or hBitmap is a device dependent bitmap.
      if (pBits = 0 || bpp != 32) { ; This built-in version is 120% faster but ignores transparency.
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", image, "ptr", 0, "ptr*", pBitmap:=0)
         return pBitmap
      }

      ; Create a device independent bitmap with negative height. All DIBs use the screen pixel format (pARGB).
      ; Use hbm to buffer the image such that top-down and bottom-up images are mapped to this top-down buffer.
      ; pBits is the pointer to (top-down) pixel values. The Scan0 will point to the pBits.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     pBits, BitmapData, 16,    "ptr") ; Scan0

      ; Use LockBits to create a copy-from buffer on pBits that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.

      ; If the source image cannot be selected onto a device context BitBlt cannot be used.
      sdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")           ; Creates a memory DC compatible with the current screen.
      old := DllCall("SelectObject", "ptr", sdc, "ptr", image, "ptr") ; Returns 0 on failure.

      ; Copies the image (hBitmap) to a top-down bitmap. Removes bottom-up-ness if present.
      if (old) ; Using BitBlt is about 10% faster than GetDIBits.
         DllCall("gdi32\BitBlt"
                  , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
                  , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY
      else
         DllCall("GetDIBits", "ptr", hdc, "ptr", image, "uint", 0, "uint", height, "ptr", pBits, "ptr", &bi, "uint", 0)

      ; The stock bitmap (obm) can never be leaked.
      DllCall("SelectObject", "ptr", sdc, "ptr", obm)
      DllCall("DeleteDC",     "ptr", sdc)

      ; Write the pARGB pixels from the device independent bitmap (hbm) to the ARGB pBitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_hIcon(image) {
      ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
      VarSetCapacity(ii, 8+3*A_PtrSize)                 ; sizeof(ICONINFO) = 20, 32
      DllCall("GetIconInfo", "ptr", image, "ptr", &ii)
         ; xHotspot := NumGet(ii, 4, "uint")
         ; yHotspot := NumGet(ii, 8, "uint")
         , hbmMask  := NumGet(ii, 8+A_PtrSize, "ptr")   ; 12, 16
         , hbmColor := NumGet(ii, 8+2*A_PtrSize, "ptr") ; 16, 24

      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      VarSetCapacity(bm, size := 16+2*A_PtrSize)        ; sizeof(BITMAP) = 24, 32
      DllCall("GetObject", "ptr", hbmMask, "int", size, "ptr", &bm)
         , width  := NumGet(bm, 4, "uint")
         , height := NumGet(bm, 8, "uint") / (hbmColor ? 1 : 2) ; Black and White cursors have doubled height.

      ; Clean up these hBitmaps.
      DllCall("DeleteObject", "ptr", hbmMask)
      DllCall("DeleteObject", "ptr", hbmColor)

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     pBits, BitmapData, 16,    "ptr") ; Scan0

      ; Use LockBits to create a writable buffer that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.

      ; Don't use DI_DEFAULTSIZE to draw the icon like DrawIcon does as it will resize to 32 x 32.
      DllCall("user32\DrawIconEx"
               , "ptr", hdc,   "int", 0, "int", 0
               , "ptr", image, "int", 0, "int", 0
               , "uint", 0, "ptr", 0, "uint", 0x1 | 0x2 | 0x4) ; DI_MASK | DI_IMAGE | DI_COMPAT

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   from_bitmap(image) {
      ; Retain the current PixelFormat, unlike GdipCloneImage.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", image, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", image, "uint*", height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", image, "int*", format:=0)
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", 0
               ,    "int", 0
               ,    "int", width
               ,    "int", height
               ,    "int", format
               ,    "ptr", image
               ,   "ptr*", pBitmap:=0)
      return pBitmap
   }

   from_stream(image) {
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", image, "ptr*", pBitmap:=0)
      return pBitmap
   }

   get_stream(image) {
      ; Creates a new, separate stream. Necessary to separate reference counting through a clone.
      DllCall(IStream_Clone := NumGet(NumGet(image+0)+13*A_PtrSize), "ptr", image, "ptr*", pStream:=0)
      return pStream
   }

   from_RandomAccessStream(image) {
      ; Creating a Bitmap from stream adds +3 to the reference count until DisposeImage is called.
      pStream := this.get_RandomAccessStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_RandomAccessStream(image) {
      ; Note that the returned stream shares a reference count with the original RandomAccessStream's internal stream.
      DllCall("ole32\CLSIDFromString", "wstr", "{0000000C-0000-0000-C000-000000000046}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall("ShCore\CreateStreamOverRandomAccessStream", "ptr", image, "ptr", &CLSID, "ptr*", pStream:=0, "uint")
      return pStream
   }

   from_sprite(image) {
      ; Create a source pBitmap and extract the width and height.
      if DllCall("gdiplus\GdipCreateBitmapFromFile", "wstr", image, "ptr*", sBitmap:=0)
         if !(sBitmap := this.from_url(image))
            throw Exception("Could not be loaded from a valid file path or URL.")

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", sBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", sBitmap, "uint*", height:=0)

      ; Create a destination pBitmap in 32-bit ARGB and get its device context though GDI+.
      ; Note that a device context from a graphics context can only be drawn on, not read.
      ; Also note that using a graphics context and blitting does not create a pixel perfect image.
      ; Using a DIB and LockBits is about 5% faster.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", dBitmap:=0)
      DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", dBitmap, "ptr*", dGraphics:=0)
      DllCall("gdiplus\GdipGetDC", "ptr", dGraphics, "ptr*", ddc:=0)

      ; Keep any existing transparency for whatever reason.
      hBitmap := this.put_hBitmap(sBitmap) ; Could copy this code here for even more speed.

      ; Create a source device context and associate the source hBitmap.
      sdc := DllCall("CreateCompatibleDC", "ptr", ddc, "ptr")
      obm := DllCall("SelectObject", "ptr", sdc, "ptr", hBitmap, "ptr")

      ; Copy the image making the top-left pixel the color key.
      DllCall("msimg32\TransparentBlt"
               , "ptr", ddc, "int", 0, "int", 0, "int", width, "int", height  ; destination
               , "ptr", sdc, "int", 0, "int", 0, "int", width, "int", height  ; source
               , "uint", DllCall("GetPixel", "ptr", sdc, "int", 0, "int", 0)) ; RGB pixel.

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", sdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hBitmap)
      DllCall("DeleteDC",     "ptr", sdc)

      ; Release the graphics context and delete.
      DllCall("gdiplus\GdipReleaseDC", "ptr", dGraphics, "ptr", ddc)
      DllCall("gdiplus\GdipDeleteGraphics", "ptr", dGraphics)

      return dBitmap
   }

   put_clipboard(pBitmap) {
      ; Standard Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/standard-clipboard-formats
      ; Synthesized Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/clipboard-formats

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; If not opened with a valid window handle EmptyClipboard will crash the next call to OpenClipboard.
      DllCall("EmptyClipboard")

      ; #1 - Place the image onto the clipboard as a PNG stream.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3

      ; Create a Stream whose underlying HGlobal must be referenced or lost forever.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210929-00/?p=105742
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", pStream:=0, "uint")
      this.select_codec(pBitmap, "png", "", pCodec, ep, ci, v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", (ep) ? &ep : 0)

      ; Rescue the HGlobal after GDI+ has written the PNG to stream and release the stream.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", hData:=0, "uint")
      ObjRelease(pStream)

      ; Set the rescued HGlobal to the clipboard as a shared object.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint") ; case insensitive
      DllCall("SetClipboardData", "uint", png, "ptr", hData)


      ; #2 - Place the image onto the clipboard in the CF_DIB format using a bottom-up bitmap.
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", hbm:=0, "uint", 0)

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      VarSetCapacity(dib, size := 64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", hbm, "int", size, "ptr", &dib)
         , pBits := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")  ; bmBits
         , size  := NumGet(dib, A_PtrSize = 4 ? 44:52, "uint") ; biSizeImage

      ; Allocate space for a new device independent bitmap on movable memory.
      hdib := DllCall("GlobalAlloc", "uint", 0x2, "uptr", 40 + size, "ptr") ; sizeof(BITMAPINFOHEADER) = 40
      pdib := DllCall("GlobalLock", "ptr", hdib, "ptr")

      ; Copy the BITMAPINFOHEADER.
      DllCall("RtlMoveMemory", "ptr", pdib, "ptr", &dib + (A_PtrSize = 4 ? 24:32), "uptr", 40)

      ; Copy the pixel data.
      DllCall("RtlMoveMemory", "ptr", pdib+40, "ptr", pBits, "uptr", size)

      ; Unlock to moveable memory because the clipboard requires it.
      DllCall("GlobalUnlock", "ptr", hdib)

      ; Delete the temporary hBitmap.
      DllCall("DeleteObject", "ptr", hbm)

      ; CF_DIB (8) can be synthesized into CF_BITMAP (2), CF_PALETTE (9), and CF_DIBV5 (17).
      DllCall("SetClipboardData", "uint", 8, "ptr", hdib)

      ; Close the clipboard.
      DllCall("CloseClipboard")

      return ""
   }

   put_buffer(pBitmap) {
      return new ImagePut.BitmapBuffer(pBitmap)
   }

   class BitmapBuffer {
      __New(pBitmap) {
         this.pBitmap := pBitmap
         ImagePut.gdiplusStartup()
      }

      __Delete() {
         ImagePut.gdiplusShutdown("smart_pointer", this.pBitmap)
      }

      width {
         get {
            DllCall("gdiplus\GdipGetImageWidth", "ptr", this.pBitmap, "uint*", width:=0)
            return width
         }
      }

      height {
         get {
            DllCall("gdiplus\GdipGetImageHeight", "ptr", this.pBitmap, "uint*", height:=0)
            return height
         }
      }
   }

   put_screenshot(pBitmap, screenshot := "", alpha := "") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      x := (IsObject(screenshot) && screenshot[1] != "") ? screenshot[1] : 0
      y := (IsObject(screenshot) && screenshot[2] != "") ? screenshot[2] : 0
      w := (IsObject(screenshot) && screenshot[3] != "") ? screenshot[3] : width
      h := (IsObject(screenshot) && screenshot[4] != "") ? screenshot[4] : height

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.put_hBitmap(pBitmap, alpha)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Retrieve the device context for the screen.
      ddc := DllCall("GetDC", "ptr", 0, "ptr")

      ; Perform bilinear interpolation. See: https://stackoverflow.com/a/4358798
      DllCall("SetStretchBltMode", "ptr", ddc, "int", 4) ; HALFTONE

      ; Copies a portion of the screen to a new device context.
      DllCall("gdi32\StretchBlt"
               , "ptr", ddc, "int", x, "int", y, "int", w,     "int", h
               , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
               , "uint", 0x00CC0020) ; SRCCOPY

      ; Release the device context to the screen.
      DllCall("ReleaseDC", "ptr", 0, "ptr", ddc)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return [x,y,w,h]
   }

   put_window(pBitmap, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "") {
      ; Window Styles - https://docs.microsoft.com/en-us/windows/win32/winmsg/window-styles
      ; Extended Window Styles - https://docs.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles

      ; Parent Window
      WS_POPUP                  := 0x80000000   ; Allow small windows.
      WS_CLIPCHILDREN           :=  0x2000000   ; Prevents redraw of pixels covered by child windows.
      WS_CAPTION                :=   0xC00000   ; Titlebar.
      WS_SYSMENU                :=    0x80000   ; Close button. Comes with Alt+Space menu.
      WS_EX_TOPMOST             :=        0x8   ; Always on top.
      WS_EX_DLGMODALFRAME       :=        0x1   ; Removes small icon in titlebar with A_ScriptHwnd as parent.

      ; Child Window
      WS_CHILD                  := 0x40000000   ; Creates a child window.
      WS_VISIBLE                := 0x10000000   ; Show on creation.
      WS_EX_LAYERED             :=    0x80000   ; For UpdateLayeredWindow.

      ; Set default styles if null.
      style := (style == "") ? WS_POPUP | WS_CLIPCHILDREN | WS_CAPTION | WS_SYSMENU : style
      styleEx := (styleEx == "") ? WS_EX_TOPMOST | WS_EX_DLGMODALFRAME : styleEx

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Get Screen width and height with DPI awareness.
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s  := (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w  := IsObject(pos) && pos.HasKey(3) ? pos[3] : s * width
      h  := IsObject(pos) && pos.HasKey(4) ? pos[4] : s * height

      x  := IsObject(pos) && pos.HasKey(1) ? pos[1] : 0.5*(ScreenWidth - w)
      y  := IsObject(pos) && pos.HasKey(2) ? pos[2] : 0.5*(ScreenHeight - h)

      ; Resolve dependent coordinates first, coordinates second, and distances last.
      x2 := Round(x + w)
      y2 := Round(y + h)
      x  := Round(x)
      y  := Round(y)
      w  := x2 - x
      h  := y2 - y

      VarSetCapacity(rect, 16)
         NumPut( x, rect,  0, "int")
         NumPut( y, rect,  4, "int")
         NumPut(x2, rect,  8, "int")
         NumPut(y2, rect, 12, "int")

      DllCall("AdjustWindowRectEx", "ptr", &rect, "uint", style, "uint", 0, "uint", styleEx)

      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      hwnd := DllCall("CreateWindowEx"
               ,   "uint", styleEx
               ,    "str", this.WindowClass()       ; lpClassName
               ,    "str", title                    ; lpWindowName
               ,   "uint", style
               ,    "int", NumGet(rect,  0, "int")
               ,    "int", NumGet(rect,  4, "int")
               ,    "int", NumGet(rect,  8, "int") - NumGet(rect,  0, "int")
               ,    "int", NumGet(rect, 12, "int") - NumGet(rect,  4, "int")
               ,    "ptr", (parent != "") ? parent : A_ScriptHwnd
               ,    "ptr", 0                        ; hMenu
               ,    "ptr", 0                        ; hInstance
               ,    "ptr", 0                        ; lpParam
               ,    "ptr")
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; Tests have shown that changing the system default colors has no effect on F0F0F0.
      ; Must call SetWindowLong with WS_EX_LAYERED immediately before SetLayeredWindowAttributes.
      DllCall("SetWindowLong", "ptr", hwnd, "int", -20, "int", styleEx | WS_EX_LAYERED)
      DllCall("SetLayeredWindowAttributes", "ptr", hwnd, "uint", 0xF0F0F0, "uchar", 0, "int", 1)

      ; A layered child window is only available on Windows 8+.
      this.show(pBitmap, title, [0, 0, w, h], WS_CHILD | WS_VISIBLE, WS_EX_LAYERED, hwnd)

      DllCall("ShowWindow", "ptr", hwnd, "int", 1)

      return hwnd
   }

   show(pBitmap, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "") {
      ; Window Styles - https://docs.microsoft.com/en-us/windows/win32/winmsg/window-styles
      WS_POPUP                  := 0x80000000   ; Allow small windows.
      WS_VISIBLE                := 0x10000000   ; Show on creation.

      ; Extended Window Styles - https://docs.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles
      WS_EX_TOPMOST             :=        0x8   ; Always on top.
      WS_EX_TOOLWINDOW          :=       0x80   ; Hides from Alt+Tab menu. Removes small icon.
      WS_EX_LAYERED             :=    0x80000   ; For UpdateLayeredWindow.

      ; Set default styles if null.
      style := (style == "") ? WS_POPUP | WS_VISIBLE : style
      styleEx := (styleEx == "") ? WS_EX_TOPMOST | WS_EX_TOOLWINDOW | WS_EX_LAYERED : styleEx

      ; Prevent the script from exiting early.
      void := ObjBindMethod({}, {})
      Hotkey % "^+F12", % void, On

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Get Screen width and height with DPI awareness.
      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s  := (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w  := IsObject(pos) && pos.HasKey(3) ? pos[3] : s * width
      h  := IsObject(pos) && pos.HasKey(4) ? pos[4] : s * height

      x  := IsObject(pos) && pos.HasKey(1) ? pos[1] : 0.5*(ScreenWidth - w)
      y  := IsObject(pos) && pos.HasKey(2) ? pos[2] : 0.5*(ScreenHeight - h)

      ; Resolve dependent coordinates first, coordinates second, and distances last.
      x2 := Round(x + w)
      y2 := Round(y + h)
      x  := Round(x)
      y  := Round(y)
      w  := x2 - x
      h  := y2 - y

      ; Convert the source pBitmap into a hBitmap manually.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "int*", format:=0)

      ; Case 1: Image is not scaled.
      if (s = 1) {
         ; Transfer data from source pBitmap to an hBitmap manually.
         VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
            NumPut(  width, Rect,  8,   "uint") ; Width
            NumPut( height, Rect, 12,   "uint") ; Height
         VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
            NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
            NumPut(     pBits, BitmapData, 16,    "ptr") ; Scan0
         DllCall("gdiplus\GdipBitmapLockBits"
                  ,    "ptr", pBitmap
                  ,    "ptr", &Rect
                  ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
                  ,    "int", 0xE200B      ; Format32bppPArgb
                  ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.
         DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)
      }

      ; Case 2: Image is scaled.
      else {
         ; Create a graphics context from the device context.
         DllCall("gdiplus\GdipCreateFromHDC", "ptr", hdc , "ptr*", pGraphics:=0)

         ; Set settings in graphics context.
         DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
         DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
         DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

         ; Draw Image.
         DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", ImageAttr:=0)
         DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", ImageAttr, "int", 3) ; WrapModeTileFlipXY
         DllCall("gdiplus\GdipDrawImageRectRectI"
                  ,    "ptr", pGraphics
                  ,    "ptr", pBitmap
                  ,    "int", 0, "int", 0, "int", w,     "int", h      ; destination rectangle
                  ,    "int", 0, "int", 0, "int", width, "int", height ; source rectangle
                  ,    "int", 2
                  ,    "ptr", ImageAttr
                  ,    "ptr", 0
                  ,    "ptr", 0)
         DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)

         ; Clean up the graphics context.
         DllCall("gdiplus\GdipDeleteGraphics", "ptr", pGraphics)
      }

      dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      hwnd := DllCall("CreateWindowEx"
               ,   "uint", styleEx | WS_EX_LAYERED  ; dwExStyle
               ,    "str", this.WindowClass()       ; lpClassName
               ,    "str", title                    ; lpWindowName
               ,   "uint", style                    ; dwStyle
               ,    "int", x
               ,    "int", y
               ,    "int", w
               ,    "int", h
               ,    "ptr", (parent != "") ? parent : A_ScriptHwnd
               ,    "ptr", 0                        ; hMenu
               ,    "ptr", 0                        ; hInstance
               ,    "ptr", 0                        ; lpParam
               ,    "ptr")
      DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; Draw the contents of the device context onto the layered window.
      DllCall("UpdateLayeredWindow"
               ,    "ptr", hwnd                     ; hWnd
               ,    "ptr", 0                        ; hdcDst
               ,    "ptr", 0                        ; *pptDst
               ,"uint64*", w | h << 32              ; *psize
               ,    "ptr", hdc                      ; hdcSrc
               , "int64*", 0                        ; *pptSrc
               ,   "uint", 0                        ; crKey
               ,  "uint*", 0xFF << 16 | 0x01 << 24  ; *pblend
               ,   "uint", 2)                       ; dwFlags

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return hwnd
   }

   WindowClass() {
      ; The window class shares the name of this class.
      cls := this.__class
      VarSetCapacity(wc, size := A_PtrSize = 4 ? 48:80) ; sizeof(WNDCLASSEX) = 48, 80

      ; Check if the window class is already registered.
      hInstance := DllCall("GetModuleHandle", "ptr", 0, "ptr")
      if DllCall("GetClassInfoEx", "ptr", hInstance, "str", cls, "ptr", &wc)
         return cls

      ; Create window data.
      pWndProc := RegisterCallback(this.WindowProc,,, &this)
      hCursor := DllCall("LoadCursor", "ptr", 0, "ptr", 32512, "ptr") ; IDC_ARROW
      hBrush := DllCall("GetStockObject", "int", 5, "ptr") ; Hollow_brush

      ; struct tagWNDCLASSEXA - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexa
      ; struct tagWNDCLASSEXW - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexw
      _ := (A_PtrSize = 4)
         NumPut(       size, wc,         0,   "uint") ; cbSize
         NumPut(        0x8, wc,         4,   "uint") ; style
         NumPut(   pWndProc, wc,         8,    "ptr") ; lpfnWndProc
         NumPut(          0, wc, _ ? 12:16,    "int") ; cbClsExtra
         NumPut(          0, wc, _ ? 16:20,    "int") ; cbWndExtra
         NumPut(          0, wc, _ ? 20:24,    "ptr") ; hInstance
         NumPut(          0, wc, _ ? 24:32,    "ptr") ; hIcon
         NumPut(    hCursor, wc, _ ? 28:40,    "ptr") ; hCursor
         NumPut(     hBrush, wc, _ ? 32:48,    "ptr") ; hbrBackground
         NumPut(          0, wc, _ ? 36:56,    "ptr") ; lpszMenuName
         NumPut(       &cls, wc, _ ? 40:64,    "ptr") ; lpszClassName
         NumPut(          0, wc, _ ? 44:72,    "ptr") ; hIconSm

      ; Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
      DllCall("RegisterClassEx", "ptr", &wc, "ushort")

      ; Return the class name as a string.
      return cls
   }
      ; Define window behavior.
      WindowProc(uMsg, wParam, lParam) {
         hwnd := this
         ; WM_DESTROY
         if (uMsg = 0x2) {
            Hotkey % "^+F12", Off
         }

         ; WM_LBUTTONDOWN
         if (uMsg = 0x201) {
            parent := DllCall("GetParent", "ptr", hwnd, "ptr")
            hwnd := (parent != A_ScriptHwnd && parent != 0) ? parent : hwnd
            return DllCall("DefWindowProc", "ptr", hwnd, "uint", 0xA1, "uptr", 2, "ptr", 0, "ptr")
         }

         ; WM_RBUTTONUP
         if (uMsg = 0x205) {
            parent := DllCall("GetParent", "ptr", hwnd, "ptr")
            hwnd := (parent != A_ScriptHwnd && parent != 0) ? parent : hwnd
            return DllCall("DestroyWindow", "ptr", hwnd)
         }

         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }


   put_desktop(pBitmap) {
      ; Thanks Gerald Degeneve - https://www.codeproject.com/Articles/856020/Draw-Behind-Desktop-Icons-in-Windows-plus

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.put_hBitmap(pBitmap)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Post-Creator's Update Windows 10. WM_SPAWN_WORKER = 0x052C
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 0)
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 1)

      ; Find the child window.
      WinGet windows, List, ahk_class WorkerW
      Loop % windows
         hwnd := windows%A_Index%
      until DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "SHELLDLL_DefView", "ptr", 0)

      ; Maybe this hack gets patched. Tough luck!
      if !(WorkerW := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "WorkerW", "ptr", 0, "ptr"))
         throw Exception("Could not locate hidden window behind desktop.")

      ; Position the image in the center. This line can be removed.
      DllCall("SetWindowPos", "ptr", WorkerW, "ptr", 1
               , "int", Round((A_ScreenWidth - width) / 2)   ; x coordinate
               , "int", Round((A_ScreenHeight - height) / 2) ; y coordinate
               , "int", width, "int", height, "uint", 0)

      ; Get device context of spawned window.
      ddc := DllCall("GetDCEx", "ptr", WorkerW, "ptr", 0, "int", 0x403, "ptr") ; LockWindowUpdate | Cache | Window

      ; Copies a portion of the screen to a new device context.
      DllCall("gdi32\BitBlt"
               , "ptr", ddc, "int", 0, "int", 0, "int", width, "int", height
               , "ptr", hdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Release device context of spawned window.
      DllCall("ReleaseDC", "ptr", 0, "ptr", ddc)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return "desktop"
   }

   put_wallpaper(pBitmap) {
      ; Create a temporary image file.
      filepath := this.put_file(pBitmap)

      ; Get the absolute path of the file.
      length := DllCall("GetFullPathName", "str", filepath, "uint", 0, "ptr", 0, "ptr", 0, "uint")
      VarSetCapacity(buf, length*(A_IsUnicode?2:1))
      DllCall("GetFullPathName", "str", filepath, "uint", length, "str", buf, "ptr", 0, "uint")

      ; Keep waiting until the file has been created. (It should be instant!)
      loop
         if FileExist(filepath)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Unable to create temporary image file.")

      ; Set the temporary image file as the new desktop wallpaper.
      DllCall("SystemParametersInfo", "uint", SPI_SETDESKWALLPAPER := 0x14, "uint", 0, "str", buf, "uint", 2)

      ; This is a delayed delete call. #Persistent may be required on v1.
      DeleteFile := Func("DllCall").Bind("DeleteFile", "str", filepath)
      SetTimer % DeleteFile, -2000

      return "wallpaper"
   }

   put_cursor(pBitmap, xHotspot := "", yHotspot := "") {
      ; Thanks Nick - https://stackoverflow.com/a/550965

      ; Creates an icon that can be used as a cursor.
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", hIcon:=0)

      ; Sets the hotspot of the cursor by changing the icon into a cursor.
      if (xHotspot != "" || yHotspot != "") {
         ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
         VarSetCapacity(ii, 8+3*A_PtrSize)                          ; sizeof(ICONINFO) = 20, 32
         DllCall("GetIconInfo", "ptr", hIcon, "ptr", &ii)           ; Fill the ICONINFO structure.
            NumPut(False, ii, 0, "uint")                            ; True/false are icon/cursor respectively.
            (xHotspot != "") ? NumPut(xHotspot, ii, 4, "uint") : {} ; Set the xHotspot value. (Default: center point)
            (yHotspot != "") ? NumPut(yHotspot, ii, 8, "uint") : {} ; Set the yHotspot value. (Default: center point)
         DllCall("DestroyIcon", "ptr", hIcon)                       ; Destroy the icon after getting the ICONINFO structure.
         hIcon := DllCall("CreateIconIndirect", "ptr", &ii, "ptr")  ; Create a new cursor using ICONINFO.

         ; Clean up hbmMask and hbmColor created as a result of GetIconInfo.
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+A_PtrSize, "ptr"))   ; hbmMask
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+2*A_PtrSize, "ptr")) ; hbmColor
      }

      ; Set all 17 System Cursors. Must copy 17 times as SetSystemCursor deletes the handle each time.
      Loop Parse, % "32512,32513,32514,32515,32516,32631,32642,32643,32644,32645,32646,32648,32649,32650,32651,32671,32672", % ","
         if hCursor := DllCall("CopyImage", "ptr", hIcon, "uint", 2, "int", 0, "int", 0, "uint", 0, "ptr")
            if !DllCall("SetSystemCursor", "ptr", hCursor, "int", A_LoopField) ; calls DestroyCursor
               DllCall("DestroyCursor", "ptr", hCursor)

      ; Destroy the original hIcon. Same as DestroyCursor.
      DllCall("DestroyIcon", "ptr", hIcon)

      ; Returns the string A_Cursor to avoid evaluation.
      return "A_Cursor"
   }

   put_file(pBitmap, filepath := "", quality := "") {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      extension := "png"
      this.select_filepath(filepath, extension)

      ; Select the proper codec based on the extension of the file.
      this.select_codec(pBitmap, extension, quality, pCodec, ep, ci, v)

      ; Write the file to disk using the specified encoder and encoding parameters with exponential backoff.
      loop
         if !DllCall("gdiplus\GdipSaveImageToFile", "ptr", pBitmap, "wstr", filepath, "ptr", pCodec, "ptr", (ep) ? &ep : 0)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Could not save file to disk.")

      return filepath
   }

   set_file(pStream, filepath := "") {
      extension := "png"
      this.select_filepath(filepath, extension, pStream)

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\SHCreateStreamOnFileEx"
               ,   "wstr", filepath
               ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
               ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
               ,    "int", True            ; fCreate is ignored when STGM_CREATE is set.
               ,    "ptr", 0               ; pstmTemplate (reserved)
               ,   "ptr*", pFileStream:=0
               ,   "uint")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "ptr*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pFileStream, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      ObjRelease(pFileStream)

      return filepath
   }

   put_hex(pBitmap, extension := "", quality := "") {
      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      hex := this.set_hex(pStream)
      ObjRelease(pStream)
      return hex
   }

   set_hex(pStream) {
      return this.set_string(pStream, 0x4000000C) ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEXRAW
   }

   put_base64(pBitmap, extension := "", quality := "") {
      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      base64 := this.set_base64(pStream)
      ObjRelease(pStream)
      return base64
   }

   set_base64(pStream) {
      return this.set_string(pStream, 0x40000001) ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
   }

   set_string(pStream, flags) {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "ptr*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", &bin := VarSetCapacity(bin, size), "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      ; Using CryptBinaryToStringA saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", &bin, "uint", size, "uint", flags, "ptr", 0, "uint*", length:=0)
      VarSetCapacity(str, length)
      DllCall("crypt32\CryptBinaryToStringA", "ptr", &bin, "uint", size, "uint", flags, "ptr", &str, "uint*", length)

      return StrGet(&str, length, "CP0")
   }

   put_dc(pBitmap, alpha := "") {
      ; This may seem strange, but the hBitmap is selected onto the device context,
      ; and therefore cannot be deleted. In addition, the stock bitmap can never be leaked.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.put_hBitmap(pBitmap, alpha)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")
      return hdc
   }

   put_hBitmap(pBitmap, alpha := "") {
      ; Revert to built in functionality if a replacement color is declared.
      if (alpha != "") { ; This built-in version is about 25% slower and also preserves transparency.
         DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", hbm:=0, "uint", alpha)
         return hbm
      }

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Convert the source pBitmap into a hBitmap manually.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
         NumPut(       40, bi,  0,   "uint") ; Size
         NumPut(    width, bi,  4,   "uint") ; Width
         NumPut(  -height, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Transfer data from source pBitmap to an hBitmap manually.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     pBits, BitmapData, 16,    "ptr") ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteDC",     "ptr", hdc)

      return hbm
   }

   put_hIcon(pBitmap) {
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", hIcon:=0)
      return hIcon
   }

   put_stream(pBitmap, extension := "", quality := "") {
      ; Default extension is TIF for fast speeds!
      if (extension == "")
         extension := "tif"

      ; Select the proper codec based on the extension of the file.
      this.select_codec(pBitmap, extension, quality, pCodec, ep, ci, v)

      ; Create a Stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", True, "ptr*", pStream:=0, "uint")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", (ep) ? &ep : 0)

      return pStream
   }

   put_RandomAccessStream(pBitmap, extension := "", quality := "") {
      pStream := this.put_stream(pBitmap, extension, quality)
      pRandomAccessStream := this.set_RandomAccessStream(pStream)
      ObjRelease(pStream) ; Decrement the reference count of the IStream interface.
      return pRandomAccessStream
   }

   set_RandomAccessStream(pStream) {
      ; Thanks teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=6&t=72674
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall("ShCore\CreateRandomAccessStreamOverStream"
               ,    "ptr", pStream
               ,   "uint", BSOS_PREFERDESTINATIONSTREAM := 1
               ,    "ptr", &CLSID
               ,   "ptr*", pRandomAccessStream:=0
               ,   "uint")
      return pRandomAccessStream
   }

   select_codec(pBitmap, extension, quality, ByRef pCodec, ByRef ep, ByRef ci, ByRef v) {
      ; Fill a buffer with the available image codec info.
      DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", count:=0, "uint*", size:=0)
      DllCall("gdiplus\GdipGetImageEncoders", "uint", count, "uint", size, "ptr", &ci := VarSetCapacity(ci, size))

      ; struct ImageCodecInfo - http://www.jose.it-berater.org/gdiplus/reference/structures/imagecodecinfo.htm
      loop {
         if (A_Index > count)
            throw Exception("Could not find a matching encoder for the specified file format.")

         idx := (48+7*A_PtrSize)*(A_Index-1)
      } until InStr(StrGet(NumGet(ci, idx+32+3*A_PtrSize, "ptr"), "UTF-16"), extension) ; FilenameExtension

      ; Get the pointer to the clsid of the matching encoder.
      pCodec := &ci + idx ; ClassID

      ; JPEG default quality is 75. Otherwise set a quality value from [0-100].
      if (quality ~= "^-?\d+$") and ("image/jpeg" = StrGet(NumGet(ci, idx+32+4*A_PtrSize, "ptr"), "UTF-16")) { ; MimeType
         ; Use a separate buffer to store the quality as ValueTypeLong (4).
         VarSetCapacity(v, 4), NumPut(quality, v, "uint")

         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ; enum ValueType - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.imaging.encoderparametervaluetype
         ; clsid Image Encoder Constants - http://www.jose.it-berater.org/gdiplus/reference/constants/gdipimageencoderconstants.htm
         VarSetCapacity(ep, 24+2*A_PtrSize)            ; sizeof(EncoderParameter) = ptr + n*(28, 32)
            NumPut(    1, ep,            0,   "uptr")  ; Count
            DllCall("ole32\CLSIDFromString", "wstr", "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}", "ptr", &ep+A_PtrSize, "uint")
            NumPut(    1, ep, 16+A_PtrSize,   "uint")  ; Number of Values
            NumPut(    4, ep, 20+A_PtrSize,   "uint")  ; Type
            NumPut(   &v, ep, 24+A_PtrSize,    "ptr")  ; Value
      }
   }

   select_extension(pStream, ByRef extension) {
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", &signature := VarSetCapacity(signature, 256), "uint", 256, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      ; This function sniffs the first 256 bytes and matches a known file signature.
      ; 256 bytes is recommended, but images only need 12 bytes.
      ; See: https://en.wikipedia.org/wiki/List_of_file_signatures
      DllCall("urlmon\FindMimeFromData"
               ,    "ptr", 0             ; pBC
               ,    "ptr", 0             ; pwzUrl
               ,    "ptr", &signature    ; pBuffer
               ,   "uint", 256           ; cbSize
               ,    "ptr", 0             ; pwzMimeProposed
               ,   "uint", 0x20          ; dwMimeFlags
               ,   "ptr*", MimeType:=0   ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,   "uint")

      ; The output is a pointer to a Mime string. It must be dereferenced.
      MimeType := StrGet(MimeType, "UTF-16")

      if (MimeType ~= "gif")
         extension := "gif"
      if (MimeType ~= "jpeg")
         extension := "jpg"
      if (MimeType ~= "png")
         extension := "png"
      if (MimeType ~= "tiff")
         extension := "tif"
      if (MimeType ~= "bmp")
         extension := "bmp"
   }

   select_filepath(ByRef filepath, ByRef extension, pStream := "") {
      ; Save default extension.
      default := extension

      ; Convert forward style slashes into Windows style backslashes.
      filepath := RegExReplace(filepath, "/", "\")

      ; Split the filepath.
      SplitPath % Trim(filepath),, directory, extension, filename

      ; Check if the entire filepath is a directory.
      if InStr(FileExist(filepath), "D")   ; If the filepath refers to a directory,
         directory := (directory != "")    ; then SplitPath wrongly assumes a directory to be a filename.
            ? ((filename != "")
               ? directory "\" filename    ; Combine directory + filename.
               : directory)                ; Do nothing.
            : (filepath ~= "^\\")
               ? "\" filename              ; Root level directory.
               : ".\" filename             ; Script level directory.
         , filename := ""

      ; Create a new directory if needed.
      if (directory != "" && !InStr(FileExist(directory), "D"))
         FileCreateDir % directory

      ; Default directory is a dot.
      directory := (directory != "") ? directory : "."

      ; Check if the filename is actually the extension.
      if (extension == "" && filename ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := filename, filename := ""

      ; An invalid extension is actually part of the filename.
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$") {
         ; Avoid appending an extra period without an extension.
         if (extension != "")
            filename .= "." extension

         ; Restore default extension.
         extension := default

         ; Try extracting the filetype from the stream.
         if (pStream)
            this.select_extension(pStream, extension)
      }

      ; Create a filepath based on the timestamp.
      if (filename == "") {
         FormatTime, filename,, % "yyyy-MM-dd HH꞉mm꞉ss"
         filepath := directory "\" filename "." extension
         while FileExist(filepath) ; Check for collisions.
            filepath := directory "\" filename " (" A_Index ")." extension
      }

      ; Create a numeric sequence of files...
      else if (filename == "0" or filename == "1") {
         filepath := directory "\" filename "." extension
         while FileExist(filepath) ; Check for collisions.
            filepath := directory "\" A_Index "." extension
      }

      ; Always overwrite specific filenames.
      else filepath := directory "\" filename "." extension
   }

   ; All references to gdiplus and pToken must be absolute!
   static gdiplus := 0, pToken := 0

   gdiplusStartup() {
      ImagePut.gdiplus++

      ; Startup gdiplus when counter goes from 0 -> 1.
      if (ImagePut.gdiplus == 1) {

         ; Startup gdiplus.
         DllCall("LoadLibrary", "str", "gdiplus")
         VarSetCapacity(si, A_PtrSize = 4 ? 16:24, 0) ; sizeof(GdiplusStartupInput) = 16, 24
            NumPut(0x1, si, "uint")
         DllCall("gdiplus\GdiplusStartup", "ptr*", pToken:=0, "ptr", &si, "ptr", 0)

         ImagePut.pToken := pToken
      }
   }

   gdiplusShutdown(cotype := "", pBitmap := "") {
      ImagePut.gdiplus--

      ; When a buffer object is deleted a bitmap is sent here for disposal.
      if (cotype == "smart_pointer")
         if DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
            throw Exception("The bitmap of this buffer object has already been deleted.")

      ; Check for unpaired calls of gdiplusShutdown.
      if (ImagePut.gdiplus < 0)
         throw Exception("Missing ImagePut.gdiplusStartup().")

      ; Shutdown gdiplus when counter goes from 1 -> 0.
      if (ImagePut.gdiplus == 0) {
         pToken := ImagePut.pToken

         ; Shutdown gdiplus.
         DllCall("gdiplus\GdiplusShutdown", "ptr", pToken)
         DllCall("FreeLibrary", "ptr", DllCall("GetModuleHandle", "str", "gdiplus", "ptr"))

         ; Exit if GDI+ is still loaded. GdiplusNotInitialized = 18
         if (18 != DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", ImageAttr:=0)) {
            DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)
            return
         }

         ; Otherwise GDI+ has been truly unloaded from the script and objects are out of scope.
         if (cotype = "bitmap")
            throw Exception("Bitmap is out of scope. `n`nIf you wish to handle raw pointers to GDI+ bitmaps, add the line"
               . "`n`n`t`t" this.__class ".gdiplusStartup()`n`nor 'pToken := Gdip_Startup()' to the top of your script."
               . "`nAlternatively, use 'obj := ImagePutBuffer()' with 'obj.pBitmap'."
               . "`nYou can copy this message by pressing Ctrl + C.", -4)
      }
   }

   ; Get the image width and height.
   Dimensions(image) {
      this.gdiplusStartup()
      try type := this.DontVerifyImageType(image)
      catch
         type := this.ImageType(image)
      pBitmap := this.ToBitmap(type, image)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      this.gdiplusShutdown()
      return [width, height]
   }

   class Destroy extends ImagePut {

      call(image) {
         this.gdiplusStartup()
         try type := this.DontVerifyImageType(image)
         catch
            type := this.ImageType(image)
         this.Destroy(type, image)
         this.gdiplusShutdown()
         return
      }

      Destroy(type, image) {
         if (type = "clipboard") {
            if !DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
               throw Exception("Clipboard could not be opened.")
            return DllCall("EmptyClipboard"), DllCall("CloseClipboard")
         }

         if (type = "screenshot")
            return DllCall("InvalidateRect", "ptr", 0, "ptr", 0, "int", 0)

         if (type = "window")
            return DllCall("DestroyWindow", "ptr", image)

         if (type = "wallpaper")
            return DllCall("SystemParametersInfo", "uint", SPI_SETDESKWALLPAPER := 0x14, "uint", 0, "ptr", 0, "uint", 2)

         if (type = "cursor")
            return DllCall("SystemParametersInfo", "uint", SPI_SETCURSORS := 0x57, "uint", 0, "ptr", 0, "uint", 0)

         if (type = "file")
            FileDelete % image

         if (type = "dc") {
            if (DllCall("GetObjectType", "ptr", image, "uint") == 3) { ; OBJ_DC
               hwnd := DllCall("WindowFromDC", "ptr", image, "ptr")
               DllCall("ReleaseDC", "ptr", hwnd, "ptr", image)
            }

            if (DllCall("GetObjectType", "ptr", image, "uint") == 10) { ; OBJ_MEMDC
               obm := DllCall("CreateBitmap", "int", 0, "int", 0, "uint", 1, "uint", 1, "ptr", 0, "ptr")
               hbm := DllCall("SelectObject", "ptr", image, "ptr", obm, "ptr")
               DllCall("DeleteObject", "ptr", hbm)
               DllCall("DeleteDC", "ptr", image)
            }
         }

         if (type = "hBitmap")
            return DllCall("DeleteObject", "ptr", image)

         if (type = "hIcon")
            return DllCall("DestroyIcon", "ptr", image)

         if (type = "bitmap")
            return !DllCall("gdiplus\GdipDisposeImage", "ptr", image)

         if (type = "RandomAccessStream") or (type = "stream")
            return !ObjRelease(image)
      }
   } ; End of Destroy class.
} ; End of ImagePut class.


class ImageEqual extends ImagePut {

   call(images*) {
      ; Returns false is there are no images to be compared.
      if (images.length() == 0)
         return False

      this.gdiplusStartup()

      ; Set the first image to its own variable to allow passing by reference.
      image := images[1]

      ; Allow the ImageType exception to bubble up.
      try type := this.DontVerifyImageType(image)
      catch
         type := this.ImageType(image)

      ; Convert only the first image to a bitmap.
      if !(pBitmap1 := this.ToBitmap(type, image))
         throw Exception("Conversion to bitmap failed. The pointer value is zero.")

      ; If there is only one image, verify that image and return.
      if (images.length() == 1) {
         if DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap1, "ptr*", pBitmapClone:=0)
            throw Exception("Validation failed. Unable to access and clone the bitmap.")

         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmapClone)
         Goto Good_Ending
      }

      ; If there are multiple images, compare each subsequent image to the first.
      for i, image in images {
         if (A_Index != 1) {

            ; Guess the type of the image.
            try type := this.DontVerifyImageType(image)
            catch
               type := this.ImageType(image)

            ; Convert the other image to a bitmap.
            pBitmap2 := this.ToBitmap(type, image)

            ; Compare the two images.
            if !this.BitmapEqual(pBitmap1, pBitmap2)
               Goto Bad_Ending ; Exit the loop if the comparison failed.

            ; Cleanup the bitmap.
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
         }
      }

      Good_Ending: ; After getting isekai'ed you somehow build a prosperous kingdom and rule the land.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      this.gdiplusShutdown()
      return True

      Bad_Ending: ; Turns out your best friend became super jealous of you and killed you in your sleep.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      this.gdiplusShutdown()
      return False
   }

   BitmapEqual(SourceBitmap1, SourceBitmap2, PixelFormat := 0x26200A) {
      ; Make sure both source bitmaps are valid GDI+ pointers. This will throw if not...
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap1, "ptr*", type1:=0)
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap2, "ptr*", type2:=0)

      ; ImageTypeUnknown = 0, ImageTypeBitmap = 1, and ImageTypeMetafile = 2.
      if (type1 != 1 || type2 != 1)
         throw Exception("The GDI+ pointer is not a bitmap.")

      ; Check if source bitmap pointers are identical.
      if (SourceBitmap1 == SourceBitmap2)
         return True

      ; The two bitmaps must be the same size.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap1, "uint*", width1:=0)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap2, "uint*", width2:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap1, "uint*", height1:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap2, "uint*", height2:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap1, "int*", format1:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap2, "int*", format2:=0)

      ; Determine if get width and height failed (as dimensions can never be zero).
      if !(width1 && width2 && height1 && height2)
         throw Exception("Get bitmap width and height failed.")

      ; Dimensions must be equal.
      if (width1 != width2 || height1 != height2)
         return False

      ; Create clones of the supplied source bitmaps in their original PixelFormat.
      ; This has the side effect of (1) removing negative stride and solves
      ; the problem when (2) both bitmaps reference the same stream and only
      ; one of them is able to retrieve the pixel data through LockBits.
      ; I assume that instead of locking the stream, the clones lock the originals.

      pBitmap1 := pBitmap2 := 0
      Loop 2
         if DllCall("gdiplus\GdipCloneBitmapAreaI"
                     ,    "int", 0
                     ,    "int", 0
                     ,    "int", width%A_Index%
                     ,    "int", height%A_Index%
                     ,    "int", format%A_Index%
                     ,    "ptr", SourceBitmap%A_Index%
                     ,   "ptr*", pBitmap%A_Index%:=0)
            throw Exception("Cloning Bitmap" A_Index " failed.")

      ; struct RECT - https://referencesource.microsoft.com/#System.Drawing/commonui/System/Drawing/Rectangle.cs,32
      VarSetCapacity(Rect, 16, 0)                 ; sizeof(Rect) = 16
         NumPut(  width1, Rect,  8,   "uint")     ; Width
         NumPut( height1, Rect, 12,   "uint")     ; Height

      ; Create a BitmapData structure.
      VarSetCapacity(BitmapData1, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32
      VarSetCapacity(BitmapData2, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32

      ; Transfer the pixels to a read-only buffer. The user can declare a PixelFormat.
      Loop 2
         DllCall("gdiplus\GdipBitmapLockBits"
                  ,    "ptr", pBitmap%A_Index%
                  ,    "ptr", &Rect
                  ,   "uint", 1            ; ImageLockMode.ReadOnly
                  ,    "int", PixelFormat  ; Format32bppArgb is fast.
                  ,    "ptr", &BitmapData%A_Index%)

      ; Get Stride (number of bytes per horizontal line).
      stride1 := NumGet(BitmapData1, 8, "int")
      stride2 := NumGet(BitmapData2, 8, "int")

      ; Well the image has already been cloned, so the stride should never be negative.
      if (stride1 < 0 || stride2 < 0) ; See: https://stackoverflow.com/a/10341340
         throw Exception("Negative stride. Please report this error to the developer.")

      ; Get Scan0 (top-left pixel at 0,0).
      Scan01 := NumGet(BitmapData1, 16, "ptr")
      Scan02 := NumGet(BitmapData2, 16, "ptr")

      ; RtlCompareMemory preforms an unsafe comparison stopping at the first different byte.
      size := stride1 * height1
      byte := DllCall("ntdll\RtlCompareMemory", "ptr", Scan01+0, "ptr", Scan02+0, "uptr", size, "uptr")

      ; Unlock Bitmaps. Since they were marked as read only there is no copy back.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap1, "ptr", &BitmapData1)
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap2, "ptr", &BitmapData2)

      ; Cleanup bitmap clones.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)

      ; Compare stopped byte.
      return (byte == size) ? True : False
   }
} ; End of ImageEqual class.
