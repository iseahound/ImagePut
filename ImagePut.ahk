; Script:    ImagePut.ahk
; License:   MIT License
; Author:    Edison Hua (iseahound)
; Github:    https://github.com/iseahound/ImagePut
; Date:      2023-03-02
; Version:   1.10

#Requires AutoHotkey v2.0-beta.13+


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

; Puts the image onto the clipboard and returns ClipboardAll().
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
ImagePutFormData(image, boundary := "ImagePut-abcdef") {
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
;   playback   -  Window Animation        |  bool     ->   True
ImagePutWindow(image, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "", playback := True) {
   return ImagePut("window", image, title, pos, style, styleEx, parent, playback)
}


;   title      -  Window Title            |  string   ->   MyTitle
;   pos        -  Window Coordinates      |  array    ->   [x,y,w,h] or [0,0]
;   style      -  Window Style            |  uint     ->   WS_VISIBLE
;   styleEx    -  Window Extended Style   |  uint     ->   WS_EX_LAYERED
;   parent     -  Window Parent           |  ptr      ->   hwnd
;   playback   -  Window Animation        |  bool     ->   True
ImageShow(image, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "", playback := True) {
   return ImagePut("show", image, title, pos, style, styleEx, parent, playback)
}

ImageDestroy(image) {
   return ImagePut.Destroy(image)
}

ImageWidth(image) {
   return ImagePut.Dimensions(image)[1]
}

ImageHeight(image) {
   return ImagePut.Dimensions(image)[2]
}
/*
ImagePut(cotype, image, p*) {
   return ImagePut.call(cotype, image, p*)
}

ImageEqual(images*) {
   return ImageEqual.call(images*)
}
*/

class ImagePut {

   static decode := False   ; Decompresses image to a pixel buffer. Any encoding such as JPG will be lost.
   static validate := False ; Always copies pixels to new memory immediately instead of copy-on-read/write.

   static call(cotype, image, p*) {

      ; Start!
      this.gdiplusStartup()

      ; Take a guess as to what the image might be. (>95% accuracy!)
      try type := this.DontVerifyImageType(&image, &keywords)
      catch
         type := this.ImageType(image)

      crop := keywords.crop
      scale := keywords.scale, upscale := keywords.upscale, downscale := keywords.downscale
      decode := (keywords.decode != "") ? keywords.decode : this.decode
      validate := (keywords.validate != "") ? keywords.validate : this.validate

      ; #1 - Stream intermediate.
      if not decode and not crop and not (scale || upscale || downscale)
         and (type ~= "^(?i:clipboard_png|pdf|url|file|stream|RandomAccessStream|hex|base64)$")
         and (cotype ~= "^(?i:file|stream|RandomAccessStream|hex|base64|uri|explorer|safeArray|formData)$")
         and (!p.Has(1) || p[1] == "") { ; For now, disallow any specification of extensions.

         ; Convert via stream intermediate.
         if !(pStream := this.ToStream(type, image, keywords))
            throw Error("pStream cannot be zero.")
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
         ; Doing so loads the pixels to the bitmap buffer. Increases memory usage.
         ; Prevents future changes to the original pixels from altering any copies.
         ; Without validation, it preforms copy-on-write and copy on LockBits(read).
         set := False

         if (type ~= "^(?i:clipboard_png|pdf|url|file|stream|RandomAccessStream|hex|base64)$") {

            ; Check the file signature for magic numbers.
            size := 12
            bin := Buffer(size)

            ; Get the first few bytes of the image.
            pStream := this.ToStream(type, image, keywords)
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", bin, "uint", size, "hresult")

            ; Allocate enough space for a hexadecimal string with spaces and a null terminator.
            length := 2 * size + (size - 1) + 1
            VarSetStrCapacity(&str, length)

            ; Lift the binary representation to hex.
            flags := 0x40000004 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_HEXRAW
            DllCall("crypt32\CryptBinaryToString", "ptr", bin, "uint", size, "uint", flags, "str", str, "uint*", &length)

            ; WEBP Signature: RIFF....WEBP
            if not str ~= "^52 49 46 46 .. .. .. .. 57 45 42 50"
               goto otherwise

            ; Gets the size of the stream.
            DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &end:=0, "hresult")

            ; Create FourCC binary buffer and a general purpose uint32 buffer.
            fourcc := Buffer(4)
            offset := 0
            current := 0

            ; Create the VP8X FourCC.
            StrPut("VP8X", VP8X := Buffer(4), "cp1252")
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", fourcc, "uint", 4, "hresult")
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "uint*", &offset, "uint", 4, "hresult")
            if 4 != DllCall("ntdll\RtlCompareMemory", "ptr", fourcc, "ptr", VP8X, "uptr", 4, "uptr")
               goto otherwise

            ; Check the animation bit.
            ;ComCall(5, pStream, "uint64", 4, "uint", 1, "uint64*", &current)
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "uchar*", &flags:=0, "uint", 1, "hresult")
            ;MsgBox "Animation Bit: " (flags & 0x2), Format("{:x}", flags)
            if not flags & 0x2
               goto otherwise

            ; Goto the ANIM FourCC.
            StrPut("ANIM", ANIM := Buffer(4), "cp1252")
            ComCall(5, pStream, "uint64", offset - 1, "uint", 1, "uint64*", &current)
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", fourcc, "uint", 4, "hresult")
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "uint*", &offset, "uint", 4, "hresult")
            if 4 != DllCall("ntdll\RtlCompareMemory", "ptr", fourcc, "ptr", ANIM, "uptr", 4, "uptr")
               goto otherwise



            ; Create the custom loop count struct.
            pCount := DllCall("GlobalAlloc", "uint", 0, "uptr", 8 + 3*A_PtrSize, "ptr")
            NumPut(   "uint",    0x5101, pCount, 0) ; PropertyTagLoopCount
            NumPut(   "uint",         1, pCount, 4) ; Size
            NumPut( "ushort",         3, pCount, 8) ; PropertyTagTypeShort
            NumPut(    "ptr", pCount + 8 + 2*A_PtrSize, pCount, 8 + A_PtrSize)

            ; Save the loop count into the struct.
            ComCall(Seek := 5, pStream, "uint64", 4, "uint", 1, "uint64*", &current)
            DllCall("shlwapi\IStream_Read", "ptr", pStream, "ushort*", pCount + 8 + 2*A_PtrSize, "uint", 2, "hresult")
            ComCall(Seek := 5, pStream, "uint64", offset - 6, "uint", 1, "uint64*", &current)


            ; ANMF fourcc.
            StrPut("ANMF", ANMF := Buffer(4), "cp1252")

            ; Create the custom frame delays struct.
            hDelays := DllCall("GlobalAlloc", "uint", 0x42, "uptr", 8 + 2*A_PtrSize, "ptr")
            pDelays := DllCall("GlobalLock", "ptr", hDelays, "ptr")
            NumPut(   "uint",    0x5100, pDelays, 0) ; PropertyTagFrameDelay
            NumPut( "ushort",    0xCAFE, pDelays, 8) ; My custom tag for milliseconds.
            ; The size and the pointer will be filled in after all ANMF chunks are found.

            ; Create the delays stream.
            DllCall("GlobalUnlock", "ptr", hDelays)
            DllCall("ole32\CreateStreamOnHGlobal", "ptr", hDelays, "int", False, "ptr*", &sDelays:=0, "hresult")
            ComCall(Seek := 5, sDelays, "uint64", 0, "uint", 2, "ptr", 0) ; Advance to end.

            ; Search for each RIFF-type ANMF chunk header (fourcc followed by its chunk size).
            while current < end {

               ; Get fourcc and chunk size.
               DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", fourcc, "uint", 4, "hresult")
               DllCall("shlwapi\IStream_Read", "ptr", pStream, "uint*", &offset, "uint", 4, "hresult")

               ; Rounds up to a even number. Odd numbers are +1, and even numbers are +0.
               alignment := offset&1 ; Use this as offset + alignment.

               if 4 == DllCall("ntdll\RtlCompareMemory", "ptr", fourcc, "ptr", ANMF, "uptr", 4, "uptr") {

                  ; Seek to the Frame Duration.
                  ComCall(Seek := 5, pStream, "uint64", 12, "uint", 1, "uint64*", &current)

                  ; Cast the Frame Delay from uint24 to uint32 and write it to the delays stream.
                  DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", sDelays, "uint", 3, "hresult")
                  DllCall("shlwapi\IStream_Write", "ptr", sDelays, "uchar*", 0, "uint", 1, "hresult")

                  ; Subtract the 15 bytes that have already been read.
                  offset -= 15
               }

               ; Seek to the next fourcc which must be aligned to 2 bytes.
               ComCall(Seek := 5, pStream, "uint64", offset + alignment, "uint", 1, "uint64*", &current)
            }

            ; Fill in the size of the delays array and pointer position.
            ObjRelease(sDelays)
            DelaySize := DllCall("GlobalSize", "ptr", hDelays, "uptr") - 8 - 2*A_PtrSize
            pDelays := DllCall("GlobalLock", "ptr", hDelays, "ptr")
            NumPut(   "uint", DelaySize, pDelays, 4) ; Size
            NumPut(    "ptr", pDelays + 8 + 2*A_PtrSize, pDelays, 8 + A_PtrSize)

            otherwise:
            ObjRelease(pStream)
         }

         ; Convert via GDI+ bitmap intermediate.
         if !(pBitmap := this.ToBitmap(type, image, keywords))
            throw Error("pBitmap cannot be zero.")

         (validate) && DllCall("gdiplus\GdipImageForceValidation", "ptr", pBitmap)
         (crop) && this.BitmapCrop(&pBitmap, crop)
         (scale) && this.BitmapScale(&pBitmap, scale)
         (upscale) && this.BitmapScale(&pBitmap, upscale, 1)
         (downscale) && this.BitmapScale(&pBitmap, downscale, -1)

         IsSet(pDelays) && DllCall("gdiplus\GdipSetPropertyItem", "ptr", pBitmap, "ptr", pDelays)
         IsSet(pCount) && DllCall("gdiplus\GdipSetPropertyItem", "ptr", pBitmap, "ptr", pCount)

         coimage := this.BitmapToCoimage(cotype, pBitmap, p*)

         ; Clean up the pBitmap copy. Export raw pointers if requested.
         if !(cotype = "bitmap")
            DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      ; Check for dangling pointers.
      this.gdiplusShutdown(cotype)

      return coimage
   }

   static get(self, name) {
      return ObjHasOwnProp(self, name) ? self.%name% : ""
   }

   static inputs := [
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




   static DontVerifyImageType(&image, &keywords := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      keywords := {base: {__get: (self, name, *) => this.get(self, name)}}

      ; Try ImageType.
      if !IsObject(image)
         throw Error("Must be an object.")

      ; Goto ImageType.
      if ObjHasOwnProp(image, "image") {
         keywords := image
         keywords.base := {__get: (self, name, *) => this.get(self, name)}
         image := image.image
         throw Error("Must catch this error with ImageType.")
      }

      ; Skip ImageType.
      for type in this.inputs
         if ObjHasOwnProp(image, type) {
            keywords := image
            keywords.base := {__get: (self, name, *) => this.get(self, name)}
            image := image.%type%
            return type
         }

      ; Continue ImageType.
      throw Error("Invalid type.")
   }

   static ImageType(image) {

      if not IsObject(image)
         goto string

      if (image.HasOwnProp("prototype") && image.prototype.HasOwnProp("__class") && image.prototype.__class == "ClipboardAll")
      or (image.base.HasOwnProp("__class") && image.base.__class == "ClipboardAll") {

         ; A "clipboard_png" is a pointer to a PNG stream saved as the "png" clipboard format.
         if DllCall("IsClipboardFormatAvailable", "uint", DllCall("RegisterClipboardFormat", "str", "png", "uint"))
            return "clipboard_png"

         ; A "clipboard" is a handle to a GDI bitmap saved as CF_BITMAP.
         if DllCall("IsClipboardFormatAvailable", "uint", 2)
            return "clipboard"

         throw Error("Clipboard format not supported.")
      }




      ; A "object" has a pBitmap property that points to an internal GDI+ bitmap.
      if image.HasOwnProp("pBitmap")
         try if !DllCall("gdiplus\GdipGetImageType", "ptr", image.pBitmap, "ptr*", &type:=0) && (type == 1)
            return "object"

      ; A "window" is an object with an hwnd property.
      if image.HasOwnProp("hwnd")
         return "window"

      ; A "screenshot" is an array of 4 numbers.
      if (HasMethod(image, "__Item") && image[1] ~= "^-?\d+$" && image[2] ~= "^-?\d+$" && image[3] ~= "^-?\d+$" && image[4] ~= "^-?\d+$")
         return "screenshot"

      ; A "buffer" is an object with a pointer to bytes and properties to determine its 2-D shape.
      if image.HasOwnProp("ptr")
         and (image.HasOwnProp("width") && image.HasOwnProp("height")
         or image.HasOwnProp("stride") && image.HasOwnProp("height")
         or image.HasOwnProp("size") && (image.HasOwnProp("stride") || image.HasOwnProp("width") || image.HasOwnProp("height")))
         return "buffer"

      if image.HasOwnProp("ptr") {
         image := image.ptr
         goto pointer
      } else
         goto end

      string:
      if (image == "")
         throw Error("Image data is an empty string.")

      ; A non-zero "monitor" number identifies each display uniquely; and 0 refers to the entire virtual screen.
      if (image ~= "^\d+$" && image >= 0 && image <= MonitorGetCount())
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
      if WinExist(image)
         return "window"

      ; A "hex" string is binary image data encoded into text using hexadecimal.
      if (StrLen(image) >= 48) && (image ~= "^\s*(?:[A-Fa-f0-9]{2})*+\s*$")
         return "hex"

      ; A "base64" string is binary image data encoded into text using standard 64 characters.
      if (StrLen(image) >= 32) && (image ~= "^\s*(?:data:image\/[a-z]+;base64,)?"
      . "(?:[A-Za-z0-9+\/]{4})*+(?:[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{2}==)?\s*$")
         return "base64"

      if not (image ~= "^-?\d+$")
         goto end

      handle:
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
      try if !DllCall("gdiplus\GdipGetImageType", "ptr", image, "ptr*", &type:=0) && (type == 1)
         return "bitmap"

      ; Note 1: All GDI+ functions add 1 to the reference count of COM objects.
      ; Note 2: GDI+ pBitmaps that are queried cease to stay pBitmaps.
      ; Note 3: Critical error for ranges 0-4095 on v1 and 0-65535 on v2.
      ObjRelease(image) ; Therefore do not move this, it has been tested.

      pointer:
      ; A "stream" is a pointer to the IStream interface.
      try if ComObjQuery(image, "{0000000C-0000-0000-C000-000000000046}")
         return "stream"

      ; A "RandomAccessStream" is a pointer to the IRandomAccessStream interface.
      try if ComObjQuery(image, "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}")
         return "RandomAccessStream"

      ; A "wicBitmap" is a pointer to a IWICBitmapSource.
      try if ComObjQuery(image, "{00000120-A8F2-4877-BA0A-FD2B6645FB94}")
         return "wicBitmap"

      ; A "d2dBitmap" is a pointer to a ID2D1Bitmap.
      try if ComObjQuery(image, "{A2296057-EA42-4099-983B-539FB6505426}")
         return "d2dBitmap"


      ; For more helpful error messages: Catch file names without extensions!
      for extension in ["bmp","dib","rle","jpg","jpeg","jpe","jfif","gif","tif","tiff","png","ico","exe","dll"]
         if FileExist(image "." extension)
            throw Error("A ." extension " file extension is required!", -3)

      end:
      throw Error("Image type could not be identified.")
   }

   static ToBitmap(type, image, k := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      (!k) && k := {__get: (self, name, *) => this.get(self, name)}

      if (type = "clipboard_png")
         return this.from_clipboard_png()

      if (type = "clipboard")
         return this.from_clipboard()

      if (type = "object")
         return this.from_bitmap(image.pBitmap)

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

      throw Error("Conversion from " type " to bitmap is not supported.")
   }

   static BitmapToCoimage(cotype, pBitmap, p1:="", p2:="", p3:="", p4:="", p5:="", p6:="", p*) {
      ; BitmapToCoimage("clipboard", pBitmap)
      if (cotype = "clipboard" || cotype = "clipboard_png")
         return this.to_clipboard(pBitmap)

      ; BitmapToCoimage("buffer", pBitmap)
      if (cotype = "buffer")
         return this.to_buffer(pBitmap)

      ; BitmapToCoimage("sharedbuffer", pBitmap, p1)
      if (cotype = "sharedbuffer")
         return this.to_sharedbuffer(pBitmap, p1)

      ; BitmapToCoimage("screenshot", pBitmap, screenshot, alpha)
      if (cotype = "screenshot")
         return this.to_screenshot(pBitmap, p1, p2)

      ; BitmapToCoimage("show", pBitmap, title, pos, style, styleEx, parent, playback)
      if (cotype = "show")
         return this.show(pBitmap, p1, p2, p3, p4, p5, p6)

      ; BitmapToCoimage("window", pBitmap, title, pos, style, styleEx, parent, playback)
      if (cotype = "window")
         return this.to_window(pBitmap, p1, p2, p3, p4, p5, p6)

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

      throw Error("Conversion from bitmap to " cotype " is not supported.")
   }

   static ToStream(type, image, k := "") {

      ; Sentinel value: Returns the empty string for unknown properties.
      (!k) && k := {__get: (self, name, *) => this.get(self, name)}

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

      throw Error("Conversion from " type " to stream is not supported.")
   }

   static StreamToCoimage(cotype, pStream, p1 := "", p2 := "", p*) {
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

      throw Error("Conversion from stream to " cotype " is not supported.")
   }

   static BitmapCrop(&pBitmap, crop) {
      if not (IsObject(crop)
      && crop[1] ~= "^-?\d+(\.\d*)?%?$" && crop[2] ~= "^-?\d+(\.\d*)?%?$"
      && crop[3] ~= "^-?\d+(\.\d*)?%?$" && crop[4] ~= "^-?\d+(\.\d*)?%?$")
         throw Error("Invalid crop.")

      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "int*", &format:=0)

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

      ; Clone
      DllCall("gdiplus\GdipCloneBitmapAreaI"
               ,    "int", crop[1]
               ,    "int", crop[2]
               ,    "int", crop[3]
               ,    "int", crop[4]
               ,    "int", format
               ,    "ptr", pBitmap
               ,   "ptr*", &pBitmapCrop:=0)

      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      return pBitmap := pBitmapCrop
   }

   static BitmapScale(&pBitmap, scale, direction := 0) {
      if not (IsObject(scale) && ((scale[1] ~= "^\d+$") || (scale[2] ~= "^\d+$")) || (scale ~= "^\d+(\.\d+)?$"))
         throw Error("Invalid scale.")

      ; Get Bitmap width, height, and format.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", pBitmap, "int*", &format:=0)

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
               , "int", safe_w, "int", safe_h, "int", 0, "int", format, "ptr", 0, "ptr*", &pBitmapScale:=0)
      DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", pBitmapScale, "ptr*", &pGraphics:=0)

      ; Set settings in graphics context.
      DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
      DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
      DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

      ; Draw Image.
      DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0)
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

      ; Fallback to CF_BITMAP. This format does not support transparency even with to_hBitmap().
      if !DllCall("IsClipboardFormatAvailable", "uint", 2)
         throw Error("Clipboard does not have CF_BITMAP data.")

      if !(hbm := DllCall("GetClipboardData", "uint", 2, "ptr"))
         throw Error("Shared clipboard data has been deleted.")

      DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &pBitmap:=0)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("CloseClipboard")
      return pBitmap
   }

   static from_clipboard_png() {
      pStream := this.get_clipboard_png()
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_clipboard_png() {
      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Clipboard could not be opened.")

      png := DllCall("RegisterClipboardFormat", "str", "png", "uint")
      if !DllCall("IsClipboardFormatAvailable", "uint", png)
         throw Error("Clipboard does not have PNG stream data.")

      if !(hData := DllCall("GetClipboardData", "uint", png, "ptr"))
         throw Error("Shared clipboard data has been deleted.")

      ; Allow the stream to be freed while leaving the hData intact.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210930-00/?p=105745
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", False, "ptr*", &pStream:=0, "hresult")
      DllCall("CloseClipboard")
      return pStream
   }

   static from_buffer(image) {

      if image.HasOwnProp("stride")
         stride := image.stride
      else if image.HasOwnProp("width")
         stride := image.width * 4
      else if image.HasOwnProp("height") && image.HasOwnProp("size")
         stride := image.size // image.height
      else throw Error("Buffer must have a stride property.")

      if image.HasOwnProp("width")
         width := image.width
      else if image.HasOwnProp("stride")
         width := image.stride // 4
      else if image.HasOwnProp("height") && image.HasOwnProp("size")
         width := image.size // (4 * image.height)
      else throw Error("Buffer must have a width property.")

      if image.HasOwnProp("height")
         height := image.height
      else if image.HasOwnProp("stride") && image.HasOwnProp("size")
         height := image.size // image.stride
      else if image.HasOwnProp("width") && image.HasOwnProp("size")
         height := image.size // (4 * image.width)
      else throw Error("Buffer must have a height property.")

      ; Could assert a few assumptions, such as stride * height = size.
      ; However, I'd like for the pointer and its size to be as flexable as possible.
      ; So permit underflow for now.

      ; Check for buffer overflow errors.
      if image.HasOwnProp("size") && (abs(stride * height) > image.size)
         throw Error("Image dimensions exceed the size of the buffer.")

      ; Create a pBitmap from the current pointer.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", stride, "int", 0x26200A, "ptr", image.ptr, "ptr*", &pBitmap:=0)

      ; Todo: what happens if the backing data is destroyed?

      return pBitmap
   }

   static read_screen() {

      assert(statement, message) {
         if !statement
            throw ValueError(message, -1, statement)
      }

      ; Load DirectX
      assert IDXGIFactory := CreateDXGIFactory(), "Create IDXGIFactory failed."

      CreateDXGIFactory() {
         if !DllCall("GetModuleHandle", "str", "DXGI")
            DllCall("LoadLibrary", "str", "DXGI")
         if !DllCall("GetModuleHandle", "str", "D3D11")
            DllCall("LoadLibrary", "str", "D3D11")
         DllCall("ole32\CLSIDFromString", "wstr", "{7b7166ec-21c7-44ae-b21a-c9ae321ae369}", "ptr", riid := Buffer(16, 0), "hresult")
         DllCall("DXGI\CreateDXGIFactory1", "ptr", riid, "ptr*", &ppFactory:=0, "hresult")
         return ppFactory
      }

      ; Get monitor?
      loop {
         ComCall(IDXGIFactory_EnumAdapters := 7, IDXGIFactory, "uint", A_Index-1, "ptr*", &IDXGIAdapter:=0)

         loop {
            try ComCall(IDXGIAdapter_EnumOutputs := 7, IDXGIAdapter, "uint", A_Index-1, "ptr*", &IDXGIOutput:=0)
            catch OSError as e
               if e.number = 0x887A0002 ; DXGI_ERROR_NOT_FOUND
                  break
               else throw

            ComCall(IDXGIOutput_GetDesc := 7, IDXGIOutput, "ptr", DXGI_OUTPUT_DESC := Buffer(88+A_PtrSize, 0))
            Width             := NumGet(DXGI_OUTPUT_DESC, 72, "int")
            Height            := NumGet(DXGI_OUTPUT_DESC, 76, "int")
            AttachedToDesktop := NumGet(DXGI_OUTPUT_DESC, 80, "int")
            if (AttachedToDesktop = 1)
               break 2
         }
      }

      ; Ensure the desktop is connected.
      assert AttachedToDesktop, "No adapter attached to desktop."

      ; Load direct3d
      DllCall("D3D11\D3D11CreateDevice"
               ,    "ptr", IDXGIAdapter                 ; pAdapter
               ,    "int", D3D_DRIVER_TYPE_UNKNOWN := 0 ; DriverType
               ,    "ptr", 0                            ; Software
               ,   "uint", 0                            ; Flags
               ,    "ptr", 0                            ; pFeatureLevels
               ,   "uint", 0                            ; FeatureLevels
               ,   "uint", D3D11_SDK_VERSION := 7       ; SDKVersion
               ,   "ptr*", &d3d_device:=0               ; ppDevice
               ,   "ptr*", 0                            ; pFeatureLevel
               ,   "ptr*", &d3d_context:=0              ; ppImmediateContext
               ,"hresult")

      ; Retrieve the desktop duplication API
      IDXGIOutput1 := ComObjQuery(IDXGIOutput, "{00cddea8-939b-4b83-a340-a685226666cc}")
      ComCall(IDXGIOutput1_DuplicateOutput := 22, IDXGIOutput1, "ptr", d3d_device, "ptr*", &Duplication:=0)
      ComCall(IDXGIOutputDuplication_GetDesc := 7, Duplication, "ptr", DXGI_OUTDUPL_DESC := Buffer(36, 0))
      DesktopImageInSystemMemory := NumGet(DXGI_OUTDUPL_DESC, 32, "uint")
      Sleep 50   ; As I understand - need some sleep for successful connecting to IDXGIOutputDuplication interface

      ; Create the texture onto which the desktop will be copied to.
      D3D11_TEXTURE2D_DESC := Buffer(44, 0)
         NumPut("uint",                            width, D3D11_TEXTURE2D_DESC,  0)   ; Width
         NumPut("uint",                           height, D3D11_TEXTURE2D_DESC,  4)   ; Height
         NumPut("uint",                                1, D3D11_TEXTURE2D_DESC,  8)   ; MipLevels
         NumPut("uint",                                1, D3D11_TEXTURE2D_DESC, 12)   ; ArraySize
         NumPut("uint", DXGI_FORMAT_B8G8R8A8_UNORM := 87, D3D11_TEXTURE2D_DESC, 16)   ; Format
         NumPut("uint",                                1, D3D11_TEXTURE2D_DESC, 20)   ; SampleDescCount
         NumPut("uint",                                0, D3D11_TEXTURE2D_DESC, 24)   ; SampleDescQuality
         NumPut("uint",         D3D11_USAGE_STAGING := 3, D3D11_TEXTURE2D_DESC, 28)   ; Usage
         NumPut("uint",                                0, D3D11_TEXTURE2D_DESC, 32)   ; BindFlags
         NumPut("uint", D3D11_CPU_ACCESS_READ := 0x20000, D3D11_TEXTURE2D_DESC, 36)   ; CPUAccessFlags
         NumPut("uint",                                0, D3D11_TEXTURE2D_DESC, 40)   ; MiscFlags
      ComCall(ID3D11Device_CreateTexture2D := 5, d3d_device, "ptr", D3D11_TEXTURE2D_DESC, "ptr", 0, "ptr*", &staging_tex:=0)


      ; Persist the concept of a desktop_resource as a closure???
      local desktop_resource

      Update(this, timeout := unset) {
         ; Unbind resources.
         Unbind()

         ; Allocate a shared buffer for all calls of AcquireNextFrame.
         static DXGI_OUTDUPL_FRAME_INFO := Buffer(48, 0)

         if !IsSet(timeout) {
            ; The following loop structure repeatedly checks for a new frame.
            loop {
               ; Ask if there is a new frame available immediately.
               try ComCall(IDXGIOutputDuplication_AcquireNextFrame := 8, Duplication, "uint", 0, "ptr", DXGI_OUTDUPL_FRAME_INFO, "ptr*", &desktop_resource:=0)
               catch OSError as e
                  if e.number = 0x887A0027 ; DXGI_ERROR_WAIT_TIMEOUT
                     continue
                  else throw

               ; Exclude mouse movement events by ensuring LastPresentTime is greater than zero.
               if NumGet(DXGI_OUTDUPL_FRAME_INFO, 0, "int64") > 0
                  break

               ; Continue the loop by releasing resources.
               ObjRelease(desktop_resource)
               ComCall(IDXGIOutputDuplication_ReleaseFrame := 14, Duplication)
            }
         } else {
            try ComCall(IDXGIOutputDuplication_AcquireNextFrame := 8, Duplication, "uint", timeout, "ptr", DXGI_OUTDUPL_FRAME_INFO, "ptr*", &desktop_resource:=0)
            catch OSError as e
               if e.number = 0x887A0027 ; DXGI_ERROR_WAIT_TIMEOUT
                  return this ; Remember to enable method chaining.
               else throw

            if NumGet(DXGI_OUTDUPL_FRAME_INFO, 0, "int64") = 0
               return this ; Remember to enable method chaining.
         }

         ; map new resources.
         if (DesktopImageInSystemMemory = 1) {
            static DXGI_MAPPED_RECT := Buffer(A_PtrSize*2, 0)
            ComCall(IDXGIOutputDuplication_MapDesktopSurface := 12, Duplication, "ptr", DXGI_MAPPED_RECT)
            pitch := NumGet(DXGI_MAPPED_RECT, 0, "int")
            pBits := NumGet(DXGI_MAPPED_RECT, A_PtrSize, "ptr")
         }
         else {
            tex := ComObjQuery(desktop_resource, "{6f15aaf2-d208-4e89-9ab4-489535d34f9c}") ; ID3D11Texture2D
            ComCall(ID3D11DeviceContext_CopyResource := 47, d3d_context, "ptr", staging_tex, "ptr", tex)
            static D3D11_MAPPED_SUBRESOURCE := Buffer(8+A_PtrSize, 0)
            ComCall(ID3D11DeviceContext_Map := 14, d3d_context, "ptr", staging_tex, "uint", 0, "uint", D3D11_MAP_READ := 1, "uint", 0, "ptr", D3D11_MAPPED_SUBRESOURCE)
            pBits := NumGet(D3D11_MAPPED_SUBRESOURCE, 0, "ptr")
            pitch := NumGet(D3D11_MAPPED_SUBRESOURCE, A_PtrSize, "uint")
         }

         this.ptr := pBits
         this.size := pitch * height

         ; Remember to enable method chaining.
         return this
      }

      Unbind() {
         if IsSet(desktop_resource) && desktop_resource != 0 {
            if (DesktopImageInSystemMemory = 1)
               ComCall(IDXGIOutputDuplication_UnMapDesktopSurface := 13, Duplication)
            else
               ComCall(ID3D11DeviceContext_Unmap := 15, d3d_context, "ptr", staging_tex, "uint", 0)

            ObjRelease(desktop_resource)
            ComCall(IDXGIOutputDuplication_ReleaseFrame := 14, Duplication)
         }
      }

      Cleanup(this) {
         Unbind()
         ObjRelease(staging_tex)
         ObjRelease(duplication)
         ObjRelease(d3d_context)
         ObjRelease(d3d_device)
         IDXGIOutput1 := ""
         ObjRelease(IDXGIOutput)
         ObjRelease(IDXGIAdapter)
         ObjRelease(IDXGIFactory)
      }

      ; Get true virtual screen coordinates.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      x := DllCall("GetSystemMetrics", "int", 76, "int")
      y := DllCall("GetSystemMetrics", "int", 77, "int")
      width := DllCall("GetSystemMetrics", "int", 78, "int")
      height := DllCall("GetSystemMetrics", "int", 79, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      return {x:x, y:y, width: width,
         height: height,
         Update: Update,
      Cleanup : Cleanup}.update() ; init ptr && size.
   }

   static from_screenshot2(image) {
      obj := this.read_screen()

      width := obj.width
      height := obj.height
      pBits := obj.ptr
      size := obj.size

      ; Create a Bitmap with 32-bit pre-multiplied ARGB. (Owned by this object!)
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "uint", size / height, "uint", 0xE200B, "ptr", 0, "ptr*", &pBitmap:=0)

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

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      return pBitmap
   }









   static from_screenshot(image) {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517

      ; Allow the image to be a window handle.
      if !IsObject(image) and WinExist(image) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         WinGetClientPos &x, &y, &w, &h, image
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         image := [x, y, w, h]
      }




      ; Adjust coordinates relative to specified window.
      if image.Has(5) and WinExist(image[5]) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         WinGetClientPos &xr, &yr,,, image[5]
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         image[1] += xr
         image[2] += yr
      }




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

      ; Check window DPI awareness.
      ; PROCESS_DPI_UNAWARE = 0, PROCESS_SYSTEM_DPI_AWARE = 1, PROCESS_PER_MONITOR_DPI_AWARE = 2
      DPI_AWARENESS := True ; Assume dpi aware if process cannot be opened.
      DllCall("GetWindowThreadProcessId", "ptr", image, "ptr*", pid:=0, "ptr")
      if hProcess := DllCall("OpenProcess", "uint", 0x0400, "int", False, "uint", pid, "ptr") {
         DllCall("Shcore\GetProcessDpiAwareness", "ptr", hProcess, "int*", DPI_AWARENESS)
         DllCall("CloseHandle", "ptr", hProcess)
      }

      ; Get the width and height of the client window.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", DPI_AWARENESS ? -3 : -5, "ptr")
      DllCall("GetClientRect", "ptr", image, "ptr", Rect := Buffer(16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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
      DllCall("user32\PrintWindow", "ptr", image, "ptr", hdc, "uint", 0x3) ; PW_RENDERFULLCONTENT | PW_CLIENTONLY
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

      loop windows.length
         hwnd := windows[A_Index]
      until DllCall("FindWindowEx", "ptr", hwnd, "ptr", 0, "str", "SHELLDLL_DefView", "ptr", 0)

      ; Maybe this hack gets patched. Tough luck!
      if !(WorkerW := DllCall("FindWindowEx", "ptr", 0, "ptr", hwnd, "str", "WorkerW", "ptr", 0, "ptr"))
         throw Error("Could not locate hidden window behind desktop.")

      ; Get the width and height of the client window.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      DllCall("GetClientRect", "ptr", WorkerW, "ptr", Rect := Buffer(16)) ; sizeof(RECT) = 16
         , width  := NumGet(Rect, 8, "int")
         , height := NumGet(Rect, 12, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      width  := DllCall("GetSystemMetrics", "int", 78, "int")
      height := DllCall("GetSystemMetrics", "int", 79, "int")
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

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

      ; Paints the wallpaper.
      DllCall("user32\PaintDesktop", "ptr", hdc)

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
      DllCall("DestroyCursor", "ptr", hCursor)

      return pBitmap
   }

   static from_pdf(image, index := "") {
      pStream := this.get_pdf(image, index)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_pdf(image, index := "") {
      ; Thanks malcev - https://www.autohotkey.com/boards/viewtopic.php?t=80735
      (index == "") && index := 1

      ; Create a stream from either a url or a file.
      pStream := this.is_url(image) ? this.get_url(image) : this.get_file(image)

      ; Compare the signature of the file with the PDF magic string "%PDF".
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", signature := Buffer(4), "uint", 4, "hresult")
      StrPut("%PDF", magic := Buffer(4), "CP0")
      if 4 > DllCall("ntdll\RtlCompareMemory", "ptr", signature, "ptr", magic, "uptr", 4, "uptr")
         throw Error("Invalid PDF.")

      ; Create a RandomAccessStream with BSOS_PREFERDESTINATIONSTREAM.
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", CLSID := Buffer(16), "hresult")
      DllCall("ShCore\CreateRandomAccessStreamOverStream", "ptr", pStream, "uint", 1, "ptr", CLSID, "ptr*", &pRandomAccessStream:=0, "hresult")

      ; Create the "Windows.Data.Pdf.PdfDocument" class using IPdfDocumentStatics.
      DllCall("combase\WindowsCreateString", "wstr", "Windows.Data.Pdf.PdfDocument", "uint", 28, "ptr*", &hString:=0, "hresult")
      DllCall("ole32\CLSIDFromString", "wstr", "{433A0B5F-C007-4788-90F2-08143D922599}", "ptr", CLSID := Buffer(16), "hresult")
      DllCall("combase\RoGetActivationFactory", "ptr", hString, "ptr", CLSID, "ptr*", &PdfDocumentStatics:=0, "hresult")
      DllCall("combase\WindowsDeleteString", "ptr", hString, "hresult")

      ; Create the PDF document.
      ComCall(IPdfDocumentStatics_LoadFromStreamAsync := 8, PdfDocumentStatics, "ptr", pRandomAccessStream, "ptr*", &PdfDocument:=0)
      this.WaitForAsync(&PdfDocument)

      ; Get Page
      ComCall(IPdfDocument_GetPage := 7, PdfDocument, "uint*", &count:=0)
      index := (index > 0) ? index - 1 : (index < 0) ? count + index : 0 ; Zero indexed.
      if (index > count || index < 0) {
         ObjRelease(PdfDocument)
         ObjRelease(PdfDocumentStatics)
         this.ObjReleaseClose(&pRandomAccessStream)
         ObjRelease(pStream)
         throw Error("The maximum number of pages in this pdf is " count ".")
      }
      ComCall(IPdfDocument_GetPage := 6, PdfDocument, "uint", index, "ptr*", &PdfPage:=0)

      ; Render the page to an output stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "uint", True, "ptr*", &pStreamOut:=0)
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", CLSID := Buffer(16), "hresult")
      DllCall("ShCore\CreateRandomAccessStreamOverStream", "ptr", pStreamOut, "uint", BSOS_DEFAULT := 0, "ptr", CLSID, "ptr*", &pRandomAccessStreamOut:=0)
      ComCall(IPdfPage_RenderToStreamAsync := 6, PdfPage, "ptr", pRandomAccessStreamOut, "ptr*", &AsyncInfo:=0)
      this.WaitForAsync(&AsyncInfo)

      ; Cleanup
      this.ObjReleaseClose(&pRandomAccessStreamOut)
      this.ObjReleaseClose(&PdfPage)

      ObjRelease(PdfDocument)
      ObjRelease(PdfDocumentStatics)

      this.ObjReleaseClose(&pRandomAccessStream)
      ObjRelease(pStream)

      return pStreamOut
   }

   static WaitForAsync(&Object) {
      AsyncInfo := ComObjQuery(Object, IAsyncInfo := "{00000036-0000-0000-C000-000000000046}")
      while !ComCall(IAsyncInfo_Status := 7, AsyncInfo, "uint*", &status:=0)
         and (status = 0)
            Sleep 10

      if (status != 1) {
         ComCall(IAsyncInfo_ErrorCode := 8, AsyncInfo, "uint*", &ErrorCode:=0)
         throw Error("AsyncInfo status error: " ErrorCode)
      }

      ComCall(8, Object, "ptr*", &ObjectResult:=0, "cdecl") ; GetResults
      ObjRelease(Object)
      Object := ObjectResult

      ComCall(IAsyncInfo_Close := 10, AsyncInfo)
      AsyncInfo := ""
   }

   static ObjReleaseClose(&Object) {
      if Object {
         if (Close := ComObjQuery(Object, IClosable := "{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}")) {
            ComCall(IClosable_Close := 6, Close)
            Close := ""
         }
         try return ObjRelease(Object)
         finally Object := ""
      }
   }

   static from_url(image) {
      pStream := this.get_url(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_url(image) {
      req := ComObject("WinHttp.WinHttpRequest.5.1")
      req.Open("GET", image, True)
      req.Send()
      req.WaitForResponse()
      IStream := ComObjQuery(req.ResponseStream, "{0000000C-0000-0000-C000-000000000046}"), ObjAddRef(IStream.ptr)
      return IStream.ptr
   }

   static from_file(image) {
      ; This is faster than GdipCreateBitmapFromFile and does not lock the file.
      pStream := this.get_file(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_file(image) {
      file := FileOpen(image, "r")
      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", file.length, "ptr")
      pData := DllCall("GlobalLock", "ptr", hData, "ptr")
      file.RawRead(pData, file.length)
      DllCall("GlobalUnlock", "ptr", hData)
      file.Close()
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", &pStream:=0, "hresult")
      return pStream
   }

   static from_hex(image) {
      pStream := this.get_hex(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_hex(image) {
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
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", &pStream:=0, "hresult")
      return pStream
   }

   static from_base64(image) {
      pStream := this.get_base64(image)
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_base64(image) {
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
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", &pStream:=0, "hresult")
      return pStream
   }

   static from_monitor(image) {
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
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
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
      return this.from_screenshot([x,y,w,h])
   }

   static from_dc(image) {
      ; An application cannot select a single bitmap into more than one DC at a time.
      if !(sbm := DllCall("GetCurrentObject", "ptr", image, "uint", 7))
         throw Error("The device context has no bitmap selected.")

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", sbm, "int", dib.size, "ptr", dib)
         , width  := NumGet(dib, 4, "uint")
         , height := NumGet(dib, 8, "uint")
         , bpp    := NumGet(dib, 18, "ushort")
         , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

      ; Fallback to built-in method if pixels are not 32-bit ARGB or hBitmap is a device dependent bitmap.
      if (pBits = 0 || bpp != 32) { ; This built-in version is 120% faster but ignores transparency.
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", sbm, "ptr", 0, "ptr*", &pBitmap:=0)
         return pBitmap
      }

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
               , "ptr", image, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY

      ; Convert the pARGB pixels copied into the device independent bitmap (hbm) to ARGB.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

      return pBitmap
   }

   static from_hBitmap(image) {
      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", image, "int", dib.size, "ptr", dib)
         , width  := NumGet(dib, 4, "uint")
         , height := NumGet(dib, 8, "uint")
         , bpp    := NumGet(dib, 18, "ushort")
         , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

      ; Fallback to built-in method if pixels are not 32-bit ARGB or hBitmap is a device dependent bitmap.
      if (pBits = 0 || bpp != 32) { ; This built-in version is 120% faster but ignores transparency.
         DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", image, "ptr", 0, "ptr*", &pBitmap:=0)
         return pBitmap
      }

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

      ; Use LockBits to create a copy-from buffer on pBits that converts pARGB to ARGB.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 6            ; ImageLockMode.UserInputBuffer | ImageLockMode.WriteOnly
               ,    "int", 0xE200B      ; Format32bppPArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (pBits) to the hbm.

      ; If the source image cannot be selected onto a device context BitBlt cannot be used.
      sdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")           ; Creates a memory DC compatible with the current screen.
      old := DllCall("SelectObject", "ptr", sdc, "ptr", image, "ptr") ; Returns 0 on failure.

      ; Copies the image (hBitmap) to a top-down bitmap. Removes bottom-up-ness if present.
      if (old) ; Using BitBlt is about 10% faster than GetDIBits.
         DllCall("gdi32\BitBlt"
                  , "ptr", hdc, "int", 0, "int", 0, "int", width, "int", height
                  , "ptr", sdc, "int", 0, "int", 0, "uint", 0x00CC0020) ; SRCCOPY
      else ; If already selected onto a device context...
         DllCall("GetDIBits", "ptr", hdc, "ptr", image, "uint", 0, "uint", height, "ptr", pBits, "ptr", bi, "uint", 0)

      ; The stock bitmap (obm) can never be leaked.
      DllCall("SelectObject", "ptr", sdc, "ptr", obm)
      DllCall("DeleteDC",     "ptr", sdc)

      ; Write the pARGB pixels from the device independent bitmap (hbm) to the ARGB pBitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Cleanup the hBitmap and device contexts.
      DllCall("SelectObject", "ptr", hdc, "ptr", obm)
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("DeleteDC",     "ptr", hdc)

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
      DllCall("user32\DrawIconEx"
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
      ; Cloning a temporary stream bypasses the downsides of GDI+ controlling the stream.
      ComCall(IStream_Clone := 13, image, "ptr*", &pStream:=0)
      ; Completely ignores the seek pointer and sets the seek position to 4096.
      DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
      ObjRelease(pStream)
      return pBitmap
   }

   static get_stream(image) {
      ; Creates a new, separate stream. Necessary to separate reference counting through a clone.
      ComCall(IStream_Clone := 13, image, "ptr*", &pStream:=0)
      ; Ensures that a duplicated stream does not inherit the original seek position.
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
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
      ; Note that the returned stream shares a reference count with the original RandomAccessStream's internal stream.
      DllCall("ole32\CLSIDFromString", "wstr", "{0000000C-0000-0000-C000-000000000046}", "ptr", CLSID := Buffer(16), "hresult")
      DllCall("ShCore\CreateStreamOverRandomAccessStream", "ptr", image, "ptr", CLSID, "ptr*", &pStream:=0, "hresult")
      ; Cloning the stream ensures that each call to "GetStreamFromRandomAccessStream" returns a new stream.
      ; ^ That's what the function should be named, because that's what it actually does!
      ComCall(IStream_Clone := 13, pStream, "ptr*", &pStreamClone:=0)
      return pStreamClone
   }

   static from_wicBitmap(image) {
      ; IWICBitmapSource::GetSize - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L1304
      ComCall(3, image, "uint*", &width:=0, "uint*", &height:=0)

      ; Intialize an empty pBitmap using managed memory.
      DllCall("gdiplus\GdipCreateBitmapFromScan0"
               , "int", width, "int", height, "int", 0, "int", 0x26200A, "ptr", 0, "ptr*", &pBitmap:=0)

      ; Create a pixel buffer.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 2            ; ImageLockMode.WriteOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)
      Scan0 := NumGet(BitmapData, 16, "ptr")
      stride := NumGet(BitmapData, 8, "int")

      ; IWICBitmapSource::CopyPixels - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L1322
      ComCall(7, image, "ptr", Rect, "uint", stride, "uint", stride * height, "ptr", Scan0)

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      return pBitmap
   }

   static from_sprite(image) {
      ; Create a source pBitmap.
      if !(pBitmap := this.from_file(image))
         if !(pBitmap := this.from_url(image))
            throw Error("Could not be loaded from a valid file path or URL.")

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Create a pixel buffer.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 3            ; ImageLockMode.ReadWrite
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)
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
      DllCall(code, "ptr", Scan0, "ptr", Scan0 + 4*width*height, "uint", NumGet(Scan0, "uint"), "cdecl")

      ; Write pixels to bitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      return pBitmap
   }

   static to_clipboard(pBitmap) {
      ; Standard Clipboard Formats - https://www.codeproject.com/Reference/1091137/Windows-Clipboard-Formats
      ; Synthesized Clipboard Formats - https://docs.microsoft.com/en-us/windows/win32/dataxchg/clipboard-formats

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Clipboard could not be opened.")

      ; Requires a valid window handle via OpenClipboard or the next call to OpenClipboard will crash.
      DllCall("EmptyClipboard")

      ; #1 - Place the image onto the clipboard as a PNG stream.
      ; Thanks Jochen Arndt - https://www.codeproject.com/Answers/1207927/Saving-an-image-to-the-clipboard#answer3

      ; Create a Stream whose underlying HGlobal must be referenced or lost forever.
      ; Rescue the HGlobal after GDI+ has written the PNG to stream and release the stream.
      ; Please read: https://devblogs.microsoft.com/oldnewthing/20210929-00/?p=105742
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", &pStream:=0, "hresult")
      this.select_codec(pBitmap, "png", "", &pCodec, &ep, &ci, &v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "uint*", &hData:=0, "hresult")
      ObjRelease(pStream)

      ; Set the rescued HGlobal to the clipboard as a shared object.
      png := DllCall("RegisterClipboardFormat", "str", "png", "uint") ; case insensitive
      DllCall("SetClipboardData", "uint", png, "ptr", hData)


      ; #2 - Place the image onto the clipboard in the CF_DIB format using a bottom-up bitmap.
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", &hbm:=0, "uint", 0)

      ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
      ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
      dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
      DllCall("GetObject", "ptr", hbm, "int", dib.size, "ptr", dib)
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

      ; CF_DIB (8) can be synthesized into CF_BITMAP (2), CF_PALETTE (9), and CF_DIBV5 (17).
      DllCall("SetClipboardData", "uint", 8, "ptr", hdib)

      ; Cleanup
      DllCall("DeleteObject", "ptr", hbm)
      DllCall("CloseClipboard")
      return ClipboardAll()
   }

   set_clipboard(pStream) { ; Not yet implemented.
      this.select_extension(pStream, &extension:="")

      if !(extension ~= "gif|png") {
         DllCall("gdiplus\GdipCreateBitmapFromStream", "ptr", pStream, "ptr*", &pBitmap:=0)
         this.to_clipboard(pBitmap)
         DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
         return ClipboardAll()
      }

      ; Open the clipboard with exponential backoff.
      loop
         if DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
            break
         else
            if A_Index < 6
               Sleep (2**(A_Index-1) * 30)
            else throw Error("Clipboard could not be opened.")

      ; Requires a valid window handle via OpenClipboard or the next call to OpenClipboard will crash.
      DllCall("EmptyClipboard")

      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", False, "ptr*", &pSharedStream:=0, "hresult")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &size:=0, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pSharedStream, "uint", size, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      DllCall("ole32\GetHGlobalFromStream", "ptr", pSharedStream, "uint*", &hData:=0, "hresult")
      ObjRelease(pSharedStream)
      DllCall("SetClipboardData", "uint", DllCall("RegisterClipboardFormat", "str", extension, "uint"), "ptr", hData)
      DllCall("CloseClipboard")
      return ClipboardAll()
   }

   static to_buffer(pBitmap) {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Allocate global memory.
      size := 4 * width * height
      ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", size, "ptr")

      ; Create a pixel buffer.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",        ptr, BitmapData, 16) ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)

      ; Write pixels to global memory.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Free the pixels later.
      free := DllCall.bind("GlobalFree", "ptr", ptr)

      return ImagePut.BitmapBuffer(ptr, size, width, height, free)
   }

   static open_sharedbuffer(image) {
      hMap := DllCall("OpenFileMapping", "uint", 0x2, "int", 0, "str", image, "ptr")
      pMap := DllCall("MapViewOfFile", "ptr", hMap, "uint", 0x2, "uint", 0, "uint", 0, "uptr", 0, "ptr")

      width := NumGet(pMap + 0, "uint")
      height := NumGet(pMap + 4, "uint")
      size := 4 * width * height
      ptr := pMap + 8

      free := () => (
         DllCall("UnmapViewOfFile", "ptr", pMap),
         DllCall("CloseHandle", "ptr", hMap)
      )

      buf := ImagePut.BitmapBuffer(ptr, size, width, height, free)
      buf.name := image
      return buf
   }

   static to_sharedbuffer(pBitmap, name := "Alice") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Allocate shared memory.
      size := 4 * width * height
      hMap := DllCall("CreateFileMapping", "ptr", -1, "ptr", 0, "uint", 0x4, "uint", 0, "uint", size, "str", name, "ptr")
      pMap := DllCall("MapViewOfFile", "ptr", hMap, "uint", 0x2, "uint", 0, "uint", 0, "uptr", 0, "ptr")

      ; Store width and height in the first 8 bytes.
      NumPut("uint",  width, pMap, 0)
      NumPut("uint", height, pMap, 4)
      ptr := pMap + 8

      ; Target a pixel buffer.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",        ptr, BitmapData, 16) ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)

      ; Write pixels to buffer.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Free the pixels later.
      free := () => (
         DllCall("UnmapViewOfFile", "ptr", pMap),
         DllCall("CloseHandle", "ptr", hMap)
      )

      buf := ImagePut.BitmapBuffer(ptr, size, width, height, free)
      buf.name := name
      return buf
   }

   class BitmapBuffer {

      __New(ptr, size, width, height, free:="") {
         ImagePut.gdiplusStartup()

         ; Create a pBitmap on saved memory.
         DllCall("gdiplus\GdipCreateBitmapFromScan0"
                  , "int", width, "int", height, "int", size // height, "int", 0x26200A, "ptr", ptr, "ptr*", &pBitmap:=0)

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

      __Item[x, y] {
         get => Format("0x{:08X}", NumGet(this.ptr + 4*(y*this.width + x), "uint"))
         set => ((value >> 24) || value |= 0xFF000000,
                  NumPut("uint", value, this.ptr + 4*(y*this.width + x)),
                  value)
      }

      __Enum(n) {

         start := 0
         end := this.size

         switch n {
         case 1:
            enum1(&c) {

               if start == end
                  return False

               ; yield statements
               c := Format("0x{:08X}", NumGet(this, start, "uint"))

               ; do block
               start += 4

               ; continue?
               return start <= end
            }
            return enum1

         case 2:
            enum2(&i, &c) {

               if start == end
                  return False

               ; yield statements
               i := start // 4
               c := Format("0x{:08X}", NumGet(this, start, "uint"))

               ; do block
               start += 4

               ; continue?
               return start <= end
            }
            return enum2

         case 3:
            enum3(&x, &y, &c) {

               if start == end
                  return False

               ; yield statements
               i := start // 4
               x := mod(i, this.width)
               y := i // this.width
               c := Format("0x{:08X}", NumGet(this, start, "uint"))

               ; do block
               start += 4

               ; continue?
               return start <= end
            }
            return enum3

         case 6:
            enum6(&x, &y, &c, &r, &g, &b) {

               if start == end
                  return False

               ; yield statements
               i := start // 4
               x := mod(i, this.width)
               y := i // this.width
               c := Format("0x{:08X}", NumGet(this, start, "uint"))
               r := c >> 16 & 0xFF
               g := c >>  8 & 0xFF
               b := c       & 0xFF

               ; do block
               start += 4

               ; continue?
               return start <= end
            }
            return enum6

         case 7:
            enum7(&x, &y, &c, &r, &g, &b, &a) {

               if start == end
                  return False

               ; yield statements
               i := start // 4
               x := mod(i, this.width)
               y := i // this.width
               c := Format("0x{:08X}", NumGet(this, start, "uint"))
               r := c >> 16 & 0xFF
               g := c >>  8 & 0xFF
               b := c       & 0xFF
               a := c >> 24 & 0xFF

               ; do block
               start += 4

               ; continue?
               return start <= end
            }
            return enum7
         }
      }

      Frequency() {
         if this.HasProp(map)
            return
         this.map := Map()
         loop this.width * this.height
            if c := NumGet(this.ptr + 4*(A_Index-1), "uint")
               this.map[c] := this.map.has(c) ? this.map[c] + 1 : 1
      }

      Count(c*) {
         this.Frequency()
         acc := 0
         for each, color in c {
            ; Lift color to 32-bits if first 8 bits are zero.
            (color >> 24) || color |= 0xFF000000
            acc += this.map.get(color, 0)
         }
         return acc
      }

      Clone() {
         ptr := DllCall("GlobalAlloc", "uint", 0, "uptr", this.size, "ptr")
         DllCall("RtlMoveMemory", "ptr", ptr, "ptr", this.ptr, "uptr", this.size)
         free := DllCall.bind("GlobalFree", "ptr", ptr)
         return ImagePut.BitmapBuffer(ptr, this.size, this.width, this.height, free)
      }

      Crop(x, y, w, h) {
         DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", this.pBitmap, "int*", &format:=0)
         DllCall("gdiplus\GdipCloneBitmapAreaI", "int", x, "int", y, "int", w, "int", h, "int", format, "ptr", this.pBitmap, "ptr*", &pBitmap:=0)
         try return ImagePut.to_buffer(pBitmap)
         finally DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      }

      Show(window_border := False, title := "", pos := "", style := "", styleEx := "", parent := "") {
         return (window_border)
            ? ImagePut.to_window(this.pBitmap, title, pos, style, styleEx, parent)
            : ImagePut.show(this.pBitmap, title, pos, style, styleEx, parent)
      }

      Save(filepath := "", quality := "")  {

         ; Process filepath and set extension.
         extension := "bmp"
         ImagePut.select_filepath(&filepath, &extension)

         ; If extension is not .bmp, use to_file routine.
         if (extension != "bmp")
            return ImagePut.to_file(this.pBitmap, filepath, quality)

         bm := Buffer(54)

         StrPut("BM", bm, "CP0")                ; identifier
         NumPut(  "uint", 54+this.size, bm,  2) ; file size
         NumPut(  "uint",            0, bm,  6) ; reserved
         NumPut(  "uint",           54, bm, 10) ; bitmap data offset

         ; BITMAPINFOHEADER struct
         NumPut(  "uint",           40, bm, 14) ; Size
         NumPut(  "uint",   this.width, bm, 18) ; Width
         NumPut(   "int", -this.height, bm, 22) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",            1, bm, 26) ; Planes
         NumPut("ushort",           32, bm, 28) ; BitCount / BitsPerPixel

         NumPut(  "uint",            0, bm, 30) ; biCompression
         NumPut(  "uint",    this.size, bm, 34) ; biSizeImage
         NumPut(   "int",            0, bm, 38) ; biXPelsPerMeter
         NumPut(   "int",            0, bm, 42) ; biYPelsPerMeter
         NumPut(  "uint",            0, bm, 46) ; biClrUsed
         NumPut(  "uint",            0, bm, 50) ; biClrImportant

         loop
            try
               if file := FileOpen(filepath, "w")
                  break
               else throw
            catch
               if A_Index < 6
                  Sleep (2**(A_Index-1) * 30)
               else throw

         file.RawWrite(bm)                    ; Writes 54 bytes of bitmap file header.
         file.RawWrite(this)                  ; Writes raw 32-bit ARGB pixel data.
         file.Close()

         return filepath
      }

      Base64Code(b64) {
         static codes := Map()

         if codes.has(b64)
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
            DllCall(code, "uint*", &a := 1, "uint*", &b := 0, "uint*", &c := 0, "uint*", &d := 0, "cdecl")

            ; Free memory.
            DllCall("GlobalFree", "ptr", code)

            ; To check for SSE2 use the following code example:
            ; if cpuid().edx[26] == True
            eax := Map(0, a & 1)
            ebx := Map(0, b & 1)
            ecx := Map(0, c & 1)
            edx := Map(0, d & 1)
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
            else if (variation.length == 3)
                  option := 3
            else if (variation.length == 6)
                  option := 4
            else throw Error("Invalid variation parameter.")
         }
         else
            if not IsObject(variation)
               if (variation == 0)
                  option := 5
               else
                  option := 6
            else if (variation.length == 3)
                  option := 7
            else throw Error("Invalid variation parameter.")

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
            colors := Buffer(4*color.length)

            ; Fill the struct by iterating through the input array.
            for c in color {
                (c >> 24) || c |= 0xFF000000             ; Lift colors to 32-bit ARGB.
                NumPut("uint", c, colors, 4*(A_Index-1)) ; Place the unsigned int at each offset.
            }

            address := DllCall(pixelsearch3, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", colors, "uint", color.length, "cdecl ptr")
         }

         ; Options 6 & 7 - Creates a high and low struct where each pair is the min and max range.

         if (option == 6) {
            high := Buffer(4*color.length)
            low := Buffer(4*color.length)

            for c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               v := abs(variation)

               NumPut("uchar", 255, high, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", min(r+v, 255), high, 4*A_Offset + 2)
               NumPut("uchar", min(g+v, 255), high, 4*A_Offset + 1)
               NumPut("uchar", min(b+v, 255), high, 4*A_Offset + 0)

               NumPut("uchar", 0, low, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", max(r-v, 0), low, 4*A_Offset + 2)
               NumPut("uchar", max(g-v, 0), low, 4*A_Offset + 1)
               NumPut("uchar", max(b-v, 0), low, 4*A_Offset + 0)
            }

            address := DllCall(pixelsearch4, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", high, "ptr", low, "uint", color.length, "cdecl ptr")
         }

         if (option == 7) {
            high := Buffer(4*color.length)
            low := Buffer(4*color.length)

            for c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               vr := abs(variation[1])
               vg := abs(variation[2])
               vb := abs(variation[3])

               NumPut("uchar", 255, high, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", min(r + vr, 255), high, 4*A_Offset + 2)
               NumPut("uchar", min(g + vg, 255), high, 4*A_Offset + 1)
               NumPut("uchar", min(b + vb, 255), high, 4*A_Offset + 0)

               NumPut("uchar", 0, low, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", max(r - vr, 0), low, 4*A_Offset + 2)
               NumPut("uchar", max(g - vg, 0), low, 4*A_Offset + 1)
               NumPut("uchar", max(b - vb, 0), low, 4*A_Offset + 0)
            }

            address := DllCall(pixelsearch4, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", high, "ptr", low, "uint", color.length, "cdecl ptr")
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
            else if (variation.length == 3)
                  option := 3
            else if (variation.length == 6)
                  option := 4
            else throw Error("Invalid variation parameter.")
         }
         else
            if not IsObject(variation)
               if (variation == 0)
                  option := 5
               else
                  option := 6
            else if (variation.length == 3)
                  option := 7
            else throw Error("Invalid variation parameter.")

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
         result := Buffer(A_PtrSize * limit) ; Allocate buffer for addresses.

         ; When doing pointer arithmetic, *Scan0 + 1 is actually adding 4 bytes.
         if (option == 1)
            count := DllCall(pixelsearchall1, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "uint", color, "cdecl uint")

         if (option == 2) {
            r := ((color & 0xFF0000) >> 16)
            g := ((color & 0xFF00) >> 8)
            b := ((color & 0xFF))
            v := abs(variation)

            count := DllCall(pixelsearchall2, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
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

            count := DllCall(pixelsearchall2, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(r + vr, 255)
                     , "uchar", max(r - vr, 0)
                     , "uchar", min(g + vg, 255)
                     , "uchar", max(g - vg, 0)
                     , "uchar", min(b + vb, 255)
                     , "uchar", max(b - vb, 0)
                     , "cdecl ptr")
         }

         if (option == 4)
            count := DllCall(pixelsearchall2, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size
                     , "uchar", min(max(variation[1], variation[2]), 255)
                     , "uchar", max(min(variation[1], variation[2]), 0)
                     , "uchar", min(max(variation[3], variation[4]), 255)
                     , "uchar", max(min(variation[3], variation[4]), 0)
                     , "uchar", min(max(variation[5], variation[6]), 255)
                     , "uchar", max(min(variation[5], variation[6]), 0)
                     , "cdecl ptr")

         if (option == 5) {
            ; Create a struct of unsigned integers.
            colors := Buffer(4*color.length)

            ; Fill the struct by iterating through the input array.
            for c in color {
                (c >> 24) || c |= 0xFF000000             ; Lift colors to 32-bit ARGB.
                NumPut("uint", c, colors, 4*(A_Index-1)) ; Place the unsigned int at each offset.
            }

            count := DllCall(pixelsearchall3, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", colors, "uint", color.length, "cdecl ptr")
         }

         ; Options 6 & 7 - Creates a high and low struct where each pair is the min and max range.

         if (option == 6) {
            high := Buffer(4*color.length)
            low := Buffer(4*color.length)

            for c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               v := abs(variation)

               NumPut("uchar", 255, high, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", min(r+v, 255), high, 4*A_Offset + 2)
               NumPut("uchar", min(g+v, 255), high, 4*A_Offset + 1)
               NumPut("uchar", min(b+v, 255), high, 4*A_Offset + 0)

               NumPut("uchar", 0, low, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", max(r-v, 0), low, 4*A_Offset + 2)
               NumPut("uchar", max(g-v, 0), low, 4*A_Offset + 1)
               NumPut("uchar", max(b-v, 0), low, 4*A_Offset + 0)
            }

            count := DllCall(pixelsearchall4, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", high, "ptr", low, "uint", color.length, "cdecl ptr")
         }

         if (option == 7) {
            high := Buffer(4*color.length)
            low := Buffer(4*color.length)

            for c in color {
               A_Offset := A_Index - 1

               r := ((c & 0xFF0000) >> 16)
               g := ((c & 0xFF00) >> 8)
               b := ((c & 0xFF))
               vr := abs(variation[1])
               vg := abs(variation[2])
               vb := abs(variation[3])

               NumPut("uchar", 255, high, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", min(r + vr, 255), high, 4*A_Offset + 2)
               NumPut("uchar", min(g + vg, 255), high, 4*A_Offset + 1)
               NumPut("uchar", min(b + vb, 255), high, 4*A_Offset + 0)

               NumPut("uchar", 0, low, 4*A_Offset + 3) ; Alpha
               NumPut("uchar", max(r - vr, 0), low, 4*A_Offset + 2)
               NumPut("uchar", max(g - vg, 0), low, 4*A_Offset + 1)
               NumPut("uchar", max(b - vb, 0), low, 4*A_Offset + 0)
            }

            count := DllCall(pixelsearchall4, "ptr", result, "uint", limit, "ptr", this.ptr, "ptr", this.ptr + this.size, "ptr", high, "ptr", low, "uint", color.length, "cdecl ptr")
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
         loop count {
            address := NumGet(result, A_PtrSize * (A_Index-1), "ptr")
            offset := (address - this.ptr) // 4
            xys.push([mod(offset, this.width), offset // this.width])
         }
         return xys
      }

      ImageSearch(image, variation := 0, option := "") {

         ; Convert image to a buffer object.
         if !(IsObject(image) && ObjHasOwnProp(image, "ptr") && ObjHasOwnProp(image, "size"))
            image := ImagePutBuffer(image)

         ; Check if the object has the coordinates.
         x := ObjHasOwnProp(image, "x") ? image.x : image.width//2
         y := ObjHasOwnProp(image, "y") ? image.y : image.height//2

         if (option == "") {
            if (variation == 0)
               option := 1
            else
               option := 2
         }

         ; ------------------------ Machine code generated with MCode4GCC using gcc 13.2.0 ------------------------
         ; C source code - https://godbolt.org/z/zGhb3dYcs
         imagesearch1 := this.Base64Code((A_PtrSize == 4)
            ? ""
            : "QVdBVkFVQVRVV1ZTSIPsGESLlCSYAAAARQ+2YQNEidAPr4QkgAAAAInTi5QkkAAAAESJxUiJz0GJ3UWLAUQrrCSAAAAASAHQQYs0"
            . "gYnoK4QkiAAAAIPAAQ+vw0yNHIFMOdkPgwQBAABED6/TiWwkcEkB0usQDx8ASIPBBEw52Q+D4wAAAEI5NJF17UWE5A+FrAAAAEiJ"
            . "yDHSSCn4SMH4AvfzQTnVctGLhCSIAAAAhcB0eIuEJIAAAABFMfZEiGQkD0Ux/0SJ8kiNLIUAAAAATInISI0UkUyNJChMOeBzS0iJ"
            . "LCQPH0QAAIB4AwB0CosqOSgPhYAAAABIg8AESIPCBEw54HLjSIssJEGDxwFEObwkiAAAAHQTQQHeTI0kKESJ8kiNFJFMOeBytUiJ"
            . "yEiDxBhbXl9dQVxBXUFeQV/DZpBEOQEPhEv///9Ig8EETDnZcxZCOTSRdOhIg8EETDnZD4Ig////Dx8Ai2wkcA+v3UiNDJ/rtQ8f"
            . "AEQPtmQkD+n1/v//")

         ; C source code - https://godbolt.org/z/qGexdGqMn
         imagesearch2 := this.Base64Code((A_PtrSize == 4)
            ? ""
            : "QVdBVkFVQVRVV1ZTSIPsOESLnCSgAAAAi7wkqAAAAEGJ1EmJyouUJLgAAACLjCSwAAAAQSn4TImMJJgAAABIi7QkmAAAAEQPt4wkwAAAAInQRQ+vxEEPr8NPjTSCSAHIiwSGRInmRCneiXQkLE058g+DcAEAAEEPr9QPtthEieVmiVwkKA+23MHoEA+2wIlcJBxIAcpmiUQkKkiNDJUAAAAARInaSI1xAUgp1UyNLJUAAAAASIl0JBBBjVP/SI1xAkWJy0iJdCQgSMHlAjH2QffbTI08lQAAAABmDx9EAABBD7YUCg+3RCQoKdBmQTnBcwpmRDnYD4LTAAAASItEJBBBD7YUAg+3RCQcKdBmQTnBcwpmRDnYD4KyAAAASItEJCBBD7YUAg+3RCQqKdBmQTnBcwpmRDnYD4KRAAAAhf8PhKMAAABIi4QkmAAAAEyJfCQITInSMdtJic9OjQQoTDnAD4OBAAAAiVwkGOsTZpBIg8AESIPCBEw5wA+DfwAAAIB4AwB06Q+2CA+2GinZZkE5yXMGZkQ52XIsD7ZIAQ+2WgEp2WZBOclzBmZEOdlyFg+2SAIPtloCKdlmQTnJc69mRDnZc6lMiflMi3wkCIPGAUmDwgREOeZyPTH2TTnyD4L6/v//RTHSTInQSIPEOFteX11BXEFdQV5BX8MPHwCLXCQYSAHqg8MBOfsPhUn////r1Q8fQABNOfJzyTl0JCwPg7n+//9NAfpNOfJztzH26ar+//8=")



         ; --------------------------------------------------------------------------------------------------------

         ; Search for the address of the first matching image.
         if (option == 1)
            address := DllCall(imagesearch1, "ptr", this.ptr, "uint", this.width, "uint", this.height
                     , "ptr", image.ptr, "uint", image.width, "uint", image.height
                     , "uint", x, "uint", y, "cdecl ptr")

         ; Search for the coordinates of the first matching image.
         if (option == 2)
            address := DllCall(imagesearch2, "ptr", this.ptr, "uint", this.width, "uint", this.height
                     , "ptr", image.ptr, "uint", image.width, "uint", image.height
                     , "uint", x, "uint", y, "ushort", variation, "cdecl ptr")

         ; Compare the address to the out-of-bounds limit.
         if (address == this.ptr + this.size)
            return False

         ; Return an [x, y] array.
         offset := (address - this.ptr) // 4
         return [mod(offset, this.width), offset // this.width]
      }

      ImageSearchAll(image, variation := 0) {

         ; Convert image to a buffer object.
         if !(IsObject(image) && ObjHasOwnProp(image, "ptr") && ObjHasOwnProp(image, "size"))
            image := ImagePutBuffer(image)

         ; Check if the object has the coordinates.
         x := ObjHasOwnProp(image, "x") ? image.x : image.width//2
         y := ObjHasOwnProp(image, "y") ? image.y : image.height//2

         if (variation == 0)
            option := 1
         else
            option := 2

         ; ------------------------ Machine code generated with MCode4GCC using gcc 13.2.0 ------------------------

         ; C source code - https://godbolt.org/z/qPodGdP1d
         imagesearchall1 := this.Base64Code((A_PtrSize == 4)
            ? "VYnlV1ZTg+wUi0UMi1UYi00IjTyFAAAAAItFECtFHA+vxwNFCIlF6ItFDCnQiUXkjQSVAAAAAIlF7ItF6DnBc2eLRRSLADkBdAmL"
            . "RRSAeAMAdVCJyCtFCDHSwfgC93UMOVXkfD4x0otFFInLiVXwi3XwO3UcdDyLVeyJ3gHCiVXgi1XgOdBzFIB4AwB0BosWORB1D4PA"
            . "BIPGBOvl/0XwAfvrzIPBBOuSi0UQD6/HA0UIicGDxBSJyFteX13D"
            : "QVdBVkFVQVRVV1ZTSIPsGEUx20SLpCSYAAAAi4QkgAAAAESLlCSQAAAASIu8JIgAAABEKeBBD6/BSInLidZMicFNjSyARInIRCnQ"
            . "iUQkDEqNBJUAAAAASIkEJEw56XN0iwc5AXQGgH8DAHViSInIMdJMKcBIwfgCQffxOVQkDHxNSIn4Me0x0kQ54nQyTIs8JEGJ7k6N"
            . "NLFJAcdMOfhzGIB4AwB0CEWLFkQ5EHUgSIPABEmDxgTr4//CRAHN68lBOfNzB0SJ2EiJDMNB/8NIg8EE64dEidhIg8QYW15fXUFc"
            . "QV1BXkFfww==")

         imagesearchall2 := this.Base64Code((A_PtrSize == 4)
            ? ""
            : "QVdBVkFVQVRVV1ZTSIPsSIuEJNgAAABEi5QkwAAAAEiLnCS4AAAAi7wk4AAAAImUJJgAAACJwkEPr8FMjWwkPEEPr9JIiYwkkAAAAIuMJNAAAABIAchIAcpIweACMcmLFJNIiUQkEESJyESJy0Qp04lUJDyLlCSwAAAAK5QkyAAAAIlcJCRBD6/RSY00kESJ0kiJdCQoSCnQif5MjSSVAAAAAEjB4AL33kiJRCQYQY1C/2aJdCQiSMHgAkiJRCQIMcBIi3QkKEk58A+D2QAAADlEJCRzDUiLRCQISQHA6b8AAABIi3QkEDHSSY0cMEYPthwqD7Y0E0Ep82ZEOd9zCGZEO1wkInJUSP/CSIP6A3XdSIuUJLgAAABNicMx7esKSItcJBj/xUkB2zusJMgAAAB0RE6NNCJMOfJz5IB6AwB0KzHbD7Y0GkUPtjwbRCn+Zjn3cw9mO3QkInMISYPABP/A6zVI/8NIg/sDdddIg8IESYPDBOvAO4wkmAAAAHMRRYsYSIucJJAAAACJykSJHJP/wU0B4EQB0EQ5yA+CIP///zHA6Rn///+JyEiDxEhbXl9dQVxBXUFeQV/D")

         ; --------------------------------------------------------------------------------------------------------

         ; Global number of addresses (matching searches) to allocate.
         limit := 256

         ; If the limit is exceeded, the following routine will be run again.
         redo:
         result := Buffer(A_PtrSize * limit) ; Allocate buffer for addresses.

         ; Search for the address of the first matching image.
         count := DllCall(imagesearchall1, "ptr", result, "uint", limit
                  , "ptr", this.ptr, "uint", this.width, "uint", this.height
                  , "ptr", image.ptr, "uint", image.width, "uint", image.height
                  , "uint", x, "uint", y, "cdecl uint")

         count := DllCall(imagesearchall2, "ptr", result, "uint", limit
                  , "ptr", this.ptr, "uint", this.width, "uint", this.height
                  , "ptr", image.ptr, "uint", image.width, "uint", image.height
                  , "uint", x, "uint", y,  "ushort", variation, "cdecl uint")

         ; If the default 256 results is exceeded, run the machine code again.
         if (count > limit) {
            limit := count
            goto redo
         }

         ; Check if any matches are found.
         if (count = 0)
            return False

         ; Create an array of [x, y] coordinates.
         xys := []
         xys.count := count
         loop count {
            address := NumGet(result, A_PtrSize * (A_Index-1), "ptr")
            offset := (address - this.ptr) // 4
            xys.push([mod(offset, this.width), offset // this.width])
         }
         return xys
      }
   }

   static to_screenshot(pBitmap, screenshot := "", alpha := "") {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      x := IsObject(screenshot) && screenshot.Has(1) ? screenshot[1] : 0
      y := IsObject(screenshot) && screenshot.Has(2) ? screenshot[2] : 0
      w := IsObject(screenshot) && screenshot.Has(3) ? screenshot[3] : width
      h := IsObject(screenshot) && screenshot.Has(4) ? screenshot[4] : height

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

   static to_window(pBitmap, title := "", pos := "", style := 0x82C80000, styleEx := 0x9, parent := "", playback := "") {
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
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Get Screen width and height with DPI awareness.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s := IsObject(pos) && pos.Has(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] / width
         : IsObject(pos) && pos.Has(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] / height
         : (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w := IsObject(pos) && pos.Has(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] : s * width
      h := IsObject(pos) && pos.Has(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] : s * height

      x := IsObject(pos) && pos.Has(1) && pos[1] ~= "^-?\d+$" ? pos[1] : 0.5*(ScreenWidth - w)
      y := IsObject(pos) && pos.Has(2) && pos[2] ~= "^-?\d+$" ? pos[2] : 0.5*(ScreenHeight - h)

      ; Adjust x and y if a relative to window position is given.
      if IsObject(pos) && pos.Has(5) && WinExist(pos[5]) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         WinGetClientPos &xr, &yr,,, pos[5]
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         x += xr
         y += yr
      }




      ; Resolve dependent coordinates first, coordinates second, and distances last.
      x2 := Round(x + w)
      y2 := Round(y + h)
      x  := Round(x)
      y  := Round(y)
      w  := x2 - x
      h  := y2 - y

      rect := Buffer(16)
         NumPut("int",  x, rect,  0)
         NumPut("int",  y, rect,  4)
         NumPut("int", x2, rect,  8)
         NumPut("int", y2, rect, 12)

      DllCall("AdjustWindowRectEx", "ptr", rect, "uint", style, "int", 0, "uint", styleEx)

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
      child := this.show(pBitmap, title, [0, 0, w, h], WS_CHILD | WS_VISIBLE, WS_EX_LAYERED, hwnd, playback)

      ; Store extra data inside window struct (cbWndExtra).
      DllCall("SetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr", hwnd) ; parent window
      DllCall("SetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr", child) ; child window
      DllCall("SetWindowLong", "ptr", child, "int", 0*A_PtrSize, "ptr", hwnd) ; parent window
      DllCall("SetWindowLong", "ptr", child, "int", 1*A_PtrSize, "ptr", child) ; child window

      ; Delaying this call prevents empty window borders from appearing.
      DllCall("ShowWindow", "ptr", hwnd, "int", 1)

      return hwnd
   }

   static show(pBitmap, title := "", pos := "", style := 0x90000000, styleEx := 0x80088, parent := "", playback := "") {
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
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Get Screen width and height with DPI awareness.
      try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
      ScreenWidth := A_ScreenWidth
      ScreenHeight := A_ScreenHeight
      try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")

      ; If both dimensions exceed the screen boundaries, compare the aspect ratio of the image
      ; to the aspect ratio of the screen to determine the scale factor. Default scale is 1.
      s := IsObject(pos) && pos.Has(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] / width
         : IsObject(pos) && pos.Has(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] / height
         : (width > ScreenWidth) && (width / height > ScreenWidth / ScreenHeight) ? ScreenWidth / width
         : (height > ScreenHeight) && (width / height <= ScreenWidth / ScreenHeight) ? ScreenHeight / height
         : 1

      w := IsObject(pos) && pos.Has(3) && pos[3] ~= "^(?!0+$)\d+$" ? pos[3] : s * width
      h := IsObject(pos) && pos.Has(4) && pos[4] ~= "^(?!0+$)\d+$" ? pos[4] : s * height

      x := IsObject(pos) && pos.Has(1) && pos[1] ~= "^-?\d+$" ? pos[1] : 0.5*(ScreenWidth - w)
      y := IsObject(pos) && pos.Has(2) && pos[2] ~= "^-?\d+$" ? pos[2] : 0.5*(ScreenHeight - h)

      ; Adjust x and y if a relative to window position is given.
      if IsObject(pos) && pos.Has(5) && WinExist(pos[5]) {
         try dpi := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
         WinGetClientPos &xr, &yr,,, pos[5]
         try DllCall("SetThreadDpiAwarenessContext", "ptr", dpi, "ptr")
         x += xr
         y += yr
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
      bi := Buffer(40, 0)                    ; sizeof(bi) = 40
         NumPut(  "uint",        40, bi,  0) ; Size
         NumPut(   "int",         w, bi,  4) ; Width
         NumPut(   "int",        -h, bi,  8) ; Height - Negative so (0, 0) is top-left.
         NumPut("ushort",         1, bi, 12) ; Planes
         NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
      hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Case 1: Image is not scaled.
      if (w == width && h == height) {
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
      }

      ; Case 2: Image is scaled.
      else {
         ; Create a graphics context from the device context.
         DllCall("gdiplus\GdipCreateFromHDC", "ptr", hdc , "ptr*", &pGraphics:=0)

         ; Set settings in graphics context.
         DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
         DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
         DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

         ; Draw Image.
         DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0)
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
      DllCall("gdiplus\GdipImageGetFrameDimensionsCount", "ptr", pBitmap, "uint*", &dims:=0)
      DllCall("gdiplus\GdipImageGetFrameDimensionsList", "ptr", pBitmap, "ptr", dimIDs := Buffer(16*dims), "uint", dims)
      DllCall("gdiplus\GdipImageGetFrameCount", "ptr", pBitmap, "ptr", dimIDs, "uint*", &number:=0)

      ; Animations!
      if (number > 1) {

         ; Get the frame delays from PropertyTagFrameDelay.
         DllCall("gdiplus\GdipGetPropertyItemSize", "ptr", pBitmap, "uint", 0x5100, "uint*", &pDelaysSize:=0)
         pDelays := DllCall("GlobalAlloc", "uint", 0, "uptr", pDelaysSize, "ptr")
         DllCall("gdiplus\GdipGetPropertyItem", "ptr", pBitmap, "uint", 0x5100, "uint", pDelaysSize, "ptr", pDelays)

         ; Check PropertyTagTypeLong if WEBP or GIF.
         type := NumGet(pDelays + 8, "ushort") == 4 ? "gif" : "webp"

         ; Save frame delays because they are slow enough to impact timing.
         p := NumGet(pDelays + 8 + A_PtrSize, "ptr")
         delays := Map(0, NumGet(p, "uint"))
         loop number ; Remember the pointer to the array of delays should be dereferenced.
            delays[A_Index] := NumGet(p + 4*A_Index, "uint")

         ; Calculate the greatest common factor of all frame delays.
         for each, delay in delays
            if A_Index = 1
               interval := delay ; Initalize the interval.
            else
               while delay {
                  temp := mod(interval, delay)
                  interval := delay
                  delay := temp
               }

         ; Convert centiseconds to milliseconds.
         if type = "gif"
            interval *= 10

         ; Because timeSetEvent calls in a seperate thread, redirect to main thread.
         ; LPTIMECALLBACK: (uTimerID, uMsg, dwUser, dw1, dw2)
         pTimeProc := this.SyncWindowProc(hwnd, 0x8000, 5) ; ParamCount = 5

         ; Create an object to hold all the extra data.
         obj := {type : type             ; Either "gif" or "webp"
               , w : w                   ; width
               , h : h                   ; height
               , frame : -1              ; current frame (will be incremented to 0)
               , number : number         ; max frames
               , accumulate : 0          ; current wait time
               , delays : delays         ; array of frame delays
               , interval : interval     ; timer resolution
               , pTimeProc : pTimeProc   ; callback address
               , dimIDs : dimIDs}        ; frame dimension guid (Time or Page)
         ObjAddRef(ObjPtr(obj))          ; Hold onto this object for dear life!
         DllCall("SetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr", ObjPtr(obj))

         ; Case 1: Image is not scaled.
         if (w == width && h == height) {
            ; Clone bitmap to avoid disposal.
            DllCall("gdiplus\GdipCloneImage", "ptr", pBitmap, "ptr*", &pBitmapClone:=0)
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
            cache := Map()

            ; Overwrites the hdc and pBits variables.
            loop number {
               ; Select frame to show.
               frame := A_Index - 1
               DllCall("gdiplus\GdipImageSelectActiveFrame", "ptr", pBitmap, "ptr", dimIDs, "uint", frame)

               ; Get Bitmap width and height.
               DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
               DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
               
               ; Convert the source pBitmap into a hBitmap manually.
               ; struct BITMAPINFOHEADER - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader
               hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
               bi := Buffer(40, 0)                    ; sizeof(bi) = 40
                  NumPut(  "uint",        40, bi,  0) ; Size
                  NumPut(   "int",         w, bi,  4) ; Width
                  NumPut(   "int",        -h, bi,  8) ; Height - Negative so (0, 0) is top-left.
                  NumPut("ushort",         1, bi, 12) ; Planes
                  NumPut("ushort",        32, bi, 14) ; BitCount / BitsPerPixel
               hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", bi, "uint", 0, "ptr*", &pBits:=0, "ptr", 0, "uint", 0, "ptr")
               obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

               ; Create a graphics context from the device context.
               DllCall("gdiplus\GdipCreateFromHDC", "ptr", hdc , "ptr*", &pGraphics:=0)

               ; Set settings in graphics context.
               DllCall("gdiplus\GdipSetPixelOffsetMode",    "ptr", pGraphics, "int", 2) ; Half pixel offset.
               DllCall("gdiplus\GdipSetCompositingMode",    "ptr", pGraphics, "int", 1) ; Overwrite/SourceCopy.
               DllCall("gdiplus\GdipSetInterpolationMode",  "ptr", pGraphics, "int", 7) ; HighQualityBicubic

               ; Draw Image.
               DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0)
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

   static WindowClass(style := 0) {
      ; The window class shares the name of this class.
      cls := this.prototype.__class
      wc := Buffer(A_PtrSize = 4 ? 48:80) ; sizeof(WNDCLASSEX) = 48, 80

      ; Check if the window class is already registered.
      hInstance := DllCall("GetModuleHandle", "ptr", 0, "ptr")
      if DllCall("GetClassInfoEx", "ptr", hInstance, "str", cls, "ptr", wc)
         return cls

      ; Create window data.
      pWndProc := CallbackCreate(WindowProc)
      hCursor := DllCall("LoadCursor", "ptr", 0, "ptr", 32512, "ptr") ; IDC_ARROW
      hBrush := DllCall("GetStockObject", "int", 5, "ptr") ; Hollow_brush

      ; struct tagWNDCLASSEXA - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexa
      ; struct tagWNDCLASSEXW - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-wndclassexw
      _ := (A_PtrSize = 4)
         NumPut(  "uint",     wc.size, wc,         0) ; cbSize
         NumPut(  "uint",       style, wc,         4) ; style
         NumPut(   "ptr",    pWndProc, wc,         8) ; lpfnWndProc
         NumPut(   "int",           0, wc, _ ? 12:16) ; cbClsExtra
         NumPut(   "int",          40, wc, _ ? 16:20) ; cbWndExtra
         NumPut(   "ptr",           0, wc, _ ? 20:24) ; hInstance
         NumPut(   "ptr",           0, wc, _ ? 24:32) ; hIcon
         NumPut(   "ptr",     hCursor, wc, _ ? 28:40) ; hCursor
         NumPut(   "ptr",      hBrush, wc, _ ? 32:48) ; hbrBackground
         NumPut(   "ptr",           0, wc, _ ? 36:56) ; lpszMenuName
         NumPut(   "ptr", StrPtr(cls), wc, _ ? 40:64) ; lpszClassName
         NumPut(   "ptr",           0, wc, _ ? 44:72) ; hIconSm

      ; Registers a window class for subsequent use in calls to the CreateWindow or CreateWindowEx function.
      DllCall("RegisterClassEx", "ptr", wc, "ushort")

      ; Return the class name as a string.
      return cls

      ; Define window behavior.
      WindowProc(hwnd, uMsg, wParam, lParam) {

         ; Prevent the script from exiting early.
         static active_windows := Persistent()

         ; WM_CREATE
         if (uMsg = 0x1)
            Persistent(++active_windows)

         ; WM_DESTROY
         if (uMsg = 0x2) {
            ; Cleanup the device context and its selected hBitmap.
            hdc := DllCall("GetWindowLong", "ptr", hwnd, "int", 2*A_PtrSize, "ptr")
            obm := DllCall("CreateBitmap", "int", 0, "int", 0, "uint", 1, "uint", 1, "ptr", 0, "ptr")
            hbm := DllCall("SelectObject", "ptr", hdc, "ptr", obm, "ptr")
            DllCall("DeleteObject", "ptr", hbm)
            DllCall("DeleteDC", "ptr", hdc)

            ; There's no need to add a reference because it will be released soon.
            if ptr := DllCall("GetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr") {
               obj := ObjFromPtr(ptr) ; Self-destruct at end of scope.
               DllCall("SetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr", 0) ; Exit

               ; Stop Animation loop.
               timer := DllCall("GetWindowLong", "ptr", hwnd, "int", 4*A_PtrSize, "ptr")
               DllCall("winmm\timeKillEvent", "uint", timer)
               DllCall("GlobalFree", "ptr", obj.pTimeProc)

               if obj.HasProp("pBitmap") {
                  DllCall("gdiplus\GdipDisposeImage", "ptr", obj.pBitmap)
                  ImagePut.gdiplusShutdown()
               }

               if obj.HasProp("cache")
                  for each, hdc in obj.cache { ; Overwrites the hdc and hbm variables.
                     hbm := DllCall("SelectObject", "ptr", hdc, "ptr", obm, "ptr")
                     DllCall("DeleteObject", "ptr", hbm)
                     DllCall("DeleteDC", "ptr", hdc)
                  }
            }

            Persistent(--active_windows)
         }

         ; WM_LBUTTONDOWN - Drag to move the window.
         if (uMsg = 0x201) {
            parent := DllCall("GetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr")
            return DllCall("DefWindowProc", "ptr", parent, "uint", 0xA1, "uptr", 2, "ptr", 0, "ptr")
         }

         ; WM_RBUTTONUP - Destroy the window.
         if (uMsg = 0x205) {
            parent := DllCall("GetWindowLong", "ptr", hwnd, "int", 0*A_PtrSize, "ptr")
            DllCall("DestroyWindow", "ptr", parent)
            return 0
         }

         ; WM_MBUTTONDOWN - Show x, y, and color.
         if (uMsg = 0x207) {
            ; Force the child hwnd as transparent pixels could redirect to the parent hwnd.
            child := DllCall("GetWindowLong", "ptr", hwnd, "int", 1*A_PtrSize, "ptr")
            hdc := DllCall("GetWindowLong", "ptr", child, "int", 2*A_PtrSize, "ptr")

            ; Get pBits from hBitmap currently selected onto the device context.
            ; struct DIBSECTION - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-dibsection
            ; struct BITMAP - https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmap
            hbm := DllCall("GetCurrentObject", "ptr", hdc, "uint", 7)
            dib := Buffer(64+5*A_PtrSize) ; sizeof(DIBSECTION) = 84, 104
            DllCall("GetObject", "ptr", hbm, "int", dib.size, "ptr", dib)
               , width  := NumGet(dib, 4, "uint")
               , height := NumGet(dib, 8, "uint")
               , pBits  := NumGet(dib, A_PtrSize = 4 ? 20:24, "ptr")

            ; Convert from unsigned int to signed shorts.
            xy := Buffer(4)
            NumPut("uint", lparam, xy)
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

            ; Show tooltip.
            tt := Tooltip(" (" x ", " y ") `n " SubStr(c, 3) " ",,, 16)


            ; Style background and text color.
            DllCall("UxTheme\SetWindowTheme", "ptr", tt, "ptr", 0, "ptr", Buffer(2, 0), "hresult")
            DllCall("SendMessage", "ptr", tt, "uint", 1043, "ptr", background_color, "ptr", 0)
            DllCall("SendMessage", "ptr", tt, "uint", 1044, "ptr", text_color, "ptr", 0)

            ; Destroy tooltip after 7 seconds of the last showing.
            static Reset_Tooltip := Tooltip.bind(,,, 16)
            SetTimer Reset_Tooltip, -7000
         }





         ; WM_APP - Animate GIFs
         if (uMsg = 0x8000) {
            ; Thanks tmplinshi, Teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=76&t=83358
            Critical

            ; Get variables.
            ptr := DllCall("GetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr")

            ; Exit GIF animation loop. Set by WM_Destroy.
            if !ptr
               return

            ; Get variables. ObjRelease is automatically called at the end of the scope.
            obj := ObjFromPtrAddRef(ptr)
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
            try pBitmap := obj.pBitmap ; not scaled
            try pBits := obj.pBits     ; not scaled
            try cache := obj.cache     ; is scaled

            ; Get next frame number and next delay.
            frame := mod(frame + 1, number)     ; Increment and loop back to zero
            delay := delays[frame]              ; Zero-based array

            ; See: https://www.biphelps.com/blog/The-Fastest-GIF-Does-Not-Exist
            if type = "gif" {
               delay *= 10                      ; Convert centiseconds to milliseconds
               delay := max(delay, 10)          ; Minimum delay is 10ms
               (delay == 10) && delay := 100    ; 10 ms is actually 100 ms
            }

            ; The current wait time is advanced by one interval.
            accumulate += interval              ; Add resolution of timer
            obj.accumulate := accumulate        ; Save the current wait time

            ; Checks if the current wait time is equal to the frame delay.
            ; Executing via frame number rather than timing is more accurate.
            ; Either a oneshot timer or a periodic timer can be used.
            ; A oneshot timer will always take into account the above overhead.
            ; Whereas the periodic timer will always form an even distribution.
            ; Note that the variance (jitter) is additive. It reverts to zero
            ; over time only when a periodic timer is used.
            ; Clever thinking also determined that setting the timer resolution
            ; or interval to the greatest common factor of all frame delays
            ; would reduce overhead as well. This is because the timer would
            ; always be divisible by the frame delays.
            if (accumulate != delay)
               return

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
                  Tooltip   "Current Delay:`t" Round(time, 4)
                     . "`n" "Average Delay:`t" Round(sum / count, 4)
                     . "`n" "Planned Delay:`t" (delay ?? "unknown")
                     . "`n" "Timer Resolution:`t" interval
                     . "`n" "Average FPS:`t" Round(count / (sum / 1000), 4)
                     . "`n" "Frame Number:`t" frame " of " number
            }
            start := now
            */

            ; Case 1: Image is not scaled.
            if IsSet(pBitmap) {
               ; Select frame to show.
               DllCall("gdiplus\GdipImageSelectActiveFrame", "ptr", pBitmap, "ptr", dimIDs, "uint", frame)

               ; Get Bitmap width and height.
               DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
               DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

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

               ; Use the saved device context for rendering.
               hdc := DllCall("GetWindowLong", "ptr", hwnd, "int", 2*A_PtrSize, "ptr")
            }

            ; Case 2: Image is scaled.
            else
               hdc := cache[frame]

            ; Render to window.
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
         }

         ; START - Kickstart playback.
         if (uMsg = 0x8001) {
            ; Start Animation loop.
            ptr := DllCall("GetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr")
            obj := ObjFromPtrAddRef(ptr)
            timer := DllCall("winmm\timeSetEvent"
                     , "uint", obj.interval  ; uDelay
                     , "uint", obj.interval  ; uResolution
                     ,  "ptr", obj.pTimeProc ; lpTimeProc
                     , "uptr", 0             ; dwUser
                     , "uint", 1             ; fuEvent
                     , "uint")

            ; Store the timer ID.
            DllCall("SetWindowLong", "ptr", hwnd, "int", 4*A_PtrSize, "ptr", timer)
         }

         ; STOP - Stop or Pause playback.
         if (uMsg = 0x8002) {
            ; Start as if new?
            if (wParam) {
               ptr := DllCall("GetWindowLong", "ptr", hwnd, "int", 3*A_PtrSize, "ptr")
               obj := ObjFromPtrAddRef(ptr)
               obj.frame := -1
               obj.accumulate := 0
            }

            ; Stop Animation loop.
            timer := DllCall("GetWindowLong", "ptr", hwnd, "int", 4*A_PtrSize, "ptr")
            DllCall("winmm\timeKillEvent", "uint", timer)
         }

         ; Must return
         default:
         return DllCall("DefWindowProc", "ptr", hwnd, "uint", uMsg, "uptr", wParam, "ptr", lParam, "ptr")
      }
   }

   static SyncWindowProc(hwnd, msg, ParamCount := 0) {
      hModule := DllCall("GetModuleHandle", "str", "user32.dll", "ptr")
      SendMessageW := DllCall("GetProcAddress", "ptr", hModule, "astr", "SendMessageW", "ptr")

      pcb := DllCall("GlobalAlloc", "uint", 0, "ptr", 96, "ptr")
      DllCall("VirtualProtect", "ptr", pcb, "ptr", 96, "uint", 0x40, "uint*", 0)

      p := pcb
      if (A_PtrSize = 8) {
                     /*
                     48 89 4c 24 08  ; mov [rsp+8], rcx
                     48 89 54'24 10  ; mov [rsp+16], rdx
                     4c 89 44 24 18  ; mov [rsp+24], r8
                     4c'89 4c 24 20  ; mov [rsp+32], r9
                     48 83 ec 28'    ; sub rsp, 40
                     4c 8d 44 24 30  ; lea r8, [rsp+48]  (arg 3, &params)
                     49 b9 ..        ; mov r9, .. (arg 4, operand to follow)
                     */
         p := NumPut("ptr"  , 0x54894808244c8948,
                     "ptr"  , 0x4c182444894c1024,
                     "ptr"  , 0x28ec834820244c89,
                     "ptr"  , 0x00b9493024448d4c, p) - 1
         lParamPtr := p, p += 8

         p := NumPut("char" , 0xba,        ; mov edx, nmsg
                     "int"  , msg,
                     "char" , 0xb9,        ; mov ecx, hwnd
                     "int"  , hwnd,
                     "short", 0xb848,      ; mov rax, SendMessageW
                     "ptr"  , SendMessageW,
                     /*
                     ff d0        ; call rax
                     48 83 c4 28  ; add rsp, 40
                     c3           ; ret
                     */
                     "ptr"  , 0x00c328c48348d0ff, p)
      } else {
         p := NumPut("char" , 0x68, p)     ; push ... (lParam data)
         lParamPtr := p, p += 4
         p := NumPut("int"  , 0x0824448d,  ; lea eax, [esp+8]
                     "char" , 0x50,        ; push eax
                     "char" , 0x68,        ; push nmsg
                     "int"  , msg,
                     "char" , 0x68,        ; push hwnd
                     "int"  , hwnd,
                     "char" , 0xb8,        ; mov eax, &SendMessageW
                     "int"  , SendMessageW,
                     "short", 0xd0ff,      ; call eax
                     "char" , 0xc2,        ; ret argsize
                     "short", ParamCount*4, p) ; InStr(Options, "C") ? 0
      }
      NumPut("ptr", p, lParamPtr)          ; To be passed as lParam.
      p := NumPut("ptr", 0, p)             ; There isn't a function object here so...
      p := NumPut("int", ParamCount, p)
      return pcb
   }

   static to_desktop(pBitmap) {
      ; Thanks Gerald Degeneve - https://www.codeproject.com/Articles/856020/Draw-Behind-Desktop-Icons-in-Windows-plus

      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Convert the Bitmap to a hBitmap and associate a device context for blitting.
      hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
      hbm := this.to_hBitmap(pBitmap)
      obm := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")

      ; Post-Creator's Update Windows 10. WM_SPAWN_WORKER = 0x052C
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 0)
      DllCall("SendMessage", "ptr", WinExist("ahk_class Progman"), "uint", 0x052C, "ptr", 0x0000000D, "ptr", 1)

      ; Find the child window.
      windows := WinGetList("ahk_class WorkerW")
      loop windows.length
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

   static to_wallpaper(pBitmap) {
      ; Create a temporary image file.
      filepath := this.to_file(pBitmap)

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
      DllCall("SystemParametersInfo", "uint", SPI_SETDESKWALLPAPER := 0x14, "uint", 0, "str", buf, "uint", 2)

      ; This is a delayed delete call. #Persistent may be required on v1.
      DeleteFile := DllCall.Bind("DeleteFile", "str", filepath)
      SetTimer DeleteFile, -2000

      return "wallpaper"
   }

   static to_cursor(pBitmap, xHotspot := "", yHotspot := "") {
      ; Thanks Nick - https://stackoverflow.com/a/550965

      ; Creates an icon that can be used as a cursor.
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", &hIcon:=0)

      ; Sets the hotspot of the cursor by changing the icon into a cursor.
      if (xHotspot ~= "^\d+$" || yHotspot ~= "^\d+$") {
         ; struct ICONINFO - https://docs.microsoft.com/en-us/windows/win32/api/winuser/ns-winuser-iconinfo
         ii := Buffer(8+3*A_PtrSize)                                 ; sizeof(ICONINFO) = 20, 32
         DllCall("GetIconInfo", "ptr", hIcon, "ptr", ii)             ; Fill the ICONINFO structure.
            NumPut("uint", False, ii, 0)                             ; True/False are icon/cursor respectively.
            (xHotspot ~= "^\d+$") && NumPut("uint", xHotspot, ii, 4) ; Set the xHotspot value. Default: center point
            (yHotspot ~= "^\d+$") && NumPut("uint", yHotspot, ii, 8) ; Set the yHotspot value. Default: center point
         DllCall("DestroyIcon", "ptr", hIcon)                        ; Destroy the icon after getting the ICONINFO structure.
         hIcon := DllCall("CreateIconIndirect", "ptr", ii, "ptr")    ; Create a new cursor using ICONINFO.

         ; Clean up hbmMask and hbmColor created as a result of GetIconInfo.
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+A_PtrSize, "ptr"))   ; hbmMask
         DllCall("DeleteObject", "ptr", NumGet(ii, 8+2*A_PtrSize, "ptr")) ; hbmColor
      }

      ; Set all 17 System Cursors. Must copy 17 times as SetSystemCursor deletes the handle each time.
      Loop Parse, "32512,32513,32514,32515,32516,32631,32642,32643,32644,32645,32646,32648,32649,32650,32651,32671,32672", ","
         if hCursor := DllCall("CopyImage", "ptr", hIcon, "uint", 2, "int", 0, "int", 0, "uint", 0, "ptr")
            if !DllCall("SetSystemCursor", "ptr", hCursor, "int", A_LoopField) ; calls DestroyCursor
               DllCall("DestroyCursor", "ptr", hCursor)

      ; Destroy the original hIcon. Same as DestroyCursor.
      DllCall("DestroyIcon", "ptr", hIcon)

      ; Returns the string A_Cursor to avoid evaluation.
      return "A_Cursor"
   }

   static to_explorer(pBitmap, default := "") {

      ; Default directory to desktop.
      (default == "") && default := A_Desktop

      ; Check if the mouse is pointing to the desktop.
      MouseGetPos ,, &hwnd

      if WinGetClass("ahk_id" hwnd) ~= "(?i)Progman|WorkerW"
         directory := A_Desktop

      ; Get path of active window.
      else if (hwnd := WinExist("ahk_class ExploreWClass")) || (hwnd := WinExist("ahk_class CabinetWClass")) {
         for window in ComObject("Shell.Application").Windows {
            if (window.hwnd == hwnd) {
               try directory := window.Document.Folder.Self.Path
            }
         }
      }
      else
         directory := default

      return this.to_file(pBitmap, directory)
   }

   static set_explorer(pStream, default := "") {

      ; Default directory to desktop.
      (default == "") && default := A_Desktop

      ; Check if the mouse is pointing to the desktop.
      MouseGetPos ,, &hwnd

      if WinGetClass("ahk_id" hwnd) ~= "(?i)Progman|WorkerW"
         directory := A_Desktop

      ; Get path of active window.
      else if (hwnd := WinExist("ahk_class ExploreWClass")) || (hwnd := WinExist("ahk_class CabinetWClass")) {
         for window in ComObject("Shell.Application").Windows {
            if (window.hwnd == hwnd) {
               try directory := window.Document.Folder.Self.Path
            }
         }
      }
      else
         directory := default

      return this.set_file(pStream, directory)
   }

   static to_file(pBitmap, filepath := "", quality := "") {
      ; Thanks tic - https://www.autohotkey.com/boards/viewtopic.php?t=6517
      extension := "png"
      this.select_filepath(&filepath, &extension)
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
      this.select_extension(pStream, &extension)
      this.select_filepath(&filepath, &extension)

      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\SHCreateStreamOnFileEx"
               ,   "wstr", filepath
               ,   "uint", 0x1001          ; STGM_CREATE | STGM_WRITE
               ,   "uint", 0x80            ; FILE_ATTRIBUTE_NORMAL
               ,    "int", True            ; fCreate is ignored when STGM_CREATE is set.
               ,    "ptr", 0               ; pstmTemplate (reserved)
               ,   "ptr*", &pFileStream:=0
               ,"hresult")
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &size:=0, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Copy", "ptr", pStream, "ptr", pFileStream, "uint", size, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      ObjRelease(pFileStream)

      return filepath
   }

   static to_hex(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.to_stream(pBitmap, extension, quality)

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "ptr*", &hbin:=0, "hresult")
      bin := DllCall("GlobalLock", "ptr", hbin, "ptr")
      size := DllCall("GlobalSize", "ptr", bin, "uptr")

      ; Calculate the length of the hexadecimal string.
      length := 2 * size ; No zero terminator needed.
      str := Buffer(length)

      ; C source code - https://godbolt.org/z/EqfK7fvr5
      static code := 0
      if !code {
         b64 := (A_PtrSize == 4)
            ? "VYnlVotFDIt1EFOLTRSLXQgBxjnwcyCKEIPBAkDA6gQPttKKFBOIUf6KUP+D4g+KFBOIUf/r3FteXcM="
            : "SInISQHQTDnCcyiKCkmDwQJI/8JBicqD4Q9BwOoERQ+20kaKFBBFiFH+igwIQYhJ/+vTww=="
         s64 := StrLen(RTrim(b64, "=")) * 3 // 4
         code := DllCall("GlobalAlloc", "uint", 0, "uptr", s64, "ptr")
         DllCall("crypt32\CryptStringToBinary", "str", b64, "uint", 0, "uint", 0x1, "ptr", code, "uint*", s64, "ptr", 0, "ptr", 0)
         DllCall("VirtualProtect", "ptr", code, "ptr", s64, "uint", 0x40, "uint*", 0)
      }

      ; Default to lowercase hex values. Or capitalize the string below.
      hex := Buffer(16)
      StrPut("0123456789abcdef", hex, "CP0")
      DllCall(code, "ptr", hex, "ptr", bin, "uptr", size, "ptr", str, "uptr", length, "cdecl")

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", hbin)
      ObjRelease(pStream)

      ; Return encoded string from ANSI.
      return StrGet(str, length, "CP0")
   }

   static set_hex(pStream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &size:=0, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", bin := Buffer(size), "uint", size, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      ; Calculate the length of the hexadecimal string.
      length := 2 * size ; No zero terminator needed.
      str := Buffer(length)

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
      hex := Buffer(16)
      StrPut("0123456789abcdef", hex, "CP0")
      DllCall(code, "ptr", hex, "ptr", bin, "uptr", size, "ptr", str, "uptr", length, "cdecl")

      ; Return encoded string from ANSI.
      return StrGet(str, length, "CP0")
   }

   static to_base64(pBitmap, extension := "", quality := "") {
      ; Thanks noname - https://www.autohotkey.com/boards/viewtopic.php?style=7&p=144247#p144247

      ; Default extension is PNG for small sizes!
      if (extension == "")
         extension := "png"

      pStream := this.to_stream(pBitmap, extension, quality)

      ; Get a pointer to binary data.
      DllCall("ole32\GetHGlobalFromStream", "ptr", pStream, "ptr*", &hbin:=0, "hresult")
      bin := DllCall("GlobalLock", "ptr", hbin, "ptr")
      size := DllCall("GlobalSize", "ptr", bin, "uptr")

      ; Calculate the length of the base64 string.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      length := 4 * Ceil(size/3) + 1 ; An extra byte of padding is required.
      str := Buffer(length)

      ; Using CryptBinaryToStringA is faster and saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", bin, "uint", size, "uint", flags, "ptr", str, "uint*", &length)

      ; Release binary data and stream.
      DllCall("GlobalUnlock", "ptr", hbin)
      ObjRelease(pStream)

      ; Return encoded string length minus 1.
      return StrGet(str, length, "CP0")
   }

   static set_base64(pStream) {
      ; For compatibility with SHCreateMemStream do not use GetHGlobalFromStream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &size:=0, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", bin := Buffer(size), "uint", size, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      ; Calculate the length of the base64 string.
      flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
      length := 4 * Ceil(size/3) + 1 ; An extra byte of padding is required.
      str := Buffer(length)

      ; Using CryptBinaryToStringA is faster and saves about 2MB in memory.
      DllCall("crypt32\CryptBinaryToStringA", "ptr", bin, "uint", size, "uint", flags, "ptr", str, "uint*", &length)

      ; Return encoded string length minus 1.
      return StrGet(str, length, "CP0")
   }

   static to_uri(pBitmap, extension := "", quality := "") {
      static dict := Map("bmp", "bmp", "dib", "bmp", "rle", "bmp", "jpg", "jpeg", "jpeg", "jpeg", "jpe", "jpeg"
                     , "jfif", "jpeg", "gif", "gif", "tif", "tiff", "tiff", "tiff", "png", "png")

      extension := RegExReplace(extension, "^\*?\.?")
      return "data:image/" dict[StrLower(extension)] ";base64," this.to_base64(pBitmap, extension, quality)
   }

   static set_uri(pStream) {
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", signature := Buffer(256), "uint", 256, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      ; This function sniffs the first 256 bytes and matches a known file signature.
      ; 256 bytes is recommended, but images only need 12 bytes.
      ; See: https://en.wikipedia.org/wiki/List_of_file_signatures
      DllCall("urlmon\FindMimeFromData"
               ,    "ptr", 0             ; pBC
               ,    "ptr", 0             ; pwzUrl
               ,    "ptr", signature     ; pBuffer
               ,   "uint", 256           ; cbSize
               ,    "ptr", 0             ; pwzMimeProposed
               ,   "uint", 0x20          ; dwMimeFlags
               ,   "ptr*", &MimeOut:=0   ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,"hresult")
      MimeType := StrGet(MimeOut, "UTF-16")
      DllCall("ole32\CoTaskMemFree", "ptr", MimeOut)

      return "data:" MimeType ";base64," this.set_base64(pStream)
   }

   static to_dc(pBitmap, alpha := "") {
      ; Revert to built in functionality if a replacement color is declared.
      if (alpha != "") { ; This built-in version is about 25% slower and also preserves transparency.
         DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", &hbm:=0, "uint", alpha)
         return hbm
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

      ; This may seem strange, but the hBitmap is selected onto the device context,
      ; and therefore cannot be deleted. In addition, the stock bitmap can never be leaked.
      return hdc
   }

   static to_hBitmap(pBitmap, alpha := "") {
      ; Revert to built in functionality if a replacement color is declared.
      if (alpha != "") { ; This built-in version is about 25% slower and also preserves transparency.
         DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "ptr", pBitmap, "ptr*", &hbm:=0, "uint", alpha)
         return hbm
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

   static to_hIcon(pBitmap) {
      DllCall("gdiplus\GdipCreateHICONFromBitmap", "ptr", pBitmap, "ptr*", &hIcon:=0)
      return hIcon
   }

   static to_stream(pBitmap, extension := "", quality := "") {
      ; Default extension is TIF for fast speeds!
      if (extension == "")
         extension := "tif"

      this.select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v)

      ; Create a Stream.
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", 0, "int", True, "ptr*", &pStream:=0, "hresult")
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)

      return pStream
   }

   static to_RandomAccessStream(pBitmap, extension := "", quality := "") {
      pStream := this.to_stream(pBitmap, extension, quality)
      pRandomAccessStream := this.set_RandomAccessStream(pStream)
      ObjRelease(pStream) ; Decrement the reference count of the IStream interface.
      return pRandomAccessStream
   }

   static set_RandomAccessStream(pStream) {
      ; Thanks teadrinker - https://www.autohotkey.com/boards/viewtopic.php?f=6&t=72674
      DllCall("ole32\CLSIDFromString", "wstr", "{905A0FE1-BC53-11DF-8C49-001E4FC686DA}", "ptr", CLSID := Buffer(16), "hresult")
      DllCall("ShCore\CreateRandomAccessStreamOverStream"
               ,    "ptr", pStream
               ,   "uint", BSOS_PREFERDESTINATIONSTREAM := 1
               ,    "ptr", CLSID
               ,   "ptr*", &pRandomAccessStream:=0
               ,"hresult")
      return pRandomAccessStream
   }

   static to_wicBitmap(pBitmap) {
      ; Get Bitmap width and height.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)

      ; Initialize Windows Imaging Component.
      IWICImagingFactory := ComObject(CLSID_WICImagingFactory := "{CACAF262-9370-4615-A13B-9F5539DA4C0A}", IID_IWICImagingFactory := "{EC5EC8A9-C395-4314-9C77-54D7A935FF70}")

      ; WICBitmapNoCache  must be 1!
      ; IWICImagingFactory::CreateBitmap - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L6447
      DllCall("ole32\CLSIDFromString", "wstr", GUID_WICPixelFormat32bppBGRA := "{6fddc324-4e03-4bfe-b185-3d77768dc90f}", "ptr", CLSID := Buffer(16), "hresult")
      ComCall(17, IWICImagingFactory, "uint", width, "uint", height, "ptr", CLSID, "int", 1, "ptr*", &wicBitmap:=0)

      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height

      ; IWICBitmap::Lock - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L2232
      ComCall(8, wicBitmap, "ptr", Rect, "uint", 0x1, "ptr*", &Lock:=0)

      ; IWICBitmapLock::GetDataPointer - https://github.com/iseahound/10/blob/win/10.0.16299.0/um/wincodec.h#L2104
      ComCall(5, Lock, "uint*", &size:=0, "ptr*", &Scan0:=0)

      BitmapData := Buffer(16+2*A_PtrSize, 0)         ; sizeof(BitmapData) = 24, 32
         NumPut(   "int",  4 * width, BitmapData,  8) ; Stride
         NumPut(   "ptr",      Scan0, BitmapData, 16) ; Scan0
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)  ; Contains the pointer (Scan0) to the WICBitmap.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ObjRelease(Lock)
      IWICImagingFactory := ""

      return wicBitmap
   }

   static set_safeArray(pStream) {
      ; Allocate a one-dimensional SAFEARRAY based on the size of the stream.
      DllCall("shlwapi\IStream_Size", "ptr", pStream, "uint64*", &size:=0, "hresult")
      safeArray := ComObjArray(0x11, size) ; VT_ARRAY | VT_UI1
      pvData := NumGet(ComObjValue(safeArray), 8 + A_PtrSize, "ptr")

      ; Copy the stream to the SAFEARRAY.
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", pvData, "uint", size, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      return safeArray
   }

   static to_safeArray(pBitmap, extension := "", quality := "") {
      ; Thanks tmplinshi - https://www.autohotkey.com/boards/viewtopic.php?p=354007#p354007

      ; Create an IStream backed with movable memory.
      hData := DllCall("GlobalAlloc", "uint", 0x2, "uptr", 0, "ptr")
      DllCall("ole32\CreateStreamOnHGlobal", "ptr", hData, "int", True, "ptr*", &pStream:=0, "hresult")

      ; Default extension is PNG for small sizes!
      (extension == "") && extension := "png"

      ; Save pBitmap to the IStream.
      this.select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v)
      DllCall("gdiplus\GdipSaveImageToStream", "ptr", pBitmap, "ptr", pStream, "ptr", pCodec, "ptr", IsSet(ep) ? ep : 0)

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

   static select_codec(pBitmap, extension, quality, &pCodec, &ep, &ci, &v) {
      ; Fill a buffer with the available image codec info.
      DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", &count:=0, "uint*", &size:=0)
      DllCall("gdiplus\GdipGetImageEncoders", "uint", count, "uint", size, "ptr", ci := Buffer(size))

      ; struct ImageCodecInfo - http://www.jose.it-berater.org/gdiplus/reference/structures/imagecodecinfo.htm
      loop {
         if (A_Index > count)
            throw Error("Could not find a matching encoder for the specified file format.")

         idx := (48+7*A_PtrSize)*(A_Index-1)
      } until InStr(StrGet(NumGet(ci, idx+32+3*A_PtrSize, "ptr"), "UTF-16"), extension) ; FilenameExtension

      ; Get the pointer to the clsid of the matching encoder.
      pCodec := ci.ptr + idx ; ClassID

      ; JPEG default quality is 75. Otherwise set a quality value from [0-100].
      if (quality ~= "^-?\d+$") and ("image/jpeg" = StrGet(NumGet(ci, idx+32+4*A_PtrSize, "ptr"), "UTF-16")) { ; MimeType
         ; Use a separate buffer to store the quality as ValueTypeLong (4).
         v := Buffer(4), NumPut("uint", quality, v)

         ; struct EncoderParameter - http://www.jose.it-berater.org/gdiplus/reference/structures/encoderparameter.htm
         ; enum ValueType - https://docs.microsoft.com/en-us/dotnet/api/system.drawing.imaging.encoderparametervaluetype
         ; clsid Image Encoder Constants - http://www.jose.it-berater.org/gdiplus/reference/constants/gdipimageencoderconstants.htm
         ep := Buffer(24+2*A_PtrSize)                  ; sizeof(EncoderParameter) = ptr + n*(28, 32)
            NumPut(  "uptr",     1, ep,            0)  ; Count
            DllCall("ole32\CLSIDFromString", "wstr", "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}", "ptr", ep.ptr+A_PtrSize, "hresult")
            NumPut(  "uint",     1, ep, 16+A_PtrSize)  ; Number of Values
            NumPut(  "uint",     4, ep, 20+A_PtrSize)  ; Type
            NumPut(   "ptr", v.ptr, ep, 24+A_PtrSize)  ; Value
      }
   }

   static select_extension(pStream, &extension) {
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")
      DllCall("shlwapi\IStream_Read", "ptr", pStream, "ptr", signature := Buffer(256), "uint", 256, "hresult")
      DllCall("shlwapi\IStream_Reset", "ptr", pStream, "hresult")

      ; This function sniffs the first 256 bytes and matches a known file signature.
      ; 256 bytes is recommended, but images only need 12 bytes.
      ; See: https://en.wikipedia.org/wiki/List_of_file_signatures
      DllCall("urlmon\FindMimeFromData"
               ,    "ptr", 0             ; pBC
               ,    "ptr", 0             ; pwzUrl
               ,    "ptr", signature     ; pBuffer
               ,   "uint", 256           ; cbSize
               ,    "ptr", 0             ; pwzMimeProposed
               ,   "uint", 0x20          ; dwMimeFlags
               ,   "ptr*", &MimeOut:=0   ; ppwzMimeOut
               ,   "uint", 0             ; dwReserved
               ,"hresult")
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

   static select_filepath(&filepath, &extension) {
      ; Save default extension.
      default := extension

      ; Split the filepath, convert forward slashes, strip invalid chars.
      filepath := RegExReplace(filepath, "/", "\")
      filepath := RegExReplace(filepath, "[*?\x22<>|\x00-\x1F]")
      SplitPath filepath,, &directory, &extension, &filename

      ; Check if the entire filepath is a directory.
      if DirExist(filepath)                ; If the filepath refers to a directory,
         directory := (directory != "")    ; then SplitPath wrongly assumes a directory to be a filename.
            ? ((filename != "")
               ? directory "\" filename    ; Combine directory + filename.
               : directory)                ; Do nothing.
            : (filepath ~= "^\\")
               ? "\" filename              ; Root level directory.
               : ".\" filename             ; Script level directory.
         , filename := ""

      ; Create a new directory if needed.
      if (directory != "" && !DirExist(directory))
         DirCreate(directory)

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
         colon := Chr(0xA789)
         filename := FormatTime(, "yyyy-MM-dd HH" colon "mm" colon "ss")
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

   static gdiplusStartup() {
      return this.gdiplus(1)
   }

   static gdiplusShutdown(cotype := "") {
      return this.gdiplus(-1, cotype)
   }

   static gdiplus(vary := 0, cotype := "") {
      static pToken := 0 ; Takes advantage of the fact that objects contain identical methods.
      static instances := 0 ; And therefore static variables can share data across instances.

      ; Guard against __Delete() errors when WindowProc is running an animated GIF.
      if not IsSet(pToken) || not IsSet(instances)
         return

      ; Startup gdiplus when counter rises from 0 -> 1.
      if (instances = 0 && vary = 1) {

         DllCall("LoadLibrary", "str", "gdiplus")
         si := Buffer(A_PtrSize = 4 ? 20:32, 0) ; sizeof(GdiplusStartupInputEx) = 20, 32
            NumPut("uint", 0x2, si)
            NumPut("uint", 0x4, si, A_PtrSize = 4 ? 16:24)
         DllCall("gdiplus\GdiplusStartup", "ptr*", &pToken:=0, "ptr", si, "ptr", 0)

      }

      ; Shutdown gdiplus when counter falls from 1 -> 0.
      if (instances = 1 && vary = -1) {

         DllCall("gdiplus\GdiplusShutdown", "ptr", pToken)
         DllCall("FreeLibrary", "ptr", DllCall("GetModuleHandle", "str", "gdiplus", "ptr"))

         ; Otherwise GDI+ has been truly unloaded from the script and objects are out of scope.
         if (cotype = "bitmap") {

            ; Check if GDI+ is still loaded. GdiplusNotInitialized = 18
            assert := (18 != DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &ImageAttr:=0))
               DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", ImageAttr)

            if not assert
               throw Error("Bitmap is out of scope. `n`nIf you wish to handle raw pointers to GDI+ bitmaps, add the line"
                  . "`n`n`t`t" this.prototype.__class ".gdiplusStartup()"
                  . "`n`nto the top of your script. If using Gdip_All.ahk use pToken := Gdip_Startup()."
                  . "`nAlternatively, use pic := ImagePutBuffer(image) and pic.pBitmap instead."
                  . "`nYou can copy this message by pressing Ctrl + C.", -4)
         }
      }

      ; Increment or decrement the number of available instances.
      instances += vary

      ; Check for unpaired calls of gdiplusShutdown.
      if (instances < 0)
         throw Error("Missing gdiplusStartup().")

      ; When vary is 0, just return the number of active instances!
      return instances
   }

   ; Get the image width and height.
   static Dimensions(image) {
      this.gdiplusStartup()
      try type := this.DontVerifyImageType(&image)
      catch
         type := this.ImageType(image)
      pBitmap := this.ToBitmap(type, image)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", pBitmap, "uint*", &width:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", pBitmap, "uint*", &height:=0)
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)
      this.gdiplusShutdown()
      return [width, height]
   }

   class Destroy extends ImagePut {

      static call(image) {
         this.gdiplusStartup()
         try type := this.DontVerifyImageType(&image)
         catch
            type := this.ImageType(image)
         this.Destroy(type, image)
         this.gdiplusShutdown()
         return
      }

      static Destroy(type, image) {
         switch type {
         case "clipboard":
            if !DllCall("OpenClipboard", "ptr", A_ScriptHwnd)
               throw Error("Clipboard could not be opened.")
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
            FileDelete image

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

   static call(images*) {
      ; Returns false is there are no images to be compared.
      if (images.length == 0)
         return False

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
         goto ImagePut_Good_Ending
      }

      ; If there are multiple images, compare each subsequent image to the first.
      for image in images {
         if (A_Index != 1) {

            ; Guess the type of the image.
            try type := this.DontVerifyImageType(&image)
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

   static BitmapEqual(SourceBitmap1, SourceBitmap2, PixelFormat := 0x26200A) {
      ; Make sure both source bitmaps are valid GDI+ pointers. This will throw if not...
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap1, "ptr*", &type1:=0)
      DllCall("gdiplus\GdipGetImageType", "ptr", SourceBitmap2, "ptr*", &type2:=0)

      ; ImageTypeUnknown = 0, ImageTypeBitmap = 1, and ImageTypeMetafile = 2.
      if (type1 != 1 || type2 != 1)
         throw Error("The GDI+ pointer is not a bitmap.")

      ; Check if source bitmap pointers are identical.
      if (SourceBitmap1 == SourceBitmap2)
         return True

      ; The two bitmaps must be the same size.
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap1, "uint*", &width1:=0)
      DllCall("gdiplus\GdipGetImageWidth", "ptr", SourceBitmap2, "uint*", &width2:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap1, "uint*", &height1:=0)
      DllCall("gdiplus\GdipGetImageHeight", "ptr", SourceBitmap2, "uint*", &height2:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap1, "int*", &format1:=0)
      DllCall("gdiplus\GdipGetImagePixelFormat", "ptr", SourceBitmap2, "int*", &format2:=0)

      ; Determine if get width and height failed (as dimensions can never be zero).
      if !(width1 && width2 && height1 && height2)
         throw Error("Get bitmap width and height failed.")

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
                     ,   "ptr*", &pBitmap%A_Index%)
            throw Error("Cloning Bitmap" A_Index " failed.")

      ; struct RECT - https://referencesource.microsoft.com/#System.Drawing/commonui/System/Drawing/Rectangle.cs,32
      Rect := Buffer(16, 0)                        ; sizeof(Rect) = 16
         NumPut(  "uint",   width1, Rect,  8)      ; Width
         NumPut(  "uint",  height1, Rect, 12)      ; Height

      ; Create a BitmapData structure.
      BitmapData1 := Buffer(16+2*A_PtrSize)        ; sizeof(BitmapData) = 24, 32
      BitmapData2 := Buffer(16+2*A_PtrSize)        ; sizeof(BitmapData) = 24, 32

      ; Transfer the pixels to a read-only buffer. The user can declare a PixelFormat.
      loop 2
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
      return (byte == size) ? True : False
   }
} ; End of ImageEqual class.


ImagePut_dropfiles() {
   filepath := ""
   for each, arg in A_Args {
      filepath .= arg . A_Space
      if FileExist(Trim(filepath)) {
         SplitPath filepath, &filename
         ImageShow({file: filepath}, filename)
         filepath := ""
      }
   }
   ; Avoid SingleInstance checks. Only seems to be necessary on v2.
   WinSetTitle WinGetTitle(A_ScriptHwnd) . A_ScriptHwnd, A_ScriptHwnd
}

; Drag and drop files directly onto this script file.
if (A_Args.length > 0 and A_LineFile == A_ScriptFullPath)
   ImagePut_dropfiles()
