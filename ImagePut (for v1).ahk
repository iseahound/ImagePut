; Script:    ImagePut.ahk
; License:   MIT License
; Author:    Edison Hua (iseahound)
; Github:    https://github.com/iseahound/ImagePut
; Date:      2023-03-02
; Version:   1.10

#Requires AutoHotkey v1.1.35+


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

; Puts the image as an encoded format into a binary data object.
;   extension  -  File Encoding           |  string   ->   bmp, gif, jpg, png, tiff
;   quality    -  JPEG Quality Level      |  integer  ->   0 - 100
ImagePutEncodedBuffer(image, extension := "", quality := "") {
   return ImagePut("EncodedBuffer", image, extension, quality)
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

; Puts the image into a file mapping and returns a buffer object sharable across processes.
;   name       -  Global Name             |  string   ->   "Alice"
ImagePutSharedBuffer(image, name := "") {
   return ImagePut("SharedBuffer", image, name)
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
;   playback   -  Animate Window?         |  bool     ->   True
;   cache      -  Cache Animation Frames? |  bool     ->   False
ImagePutWindow(image, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "", playback := True, cache := False) {
   return ImagePut("window", image, title, pos, style, styleEx, parent, playback, cache)
}


;   title      -  Window Title            |  string   ->   MyTitle
;   pos        -  Window Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   style      -  Window Style            |  uint     ->   WS_VISIBLE
;   styleEx    -  Window Extended Style   |  uint     ->   WS_EX_LAYERED
;   parent     -  Window Parent           |  ptr      ->   hwnd
;   playback   -  Animate Window?         |  bool     ->   True
;   cache      -  Cache Animation Frames? |  bool     ->   False
ImageShow(image, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "", playback := True, cache := False) {
   return ImagePut("show", image, title, pos, style, styleEx, parent, playback, cache)
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

   static decode := False    ; Decompresses image to a pixel buffer. Any encoding such as JPG will be lost.
   static render := True     ; Determines whether vectorized formats such as SVG and PDF are rendered to pixels.
   static validate := False  ; Always copies pixels to new memory immediately instead of copy-on-read/write.

   call(cotype, image, p*) {

      ; Start!
      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>95% accuracy!)
      try type := this.DontVerifyImageType(image, keywords)
      catch
         type := this.ImageType(image)

      ; Determine if the intermediate type is supported.
      isStreamIn := type ~= "^(?i:clipboardpng|safearray|encodedbuffer|url|file|stream|RandomAccessStream|hex|base64)$"
      isStreamOut := cotype ~= "^(?i:clipboard|encodedbuffer|file|stream|RandomAccessStream|hex|base64|uri|explorer|safeArray|formData)$"

      ; Extract options to be directly applied the intermediate here.
      crop      := keywords.HasKey("crop")       ? keywords.crop      : ""
      scale     := keywords.HasKey("scale")      ? keywords.scale     : ""
      upscale   := keywords.HasKey("upscale")    ? keywords.upscale   : ""
      downscale := keywords.HasKey("downscale")  ? keywords.downscale : ""
      sprite    := keywords.HasKey("sprite")     ? keywords.sprite    : ""
      decode    := keywords.HasKey("decode")     ? keywords.decode    : this.decode
      render    := keywords.HasKey("render")     ? keywords.render    : this.render
      validate  := keywords.HasKey("validate")   ? keywords.validate  : this.validate

      ; Keywords are for (input -> intermediate).
      try index := keywords.index

      cleanup := ""

      ; #1 - Stream as the intermediate representation.
      if not isStreamIn
         goto make_bitmap

      if !(stream := this.ImageToStream(type, image, keywords))
         throw Exception("Stream cannot be zero.")

      ; Check the file signature for magic numbers.
      stream:
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; 2048 characters should be good enough to identify the file correctly.
      size := min(size, 2048)
      VarSetCapacity(bin, size)

      ; Get the first few bytes of the image.
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; Allocate enough space for a hexadecimal string with spaces interleaved and a null terminator.
      length := 2*size + (size-1) + 1
      VarSetCapacity(str, length * (A_IsUnicode?2:1))

      ; Lift the binary representation to hex.
      flags := 0x40000004 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEX
      DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Determine the extension using herustics. See: http://fileformats.archiveteam.org
      extension := 0                                                              ? ""
      : str ~= "(?i)66 74 79 70 61 76 69 66"                                      ? "avif" ; ftypavif
      : str ~= "(?i)^42 4d (.. ){36}00 00 .. 00 00 00"                            ? "bmp"  ; BM
      : str ~= "(?i)^01 00 00 00 (.. ){36}20 45 4D 46"                            ? "emf"  ; emf
      : str ~= "(?i)^47 49 46 38 (37|39) 61"                                      ? "gif"  ; GIF87a or GIF89a
      : str ~= "(?i)66 74 79 70 68 65 69 63"                                      ? "heic" ; ftypheic
      : str ~= "(?i)^00 00 01 00"                                                 ? "ico"
      : str ~= "(?i)^ff d8 ff"                                                    ? "jpg"
      : str ~= "(?i)^25 50 44 46 2d"                                              ? "pdf"  ; %PDF-
      : str ~= "(?i)^89 50 4e 47 0d 0a 1a 0a"                                     ? "png"  ; PNG
      : str ~= "(?i)^(((?!3c|3e).. )|3c (3f|21) ((?!3c|3e).. )*3e )*+3c 73 76 67" ? "svg"  ; <svg
      : str ~= "(?i)^(49 49 2a 00|4d 4d 00 2a)"                                   ? "tif"  ; II* or MM*
      : str ~= "(?i)^52 49 46 46 .. .. .. .. 57 45 42 50"                         ? "webp" ; RIFF....WEBP
      : str ~= "(?i)^d7 cd c6 9a"                                                 ? "wmf"
      : "" ; Extension must be blank for file pass-through as-is.

      ; Convert vectorized formats to rasterized formats.
      if (render && extension ~= "^(?i:pdf|svg)$") {
         (extension = "pdf") && this.RenderPdf(stream, index)
         ; (extension = "svg") && pBitmap := this.RenderSvg(&stream, 800, 800)
         goto % IsSet(pBitmap) ? "bitmap" : "stream"
      }

      ; Determine whether the stream should be decoded into pixels.
      weight := decode || crop || scale || upscale || downscale || sprite ||

         ; Check if the 1st parameter matches the file signature.
         !( cotype ~= "^(?i:encodedbuffer|url|hex|base64|uri|stream|randomaccessstream|safearray)$"
            && (!p.HasKey(1) || p[1] == "" || p[1] = extension)

         ; Check if the 2nd parameter matches the file signature.
         || cotype = "formdata"
            && (!p.HasKey(2) || p[2] == "" || p[2] = extension)

         ; For files, if the desired extension is not supported, it is ignored.
         || cotype = "file"
            && (!p.HasKey(1) || p[1] == "" || p[1] ~= "(^|:|\\|\.)" extension "$"
               || !(RegExReplace(p[1], "^.*(?:^|:|\\|\.)(.*)$", "$1")
               ~= "^(?i:avif|avifs|bmp|dib|rle|gif|heic|heif|hif|jpg|jpeg|jpe|jfif|png|tif|tiff)$"))

         ; Pass through all other cotypes.
         || cotype)
         
         ; MsgBox % weight ? "convert to pixels" : "stay as stream"

      ; Attempt conversion using StreamToCoimage.
      if not weight && isStreamOut {

         coimage := this.StreamToCoimage(cotype, stream, p*)

         ; Clean up the copy. Export raw pointers if requested.
         if (cotype != "stream")
            ObjRelease(stream)

         goto exit
      }

      ; Otherwise export the image as a stream.
      type := "stream"
      image := stream
      cleanup := "stream"

      ; #2 - Fallback to GDI+ bitmap as the intermediate.
      make_bitmap:
      if !(pBitmap := this.ImageToBitmap(type, image, keywords))
         throw Exception("pBitmap cannot be zero.")

      ; GdipImageForceValidation must be called immediately or it fails silently.
      bitmap:
      (validate) && DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap)
      (crop) && this.BitmapCrop(pBitmap, crop)
      (scale) && this.BitmapScale(pBitmap, scale)
      (upscale) && this.BitmapScale(pBitmap, upscale, 1)
      (downscale) && this.BitmapScale(pBitmap, downscale, -1)
      (sprite) && this.BitmapSprite(pBitmap)

      ; Save frame delays and loop count for webp.
      if (type = "stream" && extension = "webp" && cotype ~= "^(?i:show|window)$") {
         this.ParseWebp(stream, pDelays, pCount)
         DllCall("gdiplus\GdipSetPropertyItem", "ptr", pBitmap, "ptr", pDelays)
         DllCall("gdiplus\GdipSetPropertyItem", "ptr", pBitmap, "ptr", pCount)
      }

      ; Attempt conversion using BitmapToCoimage.
      coimage := this.BitmapToCoimage(cotype, pBitmap, p*)

      ; Clean up the copy. Export raw pointers if requested.
      if (cotype != "bitmap")
         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      if cleanup = "stream"
         ObjRelease(stream)

      exit:
      ; Check for dangling pointers.
      this.gdiplusShutdown(cotype)

      return coimage
   }

   static inputs :=
   ( Join
   [
      "ClipboardPng",
      "Clipboard",
      "SafeArray",
      "Screenshot",
      "Window",
      "Object",
      "EncodedBuffer",
      "Buffer",
      "Monitor",
      "Desktop",
      "Wallpaper",
      "Cursor",
      "Url",
      "File",
      "SharedBuffer",
      "Hex",
      "Base64",
      "DC",
      "HBitmap",
      "HIcon",
      "Bitmap",
      "Stream",
      "RandomAccessStream",
      "WicBitmap",
      "D2dBitmap"
   ]
   )
   DontVerifyImageType(ByRef image, ByRef keywords := "") {

      ; Sentinel value.
      keywords := {}

      ; Try ImageType.
      if !IsObject(image)
         throw Exception("Must be an object.")

      ; Goto ImageType.
      if image.HasKey("image") {
         keywords := image
         image := image.image
         throw Exception("Must catch this error with ImageType.")
      }

      ; Skip ImageType.
      for i, type in this.inputs
         if image.HasKey(type) {
            keywords := image
            image := image[type]
            return type
         }

      ; Continue ImageType.
      throw Exception("Invalid type.")
   }

   ImageType(image) {



      ; Throw if the image is an empty string.
      if (image == "")
         ; A "clipboardpng" is a pointer to a PNG stream saved as the "png" clipboard format.
         if DllCall("IsClipboardFormatAvailable", "uint", DllCall("RegisterClipboardFormat", "str", "png", "uint"))
            return "ClipboardPng"

         ; A "clipboard" is a handle to a GDI bitmap saved as CF_BITMAP.
         else if DllCall("IsClipboardFormatAvailable", "uint", 2)
            return "Clipboard"

         else throw Exception("Image data is an empty string.")


      if not IsObject(image)
         goto string

      array:
      ; A "safearray" is a pointer to a SafeArray COM Object.
      if ComObjType(image) and ComObjType(image) & 0x2000
         return "SafeArray"

      ; A "screenshot" is an array of 4 numbers with an optional window.
      if image.length() ~= "4|5"
      && image[1] ~= "^-?\d+$" && image[2] ~= "^-?\d+$" && image[3] ~= "^\d+$" && image[4] ~= "^\d+$"
      && (image.HasKey(5) ? WinExist(image[5]) : True)
         return "Screenshot"

      object:
      ; A "window" is an object with an hwnd property.
      if image.HasKey("hwnd")
         return "Window"

      ; A "object" has a pBitmap property that points to an internal GDI+ bitmap.
      if image.HasKey("pBitmap")
         try if !DllCall("gdiplus\GdipGetImageType", "ptr", image.pBitmap, "ptr*", _type:=0) && (_type == 1)
            return "Object"

      if not image.HasKey("ptr")
         goto end

      ; Check if image is a pointer. If not, crash and do not recover.
      ("POINTER IS BAD AND PROGRAM IS CRASH") && NumGet(image.ptr, "char")

      ; An "encodedbuffer" contains a pointer to the bytes of an encoded image format.
      if image.HasKey("ptr") and image.HasKey("size") and this.IsImage(image.ptr, image.size)
         return "EncodedBuffer"

      ; A "buffer" is an object with a pointer to bytes and properties to determine its 2-D shape.
      if image.HasKey("ptr")
         and ( image.HasKey("width") && image.HasKey("height")
            or image.HasKey("stride") && image.HasKey("height")
            or image.HasKey("size") && (image.HasKey("stride") || image.HasKey("width") || image.HasKey("height")))
         return "Buffer"

      image := image.ptr
      goto pointer

      string:
      if (image == "")
         throw Exception("Image data is an empty string.")

      SysGet MonitorGetCount, MonitorCount ; A non-zero "monitor" number identifies each display uniquely; and 0 refers to the entire virtual screen.
      if (image ~= "^\d+$" && image >= 0 && image <= MonitorGetCount)
         return "Monitor"

      ; A "desktop" is a hidden window behind the desktop icons created by ImagePutDesktop.
      if (image = "desktop")
         return "Desktop"

      ; A "wallpaper" is the desktop wallpaper.
      if (image = "wallpaper")
         return "Wallpaper"

      ; A "cursor" is the name of a known cursor name.
      if (image ~= "(?i)^A_Cursor|Unknown|(IDC_)?(AppStarting|Arrow|Cross|Hand(writing)?|"
      . "Help|IBeam|No|Pin|Person|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait)$")
         return "Cursor"

      ; A "url" satisfies the url format.
      if this.IsUrl(image)
         return "Url"

      ; A "file" is stored on the disk or network.
      if FileExist(image)
         return "File"

      ; A "window" is anything considered a Window Title including ahk_class and "A".
      if WinExist(image) || DllCall("IsWindow", "ptr", image)
         return "Window"

      ; A "sharedbuffer" is a file mapping kernel object.
      if DllCall("CloseHandle", "ptr", DllCall("OpenFileMapping", "uint", 2, "int", 0, "str", image, "ptr"))
         return "SharedBuffer"

      ; A "hex" string is binary image data encoded into text using hexadecimal.
      if (StrLen(image) >= 48) && (image ~= "^\s*(?:[A-Fa-f0-9]{2})*+\s*$")
         return "Hex"

      ; A "base64" string is binary image data encoded into text using standard 64 characters.
      if (StrLen(image) >= 32) && (image ~= "^\s*(?:data:image\/[a-z]+;base64,)?"
      . "(?:[A-Za-z0-9+\/]{4})*+(?:[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{2}==)?\s*$")
         return "Base64"

      ; For more helpful error messages: Catch file names without extensions!
      if not (image ~= "^-?\d+$") {
         for i, extension in ["bmp","dib","rle","jpg","jpeg","jpe","jfif","gif","tif","tiff","png","ico","exe","dll"]
            if FileExist(image "." extension)
               throw Exception("A ." extension " file extension is required!", -4)

         goto end
      }

      handle:
      ; A "dc" is a handle to a GDI device context.
      if (DllCall("GetObjectType", "ptr", image, "uint") == 3 || DllCall("GetObjectType", "ptr", image, "uint") == 10)
         return "DC"

      ; An "hBitmap" is a handle to a GDI Bitmap.
      if (DllCall("GetObjectType", "ptr", image, "uint") == 7)
         return "HBitmap"

      ; An "hIcon" is a handle to a GDI icon.
      if DllCall("DestroyIcon", "ptr", DllCall("CopyIcon", "ptr", image, "ptr"))
         return "HIcon"

      ; Check if image is a pointer. If not, crash and do not recover.
      ("POINTER IS BAD AND PROGRAM IS CRASH") && NumGet(image+0, "char")

      ; A "bitmap" is a pointer to a GDI+ Bitmap. GdiplusStartup exception is caught above.
      try if !DllCall("gdiplus\GdipGetImageType", "ptr", image, "ptr*", _type:=0) && (_type == 1)
         return "Bitmap"

      ; Note 1: All GDI+ functions add 1 to the reference count of COM objects on 64-bit systems.
      ; Note 2: GDI+ pBitmaps that are queried cease to stay pBitmaps.
      ; Note 3: Critical error for ranges 0-4095 on v1 and 0-65535 on v2.
      (A_PtrSize == 8) && ObjRelease(image) ; Therefore do not move this, it has been tested.

      pointer:
      ; A "stream" is a pointer to the IStream interface.
      try if ComObjQuery(image, "{0000000C-0000-0000-C000-000000000046}")
         return "Stream", ObjRelease(image)

      ; A "randomaccessstream" is a pointer to the IRandomAccessStream interface.
      try if ComObjQuery(image, "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}")
         return "RandomAccessStream", ObjRelease(image)

      ; A "wicbitmap" is a pointer to a IWICBitmapSource.
      try if ComObjQuery(image, "{00000120-A8F2-4877-BA0A-FD2B6645FB94}")
         return "WicBitmap", ObjRelease(image)

      ; A "d2dbitmap" is a pointer to a ID2D1Bitmap.
      try if ComObjQuery(image, "{A2296057-EA42-4099-983B-539FB6505426}")
         return "D2dBitmap", ObjRelease(image)

      end:
      throw Exception("Image type could not be identified.")
   }

   ImageToBitmap(type, image, keywords := "") {

      try index := keywords.index

      if (type = "ClipboardPng")
         return this.ClipboardPngToBitmap()

      if (type = "Clipboard")
         return this.ClipboardToBitmap()

      if (type = "SafeArray")
         return this.SafeArrayToBitmap(image)

      if (type = "Screenshot")
         return this.ScreenshotToBitmap(image)

      if (type = "Window")
         return this.WindowToBitmap(image)

      if (type = "Object")
         return this.BitmapToBitmap(image.pBitmap)

      if (type = "EncodedBuffer")
         return this.EncodedBufferToBitmap(image)

      if (type = "Buffer")
         return this.BufferToBitmap(image)

      if (type = "SharedBuffer")
         return this.SharedBufferToBitmap(image)

      if (type = "Monitor")
         return this.MonitorToBitmap(image)

      if (type = "Desktop")
         return this.DesktopToBitmap()

      if (type = "Wallpaper")
         return this.WallpaperToBitmap()

      if (type = "Cursor")
         return this.CursorToBitmap()

      if (type = "Url")
         return this.UrlToBitmap(image)

      if (type = "File")
         return this.FileToBitmap(image)

      if (type = "Hex")
         return this.HexToBitmap(image)

      if (type = "Base64")
         return this.Base64ToBitmap(image)

      if (type = "DC")
         return this.DCToBitmap(image)

      if (type = "HBitmap")
         return this.HBitmapToBitmap(image)

      if (type = "HIcon")
         return this.HIconToBitmap(image)

      if (type = "Bitmap")
         return this.BitmapToBitmap(image)

      if (type = "Stream")
         return this.StreamToBitmap(image)

      if (type = "RandomAccessStream")
         return this.RandomAccessStreamToBitmap(image)

      if (type = "WicBitmap")
         return this.WicBitmapToBitmap(image)

      if (type = "D2dBitmap")
         return this.D2dBitmapToBitmap(image)

      throw Exception("Conversion from " type " to bitmap is not supported.")
   }

   BitmapToCoimage(cotype, pBitmap, p1:="", p2:="", p3:="", p4:="", p5:="", p6:="", p7:="", p*) {

      if (cotype = "Clipboard") ; (pBitmap)
         return this.BitmapToClipboard(pBitmap)

      if (cotype = "Screenshot") ; (pBitmap, pos, alpha)
         return this.BitmapToScreenshot(pBitmap, p1, p2)

      if (cotype = "Window") ; (pBitmap, title, pos, style, styleEx, parent, playback, cache)
         return this.BitmapToWindow(pBitmap, p1, p2, p3, p4, p5, p6, p7)

      if (cotype = "Show") ; (pBitmap, title, pos, style, styleEx, parent, playback, cache)
         return this.Show(pBitmap, p1, p2, p3, p4, p5, p6, p7)

      if (cotype = "EncodedBuffer") ; (pBitmap, extension, quality)
         return this.BitmapToEncodedBuffer(pBitmap, p1, p2)

      if (cotype = "Buffer") ; (pBitmap)
         return this.BitmapToBuffer(pBitmap)

      if (cotype = "SharedBuffer") ; (pBitmap, name)
         return this.BitmapToSharedBuffer(pBitmap, p1)

      if (cotype = "Desktop") ; (pBitmap)
         return this.BitmapToDesktop(pBitmap)

      if (cotype = "Wallpaper") ; (pBitmap)
         return this.BitmapToWallpaper(pBitmap)

      if (cotype = "Cursor") ; (pBitmap, xHotspot, yHotspot)
         return this.BitmapToCursor(pBitmap, p1, p2)

      if (cotype = "Url") ; (pBitmap)
         return this.BitmapToUrl(pBitmap)

      if (cotype = "File") ; (pBitmap, filepath, quality)
         return this.BitmapToFile(pBitmap, p1, p2)

      if (cotype = "Hex") ; (pBitmap, extension, quality)
         return this.BitmapToHex(pBitmap, p1, p2)

      if (cotype = "Base64") ; (pBitmap, extension, quality)
         return this.BitmapToBase64(pBitmap, p1, p2)

      if (cotype = "Uri") ; (pBitmap, extension, quality)
         return this.BitmapToUri(pBitmap, p1, p2)

      if (cotype = "DC") ; (pBitmap, alpha)
         return this.BitmapToDC(pBitmap, p1)

      if (cotype = "HBitmap") ; (pBitmap, alpha)
         return this.BitmapToHBitmap(pBitmap, p1)

      if (cotype = "HIcon") ; (pBitmap)
         return this.BitmapToHIcon(pBitmap)

      if (cotype = "Bitmap")
         return pBitmap

      if (cotype = "Stream") ; (pBitmap, extension, quality)
         return this.BitmapToStream(pBitmap, p1, p2)

      if (cotype = "RandomAccessStream") ; (pBitmap, extension, quality)
         return this.BitmapToRandomAccessStream(pBitmap, p1, p2)

      if (cotype = "WicBitmap") ; (pBitmap)
         return this.BitmapToWicBitmap(pBitmap)

      if (cotype = "Explorer") ; (pBitmap, default)
         return this.BitmapToExplorer(pBitmap, p1)

      if (cotype = "SafeArray") ; (pBitmap, extension, quality)
         return this.BitmapToSafeArray(pBitmap, p1, p2)

      if (cotype = "FormData") ; (pBitmap, boundary, extension, quality)
         return this.BitmapToFormData(pBitmap, p1, p2, p3)

      throw Exception("Conversion from bitmap to " cotype " is not supported.")
   }

   ImageToStream(type, image, keywords := "") {

      try index := keywords.index

      if (type = "ClipboardPng")
         return this.ClipboardPngToStream()

      if (type = "SafeArray")
         return this.SafeArrayToStream(image)

      if (type = "EncodedBuffer")
         return this.EncodedBufferToStream(image)

      if (type = "Url")
         return this.UrlToStream(image)

      if (type = "File")
         return this.FileToStream(image)

      if (type = "Hex")
         return this.HexToStream(image)

      if (type = "Base64")
         return this.Base64ToStream(image)

      if (type = "Stream")
         return this.StreamToStream(image)

      if (type = "RandomAccessStream")
         return this.RandomAccessStreamToStream(image)

      throw Exception("Conversion from " type " to stream is not supported.")
   }

   StreamToCoimage(cotype, stream, p1 := "", p2 := "", p*) {

      if (cotype = "Clipboard") ; (stream)
         return this.StreamToClipboard(stream)

      if (cotype = "EncodedBuffer") ; (stream)
         return this.StreamToEncodedBuffer(stream)

      if (cotype = "File") ; (stream, filepath)
         return this.StreamToFile(stream, p1)

      if (cotype = "Hex") ; (stream)
         return this.StreamToHex(stream)

      if (cotype = "Base64") ; (stream)
         return this.StreamToBase64(stream)

      if (cotype = "Uri") ; (stream)
         return this.StreamToUri(stream)

      if (cotype = "Stream")
         return stream

      if (cotype = "RandomAccessStream") ; (stream)
         return this.StreamToRandomAccessStream(stream)

      if (cotype = "Explorer") ; (stream, default)
         return this.StreamToExplorer(stream, p1)

      if (cotype = "SafeArray") ; (stream)
         return this.StreamToSafeArray(stream)

      if (cotype = "FormData") ; (stream, boundary)
         return this.StreamToFormData(stream, p1)

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
      crop[1] := Round(crop[1])
      crop[2] := Round(crop[2])
      crop[3] := Round(crop[1] + crop[3]) - Round(crop[1])
      crop[4] := Round(crop[2] + crop[4]) - Round(crop[2])

      ; Avoid cropping if no changes are detected.
      if (crop[1] = 0 && crop[2] = 0 && crop[3] == width && crop[4] == height)
         return pBitmap

      ; Minimum size is 1 x 1. Ensure that coordinates can never exceed the expected Bitmap area.
      safe_x := (crop[1] >= width)
      safe_y := (crop[2] >= height)
      safe_w := (crop[3] <= 0 || crop[1] + crop[3] > width)
      safe_h := (crop[4] <= 0 || crop[2] + crop[4] > height)

      ; Abort cropping if any of the changes would exceed a safe bound.
      if (safe_x || safe_y || safe_w || safe_h)
         return pBitmap

      ; Clone and retain a reference to the backing stream.
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", crop[1]
               ,    "int", crop[2]
               ,    "int", crop[3]
               ,    "int", crop[4]
               ,    "int", format
               ,    "ptr", pBitmap
               ,   "ptr*", pBitmapCrop:=0)

      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      return pBitmap := pBitmapCrop
   }

   BitmapScale(ByRef pBitmap, scale, direction := 0) {
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

      ; Force upscaling.
      if (direction > 0 and (safe_w < width && safe_h < height))
         return pBitmap

      ; Force downscaling.
      if (direction < 0 and (safe_w > width && safe_h > height))
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
      DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", ImageAttr, "int", 3, "uint", 0, "int", 0) ; WrapModeTileFlipXY
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

   BitmapSprite(ByRef pBitmap) {
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
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)
      }

      ; Sample the top-left pixel and set all matching pixels to be transparent.
      DllCall(code, "ptr", Scan0, "ptr", Scan0 + 4*width*height, "uint", NumGet(Scan0+0, "uint"), "cdecl")

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      return pBitmap
   }










   IsImage(ptr, size) {
      ; Shortest possible image is 24 bytes.
      if (size < 24)
         return False

      size := min(size, 2048)
      length := VarSetCapacity(str, (2*size + (size-1) + 1) * (A_IsUnicode ? 2 : 1))
      DllCall("crypt32\CryptBinaryToString", "ptr", ptr, "uint", size, "uint", 0x40000004, "str", str, "uint*", length)
      if str ~= "(?i)66 74 79 70 61 76 69 66"                                      ; "avif"
      || str ~= "(?i)^42 4d (.. ){36}00 00 .. 00 00 00"                            ; "bmp"
      || str ~= "(?i)^01 00 00 00 (.. ){36}20 45 4D 46"                            ; "emf"
      || str ~= "(?i)^47 49 46 38 (37|39) 61"                                      ; "gif"
      || str ~= "(?i)66 74 79 70 68 65 69 63"                                      ; "heic"
      || str ~= "(?i)^00 00 01 00"                                                 ; "ico"
      || str ~= "(?i)^ff d8 ff"                                                    ; "jpg"
      || str ~= "(?i)^25 50 44 46 2d"                                              ; "pdf"
      || str ~= "(?i)^89 50 4e 47 0d 0a 1a 0a"                                     ; "png"
      || str ~= "(?i)^(((?!3c|3e).. )|3c (3f|21) ((?!3c|3e).. )*3e )*+3c 73 76 67" ; "svg"
      || str ~= "(?i)^(49 49 2a 00|4d 4d 00 2a)"                                   ; "tif"
      || str ~= "(?i)^52 49 46 46 .. .. .. .. 57 45 42 50"                         ; "webp"
      || str ~= "(?i)^d7 cd c6 9a"                                                 ; "wmf"
         return True

      return False
   }

   IsUrl(url) {
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
            . RegExReplace("(?:(?:[a-z0-9\x{00a1}-\x{ffff}][a-z0-9\x{00a1}-\x{ffff}_-]{0,62})?[a-z0-9\x{00a1}-\x{ffff}]\.)+", "ffff", A_IsUnicode ? "ffff" : "ff")
            ; TLD identifier name, may end with dot
            . RegExReplace("(?:[a-z\x{00a1}-\x{ffff}]{2,}\.?)", "ffff", A_IsUnicode ? "ffff" : "ff")
         . ")"
         . "(?::\d{2,5})?" ; port number (optional)
         . "(?:[/?#]\S*)?$" ; resource path (optional)
   }

   ClipboardToBitmap() {
      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; Check for CF_DIB to retrieve transparent pixels when possible.
      if DllCall("IsClipboardFormatAvailable", "uint", 8)
         if !(handle := DllCall("GetClipboardData", "uint", 8, "ptr"))
            throw Exception("Shared clipboard data has been deleted.")

      ; Adjust Scan0 for top-down or bottom-up bitmaps.
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      width := NumGet(ptr + 4, "int")
      height := NumGet(ptr + 8, "int")
      bpp := NumGet(ptr + 14, "ushort")
      stride := ((height < 0) ? 1 : -1) * (width * bpp + 31) // 32 * 4
      pBits := ptr + 40
      Scan0 := (height < 0) ? pBits : pBits - stride*(height-1)

      ; Create a GDI+ Bitmap that owns its memory.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "uint", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Describe the current buffer holding the pixel data.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut(    stride, BitmapData,  8,    "int") ; Stride
         NumPut(     Scan0, BitmapData, 16,    "ptr") ; Scan0

      ; Use LockBits to copy pixel data from an external buffer into the internal GDI+ Bitmap.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0x26200A     ; Format32bppArgb (external buffer)
               ,    "ptr", &BitmapData) ; Contains the pointer to the external buffer.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      DllCall("CloseClipboard")
      return pBitmap
   }

   ClipboardPngToBitmap() {
      stream := this.ClipboardPngToStream()
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   ClipboardPngToStream() {
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

      if !(handle := DllCall("GetClipboardData", "uint", png, "ptr"))
         throw Exception("Shared clipboard PNG has been deleted.")

      DllCall("CloseClipboard")

      ; Create a new stream from the clipboard data.
      size := DllCall("GlobalSize", "ptr", handle, "uptr")
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", False, "ptr*", PngStream:=0, "uint")
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", True, "ptr*", stream:=0, "uint")
      DllCall("shlwapi\IStream_Copy", "ptr", PngStream, "ptr", stream, "uint", size, "uint")
      return stream
   }

   SafeArrayToBitmap(image) {
      stream := this.SafeArrayToBitmap(image)
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   SafeArrayToStream(image) {
      ; Expects a 1-D safe array of bytes. (VT_UI1)
      size := image.MaxIndex()
      pvData := NumGet(ComObjValue(image), 8 + A_PtrSize, "ptr")

      ; Copy data to a new stream.
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      DllCall("RtlMoveMemory", "ptr", ptr, "ptr", pvData, "uptr", size)
      DllCall("GlobalUnlock", "ptr", handle)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")
      return stream
   }

   EncodedBufferToBitmap(image) {
      stream := this.EncodedBufferToStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   EncodedBufferToStream(image) {
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", image.size, "ptr")
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      DllCall("RtlMoveMemory", "ptr", ptr, "ptr", image.ptr, "uptr", image.size)
      DllCall("GlobalUnlock", "ptr", handle)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")
      return stream
   }

   BufferToBitmap(image) {

      if image.HasKey("pitch")
         stride := image.pitch

      else if image.HasKey("stride")
         stride := image.stride
      else if image.HasKey("width")
         stride := image.width * 4
      else if image.HasKey("height") && image.HasKey("size")
         stride := image.size // image.height
      else throw Exception("Image buffer is missing a stride or pitch property.")

      if image.HasKey("height")
         height := image.height
      else if stride && image.HasKey("size")
         height := image.size // stride
      else if image.HasKey("width") && image.HasKey("size")
         height := image.size // (4 * image.width)
      else throw Exception("Image buffer is missing a height property.")

      if image.HasKey("width")
         width := image.width
      else if stride
         width := stride // 4
      else if height && image.HasKey("size")
         width := image.size // (4 * height)
      else throw Exception("Image buffer is missing a width property.")

      ; Could assert a few assumptions, such as stride * height = size.
      ; However, I'd like for the pointer and its size to be as flexable as possible.
      ; User is responsible for underflow.

      ; Check for buffer overflow errors.
      if image.HasKey("size") && (abs(stride * height) > image.size)
         throw Exception("Image dimensions exceed the size of the buffer.")

      ; User is responsible for ensuring that the pointer remains valid.
      if (height > 0) ; top-down bitmap
         DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", width, "int", height
         , "int", stride, "int", 0x26200A, "ptr", image.ptr, "ptr*", pBitmap:=0)
      else            ; bottom-up bitmap
         DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", width, "int", height
         , "int", -stride, "int", 0x26200A, "ptr", image.ptr + (height-1)*stride, "ptr*", pBitmap:=0)

      return pBitmap
   }

























































































































































































































   ScreenshotToBitmap(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; Allow the image to be a window handle.
      if !IsObject(image) and WinExist(image) || DllCall("IsWindow", "ptr", image) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         image := (hwnd := IsObject(image) ? image.hwnd : WinExist(image)) ? hwnd : image
         VarSetCapacity(rect, 16, 0)
         DllCall("GetClientRect", "ptr", image, "ptr", &rect)
         DllCall("ClientToScreen", "ptr", image, "ptr", &rect)
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         image := [NumGet(rect, 0, "int"), NumGet(rect, 4, "int"), NumGet(rect, 8, "int"), NumGet(rect, 12, "int")]
      }

      ; Adjust coordinates relative to specified window.
      if image.haskey(5) && (WinExist(image[5]) || DllCall("IsWindow", "ptr", image[5])) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         image[5] := (hwnd := WinExist(image[5])) ? hwnd : image[5]
         VarSetCapacity(rect, 16, 0)
         DllCall("GetClientRect", "ptr", image[5], "ptr", &rect)
         DllCall("ClientToScreen", "ptr", image[5], "ptr", &rect)
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         image[1] += NumGet(rect, 0, "int")
         image[2] += NumGet(rect, 4, "int")
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

   WindowToBitmap(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; Get the handle to the window.
      image := (hwnd := IsObject(image) ? image.hwnd : WinExist(image)) ? hwnd : image
      
      ; Test whether keystrokes can be sent to this window using a reserved virtual key code.
      PostMessage WM_KEYDOWN := 0x100, 0x88,,, % "ahk_id" image
      if ErrorLevel
         throw Exception("Administrator privileges are required to capture the window.")
      PostMessage WM_KEYUP := 0x101, 0x88, 0xC0000000,, % "ahk_id" image

      ; Restore the window if minimized! Must be visible for capture.
      if DllCall("IsIconic", "ptr", image)
         DllCall("ShowWindow", "ptr", image, "int", 4)

      ; Get the width and height of the client window.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      DllCall("GetClientRect", "ptr", image, "ptr", &Rect := VarSetCapacity(Rect, 16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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

   DesktopToBitmap() {
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
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      DllCall("GetClientRect", "ptr", WorkerW, "ptr", &Rect := VarSetCapacity(Rect, 16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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

   WallpaperToBitmap() {
      ; Get the width and height of all monitors.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      width  := DllCall("GetSystemMetrics", "int", 78, "int")
      height := DllCall("GetSystemMetrics", "int", 79, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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

   CursorToBitmap() {
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
      pBitmap := this.HIconToBitmap(hCursor)

      ; Cleanup the handle to the cursor. Same as DestroyIcon.
      DllCall("DestroyCursor", "ptr", hCursor)

      return pBitmap
   }

   UrlToBitmap(image) {
      stream := this.UrlToStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   UrlToStream(image) {
      req := ComObjCreate("WinHttp.WinHttpRequest.5.1")
      req.Open("GET", image, True)
      req.Send()
      req.WaitForResponse()
      stream := ComObjQuery(req.ResponseStream, "{0000000C-0000-0000-C000-000000000046}")
      return stream
   }

   FileToBitmap(image) {
      stream := this.FileToStream(image) ; Faster than GdipCreateBitmapFromFile and does not lock the file.
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   FileToStream(image) {
      file := FileOpen(image, "r")
      file.pos := 0
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", file.length, "ptr")
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      file.RawRead(ptr+0, file.length)
      DllCall("GlobalUnlock", "ptr", handle)
      file.Close()
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")
      return stream
   }

   HexToBitmap(image) {
      stream := this.HexToStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   HexToStream(image) {
      ; Trim whitespace and remove hexadecimal indicator.
      image := Trim(image)
      image := RegExReplace(image, "^(0[xX])")

      ; Retrieve the size of bytes from the length of the hex string.
      size := StrLen(image) / 2
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      bin := DllCall("GlobalLock", "ptr", handle, "ptr")

      ; Place the decoded hex string into a binary buffer.
      flags := 0xC ; CRYPT_STRING_HEXRAW
      DllCall("crypt32\CryptStringToBinary", "str", image, "uint", 0, "uint", flags, "ptr", bin, "uint*", size, "ptr", 0, "ptr", 0)

      ; Returns a stream that release the handle on ObjRelease().
      DllCall("GlobalUnlock", "ptr", handle)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")
      return stream
   }

   Base64ToBitmap(image) {
      stream := this.Base64ToStream(image)
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   Base64ToStream(image) {
      ; Trim whitespace and remove mime type.
      image := Trim(image)
      image := RegExReplace(image, "(?i)^data:image\/[a-z]+;base64,")

      ; Retrieve the size of bytes from the length of the base64 string.
      size := StrLen(RTrim(image, "=")) * 3 // 4
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
      bin := DllCall("GlobalLock", "ptr", handle, "ptr")

      ; Place the decoded base64 string into a binary buffer.
      flags := 0x1 ; CRYPT_STRING_BASE64
      DllCall("crypt32\CryptStringToBinary", "str", image, "uint", 0, "uint", flags, "ptr", bin, "uint*", size, "ptr", 0, "ptr", 0)

      ; Returns a stream that release the handle on ObjRelease().
      DllCall("GlobalUnlock", "ptr", handle)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")
      return stream
   }

   MonitorToBitmap(image) {
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
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
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
      return this.ScreenshotToBitmap([x,y,w,h])
   }

   DcToBitmap(image) {
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

   HBitmapToBitmap(image) {
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

   HIconToBitmap(image) {
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

   BitmapToBitmap(image) {
      ; Clone and retain a reference to the backing stream.
      DllCall("gdiplus\GdipCloneImage", "ptr", image, "ptr*", pBitmap:=0)
      return pBitmap
   }

   StreamToBitmap(image) {
      stream := this.StreamToStream(image) ; Below adds +3 references and seeks to 4096.
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   StreamToStream(image) {
      ; Creates a new, separate stream. Necessary to separate reference counting through a clone.
      DllCall(NumGet(NumGet(image+0)+A_PtrSize* 13), "ptr", image, "ptr*", stream:=0)
      ; Ensures that a duplicated stream does not inherit the original seek position.
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      return stream
   }

   RandomAccessStreamToBitmap(image) {
      stream := this.RandomAccessStreamToStream(image) ; Below adds +3 to the reference count.
      DllCall("gdiplus\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr*", pBitmap:=0)
      ObjRelease(stream)
      return pBitmap
   }

   RandomAccessStreamToStream(image) {
      ; Since an IStream returned from CreateStreamOverRandomAccessStream shares a reference count
      ; with the internal IStream of the RandomAccessStream, clone it so that reference counting begins anew.
      VarSetCapacity(IID_IStream, 16)
      DllCall("ole32\IIDFromString", "wstr", "{0000000C-0000-0000-C000-000000000046}", "ptr", &IID_IStream, "uint")
      DllCall("shcore\CreateStreamOverRandomAccessStream", "ptr", image, "ptr", &IID_IStream, "ptr*", stream:=0, "uint")
      DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 13), "ptr", stream, "ptr*", ClonedStream:=0)
      return ClonedStream
   }

   WicBitmapToBitmap(image) {
      ; IWICBitmapSource::GetSize - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L1304
      DllCall(NumGet(NumGet(image+0)+A_PtrSize* 3), "ptr", image, "uint*", width:=0, "uint*", height:=0)

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
      DllCall(NumGet(NumGet(image+0)+A_PtrSize* 7), "ptr", image, "ptr", &Rect, "uint", stride, "uint", stride * height, "ptr", Scan0)

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      return pBitmap
   }

   BitmapToClipboard(pBitmap) {
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

      ; #1 - PNG holds the transparency and is the most widely supported image format.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", stream:=0, "uint")
      DllCall("ole32\CLSIDFromString", "wstr", "{557CF406-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec:=VarSetCapacity(pCodec, 16), "uint")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", stream, "ptr", &pCodec, "ptr", 0)

      ; Set the rescued HGlobal to the
      DllCall("ole32\GetHGlobalFromStream", "ptr", stream, "uint*", handle:=0, "uint")
      ObjRelease(stream)

      ; Set the clipboard data. GlobalFree will be called by the system.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint") ; case insensitive
      DllCall("SetClipboardData", "uint", png, "ptr", handle)


      ; #2 - Fallback to the CF_DIB format (bottom-up bitmap) for maximum compatibility.
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

      ; Copy the BITMAPINFOHEADER and pixel data respectively.
      DllCall("RtlMoveMemory", "ptr", pdib, "ptr", &dib + (A_PtrSize = 4 ? 24:32), "uptr", 40)
      DllCall("RtlMoveMemory", "ptr", pdib+40, "ptr", pBits, "uptr", size)

      ; Unlock to moveable memory because the clipboard requires it.
      DllCall("GlobalUnlock", "ptr", hdib)
      DllCall("DeleteObject", "ptr", hbm)

      ; CF_DIB (8) can be synthesized into CF_DIBV5 (17) and CF_BITMAP (2) with delayed rendering.
      DllCall("SetClipboardData", "uint", 8, "ptr", hdib)

      ; Close the clipboard.
      DllCall("CloseClipboard")
      return ""
   }

   StreamToClipboard(stream) {
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; 2048 characters should be good enough to identify the file correctly.
      size := min(size, 2048)
      VarSetCapacity(bin, size)

      ; Get the first few bytes of the image.
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; Allocate enough space for a hexadecimal string with spaces interleaved and a null terminator.
      length := 2*size + (size-1) + 1
      VarSetCapacity(str, length * (A_IsUnicode?2:1))

      ; Lift the binary representation to hex.
      flags := 0x40000004 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEX
      DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Determine the file extension using herustics. See: http://fileformats.archiveteam.org
      extension := 0                                                              ? ""
      : str ~= "(?i)66 74 79 70 61 76 69 66"                                      ? "avif" ; ftypavif
      : str ~= "(?i)^42 4d (.. ){36}00 00 .. 00 00 00"                            ? "bmp"  ; BM
      : str ~= "(?i)^01 00 00 00 (.. ){36}20 45 4D 46"                            ? "emf"  ; emf
      : str ~= "(?i)^47 49 46 38 (37|39) 61"                                      ? "gif"  ; GIF87a or GIF89a
      : str ~= "(?i)66 74 79 70 68 65 69 63"                                      ? "heic" ; ftypheic
      : str ~= "(?i)^00 00 01 00"                                                 ? "ico"
      : str ~= "(?i)^ff d8 ff"                                                    ? "jpg"
      : str ~= "(?i)^25 50 44 46 2d"                                              ? "pdf"  ; %PDF-
      : str ~= "(?i)^89 50 4e 47 0d 0a 1a 0a"                                     ? "png"  ; PNG
      : str ~= "(?i)^(((?!3c|3e).. )|3c (3f|21) ((?!3c|3e).. )*3e )*+3c 73 76 67" ? "svg"  ; <svg
      : str ~= "(?i)^(49 49 2a 00|4d 4d 00 2a)"                                   ? "tif"  ; II* or MM*
      : str ~= "(?i)^52 49 46 46 .. .. .. .. 57 45 42 50"                         ? "webp" ; RIFF....WEBP
      : str ~= "(?i)^d7 cd c6 9a"                                                 ? "wmf"
      : "" ; Extension must be blank for file pass-through as-is.

      ; Creates a dummy window solely for the purpose of receiving clipboard messages.
      if !(hwnd := DllCall("FindWindow", "str", "AutoHotkey", "str", "_StreamToClipboard", "ptr")) {
         hwnd := DllCall("CreateWindowEx", "uint", 0, "str", "AutoHotkey", "str", "_StreamToClipboard"
         , "uint", 0, "int", 0, "int", 0, "int", 0, "int", 0, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "ptr")
         DllCall("SetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", -4, "ptr", RegisterCallback(this.StreamToClipboardProc,,, &this)) ; GWLP_WNDPROC = -4
      }

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", hwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Clipboard could not be opened.")

      ; Requires a valid window handle via OpenClipboard or the next call to OpenClipboard will crash.
      DllCall("EmptyClipboard")

      ; Save PNG directly to the clipboard.
      if (extension = "png") {
         ; Clone the stream. Can't use IStream::Clone because the cloned stream must be released.
         DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
         handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", size, "ptr")
         DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", False, "ptr*", ClonedStream:=0, "uint")
         DllCall("shlwapi\IStream_Copy", "ptr", stream, "ptr", ClonedStream, "uint", size, "uint")
         DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
         ObjRelease(ClonedStream)

         png := DllCall("RegisterClipboardFormat", "str", "png", "uint") ; case insensitive
         DllCall("SetClipboardData", "uint", png, "ptr", handle)
      }

      ; Copy other formats to a file and pass a (15) DROPFILES struct.
      ; This should be a complete substitute for CF_DIB(8) as some programs don't support PNG.
      if (extension) {
         filepath := A_ScriptDir "\clipboard." extension
         filepath := RTrim(filepath, ".") ; Remove trailing periods.

         ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
         DllCall("shlwapi\SHCreateStreamOnFileEx"
                  ,   "wstr", filepath
                  ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
                  ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
                  ,    "int", True            ; fCreate is ignored when STGM_CREATE is set.
                  ,    "ptr", 0               ; pstmTemplate (reserved)
                  ,   "ptr*", FileStream:=0
                  ,   "uint")
         DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
         DllCall("shlwapi\IStream_Copy", "ptr", stream, "ptr", FileStream, "uint", size, "uint")
         DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
         ObjRelease(FileStream)

         ; struct DROPFILES - https://learn.microsoft.com/en-us/windows/win32/api/shlobj_core/ns-shlobj_core-dropfiles
         nDropFiles := 20 + StrPut(filepath, "UTF-16") * (A_IsUnicode?2:1) + 2 ; triple/quadruple null terminated
         hDropFiles := DllCall("GlobalAlloc", "uint", 0x42, "uptr", nDropFiles, "ptr")
         pDropFiles := DllCall("GlobalLock", "ptr", hDropFiles, "ptr")
            NumPut(20, pDropFiles + 0, "uint") ; pFiles
            NumPut(1, pDropFiles + 16, "uint") ; fWide
            StrPut(filepath, pDropFiles + 20, "UTF-16")
         DllCall("GlobalUnlock", "ptr", hDropFiles)

         ; Set the file to the clipboard as a shared object.
         DllCall("SetClipboardData", "uint", 15, "ptr", hDropFiles)

         ; Clean up the file when EmptyClipboard is called by another program.
         obj := {filepath: filepath, hDropFiles: hDropFiles}
         ptr := &obj
         ObjAddRef(ptr)
         DllCall("SetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", -21, "ptr", ptr, "ptr") ; GWLP_USERDATA = -21
      }

      ; Close the clipboard.
      DllCall("CloseClipboard")
      return ""
   }
      StreamToClipboardProc(uMsg, wParam, lParam) {
         hwnd := this
         ; WM_DESTROYCLIPBOARD
         if (uMsg = 0x0307)
            if ptr := DllCall("GetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", -21, "ptr") {
               obj := Object(ptr) ; Self-destructs at end of scope.
               DllCall("GlobalFree", "ptr", obj.hDropFiles)
               DllCall("DeleteFile", "str", obj.filepath)
               DllCall("SetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", -21, "ptr", 0, "ptr") ; GWLP_USERDATA = -21
            }
         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr")
      }


   BitmapToEncodedBuffer(pBitmap, extension := "", quality := "") {
      ; Defaults to PNG for small sizes!
      stream := this.BitmapToStream(pBitmap, (extension) ? extension : "png", quality)

      ; Get a pointer to the encoded image data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", stream, "ptr*", handle:=0, "uint")
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      size := DllCall("GlobalSize", "ptr", handle, "uptr")

      ; Copy data into a buffer.
      buf := {ptr: _ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", size, "ptr"), size: size, base: {__Delete: Func("DllCall").bind("GlobalFree", "ptr", _ptr)}}
      DllCall("RtlMoveMemory", "ptr", buf.ptr, "ptr", ptr, "uptr", size)

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", handle)
      ObjRelease(stream)

      return buf
   }

   StreamToEncodedBuffer(stream) {
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      buf := {ptr: _ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", size, "ptr"), size: size, base: {__Delete: Func("DllCall").bind("GlobalFree", "ptr", _ptr)}}
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", buf.ptr, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      return buf
   }

   BitmapToBuffer(pBitmap) {
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

   SharedBufferToBuffer(image) {
      hMap := DllCall("OpenFileMapping", "uint", 0x2, "int", 0, "str", image, "ptr")
      pMap := DllCall("MapViewOfFile", "ptr", hMap, "uint", 0x2, "uint", 0, "uint", 0, "uptr", 0, "ptr")

      width := NumGet(pMap + 0, "uint")
      height := NumGet(pMap + 4, "uint")
      size := 4 * width * height
      ptr := pMap + 8

      free := DllCall.bind("UnmapViewOfFile", "ptr", pMap)
      ;   DllCall("UnmapViewOfFile", "ptr", pMap),
      ;   DllCall("CloseHandle", "ptr", hMap)
      ;)

      buf := new ImagePut.BitmapBuffer(ptr, size, width, height, free)
      buf.name := image
      return buf
   }

   SharedBufferToBitmap(image) {
      hMap := DllCall("OpenFileMapping", "uint", 0x2, "int", 0, "str", image, "ptr")
      pMap := DllCall("MapViewOfFile", "ptr", hMap, "uint", 0x2, "uint", 0, "uint", 0, "uptr", 0, "ptr")

      width := NumGet(pMap + 0, "uint")
      height := NumGet(pMap + 4, "uint")
      size := 4 * width * height
      ptr := pMap + 8

      ; Create a pBitmap that owns its memory.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", pBitmap:=0)

      ; Create a Scan0 buffer pointing to pBits.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(       ptr, BitmapData, 16,    "ptr") ; Scan0

      ; Use LockBits to create a writable buffer that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (pBits) to the hbm.

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      DllCall("UnmapViewOfFile", "ptr", pMap)
      DllCall("CloseHandle", "ptr", hMap)

      return pBitmap
   }

   BitmapToSharedBuffer(pBitmap, name := "Alice") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Allocate shared memory.
      size := 4 * width * height
      hMap := DllCall("CreateFileMapping", "ptr", -1, "ptr", 0, "uint", 0x4, "uint", 0, "uint", size, "str", name, "ptr")
      pMap := DllCall("MapViewOfFile", "ptr", hMap, "uint", 0x2, "uint", 0, "uint", 0, "uptr", 0, "ptr")

      ; Store width and height in the first 8 bytes.
      NumPut( width, pMap + 0, "uint")
      NumPut(height, pMap + 4, "uint")
      ptr := pMap + 8

      ; Target a pixel buffer.
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

      ; Write pixels to buffer.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ; Free the pixels later.
      free := DllCall.bind("UnmapViewOfFile", "ptr", pMap)
      ;free := () => (
      ;   DllCall("UnmapViewOfFile", "ptr", pMap),
      ;)

      buf := new ImagePut.BitmapBuffer(ptr, size, width, height, free)
      buf.name := name
      return buf
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
         return Format("0x{:08X}", NumGet(this.ptr + 4*(y*this.width + x), "uint"))
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
         try return ImagePut.BitmapToBuffer(pBitmap)
         finally DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      Show(window_border := False, title := "", pos := "", style := "", styleEx := "", parent := "") {
         return (window_border)
            ? ImagePut.BitmapToWindow(this.pBitmap, title, pos, style, styleEx, parent)
            : ImagePut.show(this.pBitmap, title, pos, style, styleEx, parent)
      }

      Save(filepath := "", quality := "")  {

         ; Process filepath and set extension.
         extension := "bmp"
         ImagePut.select_filepath(filepath, extension)

         ; If extension is not .bmp, use to_file routine.
         if (extension != "bmp")
            return ImagePut.BitmapToFile(this.pBitmap, filepath, quality)

         ; Note because the ARGB values are 4-byte aligned it's not a "packed" bitmap.
         VarSetCapacity(bm, 56)

         StrPut("BM", &bm, "CP0")               ; identifier
         NumPut(56+this.size, bm,  2,   "uint") ; file size
         NumPut(           0, bm,  6,   "uint") ; reserved
         NumPut(          56, bm, 10,   "uint") ; bitmap data offset

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

         file.RawWrite(bm, 56)                ; Writes 54 bytes of bitmap file header.
         file.RawWrite(this.ptr+0, this.size) ; Writes raw 32-bit ARGB pixel data.
         file.Close()

         return filepath
      }

      Base64Code(b64) {
         static codes := {}

         if codes.haskey(b64)
            return codes[b64]

         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)

         return codes[b64] := code
      }

      AVX2() {
         ; This is just plain old AVX, not a check for AVX2 (which is neexed for pixelsearch1y)
         ; Also see: https://store.steampowered.com/hwsurvey/steam-hardware-software-survey-welcome-to-steam
         ; C source code - https://godbolt.org/z/n8fxxdsfs
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnli0UIi1UQi00UO0UMcws5EHUCiQiDwATr8F3D" ; not implemented
            : "U0UxwLgBAAAARInBD6IPuuEbcxkPuuEccxNEicEPAdBI99CoBg+UwA+2wOsCMcBbww==")

         return DllCall(code, "int")
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
            DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)

            ; Set eax flag to 1 to retrieve supported CPU features.
            ; See this for CPU features: https://wiki.osdev.org/CPUID
            ; Also see: Appendix D.2 - CPUID Feature Flags Related to Instruction Support
            ; On page 1861 - https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
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
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnli0UIi1UQi00UO0UMcws5EHUCiQiDwATr8F3D"
            : "SDnRcw5EOQF1A0SJCUiDwQTr7cM=")

         ; Select top-left pixel as default.
         (key == "sentinel") && key := NumGet(this.ptr, "uint")

         ; Replaces one ARGB color with another.
         DllCall(code, "ptr", this.ptr, "uint", this.ptr + this.size, "uint", key, "uint", value, "cdecl")
      }

      SetAlpha(alpha := 0xFF) {
         ; C source code - https://godbolt.org/z/aWf73jTqc
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnli0UIilUQO0UMcwiIUAODwATr813D"
            : "SDnRcwpEiEEDSIPBBOvxww==")

         ; Sets the transparency of the entire bitmap.
         DllCall(code, "ptr", this.ptr, "ptr", this.ptr + this.size, "uchar", alpha, "cdecl")
      }

      TransColor(color := "sentinel", alpha := 0x00) {
         ; C source code - https://godbolt.org/z/z3a8WcM5M
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnli0UIilUUO0UMcxWLTRAzCIHh////AHUDiFADg8AE6+Zdww=="
            : "SDnRcxaLAUQxwKn///8AdQREiEkDSIPBBOvlww==")

         ; Select top-left pixel as default.
         (color == "sentinel") && color := NumGet(this.ptr, "uint")

         ; Sets the alpha value of a specified RGB color.
         DllCall(code, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "uchar", alpha, "cdecl")
      }

      ; Option 1: PixelSearch, single color with no variation.
      ; Option 2: PixelSearch, single color with single variation.
      ; Option 3: PixelSearch, single color with multiple variation.
      ; Option 4: PixelSearch, range of colors.
      ; Option 5: PixelSearch, multiple colors with no variation.
      ; Option 6: PixelSearch, multiple colors with single variation.
      ; Option 7: PixelSearch, multiple colors with multiple variation.

      PixelSearch(color, variation := 0) {

         if not IsObject(color) {

            ; Lift color to 32-bits if first 8 bits are zero.
            (color >> 24) || color |= 0xFF000000

            if not IsObject(variation)
               if (variation == 0)
                  option := 1
               else
                  option := 2
            else if (variation.length() == 3)
                  option := 3
            else if (variation.length() == 6)
                  option := 4
            else throw Exception("Invalid variation parameter.")
         }
         else
            if not IsObject(variation)
               if (variation == 0)
                  option := 5
               else
                  option := 6
            else if (variation.length() == 3)
                  option := 7
            else throw Exception("Invalid variation parameter.")

         ; ------------------------ Machine code generated with MCode4GCC using gcc 13.2.0 ------------------------

         ; C source code - https://godbolt.org/z/zr71creqn
         pixelsearch1 := this.Base64Code((A_PtrSize == 4)
            ? "VYnlVotNEItVDFOLRQhmD27RjVr0Zg9wygA52HMbDxAAZg92wWYP1/CF9nUMg8AQ6+g5CHQHg8AEOdBy9VteXcM="
            : "ZkEPbtBIichIjUr0Zg9wygBIOchzIA8QAGYPdsFmRA/XyEWFyXUPSIPAEOvkRDkAdAlIg8AESDnQcvLD")

         ; C source code - https://godbolt.org/z/65Yvsvs1G
         pixelsearch2 := this.Base64Code((A_PtrSize == 4)
            ? "VWYPduSJ5VdWU4Pk8IPsEIpFFItdEItNGItVHIt1DIt9IIhEJA6KRSSIXCQPD7bbiEwkDcHjEA+2yYhEJAsPtkUgweEIiFQkDA+2"
            . "0gnYweIICcgPtk0kDQAAAP8J0Q+2VRRmD27oi0UIZg9wzQDB4hAJ0Y1W9GYPbvFmD3DWADnQczkPEAAPEBgPEDhmD97BZg/e2mYP"
            . "dMFmD3TfD1TDZg92xGYP18iFyXURg8AQ68+KUAI4VCQPcwmDwAQ58HLw6yM6VCQOcvGKUAE4VCQNcug6VCQMcuKKEIn5ONFy2jpU"
            . "JAty1I1l9FteX13D"
            : "QVZBVUFUVVdWU0SLbCRgi0QkaESLdCRwRItUJHhEie6Jx0UPtu0PtsBBweUIRIn1RQ+29kWJ1EWJw0UPtsBEicvB4AhBweAQRQ+2"
            . "0kUPtslFCfBECdBBweEQRQnoRAnIQYHIAAAA/2YPbuhIichmQQ9uyEiNSvRmD3DBAGYPcM0AZg927Ug5yHM8DxAgDyjQDyjcZg/e"
            . "1GYP3tlmD3TQZg903A9U02YPdtVmRA/XwkWFwHUSSIPAEOvLikgCQTjLcwtIg8AESDnQcu/rHTjZcvGKSAFAOM5y6UA4+XLkighA"
            . "OM1y3UQ44XLYW15fXUFcQV1BXsM=")

         ; C source code - https://godbolt.org/z/GaEE4r3aW
         pixelsearch3 := this.Base64Code((A_PtrSize == 4)
            ? "VTHSieVXVlOD5PCD7BCLfQyNR/SJRCQEi0UUKdAPhBkBAACD+AF0PoP4AnQhg/gDvgMAAAAPTHQkDIl0JAyLdRBmD25klghmD3Dc"
            . "AOsIx0QkDAIAAACLXRBmD25skwRmD3DVAOsIx0QkDAEAAACLdRBmD240lo0clolcJAhmD3DOAIP4AXR0g/gCi0UIdD6LTCQEOchz"
            . "Lg8QAGYPdsFmD9fYDxAAidlmD3bCZg/X2A8QAAnLZg92w2YP1/AJ83V0g8AQ68qDwgPpS////4139Dnwcx8PEABmD3bBZg/XyA8Q"
            . "AGYPdsJmD9fYCct1RoPAEOvdg8IC6R3///+LRQiNX/Q52HMUDxAAZg92wWYP1/CF9nUgg8AQ6+hC6fn+//+LTCQIiwyROQh0FEI5"
            . "VCQMf+6DwAQ5+HMGMdLr74n4jWX0W15fXcM="
            : "QVVBVFVXVlO9AwAAAEmJykiJ0THSSI1x9ESJyCnQD4QEAQAAg/gBSGPadC6D+AJ0FWZBD25smAiD+ANED03dZg9w3QDrBkG7AgAA"
            . "AGZBD25smARmD3DVAOsGQbsBAAAAZkEPbgyYSY08mGYPcMkAg/gBdHOD+AJMidB0Xkg58HMxDxAADyjhZg924GZED9fsDyjiZg92"
            . "4GYPdsNmD9fcZkQP1+BECetECeN1c0iDwBDryoPCA+lf////DxAADyjhZg924GYPdsJmRA/X5GYP19hECeN1SUiDwBBIOfBy24PC"
            . "Auky////TInQSDnwcxUPEABmD3bBZg/X2IXbdSFIg8AQ6+b/wukO////SP/Ci3SX/DkwdBVBOdN/8EiDwARIOchzBzHS6+5Iichb"
            . "Xl9dQVxBXcM=")

         ; C source code - https://godbolt.org/z/oE5Knfc7W
         pixelsearch4 := this.Base64Code((A_PtrSize == 4)
            ? "VTHAZg925InlV1ZTg+Twg+xAi1UYKcIPhFMCAACD+gF0YIP6AnQzi10Qg/oDuQMAAAAPTflmD25sgwiLXRRmD3D9AA8pfCQwZg9u"
            . "fIMIZg9w3wAPKVwkEOsFvwIAAACLXRBmD25sgwSLXRRmD258gwRmD3DdAGYPcM8ADylMJCDrBb8BAAAAi10QjQyFAAAAAAHLiVwk"
            . "DItdEGYPbiwLi10UZg9uPAuNNAtmD3DNAIl0JAiLdQhmD3DvAIP6AQ+ECwEAAItNDIPpDIP6Ag+EnAAAADnOD4OMAAAADxAGDyjw"
            . "DyjQZg/e9WYP3tFmD3TwZg900Q9U1g8o8GYPdtRmD97zZg9082YP19oPKFQkIGYP3tBmD3TQD1TWDyh0JDBmD3bUZg/e8GYPdHQk"
            . "MGYP19IPKFQkEIlUJARmD97QZg900A9U1mYPdtRmD9fSiRQki1QkBAnaCxQkD4XLAAAAg8YQ6Wz///+DwAPpo/7//2YPdv85znNQ"
            . "DxAWDyjyDyjCZg/e9WYP3sFmD3TyZg90wQ9Uxg8odCQgZg92x2YP3vJmD3TyZg/X2A8owmYP3sNmD3TDD1TGZg92x2YP19AJ2nVo"
            . "g8YQ66yDwALpQ/7//4tVDGYPdvaD6gw51nMtDxAWDxAGDxA+Zg/e1WYP3sFmD3TBZg901w9UwmYPdsZmD9fIhcl1JYPGEOvPQOkC"
            . "/v//OFoCczr/RCQwg8IEg8AEi0wkMDnPf+mDxgQ7dQxzRIpGATHJil4CiUwkMItUJAyIRCQgigaIRCQQi0QkCOvQOlgCcsGKTCQg"
            . "OEoBcrg6SAFys4pMJBA4CnKrOghyp+sDi3UMjWX0ifBbXl9dww=="
            : "QVRVV1ZTSIPsUA8pNCQPKXwkEEQPKUQkIEQPKUwkMEQPKVQkQL8DAAAAZg9220mJ00iJyzHSSY1z9IuMJKAAAAAp0Q+EMgIAAIP5"
            . "AUhjwnRGg/kCdCFmQQ9ufIAIZkEPbnSBCIP5A0QPTddmD3DvAGYPcP4A6wZBugIAAABmQQ9uZIAEZkEPbnSBBGYPcNQAZg9w9gDr"
            . "BkG6AQAAAGZBD24kgGYPcMwAZkEPbiSBSInYZg9w5ACD+QEPhCIBAACD+QIPhKsAAABIOfAPg5oAAAAPEABEDyjIRA8owGZED97M"
            . "ZkQP3sFmRA90yGZED3TBRQ9UwUQPKMhmRA92w2ZED97KZkQPdMpmRQ/X4EQPKMBmRA/exmZED3TARQ9UwUQPKMhmRA92w2ZED97N"
            . "ZkQPdM1mQQ/XyEQPKMBmRA/ex0QJ4WZBD3TAQQ9UwWYPdsNmD9foCel0C8HiAkhj0unfAAAASIPAEOld////g8ID6cf+//9mRQ92"
            . "wEg58HNcRA8QCEUPKNFBDyjBZkQP3tRmD97BZkUPdNFmD3TBQQ9UwkUPKNFmQQ92wGZED97WZg/X6EEPKMFmD97CZkUPdMpmD3TC"
            . "QQ9UwWZBD3bAZg/XyAnpdYRIg8AQ65+DwgLpWf7//2ZFD3bJSDnwczlEDxAARQ8o0EEPKMBmRA/e1GYP3sFmD3TBZkUPdMJBD1TA"
            . "ZkEPdsFmD9fIhckPhTn///9Ig8AQ68L/wukP/v//QTh0CAJzJv/DSIPBBEE52n/uSIPABEw52HM4QIpwAkCKeAFIidEx20CKKOvg"
            . "QTp0CQJy00E4fAgBcsxBOnwJAXLFQTgsCHK/QTosCXK56wNMidgPKDQkDyh8JBBEDyhEJCBEDyhMJDBEDyhUJEBIg8RQW15fXUFc"
            . "ww==")

         ; --------------------------------------------------------------------------------------------------------

         ; When doing pointer arithmetic, *Scan0 + 1 is actually adding 4 bytes.
         if (option == 1)
            address := DllCall(pixelsearch1, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl ptr")

         if (option == 2) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            v := abs(variation)

            address := DllCall(pixelsearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r+v, 255)
                     , "uchar", max(r-v, 0)
                     , "uchar", min(g+v, 255)
                     , "uchar", max(g-v, 0)
                     , "uchar", min(b+v, 255)
                     , "uchar", max(b-v, 0)
                     , "cdecl ptr")
         }

         if (option == 3) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            vr := abs(variation[1])
            vg := abs(variation[2])
            vb := abs(variation[3])

            address := DllCall(pixelsearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r + vr, 255)
                     , "uchar", max(r - vr, 0)
                     , "uchar", min(g + vg, 255)
                     , "uchar", max(g - vg, 0)
                     , "uchar", min(b + vb, 255)
                     , "uchar", max(b - vb, 0)
                     , "cdecl ptr")
         }

         if (option == 4)
            address := DllCall(pixelsearch2, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(max(variation[1], variation[2]), 255)
                     , "uchar", max(min(variation[1], variation[2]), 0)
                     , "uchar", min(max(variation[3], variation[4]), 255)
                     , "uchar", max(min(variation[3], variation[4]), 0)
                     , "uchar", min(max(variation[5], variation[6]), 255)
                     , "uchar", max(min(variation[5], variation[6]), 0)
                     , "cdecl ptr")

         if (option == 5) {
            ; Create a struct of unsigned integers.
            VarSetCapacity(colors, 4*color.length())

            ; Fill the struct by iterating through the input array.
            for i, c in color {
                (c >> 24) || c |= 0xFF000000             ; Lift colors to 32-bit ARGB.
                NumPut(c, colors, 4*(A_Index-1), "uint") ; Place the unsigned int at each offset.
            }

            address := DllCall(pixelsearch3, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &colors, "uint", color.length(), "cdecl ptr")
         }

         ; Options 6 & 7 - Creates a high and low struct where each pair is the min and max range.

         if (option == 6) {
            VarSetCapacity(high, 4*color.length())
            VarSetCapacity(low, 4*color.length())

            for i, c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               v := abs(variation)

               NumPut(255, high, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(min(r+v, 255), high, 4*A_Offset + 2, "uchar")
               NumPut(min(g+v, 255), high, 4*A_Offset + 1, "uchar")
               NumPut(min(b+v, 255), high, 4*A_Offset + 0, "uchar")

               NumPut(0, low, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(max(r-v, 0), low, 4*A_Offset + 2, "uchar")
               NumPut(max(g-v, 0), low, 4*A_Offset + 1, "uchar")
               NumPut(max(b-v, 0), low, 4*A_Offset + 0, "uchar")
            }

            address := DllCall(pixelsearch4, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &high, "ptr", &low, "uint", color.length(), "cdecl ptr")
         }

         if (option == 7) {
            VarSetCapacity(high, 4*color.length())
            VarSetCapacity(low, 4*color.length())

            for i, c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               vr := abs(variation[1])
               vg := abs(variation[2])
               vb := abs(variation[3])

               NumPut(255, high, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(min(r + vr, 255), high, 4*A_Offset + 2, "uchar")
               NumPut(min(g + vg, 255), high, 4*A_Offset + 1, "uchar")
               NumPut(min(b + vb, 255), high, 4*A_Offset + 0, "uchar")

               NumPut(0, low, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(max(r - vr, 0), low, 4*A_Offset + 2, "uchar")
               NumPut(max(g - vg, 0), low, 4*A_Offset + 1, "uchar")
               NumPut(max(b - vb, 0), low, 4*A_Offset + 0, "uchar")
            }

            address := DllCall(pixelsearch4, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &high, "ptr", &low, "uint", color.length(), "cdecl ptr")
         }

         ; Compare the address to the out-of-bounds limit.
         if (address == this.ptr + this.size)
            return False

         ; Return an [x, y] array.
         offset := (address - this.ptr) // 4
         return [mod(offset, this.width), offset // this.width]
      }

      PixelSearchAll(color, variation := 0) {

         if not IsObject(color) {

            ; Lift color to 32-bits if first 8 bits are zero.
            (color >> 24) || color |= 0xFF000000

            if not IsObject(variation)
               if (variation == 0)
                  option := 1
               else
                  option := 2
            else if (variation.length() == 3)
                  option := 3
            else if (variation.length() == 6)
                  option := 4
            else throw Exception("Invalid variation parameter.")
         }
         else
            if not IsObject(variation)
               if (variation == 0)
                  option := 5
               else
                  option := 6
            else if (variation.length() == 3)
                  option := 7
            else throw Exception("Invalid variation parameter.")

         ; ------------------------ Machine code generated with MCode4GCC using gcc 13.2.0 ------------------------

         ; C source code - https://godbolt.org/z/GYMPYv4qT
         pixelsearchall1 := this.Base64Code((A_PtrSize == 4)
            ? "VTHSieVXZg9uVRiLRRBWU4tdFGYPcMoAjXP0OfBzDw8QAGYPdsFmD9fIhcl0BY1IEOsVjUgQicjr4TnIdPiLfRg5OHQJg8AEOdhy"
            . "7usOO1UMcwaLfQiJBJdC6+lbidBeX13D"
            : "VlMxwESLVCQ4ZkEPbtJmD3DKAEmNWfRJOdhNjVgQcyNBDxAAZg92wWYP1/CF9nUTTYnY6+JNOdh09kU5EHQLSYPABE05yHLt6w45"
            . "0HMGicZMiQTx/8Dr51teww==")

         ; C source code - https://godbolt.org/z/G5vYe5c8c
         pixelsearchall2 := this.Base64Code((A_PtrSize == 4)
            ? "VWYPduSJ5VdWU4Pk8IPsEItdGItNIItVKIpFHIhcJA8PttuLfRTB4xCIRCQOikUkiEwkDQ+2yY139IhUJAsPttLB4QgJ2ohEJAyK"
            . "RSwJyg+2TSQPttiBygAAAP+IRCQKweEIZg9u6jHSCcsPtk0cZg9wzQDB4RAJy2YPbvNmD3DWADl1EHMri0UQDxAADxAYDxA4Zg/e"
            . "wWYP3tpmD3TBZg903w9Uw2YPdsRmD9fIhcl0CItFEI1IEOsgi0UQjUgQiU0Q6705TRB09otFEIpYAjhcJA9zC4NFEAQ5fRBy5us0"
            . "OlwkDnLvilgBOFwkDXLmOlwkDHLgihg4XCQLctg6XCQKctI7VQxzCYtFCItdEIkckELrwY1l9InQW15fXcM="
            : "QVdBVkFVQVRVV1ZTRItUJGiLhCSIAAAARIucJJAAAABAimwkcESJ10UPttJBicYPtsBBweIQRYnfRQ+220iJy4tMJHiJ1ouUJIAA"
            . "AABECdBNjVH0QYnMD7bJQYnVD7bSweEIweIICchAD7bNRAnaweEQDQAAAP8JymYPbsAxwGYPbupmD3DIAGYPcMUAZg927U050EmN"
            . "UBBzQEEPECAPKNEPKNxmD97UZg/e2GYPdNFmD3TcD1TTZg921WYP18qFyXUXSYnQ68lJOdB09kGKSAJAOM9zC0mDwARNOchy6esu"
            . "QDjpcvBBikgBQTjMcudEOOly4kGKCEE4znLaRDj5ctU58HMGicFMiQTL/8Drx1teX11BXEFdQV5BX8M=")

         ; C source code - https://godbolt.org/z/Px5TE4MWW
         pixelsearchall3 := this.Base64Code((A_PtrSize == 4)
            ? "VTHSMcmJ5VdWU4Pk8IPsEItFFIPoDIlEJASLRRwp0IlEJAwPhDwBAACD+AF0PoP4AnQhg/gDuAMAAAAPTEQkCIlEJAiLRRhmD25k"
            . "kAhmD3DcAOsIx0QkCAIAAACLRRhmD25skARmD3DVAOsIx0QkCAEAAACLRRiNBJCJBCSLRRhmD240kItFEGYPcM4Ag3wkDAF1C4t1"
            . "FI1e9OmJAAAAg3wkDAJ0YIt8JAQ5+HMuDxAAZg92wWYP19gPEACJ32YPdsJmD9fYDxAACftmD3bDZg/X8AnzdQ2DwBDryoPCA+k2"
            . "////jXAQ610PEABmD3bBZg/X8A8QAGYPdsJmD9fYCfN14YPAEIt8JAQ5+HLbg8IC6QT///8PEABmD3bBZg/X8IX2db+DwBA52HLq"
            . "Quno/v//izwkizyfOTh0G0M5XCQIf++DwAQ7RRRzGjnwD4Q6////Mdvr5jtNDHMGi30IiQSPQevXjWX0ichbXl9dww=="
            : "QVdBVkFVQVRVV1ZTQb4DAAAATItcJGhMiUQkWEiJzonXMckx0kmNafREi0QkcEEp0A+EKQEAAEGD+AFIY8J0MEGD+AJ0FmZBD25s"
            . "gwhBg/gDRQ9N1mYPcN0A6wZBugIAAABmQQ9ubIMEZg9w1QDrBkG6AQAAAGZBD24Mg02NJINIi0QkWGYPcMkAQYP4AQ+EigAAAEGD"
            . "+AJ0ZEg56HMxDxAADyjhZg924GZED9f8DyjiZg924GYPdsNmD9fcZkQP1+hECftECet1DkiDwBDryoPCA+lR////TI1oEOthDxAA"
            . "DyjhZg924GYPdsJmRA/X7GYP19hECet13kiDwBBIOehy24PCAuke////DxAAZg92wWYP19iF23W+SIPAEEg56HLo/8Lp//7//0WL"
            . "PJxEOTh0Hkj/w0E52n/vSIPABEw5yHMcTDnoD4Q9////Mdvr5Tn5cwdBic9KiQT+/8Hr04nIW15fXUFcQV1BXkFfww==")

         ; C source code - https://godbolt.org/z/T8KjEPb1z
         pixelsearchall4 := this.Base64Code((A_PtrSize == 4)
            ? "VWYPdtKJ5VdWMfZTMduD5PCD7ECJXCQ0i0UgKfCJRCQ8D4R3AgAAg/gBdGOD+AJ0OIP4A7gDAAAAD0xEJDiJRCQ4i0UYZg9uZLAI"
            . "i0UcZg9w7AAPKWwkIGYPbmywCGYPcN0ADykcJOsIx0QkOAIAAACLRRhmD25ksASLRRxmD25MsARmD3DcAGYPcOkA6wjHRCQ4AQAA"
            . "AItdGI0EtQAAAACLVRiLfRABw2YPbiQCiVwkGItdHGYPcMwAjRQDZg9uJAOJVCQUZg9w5ACDfCQ8AYtFFHUIg+gM6SoBAACDfCQ8"
            . "Ao1Q9I1Y9A+E2gAAADnfc3YPEAcPKPgPKPBmD978Zg/e8WYPdPhmD3TxD1T3Dyj4Zg928mYP3vtmD3T7Zg/Xzg8o8GYP3vVmD3Tw"
            . "D1T3Dyh8JCBmD3byZg/e+GYPdHwkIGYP18YPKDQkCchmD97wZg908A9U92YPdvJmD9fWCdB1DYPHEOuGg8YD6aj+//+NRxCJRCQQ"
            . "6dAAAAAPEDcPKP4PKMZmD978Zg/ewWYPdP5mD3TBD1THDyj+Zg92wmYP3v1mD3T+Zg/XyA8oxmYP3sNmD3TDD1THZg92wmYP18AJ"
            . "yHWrg8cQOddysIPGAulE/v//DxA3DxAHDxA/Zg/e9GYP3sFmD3TBZg909w9UxmYPdgUAAAAAZg/X0IXSD4Vs////g8cQOcdyyUbp"
            . "B/7//4tEJBA5xw+Erv7//4pHAjHJi1QkFIlMJDCIRCQfikcBiEQkHooHiEQkHYtEJBiLXCQwOVwkOH8Kg8cEO30UcsDrS4pMJB84"
            . "SAJyNjpKAnIxilwkHjhYAXIoOloBciOKTCQdOAhyGzoKcheLTCQ0O00McwqLTQiLXCQ0iTyZ/0QkNP9EJDCDwASDwgTroYtEJDSN"
            . "ZfRbXl9dww=="
            : "QVdBVkFVQVRVV1ZTSIPseA8pdCQgDyl8JDBEDylEJEBEDylMJFBEDylUJGBFMdJmD3bSSImMJMAAAABNic5Mi4wk6AAAAEyJhCTQ"
            . "AAAATIuEJOAAAABJjXb0iZQkyAAAADHSRIucJPAAAABBKdMPhHgCAABBg/sBSGPCdEtBg/sCdCZmQQ9ufIAIZkEPbnSBCEGD+wO/"
            . "AwAAAA9N32YPcO8AZg9w/gDrBbsCAAAAZkEPbmSABGZBD250gQRmD3DcAGYPcPYA6wW7AQAAAGZBD24kgGYPcMwAZkEPbiSBjQSV"
            . "AAAAAEiYSIlEJBBIi4Qk0AAAAGYPcOQAZkUPdslBg/sBD4RTAQAAQYP7Ag+EBQEAAEg58A+DjgAAAA8QAEQPKMhEDyjAZkQP3sxm"
            . "RA/ewWZED3TIZkQPdMFFD1TBRA8oyGZED3bCZkQP3stmRA90y2ZBD9foRA8owGZED97GZkQPdMBFD1TBRA8oyGZED3bCZkQP3s1m"
            . "RA90zWZBD9fIRA8owGZED97HCelmQQ90wEEPVMFmD3bCZg/X+An5dRFIg8AQ6Wn///+DwgPpsv7//0iNeBBIiXwkGOnYAAAARA8Q"
            . "AEUPKMhBDyjAZkQP3sxmD97BZkUPdMhmD3TBQQ9UwUUPKMhmD3bCZkQP3s5mD9f4QQ8owGYP3sNmRQ90wWYPdMNBD1TAZg92wmYP"
            . "18gJ+XWeSIPAEEg58HKjg8IC6T/+//9EDxAARQ8o0EEPKMBmRA/e1GYP3sFmD3TBZkUPdMJBD1TAZkEPdsFmD9fIhckPhVr///9I"
            . "g8AQSDnwcsT/wun8/f//SIt8JBhIOfgPhIT+//8x/0CKaAJEimABRIooSItMJBCJfCQMi3wkDDn7fwtIg8AETDnwcsvrTkE4bAgC"
            . "cj1BOmwJAnI2RThkCAFyL0U6ZAkBcihFOCwIciJFOiwJchxEO5QkyAAAAHMPSIu8JMAAAABFiddKiQT/Qf/C/0QkDEiDwQTrnw8o"
            . "dCQgDyh8JDBEidBEDyhEJEBEDyhMJFBEDyhUJGBIg8R4W15fXUFcQV1BXkFfww==")

         ; --------------------------------------------------------------------------------------------------------

         ; Global number of addresses (matching searches) to allocate.
         limit := 256

         ; If the limit is exceeded, the following routine will be run again.
         redo:
         VarSetCapacity(result, A_PtrSize * limit) ; Allocate buffer for addresses.

         ; When doing pointer arithmetic, *Scan0 + 1 is actually adding 4 bytes.
         if (option == 1)
            count := DllCall(pixelsearchall1, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl uint")

         if (option == 2) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            v := abs(variation)

            count := DllCall(pixelsearchall2, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r+v, 255)
                     , "uchar", max(r-v, 0)
                     , "uchar", min(g+v, 255)
                     , "uchar", max(g-v, 0)
                     , "uchar", min(b+v, 255)
                     , "uchar", max(b-v, 0)
                     , "cdecl ptr")
         }

         if (option == 3) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            vr := abs(variation[1])
            vg := abs(variation[2])
            vb := abs(variation[3])

            count := DllCall(pixelsearchall2, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r + vr, 255)
                     , "uchar", max(r - vr, 0)
                     , "uchar", min(g + vg, 255)
                     , "uchar", max(g - vg, 0)
                     , "uchar", min(b + vb, 255)
                     , "uchar", max(b - vb, 0)
                     , "cdecl ptr")
         }

         if (option == 4)
            count := DllCall(pixelsearchall2, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(max(variation[1], variation[2]), 255)
                     , "uchar", max(min(variation[1], variation[2]), 0)
                     , "uchar", min(max(variation[3], variation[4]), 255)
                     , "uchar", max(min(variation[3], variation[4]), 0)
                     , "uchar", min(max(variation[5], variation[6]), 255)
                     , "uchar", max(min(variation[5], variation[6]), 0)
                     , "cdecl ptr")

         if (option == 5) {
            ; Create a struct of unsigned integers.
            VarSetCapacity(colors, 4*color.length())

            ; Fill the struct by iterating through the input array.
            for i, c in color {
               (c >> 24) || c |= 0xFF000000             ; Lift colors to 32-bit ARGB.
               NumPut(c, colors, 4*(A_Index-1), "uint") ; Place the unsigned int at each offset.
            }

            count := DllCall(pixelsearchall3, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &colors, "uint", color.length(), "cdecl ptr")
         }

         ; Options 6 & 7 - Creates a high and low struct where each pair is the min and max range.

         if (option == 6) {
            VarSetCapacity(high, 4*color.length())
            VarSetCapacity(low, 4*color.length())

            for i, c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               v := abs(variation)

               NumPut(255, high, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(min(r+v, 255), high, 4*A_Offset + 2, "uchar")
               NumPut(min(g+v, 255), high, 4*A_Offset + 1, "uchar")
               NumPut(min(b+v, 255), high, 4*A_Offset + 0, "uchar")

               NumPut(0, low, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(max(r-v, 0), low, 4*A_Offset + 2, "uchar")
               NumPut(max(g-v, 0), low, 4*A_Offset + 1, "uchar")
               NumPut(max(b-v, 0), low, 4*A_Offset + 0, "uchar")
            }

            count := DllCall(pixelsearchall4, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &high, "ptr", &low, "uint", color.length(), "cdecl ptr")
         }

         if (option == 7) {
            VarSetCapacity(high, 4*color.length())
            VarSetCapacity(low, 4*color.length())

            for i, c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               vr := abs(variation[1])
               vg := abs(variation[2])
               vb := abs(variation[3])

               NumPut(255, high, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(min(r + vr, 255), high, 4*A_Offset + 2, "uchar")
               NumPut(min(g + vg, 255), high, 4*A_Offset + 1, "uchar")
               NumPut(min(b + vb, 255), high, 4*A_Offset + 0, "uchar")

               NumPut(0, low, 4*A_Offset + 3, "uchar") ; Alpha
               NumPut(max(r - vr, 0), low, 4*A_Offset + 2, "uchar")
               NumPut(max(g - vg, 0), low, 4*A_Offset + 1, "uchar")
               NumPut(max(b - vb, 0), low, 4*A_Offset + 0, "uchar")
            }

            count := DllCall(pixelsearchall4, "ptr", &result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", &high, "ptr", &low, "uint", color.length(), "cdecl ptr")
         }

         ; If the default 256 results is exceeded, run the machine code again.
         if (count > limit) {
            limit := count
            goto redo
         }

         ; Check if any matches are found.
         if (count == 0)
            return False

         ; Create an array of [x, y] coordinates.
         xys := []
         xys.count := count
         loop % count {
            address := NumGet(result, A_PtrSize * (A_Index-1), "ptr")
            offset := (address - this.ptr) // 4
            xys.push([mod(offset, this.width), offset // this.width])
         }
         return xys
      }

      ImageSearch(image) {
         ; C source code - https://godbolt.org/z/qPodGdP1d
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnlV1ZTg+wgi0Uki1UYi30Ui00gD6/Qi3UIix8Pr0UMAcqJXeSLHJeLfQwByItVECtVHIlF7MHnAold4ItdDA+v1ytdGANVCIlV"
            . "3Ild2ItF3DnGc3CLReyLTeA5DIZ1YInwK0UIMdLB+AL3dQw5VdhyTotF5DkGdUeLRRgx0onxiVXwweACiUXoi0UUi13wO10cdDyL"
            . "VeiJywHCiVXUi1XUOdBzFIB4AwB0BosTORB1D4PABIPDBOvl/0XwAfnrzIPGBOuJi0UQD6/HA0UIicaDxCCJ8FteX13D"
            : "QVdBVkFVQVRVV1ZTSIPsKIuEJKgAAACLnCSQAAAARYshQYnSicJJicuLjCSgAAAAD6/TRInXQQ+vwinfiXwkHEgBykWLLJFEicIr"
            . "lCSYAAAASAHIQQ+v0kiJRCQITInZSY0sk0g56Q+DgAAAAEiLRCQIRDksgXVsSInIMdJMKdhIwfgCQffyOVQkHHJXRDkhdVKJ3jH/"
            . "MdJIjQS1AAAAAEiJRCQQTInIO5QkmAAAAHRESIt0JBBBif5OjTSxTI08MEw5+HMXgHgDAHQHQYs2OTB1EUiDwARJg8YE6+T/wkQB"
            . "1+vESIPBBOl3////RQ+vwkuNDINIichIg8QoW15fXUFcQV1BXkFfww==")

         ; Convert image to a buffer object.
         if !(IsObject(image) && image.HasKey("ptr") && image.HasKey("size"))
            image := ImagePutBuffer(image)

         ; Search for the address of the first matching image.
         address := DllCall(code, "ptr", this.ptr, "uint", this.width, "uint", this.height
            , "ptr", image.ptr, "uint", image.width, "uint", image.height, "uint", image.width//2, "uint", image.height//2
            , "cdecl ptr")

         ; Compare the address to the out-of-bounds limit.
         if (address == this.ptr + this.size)
            return False

         ; Return an [x, y] array.
         offset := (address - this.ptr) // 4
         return [mod(offset, this.width), offset // this.width]
      }

      ImageSearchAll(image) {
         ; C source code - https://godbolt.org/z/qPodGdP1d
         code := this.Base64Code((A_PtrSize == 4)
            ? "VYnlV1ZTg+wUi0UMi1UYi00IjTyFAAAAAItFECtFHA+vxwNFCIlF6ItFDCnQiUXkjQSVAAAAAIlF7ItF6DnBc2eLRRSLADkBdAmL"
            . "RRSAeAMAdVCJyCtFCDHSwfgC93UMOVXkfD4x0otFFInLiVXwi3XwO3UcdDyLVeyJ3gHCiVXgi1XgOdBzFIB4AwB0BosWORB1D4PA"
            . "BIPGBOvl/0XwAfvrzIPBBOuSi0UQD6/HA0UIicGDxBSJyFteX13D"
            : "QVdBVkFVQVRVV1ZTSIPsGEUx20SLpCSYAAAAi4QkgAAAAESLlCSQAAAASIu8JIgAAABEKeBBD6/BSInLidZMicFNjSyARInIRCnQ"
            . "iUQkDEqNBJUAAAAASIkEJEw56XN0iwc5AXQGgH8DAHViSInIMdJMKcBIwfgCQffxOVQkDHxNSIn4Me0x0kQ54nQyTIs8JEGJ7k6N"
            . "NLFJAcdMOfhzGIB4AwB0CEWLFkQ5EHUgSIPABEmDxgTr4//CRAHN68lBOfNzB0SJ2EiJDMNB/8NIg8EE64dEidhIg8QYW15fXUFc"
            . "QV1BXkFfww==")

         ; Convert image to a buffer object.
         if !(IsObject(image) && image.HasKey("ptr") && image.HasKey("size"))
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
         xys.count := count
         loop % count {
            address := NumGet(result, A_PtrSize * (A_Index-1), "ptr")
            offset := (address - this.ptr) // 4
            xy := [mod(offset, this.width), offset // this.width]
            xys.push(xy)
         }
         return xys
      }
   }
























































   BitmapToScreenshot(pBitmap, screenshot := "", alpha := "") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      x := IsObject(screenshot) && screenshot.HasKey(1) ? screenshot[1] : 0
      y := IsObject(screenshot) && screenshot.HasKey(2) ? screenshot[2] : 0
      w := IsObject(screenshot) && screenshot.HasKey(3) ? screenshot[3] : width
      h := IsObject(screenshot) && screenshot.HasKey(4) ? screenshot[4] : height

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.BitmapToHBitmap(pBitmap, alpha)
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

   BitmapToWindow(pBitmap, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "", playback := "", cache := "") {
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
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s := IsObject(pos) && pos.HasKey(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] / width
         : IsObject(pos) && pos.HasKey(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] / height
         : (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w := IsObject(pos) && pos.HasKey(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] : s * width
      h := IsObject(pos) && pos.HasKey(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] : s * height

      x := IsObject(pos) && pos.HasKey(1) && pos[1] ~= "^-?\d+$" ? pos[1] : 0.5*(ScreenWidth - w)
      y := IsObject(pos) && pos.HasKey(2) && pos[2] ~= "^-?\d+$" ? pos[2] : 0.5*(ScreenHeight - h)

      ; Adjust x and y if a relative to window position is given.
      if IsObject(pos) && pos.HasKey(5) && (WinExist(pos[5]) || DllCall("IsWindow", "ptr", pos[5])) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         pos[5] := (hwnd := WinExist(pos[5])) ? hwnd : pos[5]
         VarSetCapacity(rect, 16, 0)
         DllCall("GetClientRect", "ptr", pos[5], "ptr", &rect)
         DllCall("ClientToScreen", "ptr", pos[5], "ptr", &rect)
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         x += NumGet(rect, 0, "int")
         y += NumGet(rect, 4, "int")
      }

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

      DllCall("AdjustWindowRectEx", "ptr", &rect, "uint", style, "int", 0, "uint", styleEx)

      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
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
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; Tests have shown that changing the system default colors has no effect on F0F0F0.
      ; Must call SetWindowLong with WS_EX_LAYERED immediately before SetLayeredWindowAttributes.
      DllCall("SetWindowLong", "ptr", hwnd, "int", -20, "int", styleEx | WS_EX_LAYERED)
      DllCall("SetLayeredWindowAttributes", "ptr", hwnd, "uint", 0xF0F0F0, "uchar", 0, "int", 1)

      ; A layered child window is only available on Windows 8+.
      child := this.Show(pBitmap, title, [0, 0, w, h], WS_CHILD | WS_VISIBLE, WS_EX_LAYERED, hwnd, playback, cache)

      ; Store extra data inside window struct (cbWndExtra).
      DllCall("SetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr", hwnd) ; parent window
      DllCall("SetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr", child) ; child window
      DllCall("SetWindowLong", "ptr", child, "int", 0*A_PtrSize, "ptr", hwnd) ; parent window
      DllCall("SetWindowLong", "ptr", child, "int", 1*A_PtrSize, "ptr", child) ; child window

      ; Delaying this call prevents empty window borders from appearing.
      DllCall("ShowWindow", "ptr", hwnd, "int", 1)

      return hwnd
   }

   Show(pBitmap, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "", playback := "", cache := "") {
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
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s := IsObject(pos) && pos.HasKey(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] / width
         : IsObject(pos) && pos.HasKey(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] / height
         : (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w := IsObject(pos) && pos.HasKey(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] : s * width
      h := IsObject(pos) && pos.HasKey(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] : s * height

      x := IsObject(pos) && pos.HasKey(1) && pos[1] ~= "^-?\d+$" ? pos[1] : 0.5*(ScreenWidth - w)
      y := IsObject(pos) && pos.HasKey(2) && pos[2] ~= "^-?\d+$" ? pos[2] : 0.5*(ScreenHeight - h)

      ; Adjust x and y if a relative to window position is given.
      if IsObject(pos) && pos.HasKey(5) && (WinExist(pos[5]) || DllCall("IsWindow", "ptr", pos[5])) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         pos[5] := (hwnd := WinExist(pos[5])) ? hwnd : pos[5]
         VarSetCapacity(rect, 16, 0)
         DllCall("GetClientRect", "ptr", pos[5], "ptr", &rect)
         DllCall("ClientToScreen", "ptr", pos[5], "ptr", &rect)
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         x += NumGet(rect, 0, "int")
         y += NumGet(rect, 4, "int")
      }

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
         NumPut(        w, bi,  4,   "uint") ; Width
         NumPut(       -h, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
         NumPut(        1, bi, 12, "ushort") ; Planes
         NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Case 1: Image is not scaled.
      if (w == width && h == height) {
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
         DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", ImageAttr, "int", 3, "uint", 0, "int", 0) ; WrapModeTileFlipXY
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

      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
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
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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

      ; Store extra data inside window struct (cbWndExtra).
      ; For 64 -> 32-bit: https://learn.microsoft.com/en-us/windows/win32/winprog64/interprocess-communication
      DllCall("SetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr", hwnd) ; parent window (same, only 1 window for now)
      DllCall("SetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr", hwnd) ; child window  (same, only 1 window for now)
      DllCall("SetWindowLong", "ptr", hwnd, "int", 2*A_PtrSize, "ptr", hdc)  ; hdc contains a pixel buffer too!

      ; Check for multiple frames. This can be in either the page (WEBP) or time (GIF) dimension.
      DllCall("gdiplus\GdipImageGetFrameDimensionsCount", "ptr", pBitmap, "uint*", dims:=0)
      DllCall("gdiplus\GdipImageGetFrameDimensionsList", "ptr", pBitmap, "ptr", &dimIDs := VarSetCapacity(dimIDs, 16*dims), "uint", dims)
      DllCall("gdiplus\GdipImageGetFrameCount", "ptr", pBitmap, "ptr", &dimIDs, "uint*", number:=0)
      DllCall("gdiplus\GdipGetPropertyItemSize", "ptr", pBitmap, "uint", 0x5100, "uint*", nDelays:=0)

      ; Animations!
      if (number > 1 && nDelays > 0) {

         ; Get the frame delays from PropertyTagFrameDelay.
         pDelays := DllCall("GlobalAlloc", "uint", 0, "uptr", nDelays, "ptr")
         DllCall("gdiplus\GdipGetPropertyItem", "ptr", pBitmap, "uint", 0x5100, "uint", nDelays, "ptr", pDelays)

         ; Check PropertyTagTypeLong if WEBP or GIF.
         type := NumGet(pDelays + 8, "ushort") == 4 ? "gif" : "webp"

         ; Save frame delays because they are slow enough to impact timing.
         p := NumGet(pDelays + 8 + A_PtrSize, "ptr")
         delays := {0: NumGet(p+0, "uint")}
         loop % number ; Remember the pointer to the array of delays should be dereferenced.
            delays[A_Index] := NumGet(p + 4*A_Index, "uint")

         ; Calculate the greatest common factor of all frame delays.
         for each, delay in delays
            if (A_Index = 1)
               interval := delay ; Initalize the interval.
            else
               while delay {
                  temp := mod(interval, delay)
                  interval := delay
                  delay := temp
               }

         ; Convert centiseconds to milliseconds.
         if (type = "gif")
            interval *= 10

         ; Because timeSetEvent calls in a seperate thread, redirect to main thread.
         ; LPTIMECALLBACK: (uTimerID, uMsg, dwUser, dw1, dw2)
         pTimeProc := this.SyncWindowProc(hwnd, 0x8000)

         ; Create an object to hold all the extra data.
         obj := {type : type             ; Either "gif" or "webp"
               , w : w                   ; width
               , h : h                   ; height
               , frame : 0               ; current frame (zero-indexed)
               , number : number         ; max frames
               , accumulate : 0          ; current wait time
               , delays : delays         ; array of frame delays
               , interval : interval     ; timer resolution
               , pTimeProc : pTimeProc   ; callback address
               , dimIDs : dimIDs}        ; frame dimension guid (Time or Page)
         ObjAddRef(&obj)                 ; Hold onto this object for dear life!
         DllCall("SetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", 3*A_PtrSize, "ptr", &obj)

         ; Case 1: Image is not scaled.
         if (!cache && w == width && h == height) {
            ; Clone bitmap to avoid disposal.
            DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap, "ptr*", pBitmapClone:=0)
            DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmapClone) ; Load to memory.

            ; Save the cloned bitmap and pixel buffer.
            obj.pBitmap := pBitmapClone
            obj.pBits := pBits

            ; Preserve GDI+ scope due to the active pBitmap above.
            ImagePut.gdiplusStartup()
         }

         ; Case 2: Image is scaled.
         else {

            ; Create a cache of pre-rendered frames. Note: This can be very slow.
            ; Fixes problems with the animation being paused when dragged by the user.
            cache := {0: hdc}

            ; --------- Overwrites the hdc, hbm, and pBits variables!!!!!! ---------
            loop % number {
               ; Select frame to show.
               frame := A_Index
               DllCall("gdiplus\GdipImageSelectActiveFrame", "ptr", pBitmap, "ptr", &dimIDs, "uint", frame)

               ; Get Bitmap width and height.
               DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
               DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

               ; Convert the source pBitmap into a hBitmap manually.
               ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
               hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
               VarSetCapacity(bi, 40, 0)              ; sizeof(bi) = 40
                  NumPut(       40, bi,  0,   "uint") ; Size
                  NumPut(        w, bi,  4,   "uint") ; Width
                  NumPut(       -h, bi,  8,    "int") ; Height - Negative so (0, 0) is top-left.
                  NumPut(        1, bi, 12, "ushort") ; Planes
                  NumPut(       32, bi, 14, "ushort") ; BitCount / BitsPerPixel
               hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", &bi, "uint", 0, "ptr*", pBits:=0, "ptr", 0, "uint", 0, "ptr")
               obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

               ; Create a graphics context from the device context.
               DllCall("gdiplus\GdipCreateFromHDC", "ptr", hdc , "ptr*", pGraphics:=0)

               ; Set settings in graphics context.
               DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
               DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
               DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

               ; Draw Image.
               DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", ImageAttr:=0)
               DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", ImageAttr, "int", 3, "uint", 0, "int", 0) ; WrapModeTileFlipXY
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

               ; Save rendered frame.
               cache[frame] := hdc
            }

            ; Send cache to WM_APP.
            obj.cache := cache
         }

         ; Start GIF Animation loop. Defaults to immediate playback.
         if (playback == "" || playback == True)
            DllCall("PostMessage", "ptr", hwnd, "uint", 0x8001, "uptr", 0, "ptr", 0)
      }

      return hwnd
   }

   WindowClass(style := 0x8) {
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
         hwnd := this
         ; Prevent the script from exiting early.
         static void := ObjBindMethod({}, {})

         ; WM_CREATE
         if (uMsg = 0x1)
            Hotkey % "^+F12", % void, On

         ; WM_DESTROY
         if (uMsg = 0x2) {
            Hotkey % "^+F12", % void, Off ; Cannot disable script persistence, does nothing

            ; The child window contains all of the assets to be freed.
            if hwnd != DllCall("GetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr")
               return

            ; Get stock bitmap.
            obm := DllCall("CreateBitmap", "int", 0, "int", 0, "uint", 1, "uint", 1, "ptr", 0, "ptr")

            ; Cleanup the device context and its selected hBitmap.
            if hdc := DllCall("GetWindowLong", "ptr", hwnd, "int", 2*A_PtrSize, "ptr") {
               hbm := DllCall("SelectObject", "ptr", hdc, "ptr", obm, "ptr")
               DllCall("DeleteObject", "ptr", hbm)
               DllCall("DeleteDC", "ptr", hdc)
            }

            ; The object will self-destruct at end of scope. No need to add a reference!
            if ptr := DllCall("GetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", 3*A_PtrSize, "ptr") {
               obj := Object(ptr) ; Todo: test reference...

               ; Exit GIF animation loop. Ends any triggered WM_APP.
               DllCall("SetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", hwnd, "int", 3*A_PtrSize, "ptr", 0)

               ; Stop Animation loop.
               if timer := DllCall("GetWindowLong", "ptr", hwnd, "int", 4*A_PtrSize, "ptr")
                  DllCall("winmm\timeKillEvent", "uint", timer)
               DllCall("GlobalFree", "ptr", obj.pTimeProc)

               if obj.HasKey("pBitmap") {
                  DllCall("gdiplus\GdipDisposeImage", "ptr", obj.pBitmap)
                  ImagePut.gdiplusShutdown()
               }

               if obj.HasKey("cache")
                  for each, hdc in obj.cache { ; Overwrites the hdc and hbm variables.
                     hbm := DllCall("SelectObject", "ptr", hdc, "ptr", obm, "ptr")
                     DllCall("DeleteObject", "ptr", hbm)
                     DllCall("DeleteDC", "ptr", hdc)
                  }
            }
         }

         ; Let's start using custom defined parameters from the window struct.
         if (uMsg = 0x1 || uMsg = 0x2)
            goto default

         ; Remember the child window contains all the assets.
         parent := DllCall("GetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr")
         child := DllCall("GetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr")

         ; For some reason using DefWindowProc or PostMessage to reroute WM_LBUTTONDOWN to WM_NCLBUTTONDOWN
         ; will always disable the complementary WM_LBUTTONUP. However, if the CS_DBLCLKS window style is set,
         ; then a single WM_RBUTTONUP will be received as double-clicking generates a sequence of four messages:
         ; WM_LBUTTONDOWN, WM_LBUTTONUP, WM_LBUTTONDBLCLK, and WM_LBUTTONUP.
         ;                 ^ This message is lost when 0x201 → 0xA1.
         ;                               ^ Only happens when 0x8 is set in RegisterClass.

         ; WM_LBUTTONDOWN - Drag to move the window.
         if (uMsg = 0x201)
            return DllCall("DefWindowProc", "ptr", parent, "uint", 0xA1, "uptr", 2, "ptr", 0, "ptr")

         ; WM_LBUTTONUP - Double Click to toggle between play and pause.
         if (uMsg = 0x202)
            DllCall("GetWindowLong", "ptr", child, "int", 4*A_PtrSize, "ptr")
            ? uMsg := 0x8002 ; Pause
            : uMsg := 0x8001 ; Play

         ; WM_RBUTTONUP - Destroy the window.
         if (uMsg = 0x205)
            return DllCall("DestroyWindow", "ptr", parent)

         ; WM_MBUTTONDOWN - Show x, y, and color.
         if (uMsg = 0x207) {
            hdc := DllCall("GetWindowLong", "ptr", child, "int", 2*A_PtrSize, "ptr")

            ; Get pBits from hBitmap currently selected onto the device context.
            ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
            ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
            hbm := DllCall("GetCurrentObject", "ptr", hdc, "uint", 7)
            VarSetCapacity(dib, size := 64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
            DllCall("GetObject", "ptr", hbm, "int", size, "ptr", &dib)
               , width  := NumGet(dib, 4, "uint")
               , height := NumGet(dib, 8, "uint")
               , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

            ; Convert from unsigned int to signed shorts.
            VarSetCapacity(xy, 4)
            NumPut(lParam, xy, "uint")
            x := NumGet(xy, 0, "short")
            y := NumGet(xy, 2, "short")

            ; Safe limits for x and y.
            (x < 0) && x := 0
            (x >= width) && x := width-1
            (y < 0) && y := 0
            (y >= height) && y := height-1

            ; Get color.
            c := Format("0x{:08X}", NumGet(pBits + 4*(y*width + x), "uint"))

            ; Process background color (BGR) and text color (greyscale).
            background_color := RegExReplace(c, "^0x..(..)(..)(..)$", "0x$3$2$1")
            text_color := (0.3*(255&c>>16) + 0.59*(255&c>>8) + 0.11*(255&c)) >= 128 ? 0x000000 : 0xFFFFFF

            ; Show tooltip. Use Tooltip #16.
            Tooltip % " (" x ", " y ") `n " SubStr(c, 3) " ",,, 16
            tt := WinExist("ahk_class tooltips_class32 ahk_exe" A_AhkPath)

            ; Style background and text color.
            DllCall("UxTheme\SetWindowTheme", "ptr", tt, "ptr", 0, "ptr", &empty := VarSetCapacity(2, 0), "uint")
            DllCall("SendMessage", "ptr", tt, "uint", 1043, "ptr", background_color, "ptr", 0)
            DllCall("SendMessage", "ptr", tt, "uint", 1044, "ptr", text_color, "ptr", 0)

            ; Destroy tooltip after 7 seconds of the last showing.
            SetTimer Reset_Tooltip, -7000
            return

            Reset_Tooltip:
               Tooltip,,,, 16
            return
         }

         ; WM_APP - Animate GIFs
         if (uMsg = 0x8000) {
            ; Thanks tmplinshi, Teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=76&t=83358
            Critical

            ; Get variables.
            ptr := DllCall("GetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", child, "int", 3*A_PtrSize, "ptr")

            ; Exit GIF animation loop. Set by WM_Destroy.
            if !ptr
               return

            ; Get variables. ObjRelease is automatically called at the end of the scope.
            obj := Object(ptr)
            type := obj.type
            w := obj.w
            h := obj.h
            frame := obj.frame
            number := obj.number
            accumulate := obj.accumulate
            delays := obj.delays
            interval := obj.interval
            pTimeProc := obj.pTimeProc
            dimIDs := obj.dimIDs
            obj.HasKey("pBitmap")  && pBitmap := obj.pBitmap ; not scaled
            obj.HasKey("pBits")  && pBits := obj.pBits       ; not scaled
            obj.HasKey("cache")  && cache := obj.cache       ; is scaled
         }

         ; Each timer interval is the GCF of all frame delays.
         ; Avoids using oneshot timers to reduce additive jitter from constant overhead.
         if (uMsg = 0x8000 && wParam == 0) {
            index := mod(frame + 1, number)     ; Increment and loop back to zero
            delay := delays[index]              ; Zero-based array

            ; See: https://www.biphelps.com/blog/The-Fastest-GIF-Does-Not-Exist
            if (type = "gif") {
               delay *= 10                      ; Convert centiseconds to milliseconds
               delay := max(delay, 10)          ; Minimum delay is 10ms
               (delay == 10) && delay := 100    ; 10 ms is actually 100 ms
            }

            ; The current wait time is advanced by one interval.
            accumulate += interval              ; Add resolution of timer
            obj.accumulate := accumulate        ; Save the current wait time

            ; Check if enough time has passed to advance to the next frame.
            if (accumulate == delay)
               wParam := 1                      ; Step size of +1
         }

         ; WM_APP - Advance to next frame.
         if (uMsg = 0x8000 && wParam != 0) {
            ; Restrict frame index from 0 to the maximum number of frames - 1.
            frame := mod(mod(frame + wParam, number) + number, number)

            obj.frame := frame                  ; Update to next frame number
            obj.accumulate := 0                 ; Resets the wait time

            /*
            ; Debug code
            static start := 0, sum := 0, count := 0
            DllCall("QueryPerformanceFrequency", "int64*", &frequency:=0)
            DllCall("QueryPerformanceCounter", "int64*", &now:=0)
            time := (now - start) / frequency * 1000
            if (time < 10000) {
               sum += time
               count += 1
               ; Prevents the tooltip from impacting timings by showing every 10 frames.
               if (mod(count, 10) = 0)
                  Tooltip % "Current Delay:`t" Round(time, 4)
                     . "`n" "Average Delay:`t" Round(sum / count, 4)
                     . "`n" "Planned Delay:`t" (delay ?? "unknown")
                     . "`n" "Timer Resolution:`t" interval
                     . "`n" "Average FPS:`t" Round(count / (sum / 1000), 4)
                     . "`n" "Frame Number:`t" frame " of " number
            }
            start := now
            */

            ; Case 1: Image is not scaled.
            if not obj.HasKey("cache") {
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

               ; Use the saved device context for rendering.
               hdc := DllCall("GetWindowLong", "ptr", child, "int", 2*A_PtrSize, "ptr")
            }

            ; Case 2: Image is scaled.
            else {
               ; Define the device context for rendering.
               hdc := cache[frame]

               ; Sets the currently active device context for WM_MBUTTONDOWN.
               DllCall("SetWindowLong", "ptr", child, "int", 2*A_PtrSize, "ptr", hdc)
            }

            ; Render to window.
            DllCall("UpdateLayeredWindow"
                     ,    "ptr", child                    ; hWnd
                     ,    "ptr", 0                        ; hdcDst
                     ,    "ptr", 0                        ; *pptDst
                     ,"uint64*", w | h << 32              ; *psize
                     ,    "ptr", hdc                      ; hdcSrc
                     , "int64*", 0                        ; *pptSrc
                     ,   "uint", 0                        ; crKey
                     ,  "uint*", 0xFF << 16 | 0x01 << 24  ; *pblend
                     ,   "uint", 2)                       ; dwFlags
         }

         ; Clears the frame number and wait time.
         if (uMsg = 0x8001 || uMsg = 0x8002) {
            if (wParam) {
               if ptr := DllCall("GetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", child, "int", 3*A_PtrSize, "ptr") {
                  obj := Object(ptr)
                  obj.frame := 0
                  obj.accumulate := 0
               }
            }
         }

         ; Start Animation loop.
         if (uMsg = 0x8001) {
            if timer := DllCall("GetWindowLong", "ptr", child, "int", 4*A_PtrSize, "ptr")
               return

            if ptr := DllCall("GetWindowLong" (A_PtrSize=8?"Ptr":""), "ptr", child, "int", 3*A_PtrSize, "ptr") {
               obj := Object(ptr)
               timer := DllCall("winmm\timeSetEvent"
                        , "uint", obj.interval  ; uDelay
                        , "uint", obj.interval  ; uResolution
                        ,  "ptr", obj.pTimeProc ; lpTimeProc
                        , "uptr", 0             ; dwUser
                        , "uint", 1             ; fuEvent
                        , "uint")
               DllCall("SetWindowLong", "ptr", child, "int", 4*A_PtrSize, "ptr", timer)
            }
         }

         ; Stop Animation loop.
         if (uMsg = 0x8002) {
            if (timer := DllCall("GetWindowLong", "ptr", child, "int", 4*A_PtrSize, "ptr")) {
               DllCall("winmm\timeKillEvent", "uint", timer)
               DllCall("SetWindowLong", "ptr", child, "int", 4*A_PtrSize, "ptr", 0)
            }
         }

         default:
         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }


   SyncWindowProc(hwnd, uMsg, wParam := 0, lParam := 0) {
      hModule := DllCall("GetModuleHandle", "str", "user32.dll", "ptr")
      SendMessageW := DllCall("GetProcAddress", "ptr", hModule, "astr", "SendMessageW", "ptr")

      pcb := DllCall("GlobalAlloc", "uint", 0, "uptr", 71, "ptr")
      DllCall("VirtualProtect", "ptr", pcb, "ptr", 71, "uint", 0x40, "uint*", 0)

      ; Retract the hex representation to binary.
      if (A_PtrSize = 8) {
         assembly := "
            ( Join`s Comments
            48 89 4c 24 08                 ; mov [rsp+8], rcx
            48 89 54 24 10                 ; mov [rsp+16], rdx
            4c 89 44 24 18                 ; mov [rsp+24], r8
            4c 89 4c 24 20                 ; mov [rsp+32], r9
            48 83 ec 28                    ; sub rsp, 40
            49 b9 00 00 00 00 00 00 00 00  ; mov r9, .. (lParam)
            49 b8 00 00 00 00 00 00 00 00  ; mov r8, .. (wParam)
            ba 00 00 00 00                 ; mov edx, .. (uMsg)
            b9 00 00 00 00                 ; mov ecx, .. (hwnd)
            48 b8 00 00 00 00 00 00 00 00  ; mov rax, .. (SendMessageW)
            ff d0                          ; call rax
            48 83 c4 28                    ; add rsp, 40
            c3                             ; ret
            )"
         DllCall("crypt32\CryptStringToBinary", "str", assembly, "uint", 0, "uint", 0x4, "ptr", pcb, "uint*", 71, "ptr", 0, "ptr", 0)
         NumPut(SendMessageW, pcb + 56, "ptr")
         NumPut(hwnd, pcb + 50, "int")
         NumPut(uMsg, pcb + 45, "int")
         NumPut(wParam, pcb + 36, "ptr")
         NumPut(lParam, pcb + 26, "ptr")
      }
      else {
         assembly := "
            ( Join`s Comments
            68 00 00 00 00                 ; push .. (lParam)
            68 00 00 00 00                 ; push .. (wParam)
            68 00 00 00 00                 ; push .. (uMsg)
            68 00 00 00 00                 ; push .. (hwnd)
            b8 00 00 00 00                 ; mov eax, &SendMessageW
            ff d0                          ; call eax
            c3                             ; ret
            )"
         DllCall("crypt32\CryptStringToBinary", "str", assembly, "uint", 0, "uint", 0x4, "ptr", pcb, "uint*", 28, "ptr", 0, "ptr", 0)
         NumPut(SendMessageW, pcb + 21, "int")
         NumPut(hwnd, pcb + 16, "int")
         NumPut(uMsg, pcb + 11, "int")
         NumPut(wParam, pcb + 6, "int")
         NumPut(lParam, pcb + 1, "int")
      }

      return pcb
   }

   BitmapToDesktop(pBitmap) {
      ; Thanks Gerald Degeneve - https://www.codeproject.com/Articles/856020/Draw-Behind-Desktop-Icons-in-Windows-plus

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.BitmapToHBitmap(pBitmap)
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

   BitmapToWallpaper(pBitmap) {
      ; Create a temporary image file.
      filepath := this.BitmapToFile(pBitmap)

      ; Get the absolute path of the file.
      length := DllCall("GetFullPathName", "str", filepath, "uint", 0, "ptr", 0, "ptr", 0, "uint")
      VarSetCapacity(buf, length * (A_IsUnicode?2:1))
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

   BitmapToCursor(pBitmap, xHotspot := "", yHotspot := "") {
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

   BitmapToExplorer(pBitmap, default := "") {

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

      return this.BitmapToFile(pBitmap, directory)
   }

   GetCurrentExplorerTab(hwnd) {
      ; script from Lexikos: https://www.autohotkey.com/boards/viewtopic.php?f=83&t=109907
      ; modified for this by: @TheCrether
      ; useful for windows 11 explorer tabs support (works with windows 10 explorers too)
      static IID_IShellBrowser := "{000214E2-0000-0000-C000-000000000046}"

      activeTab := 0, hwnd := hwnd ? hwnd : WinExist("A")
      try
         ControlGet, activeTab, Hwnd,, ShellTabWindowClass1, ahk_id %hwnd%	; File Explorer (Windows 11)
      catch
      try
         ControlGet, activeTab, Hwnd,, TabWindowClass1, ahk_id %hwnd%	; IE
      for w in ComObjCreate("Shell.Application").Windows {
         if (w.hwnd != hwnd)
               continue
         if (activeTab) { ; The window has tabs, so make sure this is the right one.
            shellBrowser := ComObjQuery(w, IID_IShellBrowser, IID_IShellBrowser)
               DllCall(NumGet(NumGet(shellBrowser+0), 3*A_PtrSize), "UPtr",shellBrowser, "UIntP",thisTab:=0)
               if (thisTab != activeTab)
                  continue
         }
         return w
      }
	   return 0
   }

   StreamToExplorer(stream, default := "") {

      ; Default directory to desktop.
      (default == "") && default := A_Desktop

      ; Check if the mouse is pointing to the desktop.
      MouseGetPos,,, hwnd
      WinGetClass class, ahk_id %hwnd%
      if (class ~= "(?i)Progman|WorkerW")
         directory := A_Desktop

      ; Get path of active window.
      else if (hwnd := WinExist("ahk_class ExploreWClass")) || (hwnd := WinExist("ahk_class CabinetWClass")) {
         ; script from Lexikos: https://www.autohotkey.com/boards/viewtopic.php?f=83&t=109907
         ; modified for this by: @TheCrether
         ; useful for windows 11 explorer tabs support (works with windows 10 explorers too)
         tab := this.GetCurrentExplorerTab(hwnd)
         if tab {
            switch ComObjType(tab.Document, "Class")
            {
               case "ShellFolderView":
                  directory := tab.Document.Folder.Self.Path
               default: ; case "HTMLDocument"
                  directory := tab.LocationURL
            }
         }
      }
      else
         directory := default

      return this.StreamToFile(stream, directory)
   }

   BitmapToFile(pBitmap, filepath := "", quality := "") {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      extension := "png"
      this.select_filepath(filepath, extension)
      this.select_codec(pBitmap, extension, quality, pCodec, ep)

      ; Write the file to disk using the specified encoder and encoding parameters with exponential backoff.
      loop
         if !DllCall("gdiplus\GdipSaveImageToFile", "ptr", pBitmap, "wstr", filepath, "ptr", &pCodec, "ptr", &ep)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Exception("Could not save file to disk.")

      return filepath
   }

   StreamToFile(stream, filepath := "") {
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; 2048 characters should be good enough to identify the file correctly.
      size := min(size, 2048)
      VarSetCapacity(bin, size)

      ; Get the first few bytes of the image.
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; Allocate enough space for a hexadecimal string with spaces interleaved and a null terminator.
      length := 2*size + (size-1) + 1
      VarSetCapacity(str, length * (A_IsUnicode?2:1))

      ; Lift the binary representation to hex.
      flags := 0x40000004 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEX
      DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Determine the file extension using herustics. See: http://fileformats.archiveteam.org
      extension := 0                                                              ? ""
      : str ~= "(?i)66 74 79 70 61 76 69 66"                                      ? "avif" ; ftypavif
      : str ~= "(?i)^42 4d (.. ){36}00 00 .. 00 00 00"                            ? "bmp"  ; BM
      : str ~= "(?i)^01 00 00 00 (.. ){36}20 45 4D 46"                            ? "emf"  ; emf
      : str ~= "(?i)^47 49 46 38 (37|39) 61"                                      ? "gif"  ; GIF87a or GIF89a
      : str ~= "(?i)66 74 79 70 68 65 69 63"                                      ? "heic" ; ftypheic
      : str ~= "(?i)^00 00 01 00"                                                 ? "ico"
      : str ~= "(?i)^ff d8 ff"                                                    ? "jpg"
      : str ~= "(?i)^25 50 44 46 2d"                                              ? "pdf"  ; %PDF-
      : str ~= "(?i)^89 50 4e 47 0d 0a 1a 0a"                                     ? "png"  ; PNG
      : str ~= "(?i)^(((?!3c|3e).. )|3c (3f|21) ((?!3c|3e).. )*3e )*+3c 73 76 67" ? "svg"  ; <svg
      : str ~= "(?i)^(49 49 2a 00|4d 4d 00 2a)"                                   ? "tif"  ; II* or MM*
      : str ~= "(?i)^52 49 46 46 .. .. .. .. 57 45 42 50"                         ? "webp" ; RIFF....WEBP
      : str ~= "(?i)^d7 cd c6 9a"                                                 ? "wmf"
      : "" ; Extension must be blank for file pass-through as-is.

      this.select_filepath(filepath, extension)

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\SHCreateStreamOnFileEx"
               ,   "wstr", filepath
               ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
               ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
               ,    "int", True            ; fCreate is ignored when STGM_CREATE is set.
               ,    "ptr", 0               ; pstmTemplate (reserved)
               ,   "ptr*", FileStream:=0
               ,   "uint")
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Copy", "ptr", stream, "ptr", FileStream, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      ObjRelease(FileStream)

      return filepath
   }

   BitmapToHex(pBitmap, extension := "", quality := "") {
      stream := this.BitmapToStream(pBitmap, extension, quality) ; Defaults to PNG for small sizes!

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", stream, "ptr*", hbin:=0, "uint")
      bin := DllCall("GlobalLock", "ptr", hbin, "ptr")
      size := DllCall("GlobalSize", "ptr", hbin, "uptr")

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
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)
      }

      ; Default to lowercase hex values. Or capitalize the string below.
      VarSetCapacity(hex, 16)
      StrPut("0123456789abcdef", &hex, "CP0")
      DllCall(code, "ptr", &hex, "ptr", bin, "uptr", size, "ptr", &str, "uptr", length, "cdecl")

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", hbin)
      ObjRelease(stream)

      ; Return encoded string from ANSI.
      return StrGet(&str, length, "CP0")
   }

   StreamToHex(stream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin := VarSetCapacity(bin, size), "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

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
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)
      }

      ; Default to lowercase hex values. Or capitalize the string below.
      VarSetCapacity(hex, 16)
      StrPut("0123456789abcdef", &hex, "CP0")
      DllCall(code, "ptr", &hex, "ptr", &bin, "uptr", size, "ptr", &str, "uptr", length, "cdecl")

      ; Return encoded string from ANSI.
      return StrGet(&str, length, "CP0")
   }

   BitmapToBase64(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247
      stream := this.BitmapToStream(pBitmap, extension, quality) ; Defaults to PNG for small sizes!

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", stream, "ptr*", handle:=0, "uint")
      bin := DllCall("GlobalLock", "ptr", handle, "ptr")
      size := DllCall("GlobalSize", "ptr", handle, "uptr")

      ; Calculate the length of the base64 string.
      length := 4 * Ceil(size / 3) + 1                ; A string has a null terminator
      VarSetCapacity(str, length * (A_IsUnicode?2:1)) ; Allocates a ANSI or Unicode string
      ; This appends 1 or 2 zero byte null terminators respectively.

      ; Passing a pre-allocated string buffer prevents an additional memory copy via StrGet.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      DllCall("crypt32\CryptBinaryToString", "ptr", bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", handle)
      ObjRelease(stream)

      ; Returns an AutoHotkey native string.
      return str
   }

   StreamToBase64(stream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin := VarSetCapacity(bin, size), "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; Calculate the length of the base64 string.
      length := 4 * Ceil(size / 3) + 1                ; A string has a null terminator
      VarSetCapacity(str, length * (A_IsUnicode?2:1)) ; Allocates a ANSI or Unicode string
      ; This appends 1 or 2 zero byte null terminators respectively.

      ; Passing a pre-allocated string buffer prevents an additional memory copy via StrGet.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Returns an AutoHotkey native string.
      return str
   }

   BitmapToUri(pBitmap, extension := "", quality := "") {
      extension := RegExReplace(extension, "^(\*?\.)?") ; Trim leading "*." or "." from the extension
      extension :=  extension ~= "^(avif|avifs)$"           ? "avif"
                  : extension ~= "^(bmp|dib|rle)$"          ? "bmp"
                  : extension ~= "^(gif)$"                  ? "gif"
                  : extension ~= "^(heic|heif|hif)$"        ? "heic"
                  : extension ~= "^(jpg|jpeg|jpe|jfif)$"    ? "jpeg"
                  : extension ~= "^(png)$"                  ? "png"
                  : extension ~= "^(tif|tiff)$"             ? "tiff"
                  : "png" ; Defaults to PNG
      return "data:image/" extension ";base64," this.BitmapToBase64(pBitmap, extension, quality)
   }

   StreamToUri(stream) {
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; 2048 characters should be good enough to identify the file correctly.
      size := min(size, 2048)
      VarSetCapacity(bin, size)

      ; Get the first few bytes of the image.
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &bin, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      ; Allocate enough space for a hexadecimal string with spaces interleaved and a null terminator.
      length := 2*size + (size-1) + 1
      VarSetCapacity(str, length * (A_IsUnicode?2:1))

      ; Lift the binary representation to hex.
      flags := 0x40000004 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEX
      DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", size, "uint", flags, "str", str, "uint*", length)

      ; Determine the mime type using herustics. See: http://fileformats.archiveteam.org
      mime := 0                                                                   ? ""
      : str ~= "(?i)66 74 79 70 61 76 69 66"                                      ? "image/avif"
      : str ~= "(?i)^42 4d (.. ){36}00 00 .. 00 00 00"                            ? "image/bmp"
      : str ~= "(?i)^01 00 00 00 (.. ){36}20 45 4D 46"                            ? "image/emf"
      : str ~= "(?i)^47 49 46 38 (37|39) 61"                                      ? "image/gif"
      : str ~= "(?i)66 74 79 70 68 65 69 63"                                      ? "image/heic"
      : str ~= "(?i)^00 00 01 00"                                                 ? "image/x-icon"
      : str ~= "(?i)^ff d8 ff"                                                    ? "image/jpeg"
      : str ~= "(?i)^25 50 44 46 2d"                                              ? "application/pdf"
      : str ~= "(?i)^89 50 4e 47 0d 0a 1a 0a"                                     ? "image/png"
      : str ~= "(?i)^(((?!3c|3e).. )|3c (3f|21) ((?!3c|3e).. )*3e )*+3c 73 76 67" ? "image/svg+xml"
      : str ~= "(?i)^(49 49 2a 00|4d 4d 00 2a)"                                   ? "image/tiff"
      : str ~= "(?i)^52 49 46 46 .. .. .. .. 57 45 42 50"                         ? "image/webp"
      : str ~= "(?i)^d7 cd c6 9a"                                                 ? "image/wmf"
      : ""

      ; Enables guessing of mime type for general purpose usage.
      if (mime == "") {
         DllCall("urlmon\FindMimeFromData"
                  ,    "ptr", 0             ; pBC
                  ,    "ptr", 0             ; pwzUrl
                  ,    "ptr", &bin          ; pBuffer
                  ,   "uint", size          ; cbSize
                  ,    "ptr", 0             ; pwzMimeProposed
                  ,   "uint", 0x20          ; dwMimeFlags
                  ,   "ptr*", MimeOut:=0    ; ppwzMimeOut
                  ,   "uint", 0             ; dwReserved
                  ,   "uint")
         mime := StrGet(MimeOut, "UTF-16")
         DllCall("ole32\CoTaskMemFree", "ptr", MimeOut)
      }

      return "data:" mime ";base64," this.StreamToBase64(stream)
   }

   BitmapToDc(pBitmap, alpha := "") {
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

   BitmapToHBitmap(pBitmap, alpha := "") {
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

   BitmapToHIcon(pBitmap) {
      ; Remember an hCursor is the same as an hIcon with an (x, y) hotspot.
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", hIcon:=0)
      return hIcon
   }

   BitmapToStream(pBitmap, extension := "", quality := "") {
      this.select_codec(pBitmap, extension, quality, pCodec, ep) ; Defaults to PNG for small sizes!
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", True, "ptr*", stream:=0, "uint")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", stream, "ptr", &pCodec, "ptr", &ep)
      return stream
   }

   BitmapToRandomAccessStream(pBitmap, extension := "", quality := "") {
      stream := this.BitmapToStream(pBitmap, extension, quality)
      IRandomAccessStream := this.StreamToRandomAccessStream(stream)
      ObjRelease(stream) ; Decrement the reference count of the IStream interface.
      return IRandomAccessStream
   }

   StreamToRandomAccessStream(stream) {
      ; Create a RandomAccessStream that loads the memory immediately (BSOS_PREFERDESTINATIONSTREAM = 1)
      VarSetCapacity(IID_IRandomAccessStream, 16)
      DllCall("ole32\IIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", &IID_IRandomAccessStream, "uint")
      DllCall("shcore\CreateRandomAccessStreamOverStream", "ptr", stream, "uint", 1, "ptr", &IID_IRandomAccessStream, "ptr*", IRandomAccessStream:=0, "uint")
      return IRandomAccessStream
   }

   BitmapToWicBitmap(pBitmap) {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", height:=0)

      IWICImagingFactory := ComObjCreate("{CACAF262-9370-4615-A13B-9F5539DA4C0A}", "{EC5EC8A9-C395-4314-9C77-54D7A935FF70}")

      ; Initialize bitmap with backing memory. WICBitmapCacheOnDemand = 1
      VarSetCapacity(GUID_WICPixelFormat32bppBGRA, 16)
      DllCall("ole32\CLSIDFromString", "wstr", "{6fddc324-4e03-4bfe-b185-3d77768dc90f}", "ptr", &GUID_WICPixelFormat32bppBGRA, "uint")
      DllCall(NumGet(NumGet(IWICImagingFactory+0)+A_PtrSize* 17), "ptr", IWICImagingFactory, "uint", width, "uint", height, "ptr", &GUID_WICPixelFormat32bppBGRA, "int", 1, "ptr*", wicbitmap:=0)

      ; Lock the WIC bitmap with write access only and get a pointer to its pixel buffer.
      VarSetCapacity(Rect, 16, 0)            ; sizeof(Rect) = 16
         NumPut(  width, Rect,  8,   "uint") ; Width
         NumPut( height, Rect, 12,   "uint") ; Height
      DllCall(NumGet(NumGet(wicbitmap+0)+A_PtrSize* 8), "ptr", wicbitmap, "ptr", &Rect, "uint", 0x1, "ptr*", IWICBitmapLock:=0)
      DllCall(NumGet(NumGet(IWICBitmapLock+0)+A_PtrSize* 5), "ptr", IWICBitmapLock, "uint*", size:=0, "ptr*", Scan0:=0)

      ; Transfer data from source pBitmap to a WIC Bitmap manually.
      VarSetCapacity(BitmapData, 16+2*A_PtrSize, 0)   ; sizeof(BitmapData) = 24, 32
         NumPut( 4 * width, BitmapData,  8,    "int") ; Stride
         NumPut(     Scan0, BitmapData, 16,    "ptr") ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", &Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", &BitmapData) ; Contains the pointer (Scan0) to the IWICBitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", &BitmapData)

      ObjRelease(IWICBitmapLock)
      ObjRelease(IWICImagingFactory)

      return wicbitmap
   }

   StreamToSafeArray(stream) {
      ; Allocate a one-dimensional SAFEARRAY based on the size of the stream.
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", size:=0, "uint")
      safearray := ComObjArray(0x11, size) ; VT_UI1
      pvData := NumGet(ComObjValue(safearray), 8 + A_PtrSize, "ptr")

      ; Copy the stream to the SAFEARRAY.
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", pvData, "uint", size, "uint")
      DllCall("shlwapi\IStream_Reset", "ptr", stream, "uint")

      return safearray
   }

   BitmapToSafeArray(pBitmap, extension := "", quality := "") {
      ; Thanks tmplinshi - https://www.autohotkey.com/boards/viewtopic.php?p=354007#p354007

      ; Create an IStream backed with movable memory.
      handle := DllCall("GlobalAlloc", "uint", 0x2, "uptr", 0, "ptr")
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", handle, "int", True, "ptr*", stream:=0, "uint")

      ; Save pBitmap to the IStream.
      this.select_codec(pBitmap, extension, quality, pCodec, ep) ; Defaults to PNG for small sizes!
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", stream, "ptr", &pCodec, "ptr", &ep)

      ; Get the pointer and size of the IStream's movable memory.
      ptr := DllCall("GlobalLock", "ptr", handle, "ptr")
      size := DllCall("GlobalSize", "ptr", handle, "uptr")

      ; Copy the encoded image to a SAFEARRAY.
      safearray := ComObjArray(0x11, size) ; VT_UI1
      pvData := NumGet(ComObjValue(safearray), 8 + A_PtrSize, "ptr")
      DllCall("RtlMoveMemory", "ptr", pvData, "ptr", ptr, "uptr", size)

      ; Release the IStream and call GlobalFree.
      DllCall("GlobalUnlock", "ptr", handle)
      ObjRelease(stream)

      return safearray
   }

   ParseWebp(stream, ByRef pDelays, ByRef pCount) {
      ; Gets the size of the stream.
      DllCall("shlwapi\IStream_Size", "ptr", stream, "uint64*", end:=0, "uint")

      ; Create FourCC binary buffer and initalize some variables.
      VarSetCapacity(fourcc, 4)
      offset := 0
      current := 0

      ; Create the VP8X FourCC.
      StrPut("VP8X", &VP8X := VarSetCapacity(VP8X, 4), "cp1252")
      DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", 12, "uint", 0, "uint64*", current)
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &fourcc, "uint", 4, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "uint*", offset, "uint", 4, "uint")
      if (4 != DllCall("ntdll\RtlCompareMemory", "ptr", &fourcc, "ptr", &VP8X, "uptr", 4, "uptr"))
         return

      ; Check the animation bit.
      DllCall("shlwapi\IStream_Read", "ptr", stream, "uchar*", flags:=0, "uint", 1, "uint")
      if not flags & 0x2
         return

      ; Goto the ANIM FourCC.
      StrPut("ANIM", &ANIM := VarSetCapacity(ANIM, 4), "cp1252")
      DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", offset - 1, "uint", 1, "uint64*", current)
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &fourcc, "uint", 4, "uint")
      DllCall("shlwapi\IStream_Read", "ptr", stream, "uint*", offset, "uint", 4, "uint")
      if (4 != DllCall("ntdll\RtlCompareMemory", "ptr", &fourcc, "ptr", &ANIM, "uptr", 4, "uptr"))
         return

      ; Create the custom loop count struct.
      pCount := DllCall("GlobalAlloc", "uint", 0, "uptr", 8 + 3*A_PtrSize, "ptr")
      NumPut(   0x5101, pCount + 0,    "uint") ; PropertyTagLoopCount
      NumPut(        1, pCount + 4,    "uint") ; Size
      NumPut(        3, pCount + 8,  "ushort") ; PropertyTagTypeShort
      NumPut(pCount + 8 + 2*A_PtrSize, pCount + 8 + A_PtrSize, "ptr")

      ; Save the loop count into the struct.
      DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", 4, "uint", 1, "uint64*", current)
      DllCall("shlwapi\IStream_Read", "ptr", stream, "ushort*", pCount + 8 + 2*A_PtrSize, "uint", 2, "uint")
      DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", offset - 6, "uint", 1, "uint64*", current)

      ; ANMF fourcc.
      StrPut("ANMF", &ANMF := VarSetCapacity(ANMF, 4), "cp1252")

      ; Create the custom frame delays struct.
      hDelays := DllCall("GlobalAlloc", "uint", 0x42, "uptr", 8 + 2*A_PtrSize, "ptr")
      pDelays := DllCall("GlobalLock", "ptr", hDelays, "ptr")
      NumPut(   0x5100, pDelays + 0,    "uint") ; PropertyTagFrameDelay
      NumPut(   0xCAFE, pDelays + 8,  "ushort") ; My custom tag for milliseconds.
      ; The size and the pointer will be filled in after all ANMF chunks are found.

      ; Create the delays stream.
      DllCall("GlobalUnlock", "ptr", hDelays)
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hDelays, "int", False, "ptr*", sDelays:=0, "uint")
      DllCall(NumGet(NumGet(sDelays+0)+A_PtrSize* 5), "ptr", sDelays, "uint64", 0, "uint", 2, "ptr", 0) ; Advance to end.

      ; Search for each RIFF-type ANMF chunk header (fourcc followed by its chunk size).
      while current < end {

         ; Get fourcc and chunk size.
         DllCall("shlwapi\IStream_Read", "ptr", stream, "ptr", &fourcc, "uint", 4, "uint")
         DllCall("shlwapi\IStream_Read", "ptr", stream, "uint*", offset, "uint", 4, "uint")

         ; Rounds up to a even number. Odd numbers are +1, and even numbers are +0.
         alignment := offset&1 ; Use this as offset + alignment.

         if (4 == DllCall("ntdll\RtlCompareMemory", "ptr", &fourcc, "ptr", &ANMF, "uptr", 4, "uptr")) {

            ; Seek to the Frame Duration.
            DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", 12, "uint", 1, "uint64*", current)

            ; Write the Frame Delay into the stream and cast from a uint24 to uint32.
            DllCall("shlwapi\IStream_Copy", "ptr", stream, "ptr", sDelays, "uint", 3, "uint")
            DllCall("shlwapi\IStream_Write", "ptr", sDelays, "uchar*", 0, "uint", 1, "uint")

            ; Subtract the 15 bytes that have already been read.
            offset -= 15
         }

         ; Seek to the next fourcc which must be aligned to 2 bytes.
         DllCall(NumGet(NumGet(stream+0)+A_PtrSize* 5), "ptr", stream, "uint64", offset + alignment, "uint", 1, "uint64*", current)
      }

      ; Fill in the size of the delays array and pointer position.
      ObjRelease(sDelays)
      nDelays := DllCall("GlobalSize", "ptr", hDelays, "uptr") - 8 - 2*A_PtrSize
      pDelays := DllCall("GlobalLock", "ptr", hDelays, "ptr")
      NumPut(nDelays, pDelays + 4,    "uint") ; Size
      NumPut(pDelays + 8 + 2*A_PtrSize, pDelays + 8 + A_PtrSize, "ptr")
   }

   RenderPdf(ByRef IStreamIn, index := "") {
      ; Thanks malcev - https://www.autohotkey.com/boards/viewtopic.php?t=80735
      (index == "") && index := 1

      ; Create a RandomAccessStream with BSOS_PREFERDESTINATIONSTREAM.
      VarSetCapacity(IID_IRandomAccessStream, 16)
      DllCall("ole32\IIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", &IID_IRandomAccessStream, "uint")
      DllCall("shcore\CreateRandomAccessStreamOverStream", "ptr", IStreamIn, "uint", 1, "ptr", &IID_IRandomAccessStream, "ptr*", IRandomAccessStreamIn:=0, "uint")

      ; Create the "Windows.Data.Pdf.PdfDocument" class using IPdfDocumentStatics.
      VarSetCapacity(IID_IPdfDocumentStatics, 16)
      DllCall("ole32\IIDFromString", "wstr", "{433A0B5F-C007-4788-90F2-08143D922599}", "ptr", &IID_IPdfDocumentStatics, "uint")
      DllCall("combase\WindowsCreateString", "wstr", "Windows.Data.Pdf.PdfDocument", "uint", 28, "ptr*", hString:=0, "uint")
      DllCall("combase\RoGetActivationFactory", "ptr", hString, "ptr", &IID_IPdfDocumentStatics, "ptr*", PdfDocumentStatics:=0, "uint")
      DllCall("combase\WindowsDeleteString", "ptr", hString, "uint")

      ; Create the PDF document.
      DllCall(NumGet(NumGet(PdfDocumentStatics+0)+A_PtrSize* 8), "ptr", PdfDocumentStatics, "ptr", IRandomAccessStreamIn, "ptr*", PdfDocument:=0)
      this.WaitForAsync(PdfDocument)

      ; Get Page
      DllCall(NumGet(NumGet(PdfDocument+0)+A_PtrSize* 7), "ptr", PdfDocument, "uint*", count:=0)
      index := (index > 0) ? index - 1 : (index < 0) ? count + index : 0 ; Zero indexed.
      if (index > count || index < 0) {
         ObjRelease(PdfDocument)
         ObjRelease(PdfDocumentStatics)
         this.ObjReleaseClose(IRandomAccessStreamIn)
         ObjRelease(IStreamIn)
         throw Exception("The maximum number of pages in this pdf is " count ".")
      }
      DllCall(NumGet(NumGet(PdfDocument+0)+A_PtrSize* 6), "ptr", PdfDocument, "uint", index, "ptr*", PdfPage:=0)

      ; Render the page to an output stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "uint", True, "ptr*", IStreamOut:=0)
      DllCall("shcore\CreateRandomAccessStreamOverStream", "ptr", IStreamOut, "uint", BSOS_DEFAULT := 0, "ptr", &IID_IRandomAccessStream, "ptr*", IRandomAccessStreamOut:=0)
      DllCall(NumGet(NumGet(PdfPage+0)+A_PtrSize* 6), "ptr", PdfPage, "ptr", IRandomAccessStreamOut, "ptr*", AsyncInfo:=0)
      this.WaitForAsync(AsyncInfo)

      ; Cleanup
      this.ObjReleaseClose(IRandomAccessStreamOut)
      this.ObjReleaseClose(PdfPage)

      ObjRelease(PdfDocument)
      ObjRelease(PdfDocumentStatics)

      this.ObjReleaseClose(IRandomAccessStreamIn)
      ObjRelease(IStreamIn)

      DllCall("shlwapi\IStream_Reset", "ptr", IStreamOut, "uint")
      return IStreamIn := IStreamOut
   }

   WaitForAsync(ByRef Object) {
      AsyncInfo := ComObjQuery(Object, IAsyncInfo := "{00000036-0000-0000-C000-000000000046}")
      while !DllCall(NumGet(NumGet(AsyncInfo+0)+A_PtrSize* 7), "ptr", AsyncInfo, "uint*", status:=0)
         and (status = 0)
            Sleep 10

      if (status != 1) {
         DllCall(NumGet(NumGet(AsyncInfo+0)+A_PtrSize* 8), "ptr", AsyncInfo, "uint*", ErrorCode:=0)
         throw Exception("AsyncInfo status error: " ErrorCode)
      }

      DllCall(NumGet(NumGet(Object+0)+A_PtrSize* 8), "ptr", Object, "ptr*", ObjectResult:=0, "cdecl")
      ObjRelease(Object)
      Object := ObjectResult

      DllCall(NumGet(NumGet(AsyncInfo+0)+A_PtrSize* 10), "ptr", AsyncInfo)
      ObjRelease(AsyncInfo)
   }

   ObjReleaseClose(ByRef Object) {
      if Object {
         if (Close := ComObjQuery(Object, IClosable := "{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}")) {
            DllCall(NumGet(NumGet(Close+0)+A_PtrSize* 6), "ptr", Close)
            ObjRelease(Close)
         }
         try return ObjRelease(Object)
         finally Object := ""
      }
   }

   select_codec(pBitmap, extension, quality, ByRef pCodec, ByRef ep) {
      extension := RegExReplace(extension, "^(\*?\.)?") ; Trim leading "*." or "." from the extension
      extension :=  extension ~= "^(avif|avifs)$"           ? "avif"
                  : extension ~= "^(bmp|dib|rle)$"          ? "bmp"
                  : extension ~= "^(gif)$"                  ? "gif"
                  : extension ~= "^(heic|heif|hif)$"        ? "heic"
                  : extension ~= "^(jpg|jpeg|jpe|jfif)$"    ? "jpeg"
                  : extension ~= "^(png)$"                  ? "png"
                  : extension ~= "^(tif|tiff)$"             ? "tiff"
                  : "png" ; Defaults to PNG

      VarSetCapacity(pCodec, 16)

      switch extension {
      case "avif": MsgBox % "AVIF is not supported by GDI+."
      case "bmp":  DllCall("ole32\CLSIDFromString", "wstr", "{557CF400-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      case "gif":  DllCall("ole32\CLSIDFromString", "wstr", "{557CF402-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      case "heic": DllCall("ole32\CLSIDFromString", "wstr", "{557CF408-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      case "jpeg": DllCall("ole32\CLSIDFromString", "wstr", "{557CF401-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      case "png":  DllCall("ole32\CLSIDFromString", "wstr", "{557CF406-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      case "tiff": DllCall("ole32\CLSIDFromString", "wstr", "{557CF405-1A04-11D3-9A73-0000F81EF32E}", "ptr", &pCodec, "uint")
      }

      ; Default encoding parameter.
      ep := 0

      ; JPEG default quality is 75. Otherwise set a quality value from [0-100].
      if (extension = "jpeg") && (quality ~= "^\d+$") {
         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ; enum ValueType - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.imaging.encoderparametervaluetype
         ; clsid Image Encoder Constants - http://www.jose.it-berater.org/gdiplus/reference/constants/gdipimageencoderconstants.htm
         VarSetCapacity(ep, 24+2*A_PtrSize + 4)            ; sizeof(EncoderParameter) = ptr + n*(28, 32)
         offset := &ep + 24+2*A_PtrSize                    ; Address of extra values appended to end
            NumPut(      1, ep,              0,   "uptr")  ; Count
            DllCall("ole32\CLSIDFromString", "wstr", "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}", "ptr", &ep+A_PtrSize, "uint")
            NumPut(      1, ep,   16+A_PtrSize,   "uint")  ; Number of Values
            NumPut(      4, ep,   20+A_PtrSize,   "uint")  ; Type
            NumPut( offset, ep,   24+A_PtrSize,    "ptr")  ; Value
            NumPut(quality, ep, 24+2*A_PtrSize,   "uint")  ; Quality (extra value appended to end)
      }
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

      ; Declare allowed extension outputs.
      outputs := "^(?i:avif|avifs|bmp|dib|rle|gif|heic|heif|hif|jpg|jpeg|jpe|jfif|png|tif|tiff)$"

      ; Check if the filename is actually the extension.
      if (extension == "" && filename ~= outputs)
         extension := filename, filename := ""

      ; An invalid extension is actually part of the filename.
      if !(extension ~= outputs) {
         ; Avoid appending an extra period without an extension.
         if (extension != "")
            filename .= "." extension

         ; Restore default extension.
         extension := default
      }

      ; Create a filepath based on the timestamp.
      if (filename == "") {
         colon := A_IsUnicode ? Chr(0xA789) : "_"
         FormatTime, filename,, % "yyyy-MM-dd HH" colon "mm" colon "ss"
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
         VarSetCapacity(si, A_PtrSize = 4 ? 20:32, 0) ; sizeof(GdiplusStartupInputEx) = 20, 32
            NumPut(0x2, si, "uint")
            NumPut(0x4, si, A_PtrSize = 4 ? 16:24, "uint")
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
                  . "`nAlternatively, use pic := ImagePutBuffer(image) and pic.pBitmap instead."
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
      pBitmap := this.ImageToBitmap(type, image)
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
            image := (hwnd := IsObject(image) ? image.hwnd : WinExist(image)) ? hwnd : image
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
      if !(pBitmap1 := this.ImageToBitmap(type, image))
         throw Exception("Conversion to bitmap failed. The pointer value is zero.")

      ; If there is only one image, verify that image and return.
      if (images.length() == 1) {
         if DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap1, "ptr*", pBitmapClone:=0)
            throw Exception("Validation failed. Unable to access and clone the bitmap.")

         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmapClone)
         goto Good_Ending
      }

      ; If there are multiple images, compare each subsequent image to the first.
      for i, image in images {
         if (A_Index != 1) {

            ; Guess the type of the image.
            try type := this.DontVerifyImageType(image)
            catch
               type := this.ImageType(image)

            ; Convert the other image to a bitmap.
            pBitmap2 := this.ImageToBitmap(type, image)

            ; Compare the two images.
            if !this.BitmapEqual(pBitmap1, pBitmap2)
               goto Bad_Ending ; Exit the loop if the comparison failed.

            ; Cleanup the bitmap.
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap2)
         }
      }

      Good_Ending: ; After getting isekai'ed you somehow build a prosperous kingdom and rule the land.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap1)
      this.gdiplusShutdown()
      return True

      Bad_Ending: ; Things didn't turn out the way you expected yet everyone seems to be fine despite that.
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

      ; The two bitmaps must be the same size but can have different pixel formats.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap1, "uint*", width1:=0)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap2, "uint*", width2:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap1, "uint*", height1:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap2, "uint*", height2:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap1, "int*", format1:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap2, "int*", format2:=0)

      ; If the dimensions are zero, then get width and height failed.
      if !(width1 && width2 && height1 && height2)
         throw Exception("Get bitmap width and height failed.")

      ; Dimensions must be equal.
      if (width1 != width2 || height1 != height2)
         return False

      ; Create clones of the supplied source bitmaps in their original PixelFormat.
      ; This has the side effect of solving the problem when both bitmaps reference 
      ; the same stream and only one of them is able to retrieve the pixel data through LockBits.
      ; This occurs when both streams are fighting over the same seek position.

      pBitmap1 := pBitmap2 := 0
      loop 2
         if DllCall("gdiplus\GdipCloneImage", "ptr", SourceBitmap%A_Index%, "ptr*", pBitmap%A_Index%)
            throw Exception("Cloning Bitmap" A_Index " failed.")

      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap1, "int*", format3:=0)
      if (format1 != format3)
         throw Exception("Report this error to the developer.")

      ; struct RECT - https://referencesource.microsoft.com/#System.Drawing/commonui/System/Drawing/Rectangle.cs,32
      VarSetCapacity(Rect, 16, 0)                 ; sizeof(Rect) = 16
         NumPut(  width1, Rect,  8,   "uint")     ; Width
         NumPut( height1, Rect, 12,   "uint")     ; Height

      ; Create a BitmapData structure.
      VarSetCapacity(BitmapData1, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32
      VarSetCapacity(BitmapData2, 16+2*A_PtrSize) ; sizeof(BitmapData) = 24, 32

      ; Force conversion into a pixel buffer. The user can declare a PixelFormat.
      loop 2
         DllCall("gdiplus\GdipBitmapLockBits"
                  ,    "ptr", pBitmap%A_Index%
                  ,    "ptr", &Rect
                  ,   "uint", 1            ; ImageLockMode.ReadOnly
                  ,    "int", PixelFormat  ; Defaults to Format32bppArgb for comparison.
                  ,    "ptr", &BitmapData%A_Index%)

      ; Get Stride (number of bytes per horizontal line).
      stride1 := NumGet(BitmapData1, 8, "int")
      stride2 := NumGet(BitmapData2, 8, "int")

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


; Drag and drop files directly onto this script file.
if (A_Args.length() > 0 and A_LineFile == A_ScriptFullPath)
{


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