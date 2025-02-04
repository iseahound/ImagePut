#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

; SUCCESS: All 27 images show up
; FAIL: An error appears

A := WinExist("A")
ImagePut.gdiplusStartup()

ImagePutClipboard("https://raw.githubusercontent.com/iseahound/test_images/main/insta.png")
ImagePutWindow(ClipboardAll, "1. ClipboardPng")

ImagePutClipboard("https://picsum.photos/1200")
ImagePutWindow(ClipboardAll, "2. Clipboard")

safearray := ImagePutSafeArray("https://picsum.photos/1100")
ImagePutWindow(safearray, "3. SafeArray")

ImagePutWindow([0, 0, 1000, 1000], "4. Screenshot")

hwnd := ImageShow("https://picsum.photos/900")
ImagePutWindow([0, 0, 900, 900, "ahk_id" hwnd], "5. Screenshot relative to window")
ImageDestroy(hwnd)

hwnd := ImageShow("https://picsum.photos/800")
ImagePutWindow({hwnd: hwnd}, "6. Window with hwnd property")
ImageDestroy(hwnd)

pBitmap := ImagePutBitmap("https://picsum.photos/700")
ImagePutWindow({pBitmap: pBitmap}, "7. Object (has pBitmap property)")

encodedbuf := ImagePutEncodedBuffer("https://picsum.photos/600")
ImagePutWindow(encodedbuf, "8. EncodedBuffer")

buf := ImagePutBuffer("https://picsum.photos/500")
ImagePutWindow({ptr: buf.ptr, width: buf.width, height: buf.height}, "9. Buffer")

ImagePutWindow(0, "10. All Monitors")

ImagePutWindow(1, "11. Primary Monitor")

; ImagePutDesktop Broken by 24H2? Using a SVG test as a replacement for now...
hwnd := ImageShow("https://raw.githubusercontent.com/iseahound/test_images/refs/heads/main/compass.svg")
;ImagePutWindow("desktop", "12. Desktop")
;ImageDestroy(hwnd)

ImagePutWindow("wallpaper", "13. Wallpaper")

ImagePutWindow(A_Cursor, "14. Cursor")

ImagePutWindow("https://raw.githubusercontent.com/iseahound/test_images/main/pepper-creative-brochure.pdf", "15. Url")

filepath := ImagePutFile("https://picsum.photos/1200")
ImagePutWindow(filepath, "16. File")
ImageDestroy(filepath)

ImagePutWindow(A, "17. Window (Current Active Window)")

sharedbuf := ImagePutSharedBuffer("https://picsum.photos/1100", "alice")
ImagePutWindow("alice", "18. SharedBuffer")

hex := ImagePutHex("https://picsum.photos/1000")
ImagePutWindow(hex, "19. Hex")

base64 := ImagePutBase64("https://picsum.photos/900")
ImagePutWindow(base64, "20. Base64")

hdc := ImagePutDC("https://picsum.photos/800")
ImagePutWindow(hdc, "21. DC")

hBitmap := ImagePutHBitmap("https://picsum.photos/700")
ImagePutWindow(hBitmap, "22. HBITMAP")

hIcon := ImagePutHIcon("https://picsum.photos/600")
ImagePutWindow(hIcon, "23. HICON")

pBitmap := ImagePutBitmap("https://picsum.photos/500")
ImagePutWindow(pBitmap, "24. BITMAP")

IStream := ImagePutStream("https://picsum.photos/400")
ImagePutWindow(IStream, "25. IStream")

IRandomAccessStream := ImagePutRandomAccessStream("https://picsum.photos/300")
ImagePutWindow(IRandomAccessStream, "26. IRandomAccessStream")

IWICBitmap := ImagePutWICBitmap("https://picsum.photos/200")
ImagePutWindow(IWICBitmap, "27. IWICBitmap")