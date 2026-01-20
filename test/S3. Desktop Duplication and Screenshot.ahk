#include *i ..\ImagePut%A_TrayMenu%.ahk
#include *i ..\ImagePut (for v%true%).ahk
#singleinstance force

MsgBox "Taking a screenshot!"
Sleep 300
gdi := ImagePutBuffer(1)
dx11 := ImagePut.DesktopDuplicationToBuffer(1)

;test := ImageEqual(gdi, dx11) ? " (SUCCESS: Identical)" : " (FAIL: Different)"

gdi.show("GDI Screen Capture")
dx11.show("DirectX 11 Desktop Duplication")

Esc:: ExitApp