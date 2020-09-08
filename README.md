# ImagePut
Puts an image from anywhere to anywhere

#### URL to Base64 PNG
    MsgBox % str := ImagePutBase64("https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png", "png")

#### Base64 to Windows Mouse Cursor
    ImagePutCursor(str)

#### Windows Mouse Cursor to PNG File
    ImagePutFile(A_Cursor, "ahk.png")
    DllCall("SystemParametersInfo", "uint", 0x57, "uint", 0, "ptr", 0, "uint", 0) ; Restore cursor.

#### Compare images using pixel values. Not file hashes.
    MsgBox % ImageEqual("https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png", "ahk.png")

#### Declare Input Types
    ; Declare Input Type
    ImagePutFile({url:"https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png"})
    ; Auto Detect Input Type.
    ImagePutFile("https://www.autohotkey.com/boards/styles/simplicity/theme/images/logo.png")

Declaring an input type will skip the detection step, making your code faster and more reliable.

## Input Types

**base64** - A base64 string, with or without tags i.e. `data:image/png;base64,`

**bitmap** - A valid pointer to a GDI+ bitmap. 

**buffer** - An object with the `.pBitmap` property. This is a smart pointer to a GDI+ bitmap that is created by `ImagePutBuffer`. 

**clipboard** - The special variable `ClipboardAll` or an empty string `""`. 

**cursor** - The special variable `A_Cursor`. 

**desktop** - The string `"desktop"`. (Case insensitive.)

**file** - A path to an image file. Supported file formats: bmp, gif, jpg, png, tiff. 

**hBitmap** - A valid handle to a GDI bitmap. If using a transparent hBitmap, know that this format will create visually similar but not pixel identical images due to imprecise division when converting from pARGB to ARGB pixel formats. 

**hIcon** - A valid handle to a GDI icon.

**object** - A custom object (made by you) that implements a `.Bitmap()` method returning a pointer to a GDI+ bitmap. 

**RandomAccessStream** - A pointer to an IRandomAccessStream interface.

**screenshot** - `[x,y,w,h]` array. 

**stream** - A pointer to an IStream interface.

**sprite** - Must be explicitly declared as: `{sprite:"character.bmp"}`. Can be a file or a url. This will sample the top-left pixel and set all pixels of that color as transparent. 

**url** - A url that begins with `https://` or `ftp://`. To override this behavior, declare your url explicitly like `{url:"www.example.com"}`. 

**window** - Any string that matches the window title. Is affected by `SetTitleMatchMode`. Use the special variable `"A"` to match the current active window. Supports `ahk_id`, `ahk_class`, `ahk_pid`, etc. See the AutoHotkey manual for details. 

### Overriding Input Types
Use an object such as `{file:"pic.bmp"}`. This will skip automatic type detection and speed up your script. 

## Output Functions

**ImagePutBase64** - Returns a base64 string. The image can be encoded using a specifed file format. For JPG images, a quality level can be set as well. Supported file formats: bmp, gif, jpg, png, tiff. Quality: 0 - 100. 

**ImagePutBitmap** - Returns a pointer to a GDI+ bitmap. You are responsible for calling `ImagePut.DisposeImage()` when finished to prevent a GDI+ object leak. Use `ImagePutBuffer` instead. 

**ImagePutBuffer** - Returns a buffer object. This is a smart pointer. It will automatically dispose of the bitmap when the variable is freed, e.g. `buffer := ""`. It also contains its own GDI+ scope, meaning it is not necessary to place `pToken := Gdip_Startup()` at the top of the script. Access the raw pointer via `buffer.pBitmap`. 

**ImagePutClipboard** - Returns an empty string. Puts the image onto the clipboard. 

**ImagePutCursor** - Returns `"A_Cursor"`. Puts the image as the cursor. Specify the cursor hotspot ("click point") using x and y coordinates. 

**ImagePutDesktop** - Returns `"desktop"`. Puts the image on an invisible temporary window behind the desktop icons. This functionality relies on an unsupported and undocumented feature.

**ImagePutFile** - Returns a filename. Supported file formats: bmp, gif, jpg, png, tiff. Quality: 0 - 100.

**ImagePutHBitmap** - Returns an hBitmap handle. The pixel format of an hBitmap is in pARGB, so any conversion between pre-multiplied ARGB and ARGB will introduce rounding errors. The result is that any image with transparency will look visually identical to the source, but not be pixel perfect causing `ImageEqual` to fail. RGB images without an alpha channel are unaffected. An alpha color can be specified as the replacement color of transparent pixels. 

**ImagePutHex** - Puts the image into a file format and returns a hexadecimal encoded string.

**ImagePutHIcon** - Puts the image into an icon and returns the handle.

**ImagePutRandomAccessStream** - Puts the image into a file format and returns a pointer to a RandomAccessStream.

**ImagePutScreenshot** - Returns an `[x,y,w,h]` array. Puts the image directly on the screen's device context. Therefore the image will be drawn over by other applications. Takes an `[x,y,w,h]` array. Parameters can be omitted like `[0,0]`. An alpha color can be specified as the replacement color of transparent pixels. 

**ImagePutStream** - Puts the image into a file format and returns a pointer to a stream.

**ImagePutWallpaper** - Returns `"wallpaper"`. Puts the image as the wallpaper. Whether the image will be streched, filled, tiled, etc. depends on your desktop personalization settings. 

### Cropping and Scaling Images

**ImagePut(cotype, image, crop := "", scale := "", terms\*)**

**cotype** - The output type as a string. `"file"`

**crop** - `[x,y,w,h]` array. Negative values will be subtracted from the edge. Percentages are permitted. `"-20%"`

**scale** - A real number. Factor to scale by. A scale of `1` does nothing. 

## Comments

Please visit https://www.autohotkey.com/boards/viewtopic.php?f=6&t=76301

Pull requests are welcome!
