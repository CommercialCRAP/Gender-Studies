#include <MsgBoxConstants.au3>
#include <ScreenCapture.au3>


#A - Ouvrir une recherche de profils dans Thaifriendly dans fen�tre maximis�e de chrome en plein �cran r�solution 1366x768,
#B - �diter le script pour donner:

Global $n = 25
#Nombre de pages de profils dans les r�sultats de la recherche = n

#C - Lancer le script. ; Press PRINTSCREEN to terminate script, Pause/Break to "pause"

#Plantait des fois en plein milieu en ouvrant un profil (cause corrig�e)
#Ne marche pas pour la deni�re page de r�sultats quoi qu il arrive mais c est normal.


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

For $i = 1 to ($n-1)
   #Sleep ( Random(2000, 10000, 1) )
   #if ($like == 1) Then
   For $j = 0 to 9
	  For $k = 0 to 7
		 MouseClick("left", (253+$k*115), 437)
	  Next
	  MouseClickDrag ( "left", 1360, (175+$j*51), 1360, (175+($j+1)*51))
	  Sleep (3000)
   Next
   #Click on Like 605 368
   #EndIf
   #Sleep ( 1000 )
   #Send("{ESCAPE 2}")
   #Example()

#Func Example()

    #ShellExecute(@MyDocumentsDir & "\GDIPlus_Image1.jpg")

    #; Capture region
    #_ScreenCapture_Capture(@MyDocumentsDir & "ScreenShots\GDIPlus_Image2.jpg", 0, 0, 796, 596)

    #ShellExecute(@MyDocumentsDir & "\GDIPlus_Image2.jpg")
#EndFunc   ;==>Example
   if (($i < 6) Or ($i > ($n-3))) Then
	  MouseMove(849, 535)
	  ; Capture full screen
    _ScreenCapture_Capture(@MyDocumentsDir & "\BeforeClickNextResultPage" & $i & ".jpg")
	  MouseClick("left", 849, 535)
   ElseIf (($i > 6) And ($i < ($n-3))) Then
	  MouseMove(885, 535)
	  ; Capture full screen
    _ScreenCapture_Capture(@MyDocumentsDir & "\BeforeClickNextResultPage" & $i & ".jpg")
	  MouseClick("left", 885, 535)
   ElseIf (($i > 6) And ($i < ($n-3))) Then
	  MouseMove(865, 535)
	  ; Capture full screen
    _ScreenCapture_Capture(@MyDocumentsDir & "\BeforeClickNextResultPage" & $i & ".jpg")
	  MouseClick("left", 865, 535)
   Else
	  MouseMove(880, 535)
	  ; Capture full screen
    _ScreenCapture_Capture(@MyDocumentsDir & "\BeforeClickNextResultPage" & $i & ".jpg")
	  MouseClick("left", 880, 535)
   EndIf

#867 911 818 866
Sleep ( 3000 )
#Click on third Profile in the 3 search results previews

Next
#Click n times on third Profile in the 3 search results previews
