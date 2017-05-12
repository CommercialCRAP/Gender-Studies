#include <MsgBoxConstants.au3>
#include <ScreenCapture.au3>
#include <ClipBoard.au3>
#include <String.au3>

#A - Ouvrir une recherche de profils dans DateInAsia.com dans fenêtre maximisée de chrome en plein écran résolution 1366x768,
#B - éditer le script pour donner:

Global $n = 100
#Nombre de pages de profils à explorer dans les résultats de la recherche = n

Global $like = 0

Global $advertisementOffset = 110

Global $searchCriteriaOffset = 1

Global $advertisementOffsetInProfile = $advertisementOffset

Global $opener = 1

Global $profileName = ("")

Global $openerText = ("Hello " & $profileName & "{!} My name is Julo. Nice to meet you here :)")

Global $webpageLoaded = 0

Global $x_address = 279 ; abscisse Dateinasia dans barre d'adresse de chrome
Global $y_address = 48 ; ordonnée Dateinasia dans barre d'adresse de chrome



#C - Lancer le script. ; Press PRINTSCREEN to terminate script, Pause/Break to "pause"


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
   MouseClick("left", 1330, 370+$advertisementOffsetInProfile)
   for $o = 1 to $searchCriteriaOffset
	  send("{DOWN}")
   Next
   #Sleep ( Random(2000, 10000, 1) )
   For $j = 1 to 12
	  For $k = 0 to 4
		 $webpageLoaded = 0
		 $advertisementOffsetInProfile = $advertisementOffset
		 send("{SHIFTDOWN}")
		 send("{CTRLDOWN}")
		 MouseClick("left", (240+$k*220), 355)
		 send("{SHIFTUP}")
		 send("{CTRLUP}")
		 While ($webpageLoaded == 0)
			Sleep ( 5000 )
			$yellowMessageBoxColorTest1 = PixelGetColor (1180 , 445)
			#MsgBox($MB_SYSTEMMODAL, "", "The decimal color is: " & $yellowMessageBoxColorTest1)
			#MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($yellowMessageBoxColorTest1, 6))

			$yellowMessageBoxColorTest2 = PixelGetColor (1180 , 335)

			If ($yellowMessageBoxColorTest1 == 16641459) Then
			   $webpageLoaded = 1
			ElseIf ($yellowMessageBoxColorTest2 == 16641459) Then
			   $advertisementOffsetInProfile = 0
			   $webpageLoaded = 1
			EndIf
		 WEnd
		 if ($opener == 1) Then
			$redQuoteColorTest = PixelGetColor (577 , 447+$advertisementOffsetInProfile)
			#MsgBox($MB_SYSTEMMODAL, "", "The decimal color is: " & $redQuoteColorTest)
			#MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($redQuoteColorTest, 6))

			If ($redQuoteColorTest == 13369344) Then
			   #Aucun contact précédent, donc on envoit l'opener. Sinon on n'envoit pas l'opener.
			   MouseClick("left", $x_address, $y_address)

			   send("{CTRLDOWN}")
			   send("a")
			   send("c")
			   send("{CTRLUP}")
			   $msg = _ClipBoard_GetData()
			   $profileName= _StringProper(StringReplace(StringTrimLeft($msg, 27),"+"," "))
			   $openerText = ("Hello " & $profileName & "{!} My name is Julo. Nice to meet you here :)")
			   #MsgBox($MB_SYSTEMMODAL,"",$openerText)
			   MouseClick("left", 600, 360+$advertisementOffsetInProfile)
			   send($openerText)
			   sleep ( 2500 )
			   MouseClick("left", 1185, 370+$advertisementOffsetInProfile)
			   sleep ( 3000 )
			EndIf
		 EndIf
		 if ($like == 1) Then
			#Like le profil
		 EndIf
		 send("^w")
		 sleep ( 1000 )
	  Next
	  send("{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}")
	  if ($j == 6) Then
		 send("{CTRLDOWN}{SHIFTDOWN}")
		 MouseClick("left", 1366/2, 355)
		 send("{CTRLUP}{SHIFTUP}")
		 Sleep ( 5000 )
		 send("^w")
		 send("{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}")
	  ElseIf ($j == 12) Then
		 send("{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}")
	  #MouseClickDrag ( "left", 1360, (175+$j*51), 1360, (175+($j+1)*51))
	  EndIf
	  Sleep (1000)
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
	  ; Capture full screen
   _ScreenCapture_Capture(@MyDocumentsDir & "\DateInAsiaBeforeClickNextResultPage" & $i & ".jpg")
   MouseClick("left", 1140, 390)

#867 911 818 866
Sleep ( 5000 )
#Click on third Profile in the 3 search results previews

Next
#Click n times on third Profile in the 3 search results previews
