PASSWORD = None		; To use Persistant logon, Detects Logon on screen at First Join and Server Restart. PASSWORD = None Disables funtionality ; Line 545 for longon process.
 						; Gui
SetBatchLines  , -1
GUI:
Gui, Margin , 0, 0
Gui, +Resize 
Gui, Font , s12 w10, Arial
Gui, Add, ListView, xm r20 w700 vMyListView gMyListView , T|P|C
Gui, Show, x100 y100 h600 w810 , Crazybobs Cops and Robbers
LOGFILE = %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP\chatlog.txt ;FileSelectFile, LOGFILE , , %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP\chatlog.txt
goto read

GuiClose:
ExitApp

GuiSize:
if A_EventInfo = 1
    return

GuiControl, Move, MyListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight )
return
MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(VAR1, A_EventInfo, 1)
    LV_GetText(VAR2, A_EventInfo, 2)
    LV_GetText(VAR3, A_EventInfo, 4)
        clipboard =  %VAR1% %VAR2% %VAR3%
}
return

						; Logfile Reader
read:								; Find line Count
Loop, Read, %LOGFILE%
{
	lastReadRow := A_Index  

}
top:								; Read Contents
Loop 25 				; WIPE the VARS
	{
	VAR%A_INDEX% = 
	}
Loop, Read, %LOGFILE%
{
   if (A_Index > lastReadRow)
   {
      IfInString, A_LoopReadLine, %word%
      {	
		if  A_LoopReadLine > 0
		{
			StringSplit, VAR, A_LoopReadLine, %A_Space%,	
			gosub phase
			PostMessage, 0x115 , 1, 1, SysListView321, ahk_class AutoHotkeyGUI, ,,
		}
	}

      lastReadRow := A_Index     
   }

   readRow := A_Index
   
}
if (readRow < lastReadRow)
{ 
   lastReadRow := 0

}
LV_ModifyCol() 						; Adjust Colums
sleep 100							; Slows downscipt to avoid high CPU usage

goto top

phase:								; Split String into VARS
Loop, Parse, line , %a_space%,
	{
			VAR%A_index% = %A_LoopField%
	}
StringLen, VAR2LEG, VAR2
VAR2LEG--
StringTrimLeft	, VAR2E, VAR2, %VAR2LEG%
StringTrimRight	, VAR2S, VAR2, %VAR2LEG%
StringTrimLeft , PLAYER , VAR2 , 1
StringTrimRight , PLAYER , PLAYER , 1

if VAR2S = <
{
	CHATTEXT = %VAR3% %VAR4% %VAR5% %VAR6% %VAR7% %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% %VAR15% %VAR16% %VAR17% %VAR18% %VAR19% %VAR20%
	LV_Add("", VAR1, PLAYER, CHATTEXT)
	LV_ModifyCol()
	PostMessage, 0x115 , 1, 1, SysListView321, ahk_class AutoHotkeyGUI, ,,
}

if VAR2S = *
{
	if VAR6 = Joined
	{
		CHATTEXT = %VAR5% %VAR6% %VAR7% %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% %VAR15% %VAR16% %VAR17% %VAR18% %VAR19% %VAR20%
		LV_Add("", VAR1, VAR3, CHATTEXT)
		LV_ModifyCol()
		PostMessage, 0x115 , 1, 1, SysListView321, ahk_class AutoHotkeyGUI, ,,
	}
	if VAR6 = Left
	{
		CHATTEXT = %VAR5% %VAR6% %VAR7% %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% %VAR15% %VAR16% %VAR17% %VAR18% %VAR19% %VAR20%
		LV_Add("", VAR1, VAR3, CHATTEXT)
		LV_ModifyCol()
		PostMessage, 0x115 , 1, 1, SysListView321, ahk_class AutoHotkeyGUI, ,,
	}
}

if VAR2 = Type						; Auto Logon and Lotto
{ 
	if VAR5 = {D6D631}/aoff
	{
		Gosub login
		Gosub LVADD
	}
	if VAR5 = /lotto
	{
		Gosub lotto
		Gosub LVADD
	}
}

if VAR2 = Congratulations.			; Congratulations.
{ 
	Gosub LVADD
}

if VAR2 = Fishing					; Abort Fishing
	if VAR3 = Canceled
		{
			gosub ROD
			gosub LVADD
		}
if VAR2 = You 						; Have Caught
	{
		if VAR3 = Are						; You Are Now Wearing Your Fishing Rod
			if VAR7 = Fishing
			{
				gosub LVADD
				gosub FISHING
			}
	if VAR5 = Toilet				
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Crab					
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Sunfish
		{
			gosub LVADD
			gosub FISHING
		}
	if VAR6 = Body.
		{
			Gosub LVADD
			gosub FISHING
		}	
		if VAR5 = Body
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Mermaid
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Used
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Seaweed.
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Weapon
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Jelly
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Drugs.
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Drug
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Old
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Car
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Money
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Clam
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR5 = Bonus
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR6 = Sunken
		{
			Gosub LVADD
			gosub FISHING
		}
	if VAR6 = Whale
		{
			Gosub LVADD
			gosub FISHING
		}
}



