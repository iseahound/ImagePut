MsgBox "Press Win + Shift + s to activate Snipping Tool normally. After you select a portion of your screen, you'll see a window pop up of your snip! Right click the window to close it. Press Win + Alt + s to snip and save to a file instead."

#Requires AutoHotkey v2
#include ..\ImagePut.ahk
#!s::
$~#+s::  {
            (ThisHotkey ~= '~#\+s') || Send('#+s')                   ; Run("ms-screenclip:") doesn't work
            SavedClip := ClipboardAll()
            A_Clipboard := ""                                        ; Start off blank for clipboard detection
            exe := ProcessExist("SnippingTool.exe") ? "ScreenClippingHost.exe" : "SnippingTool.exe"
            ProcessWait(exe)                                         ; Wait for screen to turn dark
            ProcessWaitClose(exe)                                    ; Wait for overlay to dissappear

            if !DllCall("IsClipboardFormatAvailable", "uint", 2)     ; Check for CF_Bitmap
               return A_Clipboard := SavedClip                       ; Restore clipboard if user pressed Escape

            capture := ImagePutBuffer(ClipboardAll)
            if ThisHotkey ~= "!"
               if filepath := FileSelect('S')
                  ImagePutFile(capture, filepath)
            hwnd := ImagePutWindow(capture)                          ; Show screenshot
            Hotkey "Esc", (h) => (                                   ; Press Escape to close the screenshot
                WinExist(hwnd) && WinClose(hwnd),
                Hotkey(h, "Off")), "On"                              ; Specify "On" to re-enable the hotkey
         }