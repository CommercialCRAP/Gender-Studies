#include <MsgBoxConstants.au3>

; Press PRINTSCREEN to terminate script, Pause/Break to "pause"

Global $g_bPaused = False

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{PRINTSCREEN}", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d


Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
    Exit
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox($MB_SYSTEMMODAL, "", "This is a message.")
EndFunc   ;==>ShowMessage

MouseClick("left", 50, 5, 1, 0)
MouseClick("left", 450, 85, 1, 0)
For $h = 0 to 20
   For $i = 0 to 500
   Send("{ESCAPE 2}")
   Sleep ( 250 )
   Send("{NUMPAD1}")
   Sleep ( 250 )
   Next
Sleep ( 24*60*60*1000 )
Next