if VAR5 = Catch 					; Failed to Catch Anything
	{
		Gosub LVADD
		goto FISHING
	}
if VAR2 = {FAAC58}(FISH 			; Fishing message
	{
		Gosub LVADD
	}	
if VAR7 = Water. 					; Can only fish on Water.
	{
		Gosub ROD
		goto LVADD
	}
if VAR8 = Sea						; Sea Monster
	{
		Gosub LVADD
		goto FISHING
	}
if VAR3 = Were 						; Raped by Mermaid
	{
	if VAR4 Raped
		{
			Gosub LVADD
			goto takedrugs
		}
	}
if VAR3 = Caught 					; Fish Size Selection
	{
		if VAR6 = Pound
		{				
			if VAR7 = Amberjack.
				if VAR5 < 100
					gosub throwback
			if VAR7 = Grouper.
				if VAR5 < 100
					gosub throwback
			if VAR7 = Red
				if VAR5 < 50
					gosub throwback
			if VAR7 = Trout.
				if VAR5 < 100
					gosub throwback
			if VAR7 = BlueMarlin.
				if VAR5 < 500
					gosub throwback
			if VAR7 = Mackerel.
				if VAR5 < 50
					gosub throwback
			if VAR7 = Sea
				if VAR5 < 50
					gosub throwback
			if VAR7 = Pike.
				if VAR5 < 50
					gosub throwback
			if VAR7 = Sail
				if VAR5 < 100
					gosub throwback
			if VAR7 = Tuna.
				if VAR5 < 50
					gosub throwback
			if VAR7 = Eel.
				if VAR5 < 20
					gosub throwback
			if VAR7 = Dolphin.
				if VAR5 < 120
					gosub throwback
			if VAR7 = Shark.
				if VAR5 < 500
					gosub throwback
			if VAR7 = Turtle.
				if VAR5 < 100
					gosub throwback
			if VAR7 = Catfish.
				if VAR5 < 10
					gosub throwback
			if VAR7 = Swordfish.
				if VAR5 < 500
					gosub throwback
			if VAR7 = Squid.
				if VAR5 < 400
					gosub throwback
			if VAR7 = Barracuda.
				if VAR5 < 20
					gosub throwback
			if VAR7 = Piranha.
				if VAR5 < 5
					gosub throwback
			if VAR7 = Lobster.
				if VAR5 < 25
					gosub throwback
			if VAR7 = Cod.
				if VAR5 < 200
					gosub throwback
			if VAR7 = Sardine.
				if VAR5 < 1
					gosub throwback
			if VAR7 = Salmon.
				if VAR5 < 50
					gosub throwback
			if VAR7 = Shrimp.
				if VAR5 < 1
					gosub throwback
			if VAR7 = Sturgeon.
				if VAR5 < 800
					gosub throwback
			if VAR7 = Flounder.
				if VAR5 < 25
					gosub throwback
			if VAR7 = Haddock.
				if VAR5 < 10
					gosub throwback
			if VAR7 = Herring.
				if VAR5 < 10
					gosub throwback
			Gosub LVADD
			goto FISHING
			return
		}
	}
	
if VAR2 = Today's					; Bonus Car/Fish
	Goto LVADD
if VAR2 = The						; Genric Game Text
	Goto LVADD
if VAR2 = {FFFFFF}SA-MP				; Connection
		{
			Gosub LVADD
			return
		}	
if VAR2 = Connecting
		{
			Gosub LVADD
		}	
if VAR2 = Connected.
		{
			Gosub LVADD
		}	
if VAR2 = Connected
		{
			Gosub LVADD
		}	
if VAR2 = Welcome
		{
			Gosub LVADD
		}
if VAR2 = {FF0000}Warning!
		{
			Gosub LVADD
		}
if VAR2 = Server
		{
			Gosub LVADD
		}	
if VAR2 = Connected.
		{
			Gosub LVADD
		}	
if VAR2 = Logged
		{
			Gosub LVADD
		}	
if VAR2 = Data
		{
			Gosub LVADD
		}	
if VAR2 = {FF66FF}THIS
		{
			Gosub LVADD
		}	
if VAR2 = PlayerOfTheDay:
		{
			Gosub LVADD
		}	
if VAR2 = Your
		{
			Gosub LVADD
		}	
if VAR2 = Now
		{
			Gosub LVADD
		}	
if VAR2 = Committed
		{
			Gosub LVADD
		}	
if VAR2 = Player
		{
			Gosub LVADD
		}			
if VAR2 = Fishing...
		{			
			Gosub LVADD
		}	
if VAR2 = Jail
		{
			Gosub LVADD
		}
if VAR2 = Suspect
		{
			Gosub LVADD
		}
if VAR3 = Receive
		{
			Gosub LVADD
		}	
if VAR3 = Have 						; Jury Duty and PM
		{
	if VAR7 = Jury	; Jury Duty
		{					
			Gosub LVADD
			Gosub Jury
		}	
	if VAR3 = From 	; pm
		{
			Gosub LVADD
		}	
	if VAR3 = Sent	; pm
		{
			Gosub LVADD
		}	
	if VAR3 = Also
		{
			Gosub LVADD
		}		
	if VAR3 = Cannot
		{
			Gosub LVADD
		}			
	if VAR3 = Time:
		{
			Gosub LVADD
		}			
	if VAR3 = Failed
		{	
			gosub LVADD
			Gosub FISHING
		}
}
if VAR4 = Thrown
		{			
			Gosub LVADD
	}
if VAR4 = HAS
		{			
			Gosub LVADD
	}
if VAR4 = Died
		{
			Gosub LVADD
		}				
if VAR4 = Died.
		{
			Gosub LVADD
		}		
if VAR4 = Sell
		{
			Gosub LVADD
		}	
if VAR4 = Sold
		{
			Gosub LVADD
		}		
return

LVADD:										; Chatlog viewer
CHATTEXT = %VAR2% %VAR3% %VAR4% %VAR5% %VAR6% %VAR7% %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% %VAR15% %VAR16% %VAR17% %VAR18% %VAR19% %VAR20% %VAR18% %VAR19% %VAR20%
StringReplace, CHATTEXT, CHATTEXT, {EE5555} , , A
StringReplace, CHATTEXT, CHATTEXT, {0077FF} , , A
StringReplace, CHATTEXT, CHATTEXT, {FFFFFF} , , A
StringReplace, CHATTEXT, CHATTEXT, {00AAFF} , , A
StringReplace, CHATTEXT, CHATTEXT, {D6D631} , , A
StringReplace, CHATTEXT, CHATTEXT, {FF0000} , , A
StringReplace, CHATTEXT, CHATTEXT, {BDBDBD} , , A
StringReplace, CHATTEXT, CHATTEXT, {FF66FF} , , A
StringReplace, CHATTEXT, CHATTEXT, {8E5FE1} , , A
LV_Add("", VAR1, a_space , CHATTEXT)
LV_ModifyCol()
PostMessage, 0x115 , 1, 1, SysListView321, ahk_class AutoHotkeyGUI, ,,

return


						; Script Functions
CLEAN:								; Remove usless color information


return
					 


throwback:							; Throback Command

gosub CHATIN
GetKeyState, W, w , P
sendinput , t{END}{SHIFT DOWN}{HOME}{SHIFT UP}/throwback{enter}
if W = D
	sendinput , {W DOWN}
gosub CHATOUT
return

login:								; PERSITANT LOGIN (REPLACE %PASSWORD% with yours or define At Start of script)
if PASSWORD = None
	return
sleep 1000
	sendinput , %PASSWORD%{enter}		
	sleep 1000
	sendinput {shift down}
	sleep 1000
	sendinput {shift up}
	sleep 100
lotto:								; Random Lotto sector

gosub CHATIN
Random, lotto , 1, 125
sendinput t/lotto %lotto% {enter}
gosub CHATOUT
return

takedrugs:							; Mermaid protection

gosub CHATIN
SendInput t/td 5{enter}
gosub CHATOUT
return

jury:								; Everyone is innonect or guitly you decide

gosub CHATIN
SendInput t/jury{enter}
SendInput t2{enter}
gosub CHATOUT
return

FISHING:							; Fishing Command

sleep 2000
FISH:
if CHAT = 1
	gosub CHATIN
SendInput t/fish{enter}
if CHAT = 1
	gosub CHATOUT
return


CHATIN:								; Input stage of Chatbox Fix (fishing while chatbox open without deleting your text or spamming in chat thread)

if CHAT = 1
	SendInput ^A^X{ENTER}
return

CHATOUT:							; Output Stage of Chatbox Fix

if CHAT = 1
	SendInput t^V
return

ROD:								; Putaway/takeoout fishing rod
								
if CHAT = 1
	gosub CHATIN
SendInput t/rod{enter}
if CHAT = 1
	gosub CHATOUT
return


						; Keybinds
$^PGUP::
PostMessage, 0x115 , 2, , SysListView321, ahk_class AutoHotkeyGUI, ,,
return
$^PGDN::
PostMessage, 0x115 , 1, , SysListView321, ahk_class AutoHotkeyGUI, , ,
return
$^F1::
FileSelectFile, LOGFILE , , %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP\chatlog.txt
goto read
$t::
SendInput t
CHAT = 1
return
$ENTER::
SendInput {ENTER}
CHAT = 0
return
