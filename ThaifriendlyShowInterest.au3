#include <MsgBoxConstants.au3>
#include <ScreenCapture.au3>
#include <ClipBoard.au3>
#include <String.au3>


#A - Ouvrir une recherche de profils dans Thaifriendly dans fenêtre maximisée de chrome en plein écran résolution 1366x768,
#B - éditer le script pour donner:

Global $n = 25
#Nombre de pages de profils dans les résultats de la recherche = n

Global $like = 0

Global $advertisementOffset = 0

Global $searchCriteriaOffset = 1

Global $advertisementOffsetInProfile = $advertisementOffset

Global $opener = 1

Global $profileName = ("")

Global $openerText = ("Hello " & $profileName & "{!} My name is Julo. Nice to meet you here :)")

Global $webpageLoaded = 0

Global $startTimer = TimerInit()
Global $timerBetweenMessages = 12*60*1000

Global $x_address = 279 ; abscisse Dateinasia dans barre d'adresse de chrome
Global $y_address = 48 ; ordonnée Dateinasia dans barre d'adresse de chrome


#C - Lancer le script. ; Press PRINTSCREEN to terminate script, Pause/Break to "pause"

#Plantait des fois en plein milieu en ouvrant un profil (cause corrigée)
#Ne marche pas pour la denière page de résultats quoi qu il arrive mais c est normal.


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
		 $webpageLoaded = 0
		 $advertisementOffsetInProfile = $advertisementOffset
		 send("{SHIFTDOWN}")
		 send("{CTRLDOWN}")
		 MouseClick("left", (253+$k*115), 380)
		 send("{SHIFTUP}")
		 send("{CTRLUP}")
		 While ($webpageLoaded == 0)
			Sleep ( 5000 )
			$yellowMessageBoxColorTest1 = PixelGetColor (190 , 340)
			#MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($yellowMessageBoxColorTest1, 6))
			#MsgBox($MB_SYSTEMMODAL, "", "The decimal color is: " & $yellowMessageBoxColorTest1)

			$yellowMessageBoxColorTest2 = PixelGetColor (1180 , 335)

			If ($yellowMessageBoxColorTest1 == 16382457) Then
			   $webpageLoaded = 1
			#ElseIf ($yellowMessageBoxColorTest2 == 16641459) Then
			#   $advertisementOffsetInProfile = 0
			#   $webpageLoaded = 1
			EndIf
		 WEnd
		 if ($opener == 1) Then
			$redQuoteColorTest = PixelGetColor (1000 , 462+$advertisementOffsetInProfile)
			#MsgBox($MB_SYSTEMMODAL, "", "The decimal color is: " & $redQuoteColorTest)
			#MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($redQuoteColorTest, 6))

			If ($redQuoteColorTest == 16768678) Then
			   #Aucun contact précédent, donc on envoit l'opener. Sinon on n'envoit pas l'opener.
			   MouseClick("left", $x_address, $y_address)

			   send("{CTRLDOWN}")
			   send("a")
			   send("c")
			   send("{CTRLUP}")
			   $msg = _ClipBoard_GetData()
			   $profileName= _StringProper(StringReplace(StringTrimLeft($msg, 25),"+"," "))
			   $openerText = ("Hello " & $profileName & "{!} My name is Julo. Nice to meet you here :)")
			   #MsgBox($MB_SYSTEMMODAL,"",$openerText)
			   MouseClick("left", 624, 312+$advertisementOffsetInProfile)
			   send($openerText)
			   sleep ( 2500 )
			   MouseClick("left", 1035, 407+$advertisementOffsetInProfile)
			   sleep ( 3000 )
			   sleep ( 11*60*1000 )
			   $startTimer = TimerInit()
			EndIf
		 EndIf
		 send("^w")
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
