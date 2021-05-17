; Script:    ImagePut.ahk
; Author:    iseahound
; License:   MIT License
; Version:   2020-05-22
; Release:   2020-10-14

; ImagePut - Windows Image Transformation Library
; Copy and paste functions from this reference libary as you wish.
; -> All put_XXX functions map from a pBitmap to XXX.
; -> All from_XXX functions map from XXX to a pBitmap.
; Or use ImagePut functions as part of your standard libary.


; Puts the image into a file format and returns a base64 encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutBase64(image, extension := "", quality := "")
   => ImagePut("base64", image,,, extension, quality)


; Puts the image into a GDI+ Bitmap and returns a pointer.
ImagePutBitmap(image)
   => ImagePut("bitmap", image)


; Puts the image into a GDI+ Bitmap and returns a buffer object with GDI+ scope.
ImagePutBuffer(image)
   => ImagePut("buffer", image)


; Puts the image onto the clipboard and returns ClipboardAll().
ImagePutClipboard(image)
   => ImagePut("clipboard", image)


; Puts the image as the cursor and returns the variable A_Cursor.
;   xHotspot   -  X Click Point           |  pixel    ->   0 - width
;   yHotspot   -  Y Click Point           |  pixel    ->   0 - height
ImagePutCursor(image, xHotspot := "", yHotspot := "")
   => ImagePut("cursor", image,,, xHotspot, yHotspot)


; Puts the image behind the desktop icons and returns the string "desktop".
;   scale      -  Scale Factor            |  real     ->   A_ScreenHeight / height.
ImagePutDesktop(image, scale := 1)
   => ImagePut("desktop", image,, scale)


; Puts the image into a file and returns a relative filepath.
;   filepath   -  Filepath + Extension    |  string   ->   *.bmp, *.gif, *.jpg, *.png, *.tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutFile(image, filepath := "", quality := "")
   => ImagePut("file", image,,, filepath, quality)


; Puts the image into a device independent bitmap and returns the handle.
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutHBitmap(image, alpha := "")
   => ImagePut("hBitmap", image,,, alpha)


; Puts the image into a file format and returns a hexadecimal encoded string.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutHex(image, extension := "", quality := "")
   => ImagePut("hex", image,,, extension, quality)


; Puts the image into an icon and returns the handle.
ImagePutHIcon(image)
   => ImagePut("hBitmap", image)


; Puts the image into a file format and returns a pointer to a RandomAccessStream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutRandomAccessStream(image, extension := "", quality := "")
   => ImagePut("RandomAccessStream", image,,, extension, quality)


; Puts the image on the shared screen device context and returns an array of coordinates.
;   screenshot -  Screen Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   alpha      -  Alpha Replacement Color |  RGB      ->   0xFFFFFF
ImagePutScreenshot(image, screenshot := "", alpha := "")
   => ImagePut("screenshot", image,,, screenshot, alpha)


; Puts the image into a file format and returns a pointer to a stream.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutStream(image, extension := "", quality := "")
   => ImagePut("stream", image,,, extension, quality)


; Puts the image as the desktop wallpaper and returns the string "wallpaper".
ImagePutWallpaper(image)
   => ImagePut("wallpaper", image)


; Puts the image in a window and returns a handle to a window.
;   title      -  Window Caption Title    |  string   ->   MyTitle
ImagePutWindow(image, title := "")
   => ImagePut("window", image,,, title)







class ImagePut {

   ; ImagePut() - Puts an image from anywhere to anywhere.
   ;   cotype     -  Output Type             |  string   ->   Case Insensitive. Read documentation.
   ;   image      -  Input Image             |  image    ->   Anything. Refer to ImageType().
   ;   crop       -  Crop Coordinates        |  array    ->   [x,y,w,h] could be negative or percent.
   ;   scale      -  Scale Factor            |  real     ->   2.0
   ;   terms*     -  Additional Parameters   |  variadic ->   Extra parameters found in toCotype().
   static call(cotype, image, crop := "", scale := "", terms*) {

      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>90% accuracy!)
      try type := this.DontVerifyImageType(image)
      catch
         type := this.ImageType(image)

      ; Qualify additional parameters for correctness.
      _crop := IsObject(crop)
         && crop[1] ~= "^-?\d+(\.\d*)?%?$" && crop[2] ~= "^-?\d+(\.\d*)?%?$"
         && crop[3] ~= "^-?\d+(\.\d*)?%?$" && crop[4] ~= "^-?\d+(\.\d*)?%?$"
      _scale := scale != 1 && scale ~= "^\d+(\.\d+)?$"

      ; Make a copy of the image as a pBitmap.
      pBitmap := this.toBitmap(type, image)

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
      coimage := this.toCotype(cotype, pBitmap, terms*)

      ; Clean up the pBitmap copy. Export raw pointers if requested.
      if !(cotype = "bitmap" || cotype = "buffer")
         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      this.gdiplusShutdown(cotype)

