MsgBox "Press CapsLock to toggle the overlay. Press F1 to Play / Pause. Press F2 to advance to the next frame."

#Requires AutoHotkey v2
#Include ..\ImagePut.ahk

; You can use url, filepath, basically anything.
image1 := "https://mathiasbynens.be/demo/animated-webp-supported.webp"
image2 := "https://mathiasbynens.be/demo/animated-webp-supported.webp"

; Store hwnd in array for speed.
hwnds := []

; Detect Caps Lock key press and toggle actions
CapsLock:: {
    static toggle := -1

    ; Make images appear if never created.
    if (toggle = -1) {

         width := ImageWidth(image1)
         height := ImageHeight(image2)

         hwnds.push(Show(image1, 0, A_ScreenHeight - height))
         hwnds.push(Show(image2, A_ScreenWidth - Width, A_ScreenHeight - height))
         
         ; Synchronize playback
         PlayAll()

         toggle := 1
    }

    toggle := !toggle

    if !toggle {
        ; PlayAll()  ; Resume playback
        ShowAll()  ; Show the animated GIF
    } else {
        HideAll()  ; Hide the animated GIF
        ; PauseAll() ; Pause playback
    }
}

F1:: PlayPauseAll()
F2:: NextFrameAll()

Play(hwnd) => PostMessage(0x8001,,,, hwnd)
Restart(hwnd) => PostMessage(0x8001, 1,,, hwnd)
Pause(hwnd) => PostMessage(0x8002,,,, hwnd)
Stop(hwnd) => PostMessage(0x8002, 1,,, hwnd)
PlayPause(hwnd) => PostMessage(0x202,,,, hwnd)
RestartStop(hwnd) => PostMessage(0x202, 1,,, hwnd)
IsPlaying(hwnd) => DllCall("GetWindowLong", "ptr", hwnd, "int", 4*A_PtrSize, "ptr")
Step(hwnd, n) => PostMessage(0x8000, n,,, hwnd)
NextFrame(hwnd) => Step(hwnd, 1)
PrevFrame(hwnd) => Step(hwnd, -1)

Show(image, x?, y?, w?, h?) {
    WS_POPUP                  := 0x80000000   ; Required
    WS_VISIBLE                := 0x10000000   ; show immediately
    WS_DISABLED               :=  0x8000000   ; Disables user interaction with the window.

    WS_EX_TOPMOST             :=        0x8   ; Always on top.
    WS_EX_TOOLWINDOW          :=       0x80   ; Hides from Alt+Tab menu. Removes small icon.
    WS_EX_LAYERED             :=    0x80000   ; For UpdateLayeredWindow.
    WS_EX_CLICKTHROUGH        :=    0x80020   ; Makes it click through

    ; Shows the image in a window (without a border) and returns a handle to a window.
    ;   title      -  Window Title            |  string   ->   MyTitle
    ;   pos        -  Window Coordinates      |  array    ->   [x,y,w,h] or [0,0]
    ;   style      -  Window Style            |  uint     ->   WS_VISIBLE
    ;   styleEx    -  Window Extended Style   |  uint     ->   WS_EX_LAYERED
    ;   parent     -  Window Parent           |  ptr      ->   hwnd
    ;   playback   -  Animate Window?         |  bool     ->   True
    ;   cache      -  Cache Animation Frames? |  bool     ->   False
    style := WS_POPUP | WS_VISIBLE | WS_DISABLED
    styleEx := WS_EX_TOPMOST | WS_EX_TOOLWINDOW | WS_EX_LAYERED | WS_EX_CLICKTHROUGH
    return ImageShow(image, "GifWindow", [x?, y?, w?, h?], style, styleEx,, False, True)
}

ShowAll() {
    for hwnd in hwnds
        try WinShow(hwnd)
}

HideAll() {
    for hwnd in hwnds
        try WinHide(hwnd)
}

CloseAll() {
    for hwnd in hwnds
        try WinClose(hwnd)
}

PauseAll() {
    for hwnd in hwnds
        Pause(hwnd)
}

PlayAll() {
    for hwnd in hwnds
        Play(hwnd)
}

PlayPauseAll() {
    for hwnd in hwnds
        PlayPause(hwnd)
}

NextFrameAll() {
    for hwnd in hwnds
        NextFrame(hwnd)
}
