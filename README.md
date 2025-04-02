# ImagePut

#### A core library for images in AutoHotkey

![image](https://github.com/iseahound/ImagePut/assets/9779668/65a563a6-3d95-4819-9ea6-64d5ab00d993)

Imagine a scenario where you have a file but you're trying to get it uploaded into an API. Or you have a function that returns some strange image format, is there any way you can *just* get it to show its contents? If you pass anything, literally anything you believe is an image to `ImagePutWindow()` it will show up on screen. And then you can magically transform it to be compatible with that specific API.

#### Note: If you don't want a large library you can copy paste the relevant functions

## So you want to convert an image?

But you don't know how. That's okay because you can just do this:

    str := ImagePutBase64("cats.jpg")

or this

    ImagePutClipboard("https://example.com/cats.jpg")
    
or something like this:

    pStream := ImagePutStream([0, 0, A_ScreenWidth, A_ScreenHeight])
    
Working with images should be this easy. ImagePut has automatic type inference, meaning that it will guess whether the input is (1) a file (2) a website url or (3) a series of coordinates that map to the screen. This functionality enables the user to only memorize a single function for any possible input. For a full list of supported input types, click on the documentation link [here](https://github.com/iseahound/ImagePut/wiki/Input-Types-&-Output-Functions#input-types). For output types click [here](https://github.com/iseahound/ImagePut/wiki/Input-Types-&-Output-Functions#output-functions). 

Convert file formats. 

    ; Saves a JPEG as a GIF. 
    ImagePutFile("cats.jpg", "gif")
    
Convert file formats and image types at the same time!

    ; Saves a JPEG as a base64 encoded GIF. 
    str := ImagePutBase64("cats.jpg", "gif")
    
There's also some weird functions like ```ImagePutCursor``` which lets you set anything as your cursor. Make sure you don't choose an extremely large image! 

Finally, there are several advanced features. The first is the ability to specify the [input type](https://github.com/iseahound/ImagePut/wiki/Input-Types-&-Output-Functions#input-types) directly. The second is [cropping](https://github.com/iseahound/ImagePut/wiki/Crop,-Scale,-&-Other-Flags#crop) and [scaling](https://github.com/iseahound/ImagePut/wiki/Crop,-Scale,-&-Other-Flags#scale) functionality. Third is use of ImageEqual() a function that can compare multiple inputs across different windows image data types!

    ; Declare input type as file.
    ImagePutWindow({file: "cats.jpg"})
    
    ; Scale 2x and crop 10% from each edge.
    ImagePutWindow({file: "cats.jpg", scale: 2, crop:["-10%", "-10%", "-10%", "-10%"]})
    
    ; Unknown image type declared as "image" to be cropped to 200x200 pixels. 
    ImagePutWindow({image: "cats.jpg", crop: [0, 0, 200, 200]})
    
    ; Compare a url to a file.
    MsgBox % ImageEqual("https://example.com/cats.jpg", "cats.jpg")
    
    ; Validate an image as an actual image.
    ImageEqual("cats.jpg")

#### Features

* Simple and effective
* Decipher over [20+ image types](https://github.com/iseahound/ImagePut/wiki/Quick-Start#accepts)
* Supports newer formats `avif`, `heic`, and `webp`
* View and debug any image variable with `ImagePutWindow(image)`
* Screen capture with fast [PixelSearch](https://github.com/iseahound/ImagePut/wiki/PixelSearch-and-ImageSearch#pixelsearch) and [ImageSearch](https://github.com/iseahound/ImagePut/wiki/PixelSearch-and-ImageSearch#imagesearch)
* [Add](https://github.com/iseahound/ImagePut/wiki/Add-Image-to-AutoHotkey-GUI) animated GIFs to AutoHotkey GUIs
* [Upload](https://github.com/iseahound/ImagePut/wiki/Uploading-Images-API-POST-Request) images using website apis
* [Load](https://github.com/iseahound/ImagePut/wiki/Read-an-Image-From-Memory) images from blocks of memory

#### Documentation

* **Function List** - [Quick Start](https://github.com/iseahound/ImagePut/wiki/Quick-Start)
* Chinese Documentation (中文) - [这里有一个中文版的使用教程](https://www.autoahk.com/archives/37246)
* [Input Types & Output Functions](https://github.com/iseahound/ImagePut/wiki/Input-Types-&-Output-Functions)
* [Crop, Scale, & Other Flags](https://github.com/iseahound/ImagePut/wiki/Crop,-Scale,-&-Other-Flags)
* [PixelSearch & ImageSearch](https://github.com/iseahound/ImagePut/wiki/PixelSearch-and-ImageSearch)

#### Engineering

* [Engineering Challenges Q&A](https://github.com/iseahound/ImagePut/wiki/Engineering-Challenges-Q&A) - Click here to read some interesting stuff. 
* [Internal Documentation](https://github.com/iseahound/ImagePut/wiki/Internal-Documentation) - Understanding how ImagePut works.  

#### Design Philosophy

* 100% Compatibility with [Gdip_All.ahk](https://github.com/buliasz/AHKv2-Gdip)
* ImagePut is designed to be the fastest
* ImagePut should serve as a reference implementation
* Specific conversions between formats like PNG file to hIcon are not considered
* Users should be able to replace uses of ImagePut with individual functions
* Therefore users should be copy and paste individual functions
* If you need help extracting a function please ask!

#### Help and Support

Feel free to ask for any help, questions, or post suggestions, etc.

* v1 forum: https://www.autohotkey.com/boards/viewtopic.php?t=76301
* v2 forum: https://www.autohotkey.com/boards/viewtopic.php?t=76633

Extra appreciation: https://ko-fi.com/iseahound