      return coimage
   }

   static DontVerifyImageType(image) {

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

         ; An "object" is an object that implements a Bitmap() method returning a pointer to a GDI+ bitmap.
         if image.HasOwnMethod("Bitmap")
            return "object"

         ; A "buffer" is an AutoHotkey v2 buffer object.
         if image.HasOwnProp("pBitmap")
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
         ObjRelease(image)

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

   static toBitmap(type, image) {

      if (type = "clipboard")
         return this.from_clipboard()

      if (type = "object")                      ; Special
         return image.Bitmap()

      if (type = "buffer")
         return this.from_bitmap(image.pBitmap)

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

      throw Error("Conversion from type " type " is not supported.")
   }

   static toCotype(cotype, pBitmap, term1 := "", term2 := "", *) {
      ; toCotype("clipboard", pBitmap)
      if (cotype = "clipboard")
         return this.put_clipboard(pBitmap)

      ; toCotype("buffer", pBitmap)
      if (cotype = "buffer")
         return this.put_buffer(pBitmap)

      ; toCotype("screenshot", pBitmap, screenshot, alpha)
      if (cotype = "screenshot")
         return this.put_screenshot(pBitmap, term1, term2)

      ; toCotype("window", pBitmap, title)
      if (cotype = "window")
         return this.put_window(pBitmap, term1)

      ; toCotype("desktop", pBitmap)
      if (cotype = "desktop")
         return this.put_desktop(pBitmap)

      ; toCotype("wallpaper", pBitmap)
      if (cotype = "wallpaper")
         return this.put_wallpaper(pBitmap)

      ; toCotype("cursor", pBitmap, xHotspot, yHotspot)
      if (cotype = "cursor")
         return this.put_cursor(pBitmap, term1, term2)

      ; toCotype("url", pBitmap)
      if (cotype = "url")
         return this.put_url(pBitmap)

      ; toCotype("file", pBitmap, filename, quality)
      if (cotype = "file")
         return this.put_file(pBitmap, term1, term2)

      ; toCotype("hBitmap", pBitmap, alpha)
      if (cotype = "hBitmap")
         return this.put_hBitmap(pBitmap, term1)

      ; toCotype("hIcon", pBitmap)
      if (cotype = "hIcon")
         return this.put_hIcon(pBitmap)

      ; toCotype("bitmap", pBitmap)
      if (cotype = "bitmap")
         return pBitmap

      ; toCotype("stream", pBitmap, extension, quality)
      if (cotype = "stream")
         return this.put_stream(pBitmap, term1, term2)

      ; toCotype("RandomAccessStream", pBitmap, extension, quality)
      if (cotype = "RandomAccessStream")
         return this.put_RandomAccessStream(pBitmap, term1, term2)

      ; toCotype("hex", pBitmap, extension, quality)
      if (cotype = "hex")
         return this.put_hex(pBitmap, term1, term2)

      ; toCotype("base64", pBitmap, extension, quality)
      if (cotype = "base64")
         return this.put_base64(pBitmap, term1, term2)

      throw Error("Conversion to type " cotype " is not supported.")
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
      ; Thanks splattermania - https://www.php.net/manual/en/function.preg-match.php#93824

      regex := "^(?i)"
         . "((https?|ftp)\:\/\/)" ; SCHEME
         . "([a-z0-9+!*(),;?&=\$_.-]+(\:[a-z0-9+!*(),;?&=\$_.-]+)?@)?" ; User and Pass
         . "([a-z0-9-.]*)\.([a-z]{2,3})" ; Host or IP
         . "(\:[0-9]{2,5})?" ; Port
         . "(\/(?:[a-z0-9-_~!$&'()*+,;=:@]\.?)+)*\/?" ; Path
         . "(\?[a-z+&\$_.-][a-z0-9;:@&%=+\/\$_.-]*)?" ; GET Query
         . "(#[a-z_.-][a-z0-9+\$_.-]*)?$" ; Anchor
      return (url ~= regex)
   }

   static from_clipboard() {
      ; Open the clipboard.
      Loop 6 ; Try this 6 times.
         if (A_Index > 1)
            Sleep (2**(A_Index-2) * 30)
      until (result := DllCall("OpenClipboard", "ptr", 0))
      if !(result)
         throw Error("Clipboard could not be opened.")

      ; Prefer the PNG stream if available considering it supports transparency.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint")
      if DllCall("IsClipboardFormatAvailable", "uint", png, "int") {
         hData := DllCall("GetClipboardData", "uint", png, "ptr")
         DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", true, "ptr*", &pStream:=0)
         DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
         ObjRelease(pStream)
      }

      ; Fallback to CF_BITMAP.
      else if DllCall("IsClipboardFormatAvailable", "uint", 2, "int") {
         hBitmap := DllCall("GetClipboardData", "uint", 2, "ptr")
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hBitmap, "ptr", 0, "ptr*", &pBitmap:=0)
         DllCall("DeleteObject", "ptr", hBitmap)
      }

      DllCall("CloseClipboard")
      return pBitmap
   }

   static from_screenshot(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",  image[3], bi,  4) ; Width
         , NumPut(   "int", -image[4], bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
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
      Rect := BufferAlloc(16) ; sizeof(RECT) = 16
      DllCall("GetClientRect", "ptr", image, "ptr", Rect)
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
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
      Rect := BufferAlloc(16) ; sizeof(RECT) = 16
      DllCall("GetClientRect", "ptr", WorkerW, "ptr", Rect)
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")

      ; Get device context of spawned window.
      sdc := DllCall("GetDCEx", "ptr", WorkerW, "ptr", 0, "int", 0x403, "ptr") ; LockWindowUpdate | Cache | Window

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
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
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
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
      ci := BufferAlloc(16+A_PtrSize, 0)                 ; sizeof(CURSORINFO) = 20, 24
         , NumPut("int", ci.size, ci)
      DllCall("GetCursorInfo", "ptr", ci)
         ; cShow   := NumGet(ci,  4, "int")              ; 0x1 = CURSOR_SHOWING, 0x2 = CURSOR_SUPPRESSED
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
      req := ComObject("WinHttp.WinHttpRequest.5.1")
      req.Open("GET", image)
      req.Send()
      IStream := ComObjQuery(req.ResponseStream, "{0000000C-0000-0000-C000-000000000046}")
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", IStream, "ptr*", &pBitmap:=0)
      ObjRelease(IStream.ptr)
      return pBitmap
   }

   static from_file(image) {
      DllCall("gdiplus\GdipCreateBitmapFromFile", "wstr", image, "ptr*", &pBitmap:=0)
      return pBitmap
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
      dib := BufferAlloc(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
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
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      Rect := BufferAlloc(16, 0)               ; sizeof(Rect) = 16
         , NumPut(  "uint",   width, Rect,  8) ; Width
         , NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := BufferAlloc(16+2*A_PtrSize, 0)      ; sizeof(BitmapData) = 24, 32
         , NumPut(  "uint",      width, BitmapData,  0) ; Width
         , NumPut(  "uint",     height, BitmapData,  4) ; Height
         , NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         , NumPut(   "int",    0xE200B, BitmapData, 12) ; PixelFormat
         , NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0

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
      ii := BufferAlloc(8+3*A_PtrSize, 0)                ; sizeof(ICONINFO) = 20, 32
      DllCall("GetIconInfo", "ptr", image, "ptr", ii)
         ; xHotspot := NumGet(ii, 4, "uint")
         ; yHotspot := NumGet(ii, 8, "uint")
         , hbmMask  := NumGet(ii, 8+A_PtrSize, "ptr")    ; x86:12, x64:16
         , hbmColor := NumGet(ii, 8+2*A_PtrSize, "ptr")  ; x86:16, x64:24

      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      bm := BufferAlloc(16+2*A_PtrSize) ; sizeof(BITMAP) = 24, 32
      DllCall("GetObject", "ptr", hbmMask, "int", bm.size, "ptr", bm)
         , width  := NumGet(bm, 4, "uint")
         , height := NumGet(bm, 8, "uint") / (hbmColor ? 1 : 2) ; Black and White cursors have doubled height.

      ; Clean up these hBitmaps.
      DllCall("DeleteObject", "ptr", hbmMask)
      DllCall("DeleteObject", "ptr", hbmColor)

      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; This is the 32-bit ARGB pBitmap (different from an hBitmap) that will receive the final converted pixels.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits. The buffer has pixel format pARGB.
      Rect := BufferAlloc(16, 0)               ; sizeof(Rect) = 16
         , NumPut(  "uint",   width, Rect,  8) ; Width
         , NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := BufferAlloc(16+2*A_PtrSize, 0)      ; sizeof(BitmapData) = 24, 32
         , NumPut(  "uint",      width, BitmapData,  0) ; Width
         , NumPut(  "uint",     height, BitmapData,  4) ; Height
         , NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         , NumPut(   "int",    0xE200B, BitmapData, 12) ; PixelFormat
         , NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0

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
      DllCall("gdiplus\GdipCloneImage", "ptr", image, "ptr*", &pBitmap:=0)
      return pBitmap
   }

   static from_stream(image) {
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", image, "ptr*", &pBitmap:=0)
      return pBitmap
   }

   static from_RandomAccessStream(image) {
      ; Get the Class ID from a GUID string.
      CLSID := BufferAlloc(16, 0)
      if result := DllCall("ole32\CLSIDFromString", "wstr", "{0000000C-0000-0000-C000-000000000046}", "ptr", CLSID, "uint")
         throw Error("CLSIDFromString failed. Error: " . Format("{:#x}", result))

      ; Convert RandomAccessStream to stream.
      DllCall("ShCore\CreateStreamOverRandomAccessStream", "ptr", image, "ptr", CLSID, "ptr*", &pStream:=0, "uint")

      ; Read stream to pBitmap.
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)

      ; Manually free the pointer to an IStream.
      ObjRelease(pStream)

      return pBitmap
   }

   static from_hex(image) {
      ; Trim whitespace and remove header.
      image := Trim(image)
      image := RegExReplace(image, "^(0[xX])")

      ; Converts the image to binary data by first asking for the size.
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", 0x0000000C, "ptr",   0, "uint*", &size:=0, "ptr", 0, "ptr", 0)
      bin := BufferAlloc(size, 0)
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", 0x0000000C, "ptr", bin, "uint*", size   , "ptr", 0, "ptr", 0)

      ; Makes a stream for conversion into a pBitmap.
      pStream := DllCall("shlwapi\SHCreateMemStream", "ptr", bin, "uint", size, "ptr")
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)

      return pBitmap
   }

   static from_base64(image) {
      ; Trim whitespace and remove header.
      image := Trim(image)
      image := RegExReplace(image, "^data:image\/[a-z]+;base64,")

      ; Converts the image to binary data by first asking for the size.
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", 0x00000001, "ptr",   0, "uint*", &size:=0, "ptr", 0, "ptr", 0)
      bin := BufferAlloc(size, 0)
      DllCall("crypt32\CryptStringToBinary"
               , "ptr", StrPtr(image), "uint", 0, "uint", 0x00000001, "ptr", bin, "uint*", size   , "ptr", 0, "ptr", 0)

      ; Makes a stream for conversion into a pBitmap.
      pStream := DllCall("shlwapi\SHCreateMemStream", "ptr", bin, "uint", size, "ptr")
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)

      return pBitmap
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

      ; Open the clipboard.
      Loop 6 ; Try this 6 times.
         if (A_Index > 1)
            Sleep (2**(A_Index-2) * 30)
      until (result := DllCall("OpenClipboard", "ptr", 0))
      if !(result)
         throw Error("Clipboard could not be opened.")

      ; Clear the clipboard.
      DllCall("EmptyClipboard")

      ; #1 - Place the image onto the clipboard as a PNG stream.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3
      pStream := this.put_stream(pBitmap, "png")
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", &hData:=0)
      DllCall("SetClipboardData", "uint", DllCall("RegisterClipboardFormat", "str", "png", "uint"), "ptr", hData)
      ObjRelease(pStream)

      ; #2 - Place the image onto the clipboard in the CF_DIB format in ARGB using 3 color masks. (Extra 12 byte offset.)
      ; Thanks Nyerguds - https://stackoverflow.com/a/46424800

      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "uint*", &format:=0)

      ; Get Bitmap bits per pixel, stride, and size.
      bpp := (format & 0x00FF00) >> 8
      stride := (bpp >> 3) * width
      size := stride * height

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
      hdib := DllCall("GlobalAlloc", "uint", 0x42, "uptr", 40 + 12 + size, "ptr")
      pdib := DllCall("GlobalLock", "ptr", hdib, "ptr")
         , NumPut(  "uint",         40, pdib,  0) ; Size
         , NumPut(   "int",      width, pdib,  4) ; Width
         , NumPut(   "int",    -height, pdib,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",          1, pdib, 12) ; Planes
         , NumPut("ushort",        bpp, pdib, 14) ; BitCount / BitsPerPixel
         , NumPut(  "uint",        0x3, pdib, 16) ; Compression
         , NumPut(  "uint",       size, pdib, 20) ; SizeImage (bytes)
         ; The following bitfields when masked extract the respective color channels.
         , NumPut(  "uint", 0x00FF0000, pdib, 40) ; Red
         , NumPut(  "uint", 0x0000FF00, pdib, 44) ; Green
         , NumPut(  "uint", 0x000000FF, pdib, 48) ; Blue

      ; Transfer data from source pBitmap to the global memory manually.
      Rect := BufferAlloc(16, 0)               ; sizeof(Rect) = 16
         , NumPut(  "uint",   width, Rect,  8) ; Width
         , NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := BufferAlloc(16+2*A_PtrSize, 0)      ; sizeof(BitmapData) = 24, 32
         , NumPut(  "uint",      width, BitmapData,  0) ; Width
         , NumPut(  "uint",     height, BitmapData,  4) ; Height
         , NumPut(   "int",     stride, BitmapData,  8) ; Stride
         , NumPut(   "int",     format, BitmapData, 12) ; PixelFormat
         , NumPut(   "ptr",  pdib + 52, BitmapData, 16) ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (pdib) to the hData.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Unlock the memory as it is complete.
      DllCall("GlobalUnlock", "ptr", hdib)

      ; Add CF_DIB as a format to the clipboard.
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

      x := (IsObject(screenshot) && screenshot[1] != "") ? screenshot[1] : Round((A_ScreenWidth - width) / 2)
      y := (IsObject(screenshot) && screenshot[2] != "") ? screenshot[2] : Round((A_ScreenHeight - height) / 2)
      w := (IsObject(screenshot) && screenshot[3] != "") ? screenshot[3] : width
      h := (IsObject(screenshot) && screenshot[4] != "") ? screenshot[4] : height

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.put_hBitmap(pBitmap, alpha)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Retrieve the device context for the screen.
      ddc := DllCall("GetDC", "ptr", 0, "ptr")

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
         ;  MsgBox "NICE TRY! LOL!"
         ;   return
         }

         ; WM_LBUTTONDOWN
         if (uMsg = 0x201) {
            parent := DllCall("GetParent", "ptr", hwnd, "ptr")
            hwnd := (parent != A_ScriptHwnd && parent != 0) ? parent : hwnd
            PostMessage 0xA1, 2,,, hwnd
         }

         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }

      ; Make it permanent.
      void := ObjBindMethod({}, {})
      Hotkey "^+F12", void, "On"

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      class_name := "ImagePut"
      pWndProc := CallbackCreate("WindowProc", "Fast")

      hCursor := DllCall("LoadCursor", "ptr", 0, "ptr", 32512, "ptr") ; IDC_ARROW
      ;hBrush := DllCall("CreateSolidBrush", "uint", 0x00F0F0F0, "ptr")
      hBrush := DllCall("GetStockObject", "int", 5, "ptr") ; Hollow_brush

      ; struct tagWNDCLASSEXA - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexa
      ; struct tagWNDCLASSEXW - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexw
      WNDCLASSEX := BufferAlloc(A_PtrSize=8 ? 80:48, 0)                                ; sizeof(WNDCLASSEX) = 48, 80
         , NumPut(  "uint", WNDCLASSEX.size, WNDCLASSEX,                   0) ; cbSize
         , NumPut(  "uint",          0, WNDCLASSEX,                   4) ; style
         , NumPut(   "ptr",   pWndProc, WNDCLASSEX,                   8) ; lpfnWndProc
         , NumPut(   "int",          0, WNDCLASSEX, A_PtrSize=8 ? 16:12) ; cbClsExtra
         , NumPut(   "int",          0, WNDCLASSEX, A_PtrSize=8 ? 20:16) ; cbWndExtra
         , NumPut(   "ptr",          0, WNDCLASSEX, A_PtrSize=8 ? 24:20) ; hInstance
         , NumPut(   "ptr",          0, WNDCLASSEX, A_PtrSize=8 ? 32:24) ; hIcon
         , NumPut(   "ptr",    hCursor, WNDCLASSEX, A_PtrSize=8 ? 40:28) ; hCursor
         , NumPut(   "ptr",     hBrush, WNDCLASSEX, A_PtrSize=8 ? 48:32) ; hbrBackground
         , NumPut(   "ptr",          0, WNDCLASSEX, A_PtrSize=8 ? 56:36) ; lpszMenuName
         , NumPut(   "ptr", StrPtr(class_name), WNDCLASSEX, A_PtrSize=8 ? 64:40) ; lpszClassName
         , NumPut(   "ptr",          0, WNDCLASSEX, A_PtrSize=8 ? 72:44) ; hIconSm

      ; Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
      DllCall("RegisterClassEx", "ptr", WNDCLASSEX, "ushort")

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

         rect := BufferAlloc(16, 0)
            , NumPut("int", Floor((A_ScreenWidth - width) / 2), rect,  0)
            , NumPut("int", Floor((A_ScreenHeight - height) / 2), rect,  4)
            , NumPut("int", Floor((A_ScreenWidth + width) / 2), rect,  8)
            , NumPut("int", Floor((A_ScreenHeight + height) / 2), rect, 12)

         style := WS_VISIBLE | WS_CAPTION | WS_SYSMENU | WS_CLIPCHILDREN | WS_POPUP | WS_CLIPSIBLINGS ;| WS_SIZEBOX
         styleEx := WS_EX_TOPMOST | WS_EX_WINDOWEDGE | WS_EX_DLGMODALFRAME ;| WS_EX_LAYERED ;| WS_EX_STATICEDGE

         DllCall("AdjustWindowRectEx", "ptr", rect, "uint", style, "uint", 0, "uint", styleEx)

         x := NumGet(rect,  0, "int")
         y := NumGet(rect,  4, "int")
         w := NumGet(rect,  8, "int") - NumGet(rect,  0, "int")
         h := NumGet(rect, 12, "int") - NumGet(rect,  4, "int")

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
      Loop 6 ; Try this 6 times.
         if (A_Index > 1)
            Sleep (2**(A_Index-2) * 30)
      until FileExist(filepath)
      if !FileExist(filepath)
         throw Error("Unable to create temporary image file.")

      ; Set the temporary image file as the new desktop wallpaper.
      DllCall("SystemParametersInfo", "uint", 20, "uint", 0, "str", buf, "uint", 2)

      ; This is a delayed delete call. #Persistent may be required on v1.
      DeleteFile := Func("DllCall").Bind("DeleteFile", "str", filepath)
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
         ii := BufferAlloc(8+3*A_PtrSize, 0)                          ; sizeof(ICONINFO) = 20, 32
         DllCall("GetIconInfo", "ptr", hIcon, "ptr", ii)              ; Fill the ICONINFO structure.
            , NumPut("uint", false, ii, 0)                            ; true/false are icon/cursor respectively.
            , (xHotspot != "") ? NumPut("uint", xHotspot, ii, 4) : "" ; Set the xHotspot value. (Default: center point)
            , (yHotspot != "") ? NumPut("uint", yHotspot, ii, 8) : "" ; Set the yHotspot value. (Default: center point)
         DllCall("DestroyIcon", "ptr", hIcon)                         ; Destroy the icon after getting the ICONINFO structure.
         hIcon := DllCall("CreateIconIndirect", "ptr", ii, "ptr")     ; Create a new cursor using ICONINFO.

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

      ; Remove whitespace. Seperate the filepath. Adjust for directories.
      filepath := Trim(filepath)
      SplitPath filepath,, &directory, &extension, &filename
      if DirExist(filepath)
         directory .= "\" filename, filename := ""
      if (directory != "" && !DirExist(directory))
         DirCreate(directory)
      directory := (directory != "") ? directory : "."

      ; Validate filepath, defaulting to PNG. https://stackoverflow.com/a/6804755
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$") {
         if (extension != "")
            filename .= "." extension
         extension := "png"
      }
      filename := RegExReplace(filename, "S)(?i:^(CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])$|[<>:|?*\x00-\x1F\x22\/\\])")
      if (filename == "")
         filename := FormatTime(, "yyyy-MM-dd HH?mm?ss")
      filepath := directory "\" filename "." extension

      ; Fill a buffer with the available encoders.
      DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", &count:=0, "uint*", &size:=0)
      ci := BufferAlloc(size)
      DllCall("gdiplus\GdipGetImageEncoders", "uint", count, "uint", size, "ptr", ci)
      if !(count && size)
         throw Error("Could not get a list of image codec encoders on this system.")

      ; Search for an encoder with a matching extension.
      Loop count
         EncoderExtensions := StrGet(NumGet(ci, (idx:=(48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize, "uptr"), "UTF-16")
      until InStr(EncoderExtensions, "*." extension)

      ; Get the pointer to the index/offset of the matching encoder.
      if !(pCodec := ci.ptr + idx)
         throw Error("Could not find a matching encoder for the specified file format.")

      ; JPEG is a lossy image format that requires a quality value from 0-100. Default quality is 75.
      if (extension ~= "^(?i:jpg|jpeg|jpe|jfif)$"
      && IsInteger(quality) && 0 <= quality && quality <= 100 && quality != 75) {
         DllCall("gdiplus\GdipGetEncoderParameterListSize", "ptr", pBitmap, "ptr", pCodec, "uint*", &size:=0)
         EncoderParameters := BufferAlloc(size, 0)
         DllCall("gdiplus\GdipGetEncoderParameterList", "ptr", pBitmap, "ptr", pCodec, "uint", size, "ptr", EncoderParameters)

         ; Search for an encoder parameter with 1 value of type 6.
         Loop NumGet(EncoderParameters, "uint")
            elem := (24+A_PtrSize)*(A_Index-1) + A_PtrSize
         until (NumGet(EncoderParameters, elem+16, "uint") = 1) && (NumGet(EncoderParameters, elem+20, "uint") = 6)

         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ep := EncoderParameters.ptr + elem - A_PtrSize                  ; sizeof(EncoderParameter) = 28, 32
            , NumPut(  "uptr",       1, ep)                              ; Must be 1.
            , NumPut(  "uint",       4, ep, 20+A_PtrSize)                ; Type
            , NumPut(  "uint", quality, NumGet(ep+24+A_PtrSize, "uptr")) ; Value (pointer)
      }

      ; Write the file to disk using the specified encoder and encoding parameters.
      Loop 6 ; Try this 6 times.
         if (A_Index > 1)
            Sleep (2**(A_Index-2) * 30)
      until (result := !DllCall("gdiplus\GdipSaveImageToFile", "ptr", pBitmap, "wstr", filepath, "ptr", pCodec, "uint", IsSet(ep) ? ep : 0))
      if !(result)
         throw Error("Could not save file to disk.")

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
      bi := BufferAlloc(40, 0)                 ; sizeof(bi) = 40
         , NumPut(  "uint",        40, bi,  0) ; Size
         , NumPut(   "int",     width, bi,  4) ; Width
         , NumPut(   "int",   -height, bi,  8) ; Height - Negative so (0, 0) is top-left.
         , NumPut("ushort",         1, bi, 12) ; Planes
         , NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Transfer data from source pBitmap to an hBitmap manually.
      Rect := BufferAlloc(16, 0)               ; sizeof(Rect) = 16
         , NumPut(  "uint",   width, Rect,  8) ; Width
         , NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := BufferAlloc(16+2*A_PtrSize, 0)      ; sizeof(BitmapData) = 24, 32
         , NumPut(  "uint",      width, BitmapData,  0) ; Width
         , NumPut(  "uint",     height, BitmapData,  4) ; Height
         , NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         , NumPut(   "int",    0xE200B, BitmapData, 12) ; PixelFormat
         , NumPut(   "ptr",      pBits, BitmapData, 16) ; Scan0
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

      ; Fill a buffer with the available encoders.
      DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", &count:=0, "uint*", &size:=0)
      ci := BufferAlloc(size)
      DllCall("gdiplus\GdipGetImageEncoders", "uint", count, "uint", size, "ptr", ci)
      if !(count && size)
         throw Error("Could not get a list of image codec encoders on this system.")

      ; Search for an encoder with a matching extension.
      Loop count
         EncoderExtensions := StrGet(NumGet(ci, (idx:=(48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize, "uptr"), "UTF-16")
      until InStr(EncoderExtensions, "*." extension)

      ; Get the pointer to the index/offset of the matching encoder.
      if !(pCodec := ci.ptr + idx)
         throw Error("Could not find a matching encoder for the specified file format.")

      ; JPEG is a lossy image format that requires a quality value from 0-100. Default quality is 75.
      if (extension ~= "^(?i:jpg|jpeg|jpe|jfif)$"
      && IsInteger(quality) && 0 <= quality && quality <= 100 && quality != 75) {
         DllCall("gdiplus\GdipGetEncoderParameterListSize", "ptr", pBitmap, "ptr", pCodec, "uint*", &size:=0)
         EncoderParameters := BufferAlloc(size, 0)
         DllCall("gdiplus\GdipGetEncoderParameterList", "ptr", pBitmap, "ptr", pCodec, "uint", size, "ptr", EncoderParameters)

         ; Search for an encoder parameter with 1 value of type 6.
         Loop NumGet(EncoderParameters, "uint")
            elem := (24+A_PtrSize)*(A_Index-1) + A_PtrSize
         until (NumGet(EncoderParameters, elem+16, "uint") = 1) && (NumGet(EncoderParameters, elem+20, "uint") = 6)

         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ep := EncoderParameters.ptr + elem - A_PtrSize                  ; sizeof(EncoderParameter) = 28, 32
            , NumPut(  "uptr",       1, ep)                              ; Must be 1.
            , NumPut(  "uint",       4, ep, 20+A_PtrSize)                ; Type
            , NumPut(  "uint", quality, NumGet(ep+24+A_PtrSize, "uptr")) ; Value (pointer)
      }

      ; Create a Stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", true, "ptr*", &pStream:=0)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "uint", IsSet(ep) ? ep : 0)

      return pStream
   }

   static put_RandomAccessStream(pBitmap, extension := "", quality := "") {
      ; Thanks teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=6&t=72674

      ; Which is faster, bmp or png?
      pStream := this.put_stream(pBitmap, extension, quality)

      ; Get the Class ID from a GUID string.
      CLSID := BufferAlloc(16, 0)
      if result := DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", CLSID, "uint")
         throw Error("CLSIDFromString failed. Error: " . Format("{:#x}", result))

      ; Create a RandomAccessStream
      DllCall("ShCore\CreateRandomAccessStreamOverStream", "ptr", pStream, "uint", 1, "ptr", CLSID, "ptr*", &pRandomAccessStream:=0, "uint")

      ; The handle to the stream object is automatically freed when the stream object is released.
      ObjRelease(pStream)

      return pRandomAccessStream
   }

   static put_hex(pBitmap, extension := "", quality := "") {
      ; Default extension is PNG for small sizes!
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", &hData:=0)
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      nSize := DllCall("GlobalSize", "uint", pData, "uptr")

      ; Using CryptBinaryToStringA saves about 2MB in memory.
      DllCall("Crypt32.dll\CryptBinaryToStringA", "ptr", pData, "uint", nSize, "uint", 0x4000000C, "ptr", 0, "uint*", &length:=0)
      hex := BufferAlloc(length, 0)
      DllCall("Crypt32.dll\CryptBinaryToStringA", "ptr", pData, "uint", nSize, "uint", 0x4000000C, "ptr", hex, "uint*", length)

      DllCall("GlobalUnlock", "ptr", hData)
      DllCall("GlobalFree", "ptr", hData)
      ObjRelease(pStream)

      return StrGet(hex, length, "CP0")
   }

   static put_base64(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; Default extension is PNG for small sizes!
      if !(extension ~= "^(?i:bmp|dib|rle|jpg|jpeg|jpe|jfif|gif|tif|tiff|png)$")
         extension := "png"

      pStream := this.put_stream(pBitmap, extension, quality)
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", &hData:=0)
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      nSize := DllCall("GlobalSize", "uint", pData, "uptr")

      ; Using CryptBinaryToStringA saves about 2MB in memory.
      DllCall("Crypt32.dll\CryptBinaryToStringA", "ptr", pData, "uint", nSize, "uint", 0x40000001, "ptr", 0, "uint*", &length:=0)
      base64 := BufferAlloc(length, 0)
      DllCall("Crypt32.dll\CryptBinaryToStringA", "ptr", pData, "uint", nSize, "uint", 0x40000001, "ptr", base64, "uint*", length)

      DllCall("GlobalUnlock", "ptr", hData)
      DllCall("GlobalFree", "ptr", hData)
      ObjRelease(pStream)

      return StrGet(base64, length, "CP0")
   }

   ; All references to gdiplus and pToken must be absolute!
   static gdiplus := 0, pToken := 0

   static gdiplusStartup() {
      ImagePut.gdiplus++

      ; Startup gdiplus when counter goes from 0 -> 1.
      if (ImagePut.gdiplus == 1) {

         ; Startup gdiplus.
         DllCall("LoadLibrary", "str", "gdiplus")
         si := BufferAlloc(A_PtrSize = 8 ? 24 : 16, 0) ; sizeof(GdiplusStartupInput) = 16, 24
            , NumPut("uint", 0x1, si)
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


ImageEqual(images*)
   => ImageEqual.call(images*)


class ImageEqual extends ImagePut {

   static call(images*) {
      if (images.length == 0)
         return false

      if (images.length == 1)
         return true

      this.gdiplusStartup()

      ; Convert the images to pBitmaps (byte arrays).
      for i, image in images {
         try type := this.DontVerifyImageType(image)
         catch
            try type := this.ImageType(image)
            catch { ; Not a valid image.
               result := false
               break
            }

         if (A_Index == 1) {
            pBitmap1 := this.toBitmap(type, image)
         } else {
            pBitmap2 := this.toBitmap(type, image)
            result := this.isBitmapEqual(pBitmap1, pBitmap2)
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
            if (result)
               continue
            else {
               result := false
               break
            }
         }
      }

      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)

      this.gdiplusShutdown()

      return result
   }

   static isBitmapEqual(pBitmap1, pBitmap2, Format := 0x26200A) {
      ; Make sure both bitmaps are valid pointers.
      if !(pBitmap1 && pBitmap2)
         return false

      ; Check if pointers are identical.
      if (pBitmap1 == pBitmap2)
         return true

      ; The two bitmaps must be the same size.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap1, "uint*", &Width1:=0)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap2, "uint*", &Width2:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap1, "uint*", &Height1:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap2, "uint*", &Height2:=0)

      ; Match bitmap dimensions.
      if (Width1 != Width2 || Height1 != Height2)
         return false

      ; struct RECT - https://docs.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect
      Rect := BufferAlloc(16, 0)                     ; sizeof(Rect) = 16
         , NumPut(  "uint",   Width1, Rect,  8)      ; Width
         , NumPut(  "uint",  Height1, Rect, 12)      ; Height

      ; Do this twice.
      while ((i:=IsSet(i)?i:0)++ < 2) { ; for(int i = 0; i < 2; i++)

         ; Create a BitmapData structure.
         BitmapData%i% := BufferAlloc(16+2*A_PtrSize, 0)  ; sizeof(BitmapData) = 24, 32

         ; Transfer the pixels to a read-only buffer. Avoid using a different PixelFormat.
         DllCall("gdiplus\GdipBitmapLockBits"
                  ,    "ptr", pBitmap%i%
                  ,    "ptr", Rect
                  ,   "uint", 1            ; ImageLockMode.ReadOnly
                  ,    "int", Format       ; Format32bppArgb is fast.
                  ,    "ptr", BitmapData%i%)

         ; Get Stride (number of bytes per horizontal line).
         Stride%i% := NumGet(BitmapData%i%,  8, "int")

         ; If the Stride is negative, clone the image to make it top-down; redo the loop.
         if (Stride%i% < 0) {
            DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap%i%, "ptr*", &pBitmapClone:=0)
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap%i%) ; Permanently deletes.
            pBitmap%i% := pBitmapClone
            i-- ; "Let's go around again! Ha!" https://bit.ly/2AWWcM3
         }

         ; Get Scan0 (top-left pixel at 0,0).
         Scan0%i%  := NumGet(BitmapData%i%, 16, "ptr")
      }

      ; RtlCompareMemory preforms an unsafe comparison stopping at the first different byte.
      size := Stride%'1'% * Height1
      byte := DllCall("ntdll\RtlCompareMemory", "ptr", Scan0%'1'%, "ptr", Scan0%'2'%, "uptr", size, "uptr")

      ; Unlock Bitmaps. Since they were marked as read only there is no copy back.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap1, "ptr", BitmapData%'1'%)
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap2, "ptr", BitmapData%'2'%)

      ; Compare stopped byte.
      return (byte == size) ? true : false
   }
} ; End of ImageEqual class.