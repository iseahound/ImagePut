; Script:    ImagePut.ahk
; License:   MIT License
; Author:    Edison Hua (iseahound)
; Date:      2021-10-07
; Version:   v1.2

#Requires AutoHotkey v2.0-beta.1+


; Puts the image into a file format and returns a base64 encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutBase64(image, extension := "", quality := "") {
   return ImagePut("base64", image,,, extension, quality)
}

; Puts the image into a GDI+ Bitmap and returns a pointer.
ImagePutBitmap(image) {
   return ImagePut("bitmap", image)
}

; Puts the image into a GDI+ Bitmap and returns a buffer object with GDI+ scope.
ImagePutBuffer(image) {
   return ImagePut("buffer", image)
}

; Puts the image onto the clipboard and returns ClipboardAll().
ImagePutClipboard(image) {
   return ImagePut("clipboard", image)
}

; Puts the image as the cursor and returns the variable A_Cursor.
;   xHotspot   -  X Click Point           |  pixel    ->   0 - width
;   yHotspot   -  Y Click Point           |  pixel    ->   0 - height
ImagePutCursor(image, xHotspot := "", yHotspot := "") {
   return ImagePut("cursor", image,,, xHotspot, yHotspot)
}

; Puts the image behind the desktop icons and returns the string "desktop".
;   scale      -  Scale Factor            |  real     ->   A_ScreenHeight / height.
ImagePutDesktop(image, scale := 1) {
   return ImagePut("desktop", image,, scale)
}

; Puts the image into a file and returns a relative filepath.
;   filepath   -  Filepath + Extension    |  string   ->   *.bmp, *.gif, *.jpg, *.png, *.tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutFile(image, filepath := "", quality := "") {
   return ImagePut("file", image,,, filepath, quality)
}

; Puts the image into a device independent bitmap and returns the handle.
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutHBitmap(image, alpha := "") {
   return ImagePut("hBitmap", image,,, alpha)
}

; Puts the image into a file format and returns a hexadecimal encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutHex(image, extension := "", quality := "") {
   return ImagePut("hex", image,,, extension, quality)
}

; Puts the image into an icon and returns the handle.
ImagePutHIcon(image) {
   return ImagePut("hBitmap", image)
}

; Puts the image into a file format and returns a pointer to a RandomAccessStream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutRandomAccessStream(image, extension := "", quality := "") {
   return ImagePut("RandomAccessStream", image,,, extension, quality)
}

; Puts the image on the shared screen device context and returns an array of coordinates.
;   screenshot -  Screen Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutScreenshot(image, screenshot := "", alpha := "") {
   return ImagePut("screenshot", image,,, screenshot, alpha)
}

; Puts the image into a file format and returns a pointer to a stream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutStream(image, extension := "", quality := "") {
   return ImagePut("stream", image,,, extension, quality)
}

; Puts the image as the desktop wallpaper and returns the string "wallpaper".
ImagePutWallpaper(image) {
   return ImagePut("wallpaper", image)
}

; Puts the image in a window and returns a handle to a window.
;   title      -  Window Caption Title    |  string   ->   MyTitle
ImagePutWindow(image, title := "") {
   return ImagePut("window", image,,, title)
}






class ImagePut {

   ; If true the conversion will always go through a GDI+ Bitmap and the original file encoding will be lost.
   static ForceDecodeImagePixels := false

   ; If true the pBitmap will always be filled with image data instead of referencing it and copying when needed.
   static ForcePushImageToMemory := false

   ; ImagePut() - Puts an image from anywhere to anywhere.
   ;   cotype     -  Output Type             |  string   ->   Case Insensitive. Read documentation.
   ;   image      -  Input Image             |  image    ->   Anything. Refer to ImageType().
   ;   crop       -  Crop Coordinates        |  array    ->   [x,y,w,h] could be negative or percent.
   ;   scale      -  Scale Factor            |  real     ->   2.0
   ;   terms*     -  Additional Parameters   |  variadic ->   Extra parameters found in BitmapToCoimage().
   static call(cotype, image, crop := "", scale := "", terms*) {

      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>90% accuracy!)
      try type := this.DontVerifyImageType(&image)
      catch
         type := this.ImageType(image)

      ; Qualify additional parameters for correctness.
      _crop := IsObject(crop)
         && crop[1] ~= "^-?\d+(\.\d*)?%?$" && crop[2] ~= "^-?\d+(\.\d*)?%?$"
         && crop[3] ~= "^-?\d+(\.\d*)?%?$" && crop[4] ~= "^-?\d+(\.\d*)?%?$"
      _scale := scale != 1 && scale ~= "^\d+(\.\d+)?$"


      ; Check if a stream can be used as an intermediate.
      if not this.ForceDecodeImagePixels and not _crop and not _scale
         and (type ~= "^(?i:url|file|stream|RandomAccessStream|hex|base64)$")
         and (cotype ~= "^(?i:file|stream|RandomAccessStream|hex|base64)$") {

         ; Convert to a stream intermediate then to the output coimage.
         pStream := this.ToStream(type, image)
         coimage := this.StreamToCoimage(cotype, pStream, terms*)

         ; Prevents the stream object from being freed.
         if (cotype = "stream")
            ObjAddRef(pStream)

         ; Free the temporary stream object.
         ObjRelease(pStream)

         return coimage
      }

      ; Fallback to GDI+ bitmap as the intermediate.
      else {
         ; Make a copy of the image as a pBitmap.
         pBitmap := this.ToBitmap(type, image)

         ; Load the image pixels to the bitmap buffer.
         ; This increases memory usage but prevents any changes to the pixels,
         ; and bypasses any copy-on-write and copy on LockBits read behavior.
         ; This must be called immediately after the pBitmap is created
         ; or it will fail without throwing any errors.
         if (this.ForcePushImageToMemory)
            DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap)

         ; Crop the image.
         if (_crop) {
            pBitmap2 := this.BitmapCrop(pBitmap, crop)
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
            pBitmap := pBitmap2
         }

         ; Scale the image.
         if (_scale) {
            pBitmap2 := this.BitmapScale(pBitmap, scale)
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
            pBitmap := pBitmap2
         }

         ; Put the pBitmap to wherever the cotype specifies.
         coimage := this.BitmapToCoimage(cotype, pBitmap, terms*)

         ; Clean up the pBitmap copy. Export raw pointers if requested.
         if !(cotype = "bitmap" || cotype = "buffer")
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      ; Check for dangling pointers.
      this.gdiplusShutdown(cotype)

