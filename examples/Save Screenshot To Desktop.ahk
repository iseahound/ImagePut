MsgBox "Save the current screen to desktop by pressing Win + Control + Shift + s"

#Requires AutoHotkey v2
#include ..\ImagePut.ahk
#^+s::   ImagePutWindow({file: ImagePutFile("A", A_Desktop "\1"), scale: 2/3}, "Saved screenshot to desktop. Right click to close.")