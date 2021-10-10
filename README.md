# ImagePut

* Standalone library.
* Easily understandable syntax. 
* Fast conversions.
* Highly robust code that has undergone extensive testing. 

## Documentation

* [Methods and Properties](https://github.com/iseahound/TextRender/wiki/Methods-and-Properties)
* [Background and Text Styles](https://github.com/iseahound/TextRender/wiki/Styles)
* [Tips & Tricks](https://github.com/iseahound/TextRender/wiki/Tips-&-Tricks)

#### If you like this and want to see my other AutoHotkey libraries:

* [TextRender & ImageRender](https://github.com/iseahound/TextRender) - Draw text and images to screen. 

## So you want to convert an image?

But you don't how. That's okay because you can just do this:

    str := ImagePutBase64("cats.jpg")

or this

    ImagePutClipboard("https:\\example.com\cats.jpg")
    
or something like this:

    pStream := ImagePutStream([0, 0, A_ScreenWidth, A_ScreenHeight])
    
Working with images should be this easy. ImagePut has automatic type inference, meaning that it will guess whether the input is (1) a file (2) a website url or (3) a series of coordinates that map to the screen. This functionality enables the user to only memorize a single function for any possible input. For a full list of supported input types, click on the documentation link here. For output types click here. 

Converting between file formats is also straightforward. 

    ; Saves a JPEG as a GIF. 
    ImagePutFile("cats.jpg", "gif")
    
You can also move between different image types and file formats. 

    ; Returns a base64 encoded GIF. 
    ImagePutBase64("cats.jpg", "gif")
    
There's also some weird functions like ```ImagePutCursor``` which lets you set anything as your cursor. Make sure you don't choose an extremely large image! 

Finally, there are several advanced features. The first is the ability to control windows bitmaps directly, through ```ImagePutBitmap``` and ```ImagePutHBitmap```. The second is cropping and scaling functionality. Third is the ability to specify the input type directly.

    ; Declare input type as file.
    ImagePutScreenshot({file: "cats.jpg"})
    
    ; Scale 2x and crop 10% from each edge.
    ImagePutScreenshot({file: "cats.jpg", scale: 2, crop:["-10%", "-10%", "-10%", "-10%"]})
    
    ; Unknown image type declared as "image" to be cropped to 200x200 pixels. 
    ImagePutScreenshot({image: "cats.jpg", crop: [0, 0, 200, 200]})