      return coimage
   }

   static DontVerifyImageType(&image) {

      if !IsObject(image)
         throw Error("Must be an object.")

      ; Check for image type declarations.
      ; Assumes that the user is telling the truth.

      if ObjHasOwnProp(image, "clipboard") {
         image := image.clipboard
         return "clipboard"
      }

      if ObjHasOwnProp(image, "object") {
         image := image.object
         return "object"
      }

      if ObjHasOwnProp(image, "buffer") {
         image := image.buffer
         return "buffer"
      }

      if ObjHasOwnProp(image, "screenshot") {
         image := image.screenshot
         return "screenshot"
      }

      if ObjHasOwnProp(image, "window") {
         image := image.window
         return "window"
      }

      if ObjHasOwnProp(image, "desktop") {
         image := image.desktop
         return "desktop"
      }

      if ObjHasOwnProp(image, "wallpaper") {
         image := image.wallpaper
         return "wallpaper"
      }

      if ObjHasOwnProp(image, "cursor") {
         image := image.cursor
         return "cursor"
      }

      if ObjHasOwnProp(image, "url") {
         image := image.url
         return "url"
      }

      if ObjHasOwnProp(image, "file") {
         image := image.file
         return "file"
      }

      if ObjHasOwnProp(image, "monitor") {
         image := image.monitor
         return "monitor"
      }

      if ObjHasOwnProp(image, "hBitmap") {
         image := image.hBitmap
         return "hBitmap"
      }

      if ObjHasOwnProp(image, "hIcon") {
         image := image.hIcon
         return "hIcon"
      }

      if ObjHasOwnProp(image, "bitmap") {
         image := image.bitmap
         return "bitmap"
      }

      if ObjHasOwnProp(image, "stream") {
         image := image.stream
         return "stream"
      }

      if ObjHasOwnProp(image, "RandomAccessStream") {
         image := image.RandomAccessStream
         return "RandomAccessStream"
      }

      if ObjHasOwnProp(image, "hex") {
         image := image.hex
         return "hex"
      }

      if ObjHasOwnProp(image, "base64") {
         image := image.base64
         return "base64"
      }

      if ObjHasOwnProp(image, "sprite") {
         image := image.sprite
         return "sprite"
      }

      throw Error("Invalid type.")
   }

   static ImageType(image) {
      ; Throw if the image is an empty string.
      if (image == "")
         throw Error("Image data is an empty string.")

      if IsObject(image) {
         ; A "clipboard" is a buffer object containing binary data returned by ClipboardAll()
         if (image.base.HasOwnProp("__class") && image.base.__class == "ClipboardAll")
            return "clipboard"

         ; A "object" has a pBitmap property that points to an internal GDI+ bitmap.
         if image.HasOwnProp("pBitmap")
            return "object"

         ; A "buffer" is an object with ptr and size properties.
         if image.HasOwnProp("ptr") && image.HasOwnProp("size")
            return "buffer"

         ; A "screenshot" is an array of 4 numbers.
         if (image[1] ~= "^-?\d+$" && image[2] ~= "^-?\d+$" && image[3] ~= "^-?\d+$" && image[4] ~= "^-?\d+$")
            return "screenshot"
      }
         ; A "window" is anything considered a Window Title including ahk_class and "A".
         if WinExist(image)
            return "window"

         ; A "desktop" is a hidden window behind the desktop icons created by ImagePutDesktop.
         if (image = "desktop")
            return "desktop"

         ; A "wallpaper" is the desktop wallpaper.
         if (image = "wallpaper")
            return "wallpaper"

         ; A "cursor" is the name of a known cursor name.
         if (image ~= "(?i)^(IDC|OCR)?_?(A_Cursor|AppStarting|Arrow|Cross|Help|IBeam|"
         . "Icon|No|Size|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait|Unknown)$")
            return "cursor"

         ; A "url" satisfies the url format.
         if this.is_url(image)
            return "url"

         ; A "file" is stored on the disk or network.
         if FileExist(image)
            return "file"

      if IsInteger(image) {
         ; A non-zero "monitor" number identifies each display uniquely; and 0 refers to the entire virtual screen.
         if (image >= 0 && image <= MonitorGetCount())
            return "monitor"

         ; An "hBitmap" is a handle to a GDI Bitmap.
         if (DllCall("GetObjectType", "ptr", image) == 7)
            return "hBitmap"

         ; An "hIcon" is a handle to a GDI icon.
         if DllCall("DestroyIcon", "ptr", DllCall("CopyIcon", "ptr", image, "ptr"))
            return "hIcon"

         ; A "bitmap" is a pointer to a GDI+ Bitmap.
         try if !DllCall("gdiplus\GdipGetImageType", "ptr", image, "ptr*", &type:=0) && (type == 1)
            return "bitmap"

         ; Note 1: All GDI+ functions add 1 to the reference count of COM objects.
         ; Note 2: GDI+ pBitmaps that are queried cease to stay pBitmaps.
         ObjRelease(image) ; Therefore do not move this, it has been tested.

         ; A "stream" is a pointer to the IStream interface.
         try if ComObjQuery(image, "{0000000C-0000-0000-C000-000000000046}")
            return "stream"

         ; A "RandomAccessStream" is a pointer to the IRandomAccessStream interface.
         try if ComObjQuery(image, "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}")
            return "RandomAccessStream"
      }
         ; A "hex" string is binary image data encoded into text using hexadecimal.
         if (StrLen(image) >= 116) && (image ~= "(?i)^\s*(0x)?[0-9a-f]+\s*$")
            return "hex"

         ; A "base64" string is binary image data encoded into text using only 64 characters.
         if (StrLen(image) >= 80) && (image ~= "^\s*(?:data:image\/[a-z]+;base64,)?"
         . "(?:[A-Za-z0-9+\/]{4})*+(?:[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{2}==)?\s*$")
            return "base64"


      ; For more helpful error messages: Catch file names without extensions!
      for extension in ["bmp","dib","rle","jpg","jpeg","jpe","jfif","gif","tif","tiff","png","ico","exe","dll"]
         if FileExist(image "." extension)
            throw Error("A ." extension " file extension is required!")

      throw Error("Image type could not be identified.")
   }

   static ToBitmap(type, image) {

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

      if (type = "url")
         return this.from_url(image)

      if (type = "file")
         return this.from_file(image)

      if (type = "monitor")
         return this.from_monitor(image)

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

      if (type = "hex")
         return this.from_hex(image)

      if (type = "base64")
         return this.from_base64(image)

      if (type = "sprite")
         return this.from_sprite(image)

      throw Error("Conversion from " type " to bitmap is not supported.")
   }

   static BitmapToCoimage(cotype, pBitmap, p1 := "", p2 := "", p*) {
      ; BitmapToCoimage("clipboard", pBitmap)
      if (cotype = "clipboard")
         return this.put_clipboard(pBitmap)

      ; BitmapToCoimage("buffer", pBitmap)
      if (cotype = "buffer")
         return this.put_buffer(pBitmap)

      ; BitmapToCoimage("screenshot", pBitmap, screenshot, alpha)
      if (cotype = "screenshot")
         return this.put_screenshot(pBitmap, p1, p2)

      ; BitmapToCoimage("window", pBitmap, title)
      if (cotype = "window")
         return this.put_window(pBitmap, p1)

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

      ; BitmapToCoimage("hex", pBitmap, extension, quality)
      if (cotype = "hex")
         return this.put_hex(pBitmap, p1, p2)

      ; BitmapToCoimage("base64", pBitmap, extension, quality)
      if (cotype = "base64")
         return this.put_base64(pBitmap, p1, p2)

      throw Error("Conversion from bitmap to " cotype " is not supported.")
   }

   static ToStream(type, image) {

      if (type = "url")
         return this.get_url(image)

      if (type = "file")
         return this.get_file(image)

      if (type = "stream")
         return this.get_stream(image)

      if (type = "RandomAccessStream")
         return this.get_RandomAccessStream(image)

      if (type = "hex")
         return this.get_hex(image)

      if (type = "base64")
         return this.get_base64(image)

      throw Error("Conversion from " type " to stream is not supported.")
   }

   static StreamToCoimage(cotype, pStream, p1 := "", p2 := "", p*) {
      ; StreamToCoimage("file", pStream, filepath)
      if (cotype = "file")
         return this.set_file(pStream, p1)

      ; StreamToCoimage("stream", pStream)
      if (cotype = "stream")
         return pStream

      ; StreamToCoimage("RandomAccessStream", pStream)
      if (cotype = "RandomAccessStream")
         return this.set_RandomAccessStream(pStream)

      ; StreamToCoimage("hex", pStream)
      if (cotype = "hex")
         return this.set_hex(pStream)

      ; StreamToCoimage("base64", pStream)
      if (cotype = "base64")
         return this.set_base64(pStream)

      throw Error("Conversion from stream to " cotype " is not supported.")
   }

   static DisposeImage(pBitmap) {
      return DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
   }

   static BitmapCrop(pBitmap, crop) {
      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "uint*", &format:=0)

      ; Are the numbers percentages?
      crop[3] := (crop[3] ~= "%$") ? SubStr(crop[3], 1, -1) * 0.01 *  width : crop[3]
      crop[4] := (crop[4] ~= "%$") ? SubStr(crop[4], 1, -1) * 0.01 * height : crop[4]
      crop[1] := (crop[1] ~= "%$") ? SubStr(crop[1], 1, -1) * 0.01 *  width : crop[1]
      crop[2] := (crop[2] ~= "%$") ? SubStr(crop[2], 1, -1) * 0.01 * height : crop[2]

      ; If numbers are negative, subtract the values from the edge.
      crop[3] := (crop[3] < 0) ?  width - Abs(crop[3]) - Abs(crop[1]) : crop[3]
      crop[4] := (crop[4] < 0) ? height - Abs(crop[4]) - Abs(crop[2]) : crop[4]
      crop[1] := Abs(crop[1])
      crop[2] := Abs(crop[2])

      ; Round to the nearest integer.
      crop[3] := Round(crop[1] + crop[3]) - Round(crop[1]) ; A reminder that width and height
      crop[4] := Round(crop[2] + crop[4]) - Round(crop[2]) ; are distances, not coordinates.
      crop[1] := Round(crop[1]) ; so the abstract concept of a distance must be resolved
      crop[2] := Round(crop[2]) ; into coordinates and then rounded and added up again.

      ; Variance Shift. Now place x,y before w,h because we are building abstracts from reals now.
      ; Before we were resolving abstracts into real coordinates, now it's the opposite.

      ; Ensure that coordinates can never exceed the expected Bitmap area.
      safe_x := (crop[1] > width) ? 0 : crop[1]                          ; Zero x if bigger.
      safe_y := (crop[2] > height) ? 0 : crop[2]                         ; Zero y if bigger.
      safe_w := (crop[1] + crop[3] > width) ? width - safe_x : crop[3]   ; Max w if bigger.
      safe_h := (crop[2] + crop[4] > height) ? height - safe_y : crop[4] ; Max h if bigger.

      ; Clone
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", safe_x
               ,    "int", safe_y
               ,    "int", safe_w
               ,    "int", safe_h
               ,    "int", format
               ,    "ptr", pBitmap
               ,   "ptr*", &pBitmapCrop:=0)

      return pBitmapCrop
   }

   static BitmapScale(pBitmap, scale) {
      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "uint*", &format:=0)

      safe_w := Ceil(width * scale)
      safe_h := Ceil(height * scale)

      ; Create a new bitmap and get the graphics context.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", safe_w, "int", safe_h, "int", 0, "int", format, "ptr", 0, "ptr*", &pBitmapScale:=0)
      DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", pBitmapScale, "ptr*", &pGraphics:=0)

      ; Set settings in graphics context.
      DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
      DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
      DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

      ; Draw Image.
      DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0)
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
      return pBitmapScale
   }

   static is_url(url) {
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

   static from_clipboard() {
      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Clipboard could not be opened.")

      ; Prefer the PNG stream if available because of transparency support.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint")
      if DllCall("IsClipboardFormatAvailable", "uint", png) {
         if !(hData := DllCall("GetClipboardData", "uint", png, "ptr"))
            throw Error("Shared clipboard data has been deleted.")

         ; Allow the stream to be freed while leaving the hData intact.
         ; Please read: https://devblogs.microsoft.com/oldnewthing/20210930-00/?p=105745
         DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", false, "ptr*", &pStream:=0, "HRESULT")
         DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
         ObjRelease(pStream)
      }

      ; Fallback to CF_BITMAP. This format does not support transparency even with put_hBitmap().
      else if DllCall("IsClipboardFormatAvailable", "uint", 2) {
         if !(hBitmap := DllCall("GetClipboardData", "uint", 2, "ptr"))
            throw Error("Shared clipboard data has been deleted.")
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hBitmap, "ptr", 0, "ptr*", &pBitmap:=0)
         DllCall("DeleteObject", "ptr", hBitmap)
      }

      DllCall("CloseClipboard")
      return pBitmap
   }

   static from_object(image) {
      return this.from_bitmap(image.pBitmap)
   }

   static from_buffer(image) {
      ; to do
   }

   static from_screenshot(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",  image[3], bi,  4) ; Width
         NumPut(   "int", -image[4], bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
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
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   static from_window(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; Get the handle to the window.
      image := WinExist(image)

      ; Restore the window if minimized! Must be visible for capture.
      if DllCall("IsIconic", "ptr", image)
         DllCall("ShowWindow", "ptr", image, "int", 4)

      ; Get the width and height of the client window.
      Rect := Buffer(16) ; sizeof(RECT) = 16
      DllCall("GetClientRect", "ptr", image, "ptr", Rect)
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Print the window onto the hBitmap using an undocumented flag. https://stackoverflow.com/a/40042587
      DllCall("PrintWindow", "ptr", image, "ptr", hdc, "uint", 0x3) ; PW_RENDERFULLCONTENT | PW_CLIENTONLY
      ; Additional info on how this is implemented: https://www.reddit.com/r/windows/comments/8ffr56/altprintscreen/

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   static from_desktop() {
      ; Find the child window.
      windows := WinGetList("ahk_class WorkerW")
      if (windows.length == 0)
         throw Error("The hidden desktop window has not been initalized. Call ImagePutDesktop() first.")

      Loop windows.length
         hwnd := windows[A_Index]
      until DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "SHELLDLL_DefView", "ptr", 0)

      ; Maybe this hack gets patched. Tough luck!
      if !(WorkerW := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "WorkerW", "ptr", 0, "ptr"))
         throw Error("Could not locate hidden window behind desktop.")

      ; Get the width and height of the client window.
      Rect := Buffer(16) ; sizeof(RECT) = 16
      DllCall("GetClientRect", "ptr", WorkerW, "ptr", Rect)
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")

      ; Get device context of spawned window.
      sdc := DllCall("GetDCEx", "ptr", WorkerW, "ptr", 0, "int", 0x403, "ptr") ; LockWindowUpdate | Cache | Window

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Copies a portion of the hidden window to a new device context.
      DllCall("gdi32\BitBlt"
               , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
               , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      ; Release device context of spawned window.
      DllCall("ReleaseDC", "ptr", 0, "ptr", sdc)

      return pBitmap
   }

   static from_wallpaper() {
      ; Get the width and height of all monitors.
      width  := DllCall("GetSystemMetrics", "int", 78, "int")
      height := DllCall("GetSystemMetrics", "int", 79, "int")

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Paints the desktop.
      DllCall("PaintDesktop", "ptr", hdc)

      ; Convert the hBitmap to a Bitmap using a built in function as there is no transparency.
      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   static from_cursor() {
      ; Thanks 23W - https://stackoverflow.com/a/13295280

      ; struct CURSORINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-cursorinfo
      ci := Buffer(16+A_PtrSize, 0) ; sizeof(CURSORINFO) = 20, 24
         NumPut("int", ci.size, ci)
      DllCall("GetCursorInfo", "ptr", ci)
         ; cShow   := NumGet(ci,  4, "int") ; 0x1 = CURSOR_SHOWING, 0x2 = CURSOR_SUPPRESSED
         , hCursor := NumGet(ci,  8, "ptr")
         ; xCursor := NumGet(ci,  8+A_PtrSize, "int")
         ; yCursor := NumGet(ci, 12+A_PtrSize, "int")

      ; Cursors are the same as icons!
      pBitmap := this.from_hIcon(hCursor)

      ; Cleanup the handle to the cursor. Same as DestroyIcon.
      DllCall("DestroyCursor",  "ptr", hCursor)

      return pBitmap
   }

   static from_url(image) {
      pStream := this.get_url(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      pStream := ""
      return pBitmap
   }

   static get_url(image) {
      req := ComObject("WinHttp.WinHttpRequest.5.1")
      req.Open("GET", image)
      req.Send()
      IStream := ComObjQuery(req.ResponseStream, "{0000000C-0000-0000-C000-000000000046}"), ObjAddRef(IStream.ptr)
      return IStream.ptr
   }

   static from_file(image) {
      DllCall("gdiplus\GdipCreateBitmapFromFile", "wstr", image, "ptr*", &pBitmap:=0)
      return pBitmap
   }

   static get_file(image) {
      file := FileOpen(image, "r")
      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", file.length, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      file.RawRead(pData, file.length)
      DllCall("GlobalUnlock", "ptr", hData)
      file.Close()
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", true, "ptr*", &pStream:=0, "HRESULT")
      return pStream
   }

   static from_monitor(image) {
      if (image > 0) {
         MonitorGet(image, &Left, &Top, &Right, &Bottom)
         x := Left
         y := Top
         w := Right - Left
         h := Bottom - Top
      } else {
         x := DllCall("GetSystemMetrics", "int", 76, "int")
         y := DllCall("GetSystemMetrics", "int", 77, "int")
         w := DllCall("GetSystemMetrics", "int", 78, "int")
         h := DllCall("GetSystemMetrics", "int", 79, "int")
      }
      return this.from_screenshot([x,y,w,h])
   }

   static from_hBitmap(image) {
      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", image, "int", dib.size, "ptr", dib)
         , width  := NumGet(dib, 4, "uint")
         , height := NumGet(dib, 8, "uint")
         , bpp    := NumGet(dib, 18, "ushort")

      ; Fallback to built-in method if pixels are not 32-bit ARGB.
      if (bpp != 32) { ; This built-in version is 120% faster but ignores transparency.
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", image, "ptr", 0, "ptr*", &pBitmap:=0)
         return pBitmap
      }

      ; Create a handle to a device context and associate the image.
      sdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")           ; Creates a memory DC compatible with the current screen.
      sbm := DllCall("SelectObject", "ptr", sdc, "ptr", image, "ptr") ; Put the (hBitmap) image onto the device context.

      ; Create a device independent bitmap with negative height. All DIBs use the screen pixel format (pARGB).
      ; Use hbm to buffer the image such that top-down and bottom-up images are mapped to this top-down buffer.
      ; pBits is the pointer to (top-down) pixel values. The Scan0 will point to the pBits.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0

      ; Use LockBits to create a writable buffer that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (pBits) to the hbm.

      ; Copies the image (hBitmap) to a top-down bitmap. Removes bottom-up-ness if present.
      DllCall("gdi32\BitBlt"
               , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
               , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)
      DllCall("SelectObject", "ptr", sdc, "ptr", sbm)
      DllCall("DeleteDC",     "ptr", sdc)

      return pBitmap
   }

   static from_hIcon(image) {
      ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
      ii := Buffer(8+3*A_PtrSize)                       ; sizeof(ICONINFO) = 20, 32
      DllCall("GetIconInfo", "ptr", image, "ptr", ii)
         ; xHotspot := NumGet(ii, 4, "uint")
         ; yHotspot := NumGet(ii, 8, "uint")
         , hbmMask  := NumGet(ii, 8+A_PtrSize, "ptr")   ; 12, 16
         , hbmColor := NumGet(ii, 8+2*A_PtrSize, "ptr") ; 16, 24

      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      bm := Buffer(16+2*A_PtrSize)                      ; sizeof(BITMAP) = 24, 32
      DllCall("GetObject", "ptr", hbmMask, "int", bm.size, "ptr", bm)
         , width  := NumGet(bm, 4, "uint")
         , height := NumGet(bm, 8, "uint") / (hbmColor ? 1 : 2) ; Black and White cursors have doubled height.

      ; Clean up these hBitmaps.
      DllCall("DeleteObject", "ptr", hbmMask)
      DllCall("DeleteObject", "ptr", hbmColor)

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0

      ; Use LockBits to create a writable buffer that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (pBits) to the hbm.

      ; Don't use DI_DEFAULTSIZE to draw the icon like DrawIcon does as it will resize to 32 x 32.
      DllCall("DrawIconEx"
               , "ptr", hdc,   "int", 0, "int", 0
               , "ptr", image, "int", 0, "int", 0
               , "uint", 0, "ptr", 0, "uint", 0x1 | 0x2 | 0x4) ; DI_MASK | DI_IMAGE | DI_COMPAT

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   static from_bitmap(image) {
      ; Retain the current PixelFormat, unlike GdipCloneImage.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", image, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", image, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", image, "int*", &format:=0)
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", 0
               ,    "int", 0
               ,    "int", width
               ,    "int", height
               ,    "int", format
               ,    "ptr", image
               ,   "ptr*", &pBitmap:=0)
      return pBitmap
   }

   static from_stream(image) {
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", image, "ptr*", &pBitmap:=0)
      return pBitmap
   }

   static get_stream(image) {
      ; Creates a new, separate stream. Necessary to separate reference counting through a clone.
      ComCall(IStream_Clone := 13, image, "ptr*", &pStream:=0)
      return pStream
   }

   static from_RandomAccessStream(image) {
      ; Creating a Bitmap from stream adds +3 to the reference count until DisposeImage is called.
      pStream := this.get_RandomAccessStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_RandomAccessStream(image) {
      ; Note that the returned stream shares a reference count with the original RandomAccessStream.
      CLSID := Buffer(16)
      DllCall("ole32\CLSIDFromString", "wstr", "{0000000C-0000-0000-C000-000000000046}", "ptr", CLSID, "HRESULT")
      DllCall("ShCore\CreateStreamOverRandomAccessStream", "ptr", image, "ptr", CLSID, "ptr*", &pStream:=0, "HRESULT")
      return pStream
   }

   static from_hex(image) {
      pStream := this.get_hex(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_hex(image) {
      image := Trim(image)
      image := RegExReplace(image, "^(0[xX])")
      return this.get_string(image, 0xC) ; CRYPT_STRING_HEXRAW
   }

   static from_base64(image) {
      pStream := this.get_base64(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_base64(image) {
      image := Trim(image)
      image := RegExReplace(image, "^data:image\/[a-z]+;base64,")
      return this.get_string(image, 0x1) ; CRYPT_STRING_BASE64
   }

   static get_string(image, flags) {
      ; Ask for the size. Then allocate movable memory, copy to the buffer, unlock, and create stream.
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", flags, "ptr", 0, "uint*", &size:=0, "ptr", 0, "ptr", 0)

      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")

      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", flags, "ptr", pData, "uint*", size, "ptr", 0, "ptr", 0)

      DllCall("GlobalUnlock", "ptr", hData)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", true, "ptr*", &pStream:=0, "HRESULT")

      return pStream
   }

   static from_sprite(image) {
      ; Create a source pBitmap and extract the width and height.
      if DllCall("gdiplus\GdipCreateBitmapFromFile", "wstr", image, "ptr*", &sBitmap:=0)
         if !(sBitmap := this.from_url(image))
            throw Error("Could not be loaded from a valid file path or URL.")

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", sBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", sBitmap, "uint*", &height:=0)

      ; Create a destination pBitmap in 32-bit ARGB and get its device context though GDI+.
      ; Note that a device context from a graphics context can only be drawn on, not read.
      ; Also note that using a graphics context and blitting does not create a pixel perfect image.
      ; Using a DIB and LockBits is about 5% faster.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &dBitmap:=0)
      DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", dBitmap, "ptr*", &dGraphics:=0)
      DllCall("gdiplus\GdipGetDC", "ptr", dGraphics, "ptr*", &ddc:=0)

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

   static put_clipboard(pBitmap) {
      ; Standard Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/standard-clipboard-formats
      ; Synthesized Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/clipboard-formats

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Clipboard could not be opened.")

      ; If not opened with a valid window handle EmptyClipboard will crash the next call to OpenClipboard.
      DllCall("EmptyClipboard")

      ; #1 - Place the image onto the clipboard as a PNG stream.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3

      ; Create a Stream whose underlying HGlobal must be referenced or lost forever.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210929-00/?p=105742
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", false, "ptr*", &pStream:=0, "HRESULT")
      this.select_codec(pBitmap, "png", "", &pCodec, &ep, &ci, &v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)

      ; Rescue the HGlobal after GDI+ has written the PNG to stream and release the stream.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", &hData:=0, "HRESULT")
      ObjRelease(pStream)

      ; Set the rescued HGlobal to the clipboard as a shared object.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint") ; case insensitive
      DllCall("SetClipboardData", "uint", png, "ptr", hData)


      ; #2 - Place the image onto the clipboard in the CF_DIB format using a bottom-up bitmap.
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", &hBitmap:=0, "uint", 0)

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", hBitmap, "int", dib.size, "ptr", dib)
         , pBits := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")  ; bmBits
         , size  := NumGet(dib, A_PtrSize = 4 ? 44:52, "uint") ; biSizeImage

      ; Allocate space for a new device independent bitmap on movable memory.
      hdib := DllCall("GlobalAlloc", "uint", 0x2, "uptr", 40 + size, "ptr") ; sizeof(BITMAPINFOHEADER) = 40
      pdib := DllCall("GlobalLock", "ptr", hdib, "ptr")

      ; Copy the BITMAPINFOHEADER.
      DllCall("RtlMoveMemory", "ptr", pdib, "ptr", dib.ptr + (A_PtrSize = 4 ? 24:32), "uptr", 40)

      ; Copy the pixel data.
      DllCall("RtlMoveMemory", "ptr", pdib+40, "ptr", pBits, "uptr", size)

      ; Unlock to moveable memory because the clipboard requires it.
      DllCall("GlobalUnlock", "ptr", hdib)

      ; Delete the temporary hBitmap.
      DllCall("DeleteObject", "ptr", hBitmap)

      ; CF_DIB (8) can be synthesized into CF_BITMAP (2), CF_PALETTE (9), and CF_DIBV5 (17).
      DllCall("SetClipboardData", "uint", 8, "ptr", hdib)

      ; Close the clipboard.
      DllCall("CloseClipboard")

      return ClipboardAll()
   }

   static put_buffer(pBitmap) {
      buffer := {pBitmap: pBitmap}
         .DefineMethod("__New" , (self) => (this.gdiplusStartup(), self)) ; Increment GDI+ reference count
         .DefineMethod("__Delete", (self) => (this.gdiplusShutdown("smart_pointer", self.pBitmap)))
         .__New()  ; On deletion the buffer object will dispose of the bitmap. And it will decrement this.gdiplus.
      return buffer
   }

   static put_screenshot(pBitmap, screenshot := "", alpha := "") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

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

   static put_window(pBitmap, title := "") {

      WindowProc(hwnd, uMsg, wParam, lParam) {

         ; WM_DESTROY
         if (uMsg = 0x2) {
            return Persistent(false)
         }

         ; WM_LBUTTONDOWN
         if (uMsg = 0x201) {
            parent := DllCall("GetParent", "ptr", hwnd, "ptr")
            hwnd := (parent != A_ScriptHwnd && parent != 0) ? parent : hwnd
            return DllCall("DefWindowProc", "ptr", hwnd, "uint", 0xA1, "uptr", 2, "ptr", 0, "ptr")
         }

         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }

      ; Make it permanent.
      Persistent(true)


      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      cls := this.prototype.__class
      pWndProc := CallbackCreate(WindowProc)

      hCursor := DllCall("LoadCursor", "ptr", 0, "ptr", 32512, "ptr") ; IDC_ARROW
      ;hBrush := DllCall("CreateSolidBrush", "uint", 0x00F0F0F0, "ptr")
      hBrush := DllCall("GetStockObject", "int", 5, "ptr") ; Hollow_brush

      ; explanation or guess: There's 2 layers. The bottom layer is F0F0F0 and it is set to transparent.
      ; However, transparency is click through. But if the hollow brush is used instead, it paints with
      ; no color. But the system interprets that as the default color, F0F0F0. So later when F0F0F0 is made
      ; transparent, it can't set the bounds as click though, because the system used the default color to
      ; represent the empty color, and all we did was remove the system shading. (Just a guess.)

      ; struct tagWNDCLASSEXA - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexa
      ; struct tagWNDCLASSEXW - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexw
      _ := (A_PtrSize = 4)
      wc := Buffer(_ ? 48:80)                         ; sizeof(WNDCLASSEX) = 48, 80
         NumPut(  "uint",     wc.size, wc,         0) ; cbSize
         NumPut(  "uint",           0, wc,         4) ; style
         NumPut(   "ptr",    pWndProc, wc,         8) ; lpfnWndProc
         NumPut(   "int",           0, wc, _ ? 12:16) ; cbClsExtra
         NumPut(   "int",           0, wc, _ ? 16:20) ; cbWndExtra
         NumPut(   "ptr",           0, wc, _ ? 20:24) ; hInstance
         NumPut(   "ptr",           0, wc, _ ? 24:32) ; hIcon
         NumPut(   "ptr",     hCursor, wc, _ ? 28:40) ; hCursor
         NumPut(   "ptr",      hBrush, wc, _ ? 32:48) ; hbrBackground
         NumPut(   "ptr",           0, wc, _ ? 36:56) ; lpszMenuName
         NumPut(   "ptr", StrPtr(cls), wc, _ ? 40:64) ; lpszClassName
         NumPut(   "ptr",           0, wc, _ ? 44:72) ; hIconSm

      ; Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
      DllCall("RegisterClassEx", "ptr", wc, "ushort")

         WS_VISIBLE                := 0x10000000
         WS_SYSMENU                :=    0x80000
         WS_CHILD                  := 0x40000000
         WS_EX_TOPMOST             :=        0x8
         WS_EX_LAYERED             :=    0x80000
         WS_TILEDWINDOW            :=   0xCF0000
         WS_CAPTION                :=   0xC00000
         WS_EX_STATICEDGE          :=    0x20000
         WS_EX_WINDOWEDGE          :=      0x100
         WS_SIZEBOX                :=    0x40000
         WS_CLIPCHILDREN           :=  0x2000000
         WS_POPUP                  := 0x80000000
         WS_BORDER                 :=   0x800000
         WS_EX_TOOLWINDOW          :=       0x80
         WS_CLIPSIBLINGS           :=  0x4000000
         WS_EX_TRANSPARENT         :=       0x20
         WS_EX_DLGMODALFRAME       :=        0x1

         style := WS_VISIBLE | WS_CAPTION | WS_SYSMENU | WS_CLIPCHILDREN | WS_POPUP | WS_CLIPSIBLINGS ;| WS_SIZEBOX
         styleEx := WS_EX_TOPMOST | WS_EX_WINDOWEDGE | WS_EX_DLGMODALFRAME ;| WS_EX_LAYERED ;| WS_EX_STATICEDGE

         rect := Buffer(16)
            NumPut("int", Floor((A_ScreenWidth - width) / 2), rect,  0)
            NumPut("int", Floor((A_ScreenHeight - height) / 2), rect,  4)
            NumPut("int", Floor((A_ScreenWidth + width) / 2), rect,  8)
            NumPut("int", Floor((A_ScreenHeight + height) / 2), rect, 12)

         DllCall("AdjustWindowRectEx", "ptr", rect, "uint", style, "uint", 0, "uint", styleEx)
            , x := NumGet(rect,  0, "int")
            , y := NumGet(rect,  4, "int")
            , w := NumGet(rect,  8, "int") - NumGet(rect,  0, "int")
            , h := NumGet(rect, 12, "int") - NumGet(rect,  4, "int")

         hwnd0 := DllCall("CreateWindowEx"
            ,   "uint", styleEx
            ,    "str", "ImagePut"  ; lpClassName
            ,    "str", title ;"Pichu"            ; lpWindowName
            ,   "uint", style
            ,    "int", x      ; X
            ,    "int", y        ; Y
            ,    "int", w      ; nWidth
            ,    "int", h     ; nHeight
            ,    "ptr", A_ScriptHwnd                     ; hWndParent
            ,    "ptr", 0                     ; hMenu
            ,    "ptr", 0                     ; hInstance
            ,    "ptr", 0                     ; lpParam
            ,    "ptr")

         ;if transparent
            WinSetTransColor "F0F0F0", hwnd0

         vWinStyle := WS_VISIBLE | WS_CHILD
         vWinExStyle := WS_EX_LAYERED ;| WS_EX_TOPMOST

         hwnd := DllCall("CreateWindowEx"
            ,   "uint", vWinExStyle           ; dwExStyle
            ,    "str", "ImagePut"  ; lpClassName
            ,    "str", "Pikachu"            ; lpWindowName
            ,   "uint", vWinStyle             ; dwStyle
            ,    "int", 0       ; X
            ,    "int", 0        ; Y
            ,    "int", width      ; nWidth
            ,    "int", height     ; nHeight
            ,    "ptr", hwnd0                     ; hWndParent
            ,    "ptr", 0                     ; hMenu
            ,    "ptr", 0                     ; hInstance
            ,    "ptr", 0                     ; lpParam
            ,    "ptr")

         ;DllCall("ShowWindow", "ptr", hwnd, "int", 1)

         hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
         hbm := this.put_hBitmap(pBitmap)
         obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")
         ;DllCall("gdiplus\GdipCreateFromHDC", "ptr", hdc , "ptr*", &gfx:=0)

         DllCall("UpdateLayeredWindow"
                  ,    "ptr", hwnd                   ; hWnd
                  ,    "ptr", 0                           ; hdcDst
                  ,"uint64*", 0 | 0 << 32                      ; *pptDst
                  ,"uint64*", width | height << 32                     ; *psize
                  ,    "ptr", hdc                    ; hdcSrc
                  , "int64*", 0                           ; *pptSrc
                  ,   "uint", 0                           ; crKey
                  ,  "uint*", 0xFF << 16 | 0x01 << 24         ; *pblend
                  ,   "uint", 2)                          ; dwFlags



         ;MsgBox Format("{:X}", Style) " | " Format("{:X}", WinGetStyle(hwnd0))
         ;MsgBox Format("{:X}", StyleEx) " | " Format("{:X}", WinGetExStyle(hwnd0))

         ;MsgBox Format("{:X}", vWinStyle) " | " Format("{:X}", WinGetStyle(hwnd))
         ;MsgBox Format("{:X}", vWinExStyle) " | " Format("{:X}", WinGetExStyle(hwnd))

      return hwnd0
   }

   static put_desktop(pBitmap) {
      ; Thanks Gerald Degeneve - https://www.codeproject.com/Articles/856020/Draw-Behind-Desktop-Icons-in-Windows-plus

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.put_hBitmap(pBitmap)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Post-Creator's Update Windows 10. WM_SPAWN_WORKER = 0x052C
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 0)
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 1)

      ; Find the child window.
      windows := WinGetList("ahk_class WorkerW")
      Loop windows.length
         hwnd := windows[A_Index]
      until DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "SHELLDLL_DefView", "ptr", 0)

      ; Maybe this hack gets patched. Tough luck!
      if !(WorkerW := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "WorkerW", "ptr", 0, "ptr"))
         throw Error("Could not locate hidden window behind desktop.")

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

   static put_wallpaper(pBitmap) {
      ; Create a temporary image file.
      filepath := this.put_file(pBitmap)

      ; Get the absolute path of the file.
      length := DllCall("GetFullPathName", "str", filepath, "uint", 0, "ptr", 0, "ptr", 0, "uint")
      VarSetStrCapacity(&buf, length)
      DllCall("GetFullPathName", "str", filepath, "uint", length, "str", buf, "ptr", 0, "uint")

      ; Keep waiting until the file has been created. (It should be instant!)
      loop
         if FileExist(filepath)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Unable to create temporary image file.")

      ; Set the temporary image file as the new desktop wallpaper.
      DllCall("SystemParametersInfo", "uint", SPI_SETDESKWALLPAPER := 20, "uint", 0, "str", buf, "uint", 2)

      ; This is a delayed delete call. #Persistent may be required on v1.
      DeleteFile := DllCall.Bind("DeleteFile", "str", filepath)
      SetTimer DeleteFile, -2000

      return "wallpaper"
   }

   static put_cursor(pBitmap, xHotspot := "", yHotspot := "") {
      ; Thanks Nick - https://stackoverflow.com/a/550965

      ; Creates an icon that can be used as a cursor.
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", &hIcon:=0)

      ; Sets the hotspot of the cursor by changing the icon into a cursor.
      if (xHotspot != "" || yHotspot != "") {
         ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
         ii := Buffer(8+3*A_PtrSize)                                ; sizeof(ICONINFO) = 20, 32
         DllCall("GetIconInfo", "ptr", hIcon, "ptr", ii)            ; Fill the ICONINFO structure.
            NumPut("uint", false, ii, 0)                            ; true/false are icon/cursor respectively.
            (xHotspot != "") ? NumPut("uint", xHotspot, ii, 4) : "" ; Set the xHotspot value. (Default: center point)
            (yHotspot != "") ? NumPut("uint", yHotspot, ii, 8) : "" ; Set the yHotspot value. (Default: center point)
         DllCall("DestroyIcon", "ptr", hIcon)                       ; Destroy the icon after getting the ICONINFO structure.
         hIcon := DllCall("CreateIconIndirect", "ptr", ii, "ptr")   ; Create a new cursor using ICONINFO.

         ; Clean up hbmMask and hbmColor created as a result of GetIconInfo.
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+A_PtrSize, "ptr"))   ; hbmMask
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+2*A_PtrSize, "ptr")) ; hbmColor
      }

      ; Loop over all 16 system cursors and change them all to the new cursor.
      SystemCursors := "32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651"
      Loop Parse, SystemCursors, ","
      { ; Must copy the handle 16 times as SetSystemCursor deletes the handle 16 times.
         hCursor := DllCall("CopyImage", "ptr", hIcon, "uint", 2, "int", 0, "int", 0, "uint", 0, "ptr")
         DllCall("SetSystemCursor", "ptr", hCursor, "int", A_LoopField) ; calls DestroyCursor
      }

      ; Destroy the original hIcon. Same as DestroyCursor.
      DllCall("DestroyIcon", "ptr", hIcon)

      ; Returns the string A_Cursor to avoid evaluation.
      return "A_Cursor"
   }

   static put_file(pBitmap, filepath := "", quality := "") {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      extension := "png"
      this.select_filepath(&filepath, &extension)

      ; Select the proper codec based on the extension of the file.
      this.select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v)

      ; Write the file to disk using the specified encoder and encoding parameters with exponential backoff.
      loop
         if !DllCall("gdiplus\GdipSaveImageToFile", "ptr", pBitmap, "wstr", filepath, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Could not save file to disk.")

      return filepath
   }

   static set_file(pStream, filepath := "") {
      extension := "png"
      this.select_filepath(&filepath, &extension, pStream)

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\SHCreateStreamOnFileEx"
               ,   "wstr", filepath
               ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
               ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
               ,    "int", true            ; fCreate is ignored when STGM_CREATE is set.
               ,    "ptr", 0               ; pstmTemplate (reserved)
               ,   "ptr*", &pFileStream:=0
               ,"HRESULT")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "ptr*", &size:=0, "HRESULT")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "HRESULT")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pFileStream, "uint", size, "HRESULT")
      ObjRelease(pFileStream)

      return filepath
   }

   static put_hBitmap(pBitmap, alpha := "") {
      ; Revert to built in functionality if a replacement color is declared.
      if (alpha != "") { ; This built-in version is about 25% slower.
         DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", &hBitmap:=0, "uint", alpha)
         return hBitmap
      }

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Convert the source pBitmap into a hBitmap manually.
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",     width, bi,  4) ; Width
         NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Transfer data from source pBitmap to an hBitmap manually.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (pBits) to the hbm.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteDC",     "ptr", hdc)

      return hbm
   }

   static put_hIcon(pBitmap) {
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", &hIcon:=0)
      return hIcon
   }

   static put_stream(pBitmap, extension := "", quality := "") {
      ; Default extension is TIF for fast speeds!
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := "tif"

      ; Select the proper codec based on the extension of the file.
      this.select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v)

      ; Create a Stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", true, "ptr*", &pStream:=0, "HRESULT")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)

      return pStream
   }

   static put_RandomAccessStream(pBitmap, extension := "", quality := "") {
      pStream := this.put_stream(pBitmap, extension, quality)
      pRandomAccessStream := this.set_RandomAccessStream(pStream)
      ObjRelease(pStream) ; Decrement the reference count of the IStream interface.
      return pRandomAccessStream
   }

   static set_RandomAccessStream(pStream) {
      ; Thanks teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=6&t=72674
      CLSID := Buffer(16)
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", CLSID, "HRESULT")
      DllCall("ShCore\CreateRandomAccessStreamOverStream"
               ,    "ptr", pStream
               ,   "uint", BSOS_PREFERDESTINATIONSTREAM := 1
               ,    "ptr", CLSID
               ,   "ptr*", &pRandomAccessStream:=0
               ,"HRESULT")
      return pRandomAccessStream
   }

   static put_hex(pBitmap, extension := "", quality := "") {
      ; Default extension is PNG for small sizes!
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      hex := this.set_hex(pStream)
      ObjRelease(pStream)
      return hex
   }

   static set_hex(pStream) {
      return this.set_string(pStream, 0x4000000C) ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEXRAW
   }

   static put_base64(pBitmap, extension := "", quality := "") {
      ; Default extension is PNG for small sizes!
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      base64 := this.set_base64(pStream)
      ObjRelease(pStream)
      return base64
   }

   static set_base64(pStream) {
      return this.set_string(pStream, 0x40000001) ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
   }

   static set_string(pStream, flags) {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "ptr*", &size:=0, "HRESULT")
      bin := Buffer(size)
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "HRESULT")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", bin, "uint", size, "HRESULT")

      ; Using CryptBinaryToStringA saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", bin, "uint", size, "uint", flags, "ptr", 0, "uint*", &length:=0)
      str := Buffer(length)
      DllCall("crypt32\CryptBinaryToStringA", "ptr", bin, "uint", size, "uint", flags, "ptr", str, "uint*", length)

      return StrGet(str, length, "CP0")
   }

   static select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v) {
      ; Fill a buffer with the available image codec info.
      DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", &count:=0, "uint*", &size:=0)
      DllCall("gdiplus\GdipGetImageEncoders", "uint", count, "uint", size, "ptr", ci := Buffer(size))

      ; struct ImageCodecInfo - http://www.jose.it-berater.org/gdiplus/reference/structures/imagecodecinfo.htm
      loop {
         if (A_Index > count)
            throw Error("Could not find a matching encoder for the specified file format.")

         idx := (48+7*A_PtrSize)*(A_Index-1)
      } until InStr(StrGet(NumGet(ci, idx+32+3*A_PtrSize, "ptr"), "UTF-16"), "*." extension) ; FilenameExtension

      ; Get the pointer to the clsid of the matching encoder.
      pCodec := ci.ptr + idx ; ClassID

      ; JPEG default quality is 75. Otherwise set a quality value from [0-100].
      if IsInteger(quality) and ("image/jpeg" = StrGet(NumGet(ci, idx+32+4*A_PtrSize, "ptr"), "UTF-16")) { ; MimeType
         ; Use a separate buffer to store the quality as ValueTypeLong (4).
         v := Buffer(4), NumPut("uint", quality, v)

         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ; enum ValueType - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.imaging.encoderparametervaluetype
         ; clsid Image Encoder Constants - http://www.jose.it-berater.org/gdiplus/reference/constants/gdipimageencoderconstants.htm
         ep := Buffer(24+2*A_PtrSize)                  ; sizeof(EncoderParameter) = ptr + n*(28, 32)
            NumPut(  "uptr",     1, ep,            0)  ; Count
            DllCall("ole32\CLSIDFromString", "wstr", "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}", "ptr", ep.ptr+A_PtrSize, "HRESULT")
            NumPut(  "uint",     1, ep, 16+A_PtrSize)  ; Number of Values
            NumPut(  "uint",     4, ep, 20+A_PtrSize)  ; Type
            NumPut(   "ptr", v.ptr, ep, 24+A_PtrSize)  ; Value
      }
   }

   static select_extension(pStream, &extension) {
      signature := Buffer(12)
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "HRESULT")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", signature, "uint", 12, "HRESULT")

      ; This function sniffs the first 12 bytes and matches a known file signature.
      ; 256 bytes is recommended, but images only need 12 bytes.
      ; See: https://en.wikipedia.org/wiki/List_of_file_signatures
      DllCall("urlmon\FindMimeFromData"
               ,    "ptr", 0             ; pBC
               ,    "ptr", 0             ; pwzUrl
               ,    "ptr", signature     ; pBuffer
               ,   "uint", 12            ; cbSize
               ,    "ptr", 0             ; pwzMimeProposed
               ,   "uint", 0x20          ; dwMimeFlags
               ,   "ptr*", &MimeType:=0  ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,"HRESULT")

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

   static select_filepath(&filepath, &extension, pStream := "") {
      ; Save extension as default.
      default := extension

      ; Remove whitespace. Seperate the filepath. Adjust for directories.
      filepath := Trim(filepath)
      SplitPath filepath,, &directory, &extension, &filename
      if DirExist(filepath)
         directory .= "\" filename, filename := ""
      if (directory != "" && !DirExist(directory))
         DirCreate(directory)
      directory := (directory != "") ? directory : "."

      ; Validate filepath. https://stackoverflow.com/a/6804755
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$") {
         ; If the extension does not match a known file type, append it to the filename.
         if (extension != "")
            filename .= "." extension

         extension := default

         if (pStream) {
            this.select_extension(pStream, &extension)
         }
      }
      filename := RegExReplace(filename, "S)(?i:^(CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])$|[<>:|?*\x00-\x1F\x22\/\\])")
      if (filename == "") {
         filename := FormatTime(, "yyyy-MM-dd HH?mm?ss")
         filepath := directory "\" filename "." extension
         if FileExist(filepath) { ; Check for collisions.
            loop
               filepath := directory "\" filename " (" A_Index ")." extension
            until !FileExist(filepath)
         }
      }
      else
         filepath := directory "\" filename "." extension
   }

   ; All references to gdiplus and pToken must be absolute!
   static gdiplus := 0, pToken := 0

   static gdiplusStartup() {
      ImagePut.gdiplus++

      ; Startup gdiplus when counter goes from 0 -> 1.
      if (ImagePut.gdiplus == 1) {

         ; Startup gdiplus.
         DllCall("LoadLibrary", "str", "gdiplus")
         si := Buffer(A_PtrSize = 4 ? 16:24, 0) ; sizeof(GdiplusStartupInput) = 16, 24
            NumPut("uint", 0x1, si)
         DllCall("gdiplus\GdiplusStartup", "ptr*", &pToken:=0, "ptr", si, "ptr", 0)

         ImagePut.pToken := pToken
      }
   }

   static gdiplusShutdown(cotype := "", pBitmap := "") {
      ImagePut.gdiplus--

      ; When a buffer object is deleted a bitmap is sent here for disposal.
      if (cotype == "smart_pointer")
         if DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
            throw Error("The bitmap of this buffer object has already been deleted.")

      ; Check for unpaired calls of gdiplusShutdown.
      if (ImagePut.gdiplus < 0)
         throw Error("Missing ImagePut.gdiplusStartup().")

      ; Shutdown gdiplus when counter goes from 1 -> 0.
      if (ImagePut.gdiplus == 0) {
         pToken := ImagePut.pToken

         ; Shutdown gdiplus.
         DllCall("gdiplus\GdiplusShutdown", "ptr", pToken)
         DllCall("FreeLibrary", "ptr", DllCall("GetModuleHandle", "str", "gdiplus", "ptr"))

         ; Exit if GDI+ is still loaded. GdiplusNotInitialized = 18
         if (18 != DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0)) {
            DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)
            return
         }

         ; Otherwise GDI+ has been truly unloaded from the script and objects are out of scope.
         if (cotype = "bitmap")
            throw Error("Out of scope error. `n`nIf you wish to handle raw pointers to GDI+ bitmaps, add the line"
               . "`n`n`t`t" this.prototype.__class ".gdiplusStartup()`n`nor 'pToken := Gdip_Startup()' to the top of your script."
               . "`nAlternatively, use 'obj := ImagePutBuffer()' with 'obj.pBitmap'."
               . "`nYou can copy this message by pressing Ctrl + C.")
      }
   }
} ; End of ImagePut class.






