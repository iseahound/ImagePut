; Script:    ImagePut.ahk
; License:   MIT License
; Author:    Edison Hua (iseahound)
; Github:    https://github.com/iseahound/ImagePut
; Date:      2023-03-02
; Version:   1.10

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

; Puts the image into the most recently active explorer window.
ImagePutExplorer(image, default := "") {
   return ImagePut("explorer", image, default)
}

; Puts the image into a file and returns its filepath.
;   filepath   -  Filepath + Extension    |  string   ->   *.bmp, *.gif, *.jpg, *.png, *.tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutFile(image, filepath := "", quality := "") {
   return ImagePut("file", image, filepath, quality)
}

; Puts the image into a multipart/form-data in binary and returns a SafeArray COM Object.
;   boundary   -  Content-Type            |  string   ->   multipart/form-data; boundary=something
ImagePutFormData(image, boundary := "--ImagePut abc 321 xyz--") {
   return ImagePut("formdata", image, boundary)
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

; Puts the image into a file format and returns a SafeArray COM Object.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutSafeArray(image, extension := "", quality := "") {
   return ImagePut("safeArray", image, extension, quality)
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

; Puts the image into a file format and returns a URI string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutURI(image, extension := "", quality := "") {
   return ImagePut("uri", image, extension, quality)
}

; Puts the image as the desktop wallpaper and returns the string "wallpaper".
ImagePutWallpaper(image) {
   return ImagePut("wallpaper", image)
}

; Puts the image into a WICBitmap and returns the pointer to the interface.
ImagePutWICBitmap(image) {
   return ImagePut("wicBitmap", image)
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

   call(cotype, image, p*) {

      ; Start!
      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>95% accuracy!)
      try type := this.DontVerifyImageType(image, keywords)
      catch
         type := this.ImageType(image)

      crop := keywords.crop
      scale := keywords.scale
      decode := (keywords.decode != "") ? keywords.decode : this.decode
      validate := (keywords.validate != "") ? keywords.validate : this.validate

      ; #1 - Stream intermediate.
      if not decode and not crop and not scale
         and (type ~= "^(?i:clipboard_png|pdf|url|file|stream|RandomAccessStream|hex|base64)$")
         and (cotype ~= "^(?i:file|stream|RandomAccessStream|hex|base64|uri|explorer|safeArray|formData)$")
         and (p[1] == "") { ; For now, disallow any specification of extensions.

         ; Convert via stream intermediate.
         if !(pStream := this.ToStream(type, image, keywords))
            throw Exception("pStream cannot be zero.")
         coimage := this.StreamToCoimage(cotype, pStream, p*)

         ; Prevents the stream object from being freed.
         if (cotype = "stream")
            ObjAddRef(pStream)

         ; Free the temporary stream object.
         ObjRelease(pStream)
      }

      ; #2 - Fallback to GDI+ bitmap as the intermediate.
      else {
         ; GdipImageForceValidation must be called immediately or it fails without any errors.
         ; It load the image pixels to the bitmap buffer, increasing memory usage and prevents
         ; changes to the pixels while bypassing any copy-on-write and copy on LockBits(read) behavior.

         ; Convert via GDI+ bitmap intermediate.
         if !(pBitmap := this.ToBitmap(type, image, keywords))
            throw Exception("pBitmap cannot be zero.")
         (validate) && DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap)
         (crop) && this.BitmapCrop(pBitmap, crop)
         (scale) && this.BitmapScale(pBitmap, scale)
         coimage := this.BitmapToCoimage(cotype, pBitmap, p*)

         ; Clean up the pBitmap copy. Export raw pointers if requested.
         if !(cotype = "bitmap")
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      ; Check for dangling pointers.
      this.gdiplusShutdown(cotype)

      return coimage
   }

   get(name, p*) {
      return ObjHasKey(this, name) ? this.name : ""
   }

   static inputs :=
      ( Join
      [
      "clipboard_png",
      "clipboard",
      "object",
      "buffer",
      "screenshot",
      "window",
      "desktop",
      "wallpaper",
      "cursor",
      "pdf",
      "url",
      "file",
      "hex",
      "base64",
      "monitor",
      "dc",
      "hBitmap",
      "hIcon",
      "bitmap",
      "stream",
      "RandomAccessStream",
      "wicBitmap",
      "d2dBitmap",
      "sprite"
      ]
      )

   DontVerifyImageType(ByRef image, ByRef keywords := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      keywords := {base: {__get: this.get}}

      ; Try ImageType.
      if !IsObject(image)
         throw Exception("Must be an object.")

      ; Goto ImageType.
      if ObjHasKey(image, "image") {
         keywords := image
         keywords.base := {__get: this.get}
         image := image.image
         throw Exception("Must catch this error with ImageType.")
      }

      ; Skip ImageType.
      for i, type in this.inputs
         if ObjHasKey(image, type) {
            keywords := image
            keywords.base := {__get: this.get}
            image := image[type]
            return type
         }

      ; Continue ImageType.
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

         ; A "window" is an object with an hwnd property.
         if image.HasKey("hwnd")
            return "window"

         ; A "window2" is an array with a string that contains the window title.
         if (image.HasKey(1) && WinExist(image[1]))
            return "window2"

         ; A "screenshot" is an array of 4 numbers.
         if (image[1] ~= "^-?\d+$" && image[2] ~= "^-?\d+$" && image[3] ~= "^-?\d+$" && image[4] ~= "^-?\d+$")
            return "screenshot"

         throw Exception("Image type could not be identified.")
      }
         SysGet MonitorGetCount, MonitorCount ; A non-zero "monitor" number identifies each display uniquely; and 0 refers to the entire virtual screen.
         if (image ~= "^\d+$" && image >= 0 && image <= MonitorGetCount)
            return "monitor"

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

         ; A "window" is anything considered a Window Title including ahk_class and "A".
         if WinExist(image) || DllCall("IsWindow", "ptr", image)
            return "window"

         ; A "hex" string is binary image data encoded into text using hexadecimal.
         if (StrLen(image) >= 48) && (image ~= "^\s*(?:[A-Fa-f0-9]{2})*+\s*$")
            return "hex"

         ; A "base64" string is binary image data encoded into text using standard 64 characters.
         if (StrLen(image) >= 32) && (image ~= "^\s*(?:data:image\/[a-z]+;base64,)?"
         . "(?:[A-Za-z0-9+\/]{4})*+(?:[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{2}==)?\s*$")
            return "base64"

      if (image ~= "^-?\d+$") {
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

         ; A "wicBitmap" is a pointer to a IWICBitmapSource.
         try if ComObjQuery(image, "{00000120-A8F2-4877-BA0A-FD2B6645FB94}")
            return "wicBitmap", ObjRelease(image)

         ; A "d2dBitmap" is a pointer to a ID2D1Bitmap.
         try if ComObjQuery(image, "{A2296057-EA42-4099-983B-539FB6505426}")
            return "d2dBitmap", ObjRelease(image)
      }


      ; For more helpful error messages: Catch file names without extensions!
      for i, extension in ["bmp","dib","rle","jpg","jpeg","jpe","jfif","gif","tif","tiff","png","ico","exe","dll"]
         if FileExist(image "." extension)
            throw Exception("A ." extension " file extension is required!", -4)

      throw Exception("Image type could not be identified.")
   }

   ToBitmap(type, image, k := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      (!k) && k := {base: {__get: this.get}}

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

      if (type = "window2")
         return this.from_screenshot(image[1])

      if (type = "desktop")
         return this.from_desktop()

      if (type = "wallpaper")
         return this.from_wallpaper()

      if (type = "cursor")
         return this.from_cursor()

      if (type = "pdf")
         return this.from_pdf(image, k.index)

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

      if (type = "wicBitmap")
         return this.from_wicBitmap(image)

      if (type = "sprite")
         return this.from_sprite(image)

      throw Exception("Conversion from " type " to bitmap is not supported.")
   }

   BitmapToCoimage(cotype, pBitmap, p1:="", p2:="", p3:="", p4:="", p5:="", p*) {
      ; BitmapToCoimage("clipboard", pBitmap)
      if (cotype = "clipboard" || cotype = "clipboard_png")
         return this.to_clipboard(pBitmap)

      ; BitmapToCoimage("buffer", pBitmap)
      if (cotype = "buffer")
         return this.to_buffer(pBitmap)

      ; BitmapToCoimage("screenshot", pBitmap, screenshot, alpha)
      if (cotype = "screenshot")
         return this.to_screenshot(pBitmap, p1, p2)

      ; BitmapToCoimage("show", pBitmap, title, pos, style, styleEx, parent)
      if (cotype = "show")
         return this.show(pBitmap, p1, p2, p3, p4, p5)

      ; BitmapToCoimage("window", pBitmap, title, pos, style, styleEx, parent)
      if (cotype = "window")
         return this.to_window(pBitmap, p1, p2, p3, p4, p5)

      ; BitmapToCoimage("desktop", pBitmap)
      if (cotype = "desktop")
         return this.to_desktop(pBitmap)

      ; BitmapToCoimage("wallpaper", pBitmap)
      if (cotype = "wallpaper")
         return this.to_wallpaper(pBitmap)

      ; BitmapToCoimage("cursor", pBitmap, xHotspot, yHotspot)
      if (cotype = "cursor")
         return this.to_cursor(pBitmap, p1, p2)

      ; BitmapToCoimage("url", pBitmap)
      if (cotype = "url")
         return this.to_url(pBitmap)

      ; BitmapToCoimage("file", pBitmap, filepath, quality)
      if (cotype = "file")
         return this.to_file(pBitmap, p1, p2)

      ; BitmapToCoimage("hex", pBitmap, extension, quality)
      if (cotype = "hex")
         return this.to_hex(pBitmap, p1, p2)

      ; BitmapToCoimage("base64", pBitmap, extension, quality)
      if (cotype = "base64")
         return this.to_base64(pBitmap, p1, p2)

      ; BitmapToCoimage("uri", pBitmap, extension, quality)
      if (cotype = "uri")
         return this.to_uri(pBitmap, p1, p2)

      ; BitmapToCoimage("dc", pBitmap, alpha)
      if (cotype = "dc")
         return this.to_dc(pBitmap, p1)

      ; BitmapToCoimage("hBitmap", pBitmap, alpha)
      if (cotype = "hBitmap")
         return this.to_hBitmap(pBitmap, p1)

      ; BitmapToCoimage("hIcon", pBitmap)
      if (cotype = "hIcon")
         return this.to_hIcon(pBitmap)

      ; BitmapToCoimage("bitmap", pBitmap)
      if (cotype = "bitmap")
         return pBitmap

      ; BitmapToCoimage("stream", pBitmap, extension, quality)
      if (cotype = "stream")
         return this.to_stream(pBitmap, p1, p2)

      ; BitmapToCoimage("RandomAccessStream", pBitmap, extension, quality)
      if (cotype = "RandomAccessStream")
         return this.to_RandomAccessStream(pBitmap, p1, p2)

      ; BitmapToCoimage("wicBitmap", pBitmap)
      if (cotype = "wicBitmap")
         return this.to_wicBitmap(pBitmap)

      ; BitmapToCoimage("explorer", pBitmap, default)
      if (cotype = "explorer")
         return this.to_explorer(pBitmap, p1)

      ; BitmapToCoimage("safeArray", pBitmap, extension, quality)
      if (cotype = "safeArray")
         return this.to_safeArray(pBitmap, p1, p2)

      ; BitmapToCoimage("formData", pBitmap, boundary, extension, quality)
      if (cotype = "formData")
         return this.to_formData(pBitmap, p1, p2, p3)

      throw Exception("Conversion from bitmap to " cotype " is not supported.")
   }

   ToStream(type, image, k := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      (!k) && k := {base: {__get: this.get}}

      if (type = "clipboard_png")
         return this.get_clipboard_png()

      if (type = "pdf")
         return this.get_pdf(image, k.index)

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

      ; StreamToCoimage("uri", pStream)
      if (cotype = "uri")
         return this.set_uri(pStream)

      ; StreamToCoimage("stream", pStream)
      if (cotype = "stream")
         return pStream

      ; StreamToCoimage("RandomAccessStream", pStream)
      if (cotype = "RandomAccessStream")
         return this.set_RandomAccessStream(pStream)

      ; StreamToCoimage("explorer", pStream, default)
      if (cotype = "explorer")
         return this.set_explorer(pStream, p1)

      ; StreamToCoimage("safeArray", pStream)
      if (cotype = "safeArray")
         return this.set_safeArray(pStream)

      ; StreamToCoimage("formData", pStream, boundary)
      if (cotype = "formData")
         return this.set_formData(pStream, p1)

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
      (crop[1] ~= "%$") && crop[1] := SubStr(crop[1], 1, -1) * 0.01 *  width
      (crop[2] ~= "%$") && crop[2] := SubStr(crop[2], 1, -1) * 0.01 * height
      (crop[3] ~= "%$") && crop[3] := SubStr(crop[3], 1, -1) * 0.01 *  width
      (crop[4] ~= "%$") && crop[4] := SubStr(crop[4], 1, -1) * 0.01 * height

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

      ; Fallback to CF_BITMAP. This format does not support transparency even with to_hBitmap().
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

      if !IsObject(image) {
         dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         hwnd := WinExist(image)
         VarSetCapacity(rect, 16, 0)
         DllCall("GetClientRect", "ptr", hwnd, "ptr", &rect)
         DllCall("ClientToScreen", "ptr", hwnd, "ptr", &rect)
         DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         image := [NumGet(rect, 0, "int"), NumGet(rect, 4, "int"), NumGet(rect, 8, "int"), NumGet(rect, 12, "int")]
      }

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

      loop % windows
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

   from_pdf(image, index := "") {
      pStream := this.get_pdf(image, index)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_pdf(image, index := "") {
      ; Thanks malcev - https://www.autohotkey.com/boards/viewtopic.php?t=80735
      (index == "") && index := 1

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

      DllCall(NumGet(NumGet(Object+0)+8*A_PtrSize), "ptr", Object, "ptr*", ObjectResult:=0, "cdecl") ; GetResults
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
         try return ObjRelease(Object)
         finally Object := ""
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
      ; Trim whitespace and remove hexadecimal indicator.
      image := Trim(image)
      image := RegExReplace(image, "^(0[xX])")

      ; Retrieve the size of bytes from the length of the base64 string.
      flags := 0xC ; CRYPT_STRING_HEXRAW
      size := StrLen(image) / 2

      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")

      DllCall("crypt32\CryptStringToBinary", "str", image, "uint", 0, "uint", flags, "ptr", pData, "uint*", size, "ptr", 0, "ptr", 0)

      DllCall("GlobalUnlock", "ptr", hData)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", pStream:=0, "uint")
      return pStream
   }

   from_base64(image) {
      pStream := this.get_base64(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   get_base64(image) {
      ; Trim whitespace and remove mime type.
      image := Trim(image)
      image := RegExReplace(image, "(?i)^data:image\/[a-z]+;base64,")

      ; Retrieve the size of bytes from the length of the base64 string.
      flags := 0x1 ; CRYPT_STRING_BASE64
      size := StrLen(RTrim(image, "=")) * 3 // 4

      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")

      DllCall("crypt32\CryptStringToBinary", "str", image, "uint", 0, "uint", flags, "ptr", pData, "uint*", size, "ptr", 0, "ptr", 0)

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
      else ; If already selected onto a device context...
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

   from_wicBitmap(image) {
      ; IWICBitmapSource::GetSize - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L1304
      DllCall(NumGet(NumGet(image + 0) + A_PtrSize*3), "ptr", image, "uint*", width:=0, "uint*", height:=0)

      ; Intialize an empty pBitmap using managed memory.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Create a pixel buffer.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 2            ; ImageLockMode.WriteOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData)
      Scan0 := NumGet(BitmapData, 16, "ptr")
      stride := NumGet(BitmapData, 8, "int")

      ; IWICBitmapSource::CopyPixels - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L1322
      DllCall(NumGet(NumGet(image + 0) + A_PtrSize*7), "ptr", image, "ptr", &Rect, "uint", stride, "uint", stride * height, "ptr", Scan0)

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      return pBitmap
   }

   from_sprite(image) {
      ; Create a source pBitmap.
      if !(pBitmap := this.from_file(image))
         if !(pBitmap := this.from_url(image))
            throw Exception("Could not be loaded from a valid file path or URL.")

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Create a pixel buffer.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 3            ; ImageLockMode.ReadWrite
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData)
      Scan0 := NumGet(BitmapData, 16, "ptr")

      ; C source code - https://godbolt.org/z/nrv5Yr3Y3
      static code := 0
      if !code {
         b64 := (A_PtrSize == 4)
            ? "VYnli0UIi1UMi00QOdBzDzkIdQbHAAAAAACDwATr7V3D"
            : "SDnRcw9EOQF1BDHAiQFIg8EE6+zD"
         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", op:=0)
      }

      ; Sample the top-left pixel and set all matching pixels to be transparent.
      DllCall(code, "ptr", Scan0, "ptr", Scan0 + 4*width*height, "uint", NumGet(Scan0+0, "uint"), "cdecl")

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      return pBitmap
   }

   to_clipboard(pBitmap) {
      ; Standard Clipboard Formats - https://www.codeproject.com/Reference/1091137/Windows-Clipboard-Formats
      ; Synthesized Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/clipboard-formats

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; Requires a valid window handle via OpenClipboard or the next call to OpenClipboard will crash.
      DllCall("EmptyClipboard")

      ; #1 - Place the image onto the clipboard as a PNG stream.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3

      ; Create a Stream whose underlying HGlobal must be referenced or lost forever.
      ; Rescue the HGlobal after GDI+ has written the PNG to stream and release the stream.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210929-00/?p=105742
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", pStream:=0, "uint")
      this.select_codec(pBitmap, "png", "", pCodec, ep, ci, v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", (ep) ? &ep : 0)
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

      ; CF_DIB (8) can be synthesized into CF_BITMAP (2), CF_PALETTE (9), and CF_DIBV5 (17).
      DllCall("SetClipboardData", "uint", 8, "ptr", hdib)

      ; Cleanup
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("CloseClipboard")
      return ""
   }

   set_clipboard(pStream) { ; Not yet implemented.
      this.select_extension(pStream, extension:="")

      if !(extension ~= "gif|png") {
         DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", pBitmap:=0)
         this.to_clipboard(pBitmap)
         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
         return ""
      }

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; Requires a valid window handle via OpenClipboard or the next call to OpenClipboard will crash.
      DllCall("EmptyClipboard")

      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", pSharedStream:=0, "uint")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pSharedStream, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      DllCall("ole32\GetHGlobalFromStream", "ptr", pSharedStream, "uint*", hData:=0, "uint")
      ObjRelease(pSharedStream)
      DllCall("SetClipboardData", "uint", DllCall("RegisterClipboardFormat", "str", extension, "uint"), "ptr", hData)
      DllCall("CloseClipboard")
      return ""
   }

   to_buffer(pBitmap) {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Allocate global memory.
      size := 4 * width * height
      ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", size, "ptr")

      ; Create a pixel buffer.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(       ptr, BitmapData, 16,    "ptr") ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData)

      ; Write pixels to global memory.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Free the pixels later.
      free := Func("DllCall").bind("GlobalFree", "ptr", ptr)

      return new ImagePut.BitmapBuffer(ptr, size, width, height, free)
   }

   class BitmapBuffer {

      __New(ptr, size, width, height, free:="") {
         ImagePut.gdiplusStartup()

         ; Create a pBitmap on saved memory.
         DllCall("gdiplus\GdipCreateBitmapFromScan0"
                  , "int", width, "int", height, "int", size // height, "int", 0x26200A, "ptr", ptr, "ptr*", pBitmap:=0)

         ; Wrap the pointer without copying the data.
         this.ptr := ptr
         this.size := size
         this.width := width
         this.height := height
         this.free := free
         this.pBitmap := pBitmap
      }

      __Delete() {
         DllCall("gdiplus\GdipDisposeImage", "ptr", this.pBitmap)
         this.free.call()
         ImagePut.gdiplusShutdown()
      }

      __Get(x, y) {
         return Format("0x{:X}", NumGet(this.ptr + 4*(y*this.width + x), "uint"))
      }

      __Set(x, y, color) {
         (color >> 24) || color |= 0xFF000000
         NumPut(color, this.ptr + 4*(y*this.width + x), "uint")
         return color
      }












































































































      Frequency() {
         if this.HasKey(map)
            return
         this.map := {}
         loop % this.width * this.height
            if c := NumGet(this.ptr + 4*(A_Index-1), "uint")
               this.map[c] := this.map.haskey(c) ? this.map[c] + 1 : 1
      }

      Count(c*) {
         this.Frequency()
         acc := 0
         for each, color in c {
            ; Lift color to 32-bits if first 8 bits are zero.
            (color >> 24) || color |= 0xFF000000
            acc += this.map[color]
         }
         return acc
      }

      Clone() {
         ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", this.size, "ptr")
         DllCall("RtlMoveMemory", "ptr", ptr, "ptr", this.ptr, "uptr", this.size)
         free := Func("DllCall").bind("GlobalFree", "ptr", ptr)
         return new ImagePut.BitmapBuffer(ptr, this.size, this.width, this.height, free)
      }

      Crop(x, y, w, h) {
         DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", this.pBitmap, "int*", format:=0)
         DllCall("gdiplus\GdipCloneBitmapAreaI", "int", x, "int", y, "int", w, "int", h, "int", format, "ptr", this.pBitmap, "ptr*", pBitmap:=0)
         return ImagePut.to_buffer(pBitmap)
      }

      Show(window_border := False, title := "", pos := "", style := "", styleEx := "", parent := "") {
         return (window_border)
            ? ImagePut.to_window(this.pBitmap, title, pos, style, styleEx, parent)
            : ImagePut.show(this.pBitmap, title, pos, style, styleEx, parent)
      }

      Save(filepath := "", quality := "")  {

         ; Process filepath and set extension.
         extension := "bmp"
         ImagePut.select_filepath(filepath, extension)

         ; If extension is not .bmp, use to_file routine.
         if (extension != "bmp")
            return ImagePut.to_file(this.pBitmap, filepath, quality)

         VarSetCapacity(bm, 54)

         StrPut("BM", &bm, "CP0")               ; identifier
         NumPut(54+this.size, bm,  2,   "uint") ; file size
         NumPut(           0, bm,  6,   "uint") ; reserved
         NumPut(          54, bm, 10,   "uint") ; bitmap data offset

         ; BITMAPINFOHEADER struct
         NumPut(          40, bm, 14,   "uint") ; Size
         NumPut(  this.width, bm, 18,   "uint") ; Width
         NumPut(-this.height, bm, 22,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(           1, bm, 26, "ushort") ; Planes
         NumPut(          32, bm, 28, "ushort") ; BitCount / BitsPerPixel

         NumPut(           0, bm, 30,   "uint") ; biCompression
         NumPut(   this.size, bm, 34,   "uint") ; biSizeImage
         NumPut(           0, bm, 38,    "int") ; biXPelsPerMeter
         NumPut(           0, bm, 42,    "int") ; biYPelsPerMeter
         NumPut(           0, bm, 46,   "uint") ; biClrUsed
         NumPut(           0, bm, 50,   "uint") ; biClrImportant

         loop
            try
               if file := FileOpen(filepath, "w")
                  break
               else throw
            catch
               if A_Index < 6
                  Sleep (2**(A_Index-1) * 30)
               else throw

         file.RawWrite(bm, 54)                ; Writes 54 bytes of bitmap file header.
         file.RawWrite(this.ptr+0, this.size) ; Writes raw 32-bit ARGB pixel data.
         file.Close()

         return filepath
      }

      Base64Put(b64) {
         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", op:=0)
         return code
      }

      CPUID() {
         static cpuid := 0

         if not cpuid {
            ; C source code - https://godbolt.org/z/1YPd6jz61
            b64 := (A_PtrSize == 4)
               ? "VYnlV4t9EFaLdQhTiw+LBg+iiQaLRQyJGItFFIkPiRBbXl9dww=="
               : "U4sBSYnKSYnTQYsID6JBiQJBiRtBiQhBiRFbww=="
            s64 := StrLen(RTrim(b64, "=")) * 3 // 4
            code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
            DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
            DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", op:=0)

            ; Set eax flag to 1 to retrieve supported CPU features.
            ; See this for CPU features: https://wiki.osdev.org/CPUID
            ; Also see page 591: https://www.amd.com/system/files/TechDocs/24594.pdf
            DllCall(code, "uint*", a := 1, "uint*", b := 0, "uint*", c := 0, "uint*", d := 0, "cdecl")

            ; Free memory.
            DllCall("GlobalFree", "ptr", code)

            ; To check for SSE2 use the following code example:
            ; if cpuid().edx[26] == True
            eax := {0: a & 1}
            ebx := {0: b & 1}
            ecx := {0: c & 1}
            edx := {0: d & 1}
            loop 31 {
               eax[A_Index] := !!(1 << A_Index & a)
               ebx[A_Index] := !!(1 << A_Index & b)
               ecx[A_Index] := !!(1 << A_Index & c)
               edx[A_Index] := !!(1 << A_Index & d)
            }
            cpuid := {eax: eax, ebx: ebx, ecx: ecx, edx: edx}
         }

         return cpuid
      }

      ColorKey(key := "sentinel", value := 0x00000000) {
         ; C source code - https://godbolt.org/z/eaG9fax9v
         static code := 0
         (code) || code := this.Base64Put((A_PtrSize == 4)
            ? "VYnli0UIi1UQi00UO0UMcws5EHUCiQiDwATr8F3D"
            : "SDnRcw5EOQF1A0SJCUiDwQTr7cM=")

         ; Select top-left pixel as default.
         (key == "sentinel") && key := NumGet(this.ptr, "uint")

         ; Replaces one ARGB color with another.
         DllCall(code, "ptr", this.ptr, "uint", this.ptr + this.size, "uint", key, "uint", value, "cdecl")
      }

      SetAlpha(alpha := 0xFF) {
         ; C source code - https://godbolt.org/z/aWf73jTqc
         static code := 0
         (code) || code := this.Base64Put((A_PtrSize == 4)
            ? "VYnli0UIilUQO0UMcwiIUAODwATr813D"
            : "SDnRcwpEiEEDSIPBBOvxww==")

         ; Sets the transparency of the entire bitmap.
         DllCall(code, "ptr", this.ptr, "ptr", this.ptr + this.size, "uchar", alpha, "cdecl")
      }

      TransColor(color := "sentinel", alpha := 0x00) {
         ; C source code - https://godbolt.org/z/z3a8WcM5M
         static code := 0
         (code) || code := this.Base64Put((A_PtrSize == 4)
            ? "VYnli0UIilUUO0UMcxWLTRAzCIHh////AHUDiFADg8AE6+Zdww=="
            : "SDnRcxaLAUQxwKn///8AdQREiEkDSIPBBOvlww==")

         ; Select top-left pixel as default.
         (color == "sentinel") && color := NumGet(this.ptr, "uint")

         ; Sets the alpha value of a specified RGB color.
         DllCall(code, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "uchar", alpha, "cdecl")
      }

      PixelSearch(color, variation := 0) {
         ; C source code - https://godbolt.org/z/o7EPo8xPr
         static PixelSearch := 0
         (PixelSearch) || PixelSearch := this.Base64Put((A_PtrSize == 4)
            ? "VYnli1UMi00Qi0UIOdBzCTkIdAeDwATr84nQXcM="
            : "SInISDnQcwtEOQB0CUiDwATr8EiJ0MM=")

         ; C source code - https://godbolt.org/z/4K38sq8hY
         static PixelSearch2 := 0
         (PixelSearch2) || PixelSearch2 := this.Base64Put((A_PtrSize == 4)
            ? "VYnlVlNRikUQilUcik0gil0ki3UIiEX3ikUUiEX2ikUYiEX1O3UMcyiKRgI4RfdyGzpF9nIWikYBOEX1cg440HIKigY4wXIEONhzBYPGBOvTWonwW15dww=="
            : "VlNEilQkOESKXCRAilwkSECKdCRQSInISDnQcyuKSAJBOMhyHUQ4yXIYikgBQTjKchBEONlyC4oIOMtyBUA48XMGSIPABOvQW17D")

         ; Lift color to 32-bits if first 8 bits are zero.
         (color >> 24) || color |= 0xFF000000

         ; PixelSearch, single color, no variation
         if !IsObject(variation) && (variation == 0)
            byte := DllCall(PixelSearch, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl ptr")

         ; PixelSearch, single color, and variation
         else if !IsObject(variation) && (variation != 0) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            v := abs(variation)

            ; When doing pointer arithmetic, *Scan0 + 1 is actually adding 4 bytes.
            byte := DllCall(PixelSearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r+v, 255)
                     , "uchar", max(r-v, 0)
                     , "uchar", min(g+v, 255)
                     , "uchar", max(g-v, 0)
                     , "uchar", min(b+v, 255)
                     , "uchar", max(b-v, 0)
                     , "cdecl ptr")
         }

         ; PixelSearch, range of colors, and variation.
         else if IsObject(variation) && (variation.length() == 3) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))

            byte := DllCall(PixelSearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r + variation[1], 255)
                     , "uchar", max(r - variation[1], 0)
                     , "uchar", min(g + variation[2], 255)
                     , "uchar", max(g - variation[2], 0)
                     , "uchar", min(b + variation[3], 255)
                     , "uchar", max(b - variation[3], 0)
                     , "cdecl ptr")
         }

         ; PixelSearch, range of colors, and variation.
         else if IsObject(variation) && (variation.length() == 6) {
            byte := DllCall(PixelSearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(max(variation[1], variation[2]), 255)
                     , "uchar", max(min(variation[1], variation[2]), 0)
                     , "uchar", min(max(variation[3], variation[4]), 255)
                     , "uchar", max(min(variation[3], variation[4]), 0)
                     , "uchar", min(max(variation[5], variation[6]), 255)
                     , "uchar", max(min(variation[5], variation[6]), 0)
                     , "cdecl ptr")
         }

         else throw Exception("Invalid variation parameter.")

         ; Compare the address to the out-of-bounds limit.
         if (byte == this.ptr + this.size)
            return False

         ; Return an [x, y] array.
         offset := (byte - this.ptr) // 4
         return [mod(offset, this.width), offset // this.width]
      }

      PixelSearchAll(color) {
         ; C source code - https://godbolt.org/z/zPY1qMvYe
         static PixelSearch3 := 0
         (PixelSearch3) || PixelSearch3 := this.Base64Put((A_PtrSize == 4)
            ? "VTHAieVTi1UQi00UOcpzGItdGDkadQw7RQxzBotdCIkUg0CDwgTr5Ftdww=="
            : "McBEi1QkKE05yHMYRTkQdQ050HMHQYnDTokE2f/ASYPABOvjww==")

         ; Lift color to 32-bits if first 8 bits are zero.
         (color >> 24) || color |= 0xFF000000

         ; PixelSearchAll, single color, no variation
         capacity := 256
         VarSetCapacity(result, A_PtrSize * capacity)
         count := DllCall(PixelSearch3, "ptr", &result, "uint", capacity, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl uint")

         ; If the default 256 results is exceeded, run the function again.
         if (count > capacity) {
            VarSetCapacity(result, A_PtrSize * count)
            count := DllCall(PixelSearch3, "ptr", &result, "uint", count, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl uint")
         }

         ; Check if any matches are found.
         if (count = 0)
            return False

         ; Create an array of [x, y] coordinates.
         xys := []
         loop % count {
            byte := NumGet(result, A_PtrSize*(A_Index-1), "ptr")
            offset := (byte - this.ptr) // 4
            xy := [mod(offset, this.width), offset // this.width]
            xys.push(xy)
         }
         return xys
      }

      ImageSearch(image) {
         ; C source code - https://godbolt.org/z/qPodGdP1d
         static code := 0
         (code) || code := this.Base64Put((A_PtrSize == 4)
            ? "VYnlV1ZTg+wUi0UMi1UYi00IjTyFAAAAAItFECtFHA+vxwNFCIlF6ItFDCnQiUXkjQSVAAAAAIlF7ItF6DnBc2eLRRSLADkBdAmL"
            . "RRSAeAMAdVCJyCtFCDHSwfgC93UMOVXkfD4x0otFFInLiVXwi3XwO3UcdDyLVeyJ3gHCiVXgi1XgOdBzFIB4AwB0BosWORB1D4PA"
            . "BIPGBOvl/0XwAfvrzIPBBOuSi0UQD6/HA0UIicGDxBSJyFteX13D"
            : "QVdBVkFVQVRVV1ZTi1wkcItEJGhIjSyFAAAAAEGJ0kSJwkmJyynaRInXQQ+v0inHSI00kUg58XNjQYsBOQF0B0GAeQMAdU9Iicgx"
            . "0kwp2EjB+AJB9/I513w8TInIRTHkMdI52nQ+RYnlTI00KE6NLKlMOfBzGYB4AwB0CUWLfQBEOTh1EUiDwARJg8UE6+L/wkUB1OvM"
            . "SIPBBOuYRQ+vwkuNDINIichbXl9dQVxBXUFeQV/D")

         ; Convert image to a buffer object.
         if !(IsObject(image) && ObjHasKey(image, "ptr") && ObjHasKey(image, "size"))
            image := ImagePutBuffer(image)

         ; Search for the address of the first matching image.
         byte := DllCall(code, "ptr", this.ptr, "uint", this.width, "uint", this.height
                           , "ptr", image.ptr, "uint", image.width, "uint", image.height, "cdecl ptr")

         ; Compare the address to the out-of-bounds limit.
         if (byte == this.ptr + this.size)
            return False

         ; Return an [x, y] array.
         offset := (byte - this.ptr) // 4
         return [mod(offset, this.width), offset // this.width]
      }

      ImageSearchAll(image) {
         ; C source code - https://godbolt.org/z/qPodGdP1d
         static code := 0
         (code) || code := this.Base64Put((A_PtrSize == 4)
            ? "VYnlV1ZTg+wUi0UMi1UYi00IjTyFAAAAAItFECtFHA+vxwNFCIlF6ItFDCnQiUXkjQSVAAAAAIlF7ItF6DnBc2eLRRSLADkBdAmL"
            . "RRSAeAMAdVCJyCtFCDHSwfgC93UMOVXkfD4x0otFFInLiVXwi3XwO3UcdDyLVeyJ3gHCiVXgi1XgOdBzFIB4AwB0BosWORB1D4PA"
            . "BIPGBOvl/0XwAfvrzIPBBOuSi0UQD6/HA0UIicGDxBSJyFteX13D"
            : "QVdBVkFVQVRVV1ZTSIPsGEUx20SLpCSYAAAAi4QkgAAAAESLlCSQAAAASIu8JIgAAABEKeBBD6/BSInLidZMicFNjSyARInIRCnQ"
            . "iUQkDEqNBJUAAAAASIkEJEw56XN0iwc5AXQGgH8DAHViSInIMdJMKcBIwfgCQffxOVQkDHxNSIn4Me0x0kQ54nQyTIs8JEGJ7k6N"
            . "NLFJAcdMOfhzGIB4AwB0CEWLFkQ5EHUgSIPABEmDxgTr4//CRAHN68lBOfNzB0SJ2EiJDMNB/8NIg8EE64dEidhIg8QYW15fXUFc"
            . "QV1BXkFfww==")

         ; Convert image to a buffer object.
         if !(IsObject(image) && ObjHasKey(image, "ptr") && ObjHasKey(image, "size"))
            image := ImagePutBuffer(image)

         ; Search for the address of the first matching image.
         capacity := 256
         VarSetCapacity(result, A_PtrSize * capacity)
         count := DllCall(code, "ptr", &result, "uint", capacity
                           , "ptr", this.ptr, "uint", this.width, "uint", this.height
                           , "ptr", image.ptr, "uint", image.width, "uint", image.height, "cdecl uint")

         ; If more than 256 results, run the function with the true capacity.
         if (count > capacity) {
            VarSetCapacity(result, A_PtrSize * count)
            count := DllCall(code, "ptr", &result, "uint", capacity
                           , "ptr", this.ptr, "uint", this.width, "uint", this.height
                           , "ptr", image.ptr, "uint", image.width, "uint", image.height, "cdecl uint")
         }

         ; Check if any matches are found.
         if (count = 0)
            return False

         ; Create an array of [x, y] coordinates.
         xys := []
         loop % count {
            byte := NumGet(result, A_PtrSize*(A_Index-1), "ptr")
            offset := (byte - this.ptr) // 4
            xy := [mod(offset, this.width), offset // this.width]
            xys.push(xy)
         }
         return xys
      }
   }

   to_screenshot(pBitmap, screenshot := "", alpha := "") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      x := IsObject(screenshot) && screenshot.HasKey(1) ? screenshot[1] : 0
      y := IsObject(screenshot) && screenshot.HasKey(2) ? screenshot[2] : 0
      w := IsObject(screenshot) && screenshot.HasKey(3) ? screenshot[3] : width
      h := IsObject(screenshot) && screenshot.HasKey(4) ? screenshot[4] : height

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.to_hBitmap(pBitmap, alpha)
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

   to_window(pBitmap, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "") {
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

      ; Default styles can be overwritten by previous functions.
      (style == "") && style := WS_POPUP | WS_CLIPCHILDREN | WS_CAPTION | WS_SYSMENU
      (styleEx == "") && styleEx := WS_EX_TOPMOST | WS_EX_DLGMODALFRAME

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

      ; Set itself as the *internal* top level window.
      __32 := A_PtrSize = 8 ? "Ptr" : "" ; Fixes 32-bit windows
      DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 0, "ptr", hwnd)

      ; A layered child window is only available on Windows 8+.
      hwnd_child := this.show(pBitmap, title, [0, 0, w, h], WS_CHILD | WS_VISIBLE, WS_EX_LAYERED, hwnd)

      ; Override the child's internal hwnd with the parent's hwnd.
      DllCall("SetWindowLong" __32, "ptr", hwnd_child, "int", 0, "ptr", hwnd)

      ; Prevent empty windows from showing.
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

      ; Default styles can be overwritten by previous functions.
      (style == "") && style := WS_POPUP | WS_VISIBLE
      (styleEx == "") && styleEx := WS_EX_TOPMOST | WS_EX_TOOLWINDOW | WS_EX_LAYERED

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

      ; Set itself as the *internal* top level window.
      __32 := A_PtrSize = 8 ? "Ptr" : "" ; Fixes 32-bit windows
      DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 0, "ptr", hwnd)

      ; Check for multiple frames.
      DllCall("gdiplus\GdipImageGetFrameDimensionsCount", "ptr", pBitmap, "uint*", dims:=0)
      DllCall("gdiplus\GdipImageGetFrameDimensionsList", "ptr", pBitmap, "ptr", &dimIDs := VarSetCapacity(dimIDs, 16*dims), "uint", dims)
      DllCall("gdiplus\GdipImageGetFrameCount", "ptr", pBitmap, "ptr", &dimIDs, "uint*", frames:=0)

      ; For multiple frames, send WM_APP to WindowProc to render GIFs.
      if (frames > 1) {
         ; Save frame delays because they are slow enough to impact timing.
         DllCall("gdiplus\GdipGetPropertyItemSize", "ptr", pBitmap, "uint", 0x5100, "uint*", ItemSize:=0) ; PropertyTagFrameDelay
         Item := DllCall("GlobalAlloc", "uint", 0, "uptr", ItemSize, "ptr")
         DllCall("gdiplus\GdipGetPropertyItem", "ptr", pBitmap, "uint", 0x5100, "uint", ItemSize, "ptr", Item)

         ; Clone bitmap to avoid disposal.
         DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap, "ptr*", pBitmapClone:=0)
         DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmapClone)

         ; Store data inside window class extra bits (cbWndExtra).
         DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 1*A_PtrSize, "ptr", pBitmapClone)
         DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 2*A_PtrSize, "ptr", hdc)
         DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 3*A_PtrSize, "ptr", Item)
         DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 4*A_PtrSize, "ptr", pBits)

         ; Preserve GDI+ scope.
         ImagePut.gdiplusStartup()

         ; Goto WindowProc() and initiate animation via PostMessage.
         DllCall("PostMessage", "ptr", hwnd, "uint", 0x8000, "uptr", -1, "ptr", 0)

         ; Avoid disposing the device context.
         return hwnd
      }

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return hwnd
   }

   WindowClass(style := 0) {
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
         NumPut(      style, wc,         4,   "uint") ; style
         NumPut(   pWndProc, wc,         8,    "ptr") ; lpfnWndProc
         NumPut(          0, wc, _ ? 12:16,    "int") ; cbClsExtra
         NumPut(         40, wc, _ ? 16:20,    "int") ; cbWndExtra
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
         __32 := A_PtrSize = 8 ? "Ptr" : "" ; Fixes 32-bit windows
         hwnd := this
         ; Prevent the script from exiting early.
         static void := ObjBindMethod({}, {})

         ; WM_CREATE
         if (uMsg = 0x1)
            Hotkey % "^+F12", % void, On

         ; WM_DESTROY
         if (uMsg = 0x2) {
            if pBitmap := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 1*A_PtrSize, "ptr") {
               hdc := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 2*A_PtrSize, "ptr")
               Item := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 3*A_PtrSize, "ptr")

               ; Exit loop.
               DllCall("SetWindowLong" __32, "ptr", hwnd, "int", 1*A_PtrSize, "ptr", 0)

               ; Dispose of all data stored in the window class.
               DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
               obm := DllCall("CreateBitmap", "int", 0, "int", 0, "uint", 1, "uint", 1, "ptr", 0, "ptr")
               hbm := DllCall("SelectObject", "ptr", hdc, "ptr", obm, "ptr")
               DllCall("DeleteObject", "ptr", hbm)
               DllCall("DeleteDC", "ptr", hdc)
               DllCall("GlobalFree", "ptr", Item)

               ; Exit GDI+ conditionally due to the ImagePut class being destroyed first.
               ImagePut.gdiplusShutdown()
            }
            Hotkey % "^+F12", % void, Off ; Cannot disable, does nothing
         }

         ; WM_LBUTTONDOWN
         if (uMsg = 0x201) {
            hwnd := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 0, "ptr") ; internal parent hwnd
            return DllCall("DefWindowProc", "ptr", hwnd, "uint", 0xA1, "uptr", 2, "ptr", 0, "ptr")
         }

         ; WM_RBUTTONUP
         if (uMsg = 0x205) {
            hwnd := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 0, "ptr") ; internal parent hwnd
            DllCall("DestroyWindow", "ptr", hwnd)
            return 0
         }

         ; WM_APP - Animate GIFs
         if (uMsg = 0x8000) {
            ; Thanks tmplinshi, Teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=76&t=83358
            Critical

            ; Get variables.
            pBitmap := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 1*A_PtrSize, "ptr")
            hdc := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 2*A_PtrSize, "ptr")
            Item := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 3*A_PtrSize, "ptr")
            pBits := DllCall("GetWindowLong" __32, "ptr", hwnd, "int", 4*A_PtrSize, "ptr")

            ; Exit loop.
            if !pBitmap
               return
            
            ; Get next frame.
            frames := NumGet(Item + 4, "uint") // 4                 ; Max frames
            frame := wParam + 1                                     ; Next frame
            frame := mod(frame, frames)                             ; Loop back to first frame

            ; Get delay.
            delays := NumGet(Item + 8 + A_PtrSize, "ptr")           ; Array of delays
            delay := 10 * NumGet(delays + 4*frame, "uint")          ; Delay of next frame
            delay := max(delay, 10)                                 ; Minimum delay is 10ms
            (delay == 10) && delay := 100                           ; 10 ms is actually 100 ms
            ; See: https://www.biphelps.com/blog/The-Fastest-GIF-Does-Not-Exist

            ; Randomize the delay in intervals of 15.6
            resolution := 15.6
            Random rand, 1, 100000
            percentage := mod(delay, resolution) / resolution
            percentage *= 0.957 ; Higher is faster, lower is slower

            ; Randomized multiples of resolution
            if ((rand := rand / 100000) > percentage)
               res := Floor(delay / resolution) * resolution
            else
               res := Ceil(delay / resolution) * resolution

            ; Async the next frame as soon as possible to prevent rendering lag.
            static pWndProc := RegisterCallback(ImagePut.WindowProc,,, &ImagePut)
            next_frame := Func("DllCall").bind(pWndProc, "ptr", hwnd, "uint", uMsg, "uptr", frame, "ptr", 0)
            SetTimer % next_frame, % -1 * res
            /*
            ; Debug code
            static start := 0, sum := 0, count := 0, sum2 := 0, count2 := 0
            DllCall("QueryPerformanceFrequency", "int64*", frequency:=0)
            DllCall("QueryPerformanceCounter", "int64*", now:=0)
            time := (now - start) / frequency * 1000
            if (time < 10000) {
               sum += time
               count++
               average := sum / count
               sum2 += res
               count2++
               Tooltip % "Current Tick:`t" Round(time, 4)
                     . "`nAverage FPS:`t" Round(average, 4)
                     . "`nQueued FPS:`t" Round(sum2 / count2, 4)
                     . "`nTarget FPS:`t" delay
                     . "`nPercentage:`t" percentage ", " rand
                     . "`nFloor and Ceiling:`t" Floor(delay / resolution) * resolution ", " Ceil(delay / resolution) * resolution
            }
            start := now
            */
            ; Select frame to show.
            DllCall("gdiplus\GdipImageGetFrameDimensionsCount", "ptr", pBitmap, "uint*", dims:=0)
            DllCall("gdiplus\GdipImageGetFrameDimensionsList", "ptr", pBitmap, "ptr", &dimIDs := VarSetCapacity(dimIDs, 16*dims), "uint", dims)
            DllCall("gdiplus\GdipImageSelectActiveFrame", "ptr", pBitmap, "ptr", &dimIDs, "uint", frame)

            ; Get Bitmap width and height.
            DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
            DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

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

            ; Render to window.
            DllCall("UpdateLayeredWindow"
                     ,    "ptr", hwnd                     ; hWnd
                     ,    "ptr", 0                        ; hdcDst
                     ,    "ptr", 0                        ; *pptDst
                     ,"uint64*", width | height << 32     ; *psize
                     ,    "ptr", hdc                      ; hdcSrc
                     , "int64*", 0                        ; *pptSrc
                     ,   "uint", 0                        ; crKey
                     ,  "uint*", 0xFF << 16 | 0x01 << 24  ; *pblend
                     ,   "uint", 2)                       ; dwFlags
            return
         }

         ; Must return
         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }


   to_desktop(pBitmap) {
      ; Thanks Gerald Degeneve - https://www.codeproject.com/Articles/856020/Draw-Behind-Desktop-Icons-in-Windows-plus

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.to_hBitmap(pBitmap)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Post-Creator's Update Windows 10. WM_SPAWN_WORKER = 0x052C
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 0)
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 1)

      ; Find the child window.
      WinGet windows, List, ahk_class WorkerW
      loop % windows
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

   to_wallpaper(pBitmap) {
      ; Create a temporary image file.
      filepath := this.to_file(pBitmap)

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

   to_cursor(pBitmap, xHotspot := "", yHotspot := "") {
      ; Thanks Nick - https://stackoverflow.com/a/550965

      ; Creates an icon that can be used as a cursor.
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", hIcon:=0)

      ; Sets the hotspot of the cursor by changing the icon into a cursor.
      if (xHotspot ~= "^\d+$" || yHotspot ~= "^\d+$") {
         ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
         VarSetCapacity(ii, 8+3*A_PtrSize)                           ; sizeof(ICONINFO) = 20, 32
         DllCall("GetIconInfo", "ptr", hIcon, "ptr", &ii)            ; Fill the ICONINFO structure.
            NumPut(False, ii, 0, "uint")                             ; True/False are icon/cursor respectively.
            (xHotspot ~= "^\d+$") && NumPut(xHotspot, ii, 4, "uint") ; Set the xHotspot value. Default: center point
            (yHotspot ~= "^\d+$") && NumPut(yHotspot, ii, 8, "uint") ; Set the yHotspot value. Default: center point
         DllCall("DestroyIcon", "ptr", hIcon)                        ; Destroy the icon after getting the ICONINFO structure.
         hIcon := DllCall("CreateIconIndirect", "ptr", &ii, "ptr")   ; Create a new cursor using ICONINFO.

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

   to_explorer(pBitmap, default := "") {

      ; Default directory to desktop.
      (default == "") && default := A_Desktop

      ; Check if the mouse is pointing to the desktop.
      MouseGetPos,,, hwnd
      WinGetClass class, ahk_id %hwnd%
      if (class ~= "(?i)Progman|WorkerW")
         directory := A_Desktop

      ; Get path of active window.
      else if (hwnd := WinExist("ahk_class ExploreWClass")) || (hwnd := WinExist("ahk_class CabinetWClass")) {
         for window in ComObjCreate("Shell.Application").Windows {
            if (window.hwnd == hwnd) {
               try directory := window.Document.Folder.Self.Path
            }
         }
      }
      else
         directory := default

      return this.to_file(pBitmap, directory)
   }

   set_explorer(pStream, default := "") {

      ; Default directory to desktop.
      (default == "") && default := A_Desktop

      ; Check if the mouse is pointing to the desktop.
      MouseGetPos,,, hwnd
      WinGetClass class, ahk_id %hwnd%
      if (class ~= "(?i)Progman|WorkerW")
         directory := A_Desktop

      ; Get path of active window.
      else if (hwnd := WinExist("ahk_class ExploreWClass")) || (hwnd := WinExist("ahk_class CabinetWClass")) {
         for window in ComObjCreate("Shell.Application").Windows {
            if (window.hwnd == hwnd) {
               try directory := window.Document.Folder.Self.Path
            }
         }
      }
      else
         directory := default

      return this.to_file(pStream, directory)
   }

   to_file(pBitmap, filepath := "", quality := "") {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      extension := "png"
      this.select_filepath(filepath, extension)
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
      this.select_extension(pStream, extension)
      this.select_filepath(filepath, extension)

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\SHCreateStreamOnFileEx"
               ,   "wstr", filepath
               ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
               ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
               ,    "int", True            ; fCreate is ignored when STGM_CREATE is set.
               ,    "ptr", 0               ; pstmTemplate (reserved)
               ,   "ptr*", pFileStream:=0
               ,   "uint")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pFileStream, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      ObjRelease(pFileStream)

      return filepath
   }

   to_hex(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.to_stream(pBitmap, extension, quality)

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "ptr*", hbin:=0, "uint")
      bin := DllCall("GlobalLock", "ptr", hbin, "ptr")
      size := DllCall("GlobalSize", "ptr", bin, "uptr")

      ; Calculate the length of the hexadecimal string.
      length := 2 * size ; No zero terminator needed.
      VarSetCapacity(str, length)

      ; C source code - https://godbolt.org/z/EqfK7fvr5
      static code := 0
      if !code {
         b64 := (A_PtrSize == 4)
            ? "VYnlVotFDIt1EFOLTRSLXQgBxjnwcyCKEIPBAkDA6gQPttKKFBOIUf6KUP+D4g+KFBOIUf/r3FteXcM="
            : "SQHQTDnCcyWKAkmDwQJI/8LA6AQPtsCKBAFBiEH+ikL/g+APigQBQYhB/+vWww=="
         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", op:=0)
      }

      ; Default to lowercase hex values. Or capitalize the string below.
      VarSetCapacity(hex, 16)
      StrPut("0123456789abcdef", &hex, "CP0")
      DllCall(code, "ptr", &hex, "ptr", bin, "uptr", size, "ptr", &str, "uptr", length, "cdecl")

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", hbin)
      ObjRelease(pStream)

      ; Return encoded string from ANSI.
      return StrGet(&str, length, "CP0")
   }

   set_hex(pStream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", &bin := VarSetCapacity(bin, size), "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      ; Calculate the length of the hexadecimal string.
      length := 2 * size ; No zero terminator needed.
      VarSetCapacity(str, length)

      ; C source code - https://godbolt.org/z/EqfK7fvr5
      static code := 0
      if !code {
         b64 := (A_PtrSize == 4)
            ? "VYnlVotFDIt1EFOLTRSLXQgBxjnwcyCKEIPBAkDA6gQPttKKFBOIUf6KUP+D4g+KFBOIUf/r3FteXcM="
            : "SQHQTDnCcyWKAkmDwQJI/8LA6AQPtsCKBAFBiEH+ikL/g+APigQBQYhB/+vWww=="
         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", op:=0)
      }

      ; Default to lowercase hex values. Or capitalize the string below.
      VarSetCapacity(hex, 16)
      StrPut("0123456789abcdef", &hex, "CP0")
      DllCall(code, "ptr", &hex, "ptr", &bin, "uptr", size, "ptr", &str, "uptr", length, "cdecl")

      ; Return encoded string from ANSI.
      return StrGet(&str, length, "CP0")
   }

   to_base64(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.to_stream(pBitmap, extension, quality)

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "ptr*", hbin:=0, "uint")
      bin := DllCall("GlobalLock", "ptr", hbin, "ptr")
      size := DllCall("GlobalSize", "ptr", bin, "uptr")

      ; Calculate the length of the base64 string.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      length := 4 * Ceil(size/3) + 1 ; An extra byte of padding is required.
      VarSetCapacity(str, length)

      ; Using CryptBinaryToStringA is faster and saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", bin, "uint", size, "uint", flags, "ptr", &str, "uint*", length)

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", hbin)
      ObjRelease(pStream)

      ; Return encoded string length minus 1.
      return StrGet(&str, length, "CP0")
   }

   set_base64(pStream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", &bin := VarSetCapacity(bin, size), "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      ; Calculate the length of the base64 string.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      length := 4 * Ceil(size/3) + 1 ; An extra byte of padding is required.
      VarSetCapacity(str, length)

      ; Using CryptBinaryToStringA is faster and saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", &bin, "uint", size, "uint", flags, "ptr", &str, "uint*", length)

      ; Return encoded string length minus 1.
      return StrGet(&str, length, "CP0")
   }

   to_uri(pBitmap, extension := "", quality := "") {
      static dict := { bmp: "bmp", dib: "bmp", rle: "bmp", jpg: "jpeg", jpeg: "jpeg", jpe: "jpeg"
                     , jfif: "jpeg", gif: "gif", tif: "tiff", tiff: "tiff", png: "png" }

      extension := RegExReplace(extension, "^\*?\.?")
      return "data:image/" dict[extension] ";base64," this.to_base64(pBitmap, extension, quality)
   }

   set_uri(pStream) {
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
               ,   "ptr*", MimeOut:=0    ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,   "uint")
      MimeType := StrGet(MimeOut, "UTF-16")
      DllCall("ole32\CoTaskMemFree", "ptr", MimeOut)

      return "data:" MimeType ";base64," this.set_base64(pStream)
   }

   to_dc(pBitmap, alpha := "") {
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

      ; This may seem strange, but the hBitmap is selected onto the device context,
      ; and therefore cannot be deleted. In addition, the stock bitmap can never be leaked.
      return hdc
   }

   to_hBitmap(pBitmap, alpha := "") {
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

   to_hIcon(pBitmap) {
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", hIcon:=0)
      return hIcon
   }

   to_stream(pBitmap, extension := "", quality := "") {
      ; Default extension is TIF for fast speeds!
      if (extension == "")
         extension := "tif"

      this.select_codec(pBitmap, extension, quality, pCodec, ep, ci, v)

      ; Create a Stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", True, "ptr*", pStream:=0, "uint")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", (ep) ? &ep : 0)

      return pStream
   }

   to_RandomAccessStream(pBitmap, extension := "", quality := "") {
      pStream := this.to_stream(pBitmap, extension, quality)
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

   to_wicBitmap(pBitmap) {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Initialize Windows Imaging Component.
      IWICImagingFactory := ComObjCreate(CLSID_WICImagingFactory := "{CACAF262-9370-4615-A13B-9F5539DA4C0A}", IID_IWICImagingFactory := "{EC5EC8A9-C395-4314-9C77-54D7A935FF70}")

      ; WICBitmapNoCache  must be 1!
      ; IWICImagingFactory::CreateBitmap - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L6447
      DllCall("ole32\CLSIDFromString", "wstr", GUID_WICPixelFormat32bppBGRA := "{6fddc324-4e03-4bfe-b185-3d77768dc90f}", "ptr", &CLSID := VarSetCapacity(CLSID, 16), "uint")
      DllCall(NumGet(NumGet(IWICImagingFactory + 0) + A_PtrSize*17), "ptr", IWICImagingFactory, "uint", width, "uint", height, "ptr", &CLSID, "int", 1, "ptr*", wicBitmap:=0)

      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height

      ; IWICBitmap::Lock - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L2232
      DllCall(NumGet(NumGet(wicBitmap + 0) + A_PtrSize*8), "ptr", wicBitmap, "ptr", &Rect, "uint", 0x1, "ptr*", Lock:=0)

      ; IWICBitmapLock::GetDataPointer - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L2104
      DllCall(NumGet(NumGet(Lock + 0) + A_PtrSize*5), "ptr", Lock, "uint*", size:=0, "ptr*", Scan0:=0)

      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     Scan0, BitmapData, 16,    "ptr") ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (Scan0) to the WICBitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ObjRelease(Lock)
      ObjRelease(IWICImagingFactory)

      return wicBitmap
   }

   set_safeArray(pStream) {
      ; Allocate a one-dimensional SAFEARRAY based on the size of the stream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", size:=0, "uint")
      safeArray := ComObjArray(0x11, size) ; VT_ARRAY | VT_UI1
      pvData := NumGet(ComObjValue(safeArray), 8 + A_PtrSize, "ptr")

      ; Copy the stream to the SAFEARRAY.
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", pvData, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "uint")

      return safeArray
   }

   to_safeArray(pBitmap, extension := "", quality := "") {
      ; Thanks tmplinshi - https://www.autohotkey.com/boards/viewtopic.php?p=354007#p354007

      ; Create an IStream backed with movable memory.
      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", 0, "ptr")
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", pStream:=0, "uint")

      ; Default extension is PNG for small sizes!
      (extension == "") && extension := "png"

      ; Save pBitmap to the IStream.
      this.select_codec(pBitmap, extension, quality, pCodec, ep, ci, v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", (ep) ? &ep : 0)

      ; Get the pointer and size of the IStream's movable memory.
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      size := DllCall("GlobalSize", "ptr", pData, "uptr")

      ; Copy the encoded image to a SAFEARRAY.
      safeArray := ComObjArray(0x11, size) ; VT_ARRAY | VT_UI1
      pvData := NumGet(ComObjValue(safeArray), 8 + A_PtrSize, "ptr")
      DllCall("RtlMoveMemory", "ptr", pvData, "ptr", pData, "uptr", size)

      ; Release the IStream and call GlobalFree.
      DllCall("GlobalUnlock", "ptr", hData)
      ObjRelease(pStream)

      return safeArray
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
               ,   "ptr*", MimeOut:=0    ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,   "uint")
      MimeType := StrGet(MimeOut, "UTF-16")
      DllCall("ole32\CoTaskMemFree", "ptr", MimeOut)

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

   select_filepath(ByRef filepath, ByRef extension) {
      ; Save default extension.
      default := extension

      ; Split the filepath, convert forward slashes, strip invalid chars.
      filepath := RegExReplace(filepath, "/", "\")
      filepath := RegExReplace(filepath, "[*?\x22<>|\x00-\x1F]")
      SplitPath % filepath,, directory, extension, filename

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
      (directory == "") && directory := "."

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
      }

      ; Create a filepath based on the timestamp.
      if (filename == "") {
         FormatTime, filename,, % "yyyy-MM-dd HH꞉mm꞉ss"
         filepath := directory "\" filename "." extension
         while FileExist(filepath)
            filepath := directory "\" filename " (" A_Index ")." extension
      }

      ; Create a numeric sequence of files...
      else if (filename == "0" or filename == "1") {
         filepath := directory "\" filename "." extension
         while FileExist(filepath)
            filepath := directory "\" A_Index "." extension
      }

      ; Always overwrite specific filenames.
      else filepath := directory "\" filename "." extension
   }

   gdiplusStartup() {
      return this.gdiplus(1)
   }

   gdiplusShutdown(cotype := "") {
      return this.gdiplus(-1, cotype)
   }

   gdiplus(vary := 0, cotype := "") {
      static pToken := 0 ; Takes advantage of the fact that objects contain identical methods.
      static instances := 0 ; And therefore static variables can share data across instances.



      

      ; Startup gdiplus when counter rises from 0 -> 1.
      if (instances = 0 && vary = 1) {

         DllCall("LoadLibrary", "str", "gdiplus")
         VarSetCapacity(si, A_PtrSize = 4 ? 16:24, 0) ; sizeof(GdiplusStartupInput) = 16, 24
            NumPut(0x1, si, "uint")
         DllCall("gdiplus\GdiplusStartup", "ptr*", pToken:=0, "ptr", &si, "ptr", 0)

      }

      ; Shutdown gdiplus when counter falls from 1 -> 0.
      if (instances = 1 && vary = -1) {

         DllCall("gdiplus\GdiplusShutdown", "ptr", pToken)
         DllCall("FreeLibrary", "ptr", DllCall("GetModuleHandle", "str", "gdiplus", "ptr"))

         ; Otherwise GDI+ has been truly unloaded from the script and objects are out of scope.
         if (cotype = "bitmap") {

            ; Check if GDI+ is still loaded. GdiplusNotInitialized = 18
            assert := (18 != DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", ImageAttr:=0))
               DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)

            if not assert
               throw Exception("Bitmap is out of scope. `n`nIf you wish to handle raw pointers to GDI+ bitmaps, add the line"
                  . "`n`n`t`t" this.__class ".gdiplusStartup()"
                  . "`n`nto the top of your script. If using Gdip_All.ahk use pToken := Gdip_Startup()."
                  . "`nAlternatively, use pic := ImagePutBuffer() and pic.pBitmap instead."
                  . "`nYou can copy this message by pressing Ctrl + C.", -5)
         }
      }

      ; Increment or decrement the number of available instances.
      instances += vary

      ; Check for unpaired calls of gdiplusShutdown.
      if (instances < 0)
         throw Exception("Missing gdiplusStartup().")

      ; When vary is 0, just return the number of active instances!
      return instances
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
         switch type {
         case "clipboard":
            if !DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
               throw Exception("Clipboard could not be opened.")
            DllCall("EmptyClipboard")
            DllCall("CloseClipboard")

         case "screenshot":
            DllCall("InvalidateRect", "ptr", 0, "ptr", 0, "int", 0)

         case "window":
            DllCall("DestroyWindow", "ptr", image)

         case "wallpaper":
            DllCall("SystemParametersInfo", "uint", SPI_SETDESKWALLPAPER := 0x14, "uint", 0, "ptr", 0, "uint", 2)

         case "cursor":
            DllCall("SystemParametersInfo", "uint", SPI_SETCURSORS := 0x57, "uint", 0, "ptr", 0, "uint", 0)

         case "file":
            FileDelete % image

         case "dc":
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

         case "hBitmap":
            DllCall("DeleteObject", "ptr", image)

         case "hIcon":
            DllCall("DestroyIcon", "ptr", image)

         case "bitmap":
            DllCall("gdiplus\GdipDisposeImage", "ptr", image)

         case "RandomAccessStream", "stream", "wicBitmap":
            ObjRelease(image)
         }
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
         goto ImagePut_Good_Ending
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
               goto ImagePut_Bad_Ending ; Exit the loop if the comparison failed.

            ; Cleanup the bitmap.
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
         }
      }

      ImagePut_Good_Ending: ; After getting isekai'ed you somehow build a prosperous kingdom and rule the land.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      this.gdiplusShutdown()
      return True

      ImagePut_Bad_Ending: ; Things didn't turn out the way you expected yet everyone seems to be fine despite that.
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
      loop 2
         if DllCall("gdiplus\GdipCloneBitmapAreaI"
                     ,    "int", 0
                     ,    "int", 0
                     ,    "int", width%A_Index%
                     ,    "int", height%A_Index%
                     ,    "int", format%A_Index%
                     ,    "ptr", SourceBitmap%A_Index%
                     ,   "ptr*", pBitmap%A_Index%)
            throw Exception("Cloning Bitmap" A_Index " failed.")

      ; struct RECT - https://referencesource.microsoft.com/#System.Drawing/commonui/System/Drawing/Rectangle.cs,32
      VarSetCapacity(Rect, 16, 0)                 ; sizeof(Rect) = 16
         NumPut(  width1, Rect,  8,   "uint")     ; Width
         NumPut( height1, Rect, 12,   "uint")     ; Height

      ; Create a BitmapData structure.
      VarSetCapacity(BitmapData1, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32
      VarSetCapacity(BitmapData2, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32

      ; Transfer the pixels to a read-only buffer. The user can declare a PixelFormat.
      loop 2
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


ImagePut_dropfiles() {
   filepath := ""
   for each, arg in A_Args {
      filepath .= arg . A_Space
      if FileExist(Trim(filepath)) {
         SplitPath % filepath, filename
         ImageShow({file: filepath}, filename)
         filepath := ""
      }
   }


}

; Drag and drop files directly onto this script file.
if (A_Args.length() > 0 and A_LineFile == A_ScriptFullPath)
   ImagePut_dropfiles()