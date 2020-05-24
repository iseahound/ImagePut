# ImagePut
Puts an image from anywhere to anywhere

## Examples

Features automatic type detection. Don't worry about converting an image to a common format. 
* `str := ImagePutBase64("https://i.imgur.com/F4k7o1e.png", "png")` - Encodes a URL as a base64 png. 
* `ImagePutCursor(str)` - Sets a base64 string as the mouse cursor.
* `ImagePutFile(A_Cursor, "swift.png")` - Saves the current cursor as a file. 

Image verification based on pixels, not hashes. 
* `MsgBox % ImageEqual("https://i.imgur.com/F4k7o1e.png", "swift.png")`

Explicit typing for faster execution. 
* `MsgBox % ImageEqual({url:"https://i.imgur.com/F4k7o1e.png"}, {file:"swift.png"}

Supports over 12 input types and 6 output types. The list is still growing!
* Input: base64, bitmap, buffer, clipboard, cursor, desktop, file, hBitmap, hwnd, object, screenshot, url, window
* Output: base64, bitmap, buffer, clipboard, cursor, desktop, file, hBitmap

## Input Types

**base64** - A base64 string, with or without tags i.e. `data:image/png;base64,`

**bitmap** - A valid pointer to a GDI+ bitmap. 

**buffer** - An object with the `.pBitmap` property. This is a smart pointer to a GDI+ bitmap that is created by `ImagePutBuffer`. 

**clipboard** - The special variable `ClipboardAll` or an empty string `""`. 

**cursor** - The special variable `A_Cursor`. 

**desktop** - The string `"desktop"`. (Case insensitive.)

**file** - A path to an image file. Supported file formats: bmp, gif, jpg, png, tiff. 

**hBitmap** - A valid handle to a GDI bitmap. If using a transparent hBitmap, know that this format will create visually similar but not pixel identical images due to imprecise division when converting from pARGB to ARGB pixel formats. 

**hwnd** - A handle to a window. Will grab the client area. 

**object** - A custom object (made by you) that implements a `.Bitmap()` method returning a pointer to a GDI+ bitmap. 

**screenshot** - `[x,y,w,h]` array. 

**url** - A url that begins with `https://` or `ftp://`. To override this behavior, declare your url explicitly like `{url:"www.example.com"}`. 

**window** - Any string that matches the window title. Is affected by `SetTitleMatchMode`. Use the special variable `"A"` to match the current active window. Supports `ahk_id`, `ahk_class`, `ahk_pid`, etc. See the AutoHotkey manual for details. 

### Overriding Input Types
Use an object such as `{file:"pic.bmp"}`. This will skip automatic type detection and speed up your script. 
