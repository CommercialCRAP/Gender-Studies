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

MouseClick("left", 50, 5)
#Click on Badoo Tab in Chrome maximised window
Sleep ( 1000 )

MouseClick("left", 330, 85)
#Click on People Nearby
Sleep ( 3000 )

MouseClick("left", 330, 330)
#Click on First Profile
Sleep ( 3000 )

MouseClick("left", 165, 330)
#Click on second Profile in the 3 search results previews

For $i = 0 to 10000
Sleep ( 1000 )
MouseClick("left", 240, 330)
Next
#Click 60 times on third Profile in the 3 search results previews