class ImageEqual extends ImagePut {

   static call(images*) {
      ; Returns false is there are no images to be compared.
      if (images.length == 0)
         return false

      this.gdiplusStartup()

      ; Set the first image to its own variable to allow passing by reference.
      image := images[1]

      ; Allow the ImageType exception to bubble up.
      try type := this.DontVerifyImageType(&image)
      catch
         type := this.ImageType(image)

      ; Convert only the first image to a bitmap.
      if !(pBitmap1 := this.ToBitmap(type, image))
         throw Error("Conversion to bitmap failed. The pointer value is zero.")

      ; If there is only one image, verify that image and return.
      if (images.length == 1) {
         if DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap1, "ptr*", &pBitmapClone:=0)
            throw Error("Validation failed. Unable to access and clone the bitmap.")

         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmapClone)
         Goto Good_Ending
      }

      ; If there are multiple images, compare each subsequent image to the first.
      for i, image in images {
         if (A_Index != 1) {

            ; Guess the type of the image.
            try type := this.DontVerifyImageType(&image)
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
      return true

      Bad_Ending: ; Turns out your best friend became super jealous of you and killed you in your sleep.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      this.gdiplusShutdown()
      return false
   }

   static BitmapEqual(SourceBitmap1, SourceBitmap2, PixelFormat := 0x26200A) {
      ; Make sure both source bitmaps are valid GDI+ pointers. This will throw if not...
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap1, "ptr*", &type1:=0)
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap2, "ptr*", &type2:=0)

      ; ImageTypeUnknown = 0, ImageTypeBitmap = 1, and ImageTypeMetafile = 2.
      if (type1 != 1 || type2 != 1)
         throw Error("The GDI+ pointer is not a bitmap.")

      ; Check if source bitmap pointers are identical.
      if (SourceBitmap1 == SourceBitmap2)
         return true

      ; The two bitmaps must be the same size.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap1, "uint*", &width1:=0)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap2, "uint*", &width2:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap1, "uint*", &height1:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap2, "uint*", &height2:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap1, "int*", &format1:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap2, "int*", &format2:=0)

      ; Dimensions must be non-zero.
      if !(width1 && width2 && height1 && height2)
         throw Error("The bitmap dimensions cannot be zero.")

      ; Match bitmap dimensions.
      if (width1 != width2 || height1 != height2)
         return false

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
                     ,   "ptr*", &pBitmap%A_Index%:=0)
            throw Error("Cloning Bitmap" A_Index " failed.")

      ; struct RECT - https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect
      Rect := Buffer(16, 0)                        ; sizeof(Rect) = 16
         NumPut(  "uint",   width1, Rect,  8)      ; Width
         NumPut(  "uint",  height1, Rect, 12)      ; Height

      ; Create a BitmapData structure.
      BitmapData1 := Buffer(16+2*A_PtrSize)        ; sizeof(BitmapData) = 24, 32
      BitmapData2 := Buffer(16+2*A_PtrSize)        ; sizeof(BitmapData) = 24, 32

      ; Transfer the pixels to a read-only buffer. The user can declare a PixelFormat.
      Loop 2
         DllCall("gdiplus\GdipBitmapLockBits"
                  ,    "ptr", pBitmap%A_Index%
                  ,    "ptr", Rect
                  ,   "uint", 1            ; ImageLockMode.ReadOnly
                  ,    "int", PixelFormat  ; Format32bppArgb is fast.
                  ,    "ptr", BitmapData%A_Index%)

      ; Get Stride (number of bytes per horizontal line).
      stride1 := NumGet(BitmapData1, 8, "int")
      stride2 := NumGet(BitmapData2, 8, "int")

      ; Well the image has already been cloned, so the stride should never be negative.
      if (stride1 < 0 || stride2 < 0) ; See: https://stackoverflow.com/a/10341340
         throw Error("Negative stride. Please report this error to the developer.")

      ; Get Scan0 (top-left pixel at 0,0).
      Scan01 := NumGet(BitmapData1, 16, "ptr")
      Scan02 := NumGet(BitmapData2, 16, "ptr")

      ; RtlCompareMemory preforms an unsafe comparison stopping at the first different byte.
      size := stride1 * height1
      byte := DllCall("ntdll\RtlCompareMemory", "ptr", Scan01, "ptr", Scan02, "uptr", size, "uptr")

      ; Unlock Bitmaps. Since they were marked as read only there is no copy back.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap1, "ptr", BitmapData1)
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap2, "ptr", BitmapData2)

      ; Cleanup bitmap clones.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)

      ; Compare stopped byte.
      return (byte == size) ? true : false
   }
} ; End of ImageEqual class.