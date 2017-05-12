#Capcha Random: 1115 1216 1316 1416
#Capcha 2500 3000: 1512 1612
#Men 	CMX:12924 	50km:18474 	BKK:220894 	50km:304670 	100km:412547 	MNL:12912 	12km:43713 	50km:69051 	100km:77209 	Cebu:2074 	100km:5889 	Saigon:11856 	25km:30699 	100km:36970  	Paris:185034 	100km:524245
#Wome 	CMX:8772 	50km:12365 	BKK:155490 	50km:202907 	100km:274225 	MNL:22559 	12km:50431 	50km:71560 	100km:79532 	Cebu:2853 	100km:7688 	Saigon: 7390 	25km:18141 	100km:20980  	Paris:68441  	100km:132413
#     	0.7                 	0.7                    0.664        1.74      1.15                  1.03        1.3756    1.30       0.623        0.59       0.567        0.37         0.25
#include <MsgBoxConstants.au3>

Global $n = 100000
#Nombre de profils = n

Global $love = 0
#Like si 1 ne like pas si 0

Global $favorite = 0
#Favorite si 1 ne favorite pas si 0

Global $restart = 0
#Restart la recherche Nerby People si 1 ne restart pas si 0

; Press PRINTSCREEN to terminate script, Pause/Break to "pause"

Global $iChecksumNotFavorite = 4244979878
#2983805437 2276344175 2327200431 4244979878
Global $redesign = 0
#A utiliser si l option favouritene fonctionne pas, pour récupérer le nouveau checksum. Affiche une message box avec le checksum de la zone localisée autour du bouton favorite si 1 n affiche rien si 0

Global $g_bPaused = False

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{PRINTSCREEN}", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d

Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ToolTip('Script is "Paused" $like $restart', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
    Exit
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox($MB_SYSTEMMODAL, "", "This is a message.")
EndFunc   ;==>ShowMessage

If ($restart == 1) Then
   MouseClick("left", 50, 5)
   #Click on Badoo Tab in Chrome maximised window
   Sleep ( 1000 )

   MouseClick("left", 190, 360)
   #Click on People Nearby
   Sleep ( 3000 )

   MouseClick("left", 490, 250)
   #Click on First Profile
   Send("{ESCAPE 2}")
   Sleep ( 3000 )

	  if ($love == 1) Then
	  MouseClick("left",  425, 115)
	  #Click on Like
	  EndIf
   	  if ($favorite == 1) Then
		 if ($iChecksumNotFavorite == PixelChecksum(1085, 105, 1105, 125)) Then
			MouseClick("left",  1098, 115)
			#Click on star to add to favorites si pas déjà liké (motif d étoile grise foncé)
			Sleep ( 1000 )
			Send("{ESCAPE 2}")
		 EndIf
	  EndIf
   Sleep ( 500 )
   Send("{ESCAPE 2}")

   MouseClick("left", 1310, 245)
   Send("{ESCAPE 2}")
   #Click on second profile in the 5 search results previews on the right side of the window
	  if ($love == 1) Then
	  MouseClick("left",  425, 115)
	  #Click on Like
	  Sleep ( 500 )
	  Send("{ESCAPE 2}")
	  EndIf
   	  if ($favorite == 1) Then
		 if ($iChecksumNotFavorite == PixelChecksum(1085, 105, 1105, 125)) Then
			MouseClick("left",  1098, 115)
			#Click on star to add to favorites si pas déjà liké (motif d étoile grise foncé)
			Sleep ( 1000 )
			Send("{ESCAPE 2}")
		 EndIf
	  EndIf
   Sleep ( 500 )

   MouseClick("left", 1310, 300)
   Send("{ESCAPE 2}")
   #Click on 3rd profile in the 5 search results previews on the right side of the window
	  if ($love == 1) Then
	  MouseClick("left",  425, 115)
	  #Click on Like
	  Sleep ( 500 )
	  Send("{ESCAPE 2}")
	  EndIf
   	  if ($favorite == 1) Then
		 if ($iChecksumNotFavorite == PixelChecksum(1085, 105, 1105, 125)) Then
			MouseClick("left",  1098, 115)
			#Click on star to add to favorites si pas déjà liké (motif d étoile grise foncé)
			Sleep ( 1000 )
			Send("{ESCAPE 2}")
		 EndIf
	  EndIf
   Sleep ( 500 )
   EndIf

$white = PixelGetColor(375, 75)

For $i = 0 to $n
   #Sleep ( Random(2000, 10000, 1) )
   Sleep ( 3000 )
   	  if ($love == 1) Then
		 		 #MsgBox($MB_SYSTEMMODAL, "Checksum", PixelChecksum(1085, 105, 1105, 125))
		 #Use this message box to find the new checksum of the button after a redesign of Badoo
	  MouseClick("left",  425, 115)
	  #Click on Like
	  Sleep ( 500 )
	  Send("{ESCAPE 2}")
	  EndIf
   	  if ($favorite == 1) Then
		 if ($redesign == 1) Then
		 MsgBox($MB_SYSTEMMODAL, "Checksum", PixelChecksum(1085, 105, 1105, 125))
		 #Use this message box to find the new checksum of the button after a redisgn of Badoo
		 EndIf
		 if ($iChecksumNotFavorite == PixelChecksum(1085, 105, 1105, 125)) Then

			MouseClick("left",  1098, 115)
			#Click on star to add to favorites si pas déjà liké (motif d étoile grise foncé)
			Sleep ( 1000 )
			Send("{ESCAPE 2}")
		 EndIf
	  EndIf
   MouseClick("left", 1310, 355)
#Click on 4th Profile in the 5 search results previews

Next
#Click n times on 4th Profile in the 5 search results previews
