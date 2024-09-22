MsgBox "Copy an image from a webpage OR copy the image link. When you navigate to an explorer window or desktop, press Ctrl + v. It's that simple! As a bonus, this converts PDFs and SVGs to png files—perfect for sending to the printer."

#Requires AutoHotkey v2
#include ..\ImagePut.ahk
#HotIf   WinActive("ahk_exe explorer.exe")
~^v::    {
            Sleep 50   ; Delay opening clipboard when Ctrl + v
            if DllCall("IsClipboardFormatAvailable", "uint", 2) && !DllCall("IsClipboardFormatAvailable", "uint", 15)
               ImagePutExplorer(ClipboardAll)
            else if ImagePut.isURL(A_Clipboard)
               ImagePutExplorer(A_Clipboard)
         }
#HotIf

; To turn off auto conversion of formats with PDF urls
; ImagePutExplorer({render: 0, image: A_Clipboard})