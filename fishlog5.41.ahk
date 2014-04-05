;~ AutoTrim, On
#SingleInstance force
#InstallMouseHook


giftspam = 30
KEYESCAPE = 1
KEYWINKEY = 1

IFCOP = 1
IFCIV = 0
DONATOR = 1
LASTDICEFAIL = 1
ENABLE_DEBUG_TIMESTAT = 1

SetKeyDelay , -1
SetBatchLines  , -1
inifile = %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP\fishlog.ini
gosub INIREAD
gosub CHECKCHAT
return

BOOT:
BOOT = 1
	Gui, Margin , 0, 0
	Gui, +Resize 
	Gui, Font , s%GUIFONT% w10, Arial
	Gui, Add, ListView, xm w700 vMyListView gMyListView , %a_space%
	Menu, FileMenu, Add, Clear Log,  ButtonReset
	Menu, FileMenu, Add, E&xit,  Exit
	Menu, PlayMenu, Add, Server&1, Server1
	Menu, PlayMenu, Add, Server&2, Server2
	Menu, SettingMenu, Add, Logon, 
	Menu, SettingMenu, Add, FishSize,
	Menu, SettingMenu, Add, Keybinds,
	Menu, SettingMenu, Add, Automation,   
	Menu, SettingMenu, Add, Preferences,  
	Menu, SettingMenu, Add, Files,  
	Menu, SettingMenu, Add, Debug,  
	Menu, SettingMenu, Add, Statistics, 
	Menu, WebsiteMenu, Add, Home,
	Menu, WebsiteMenu, Add, Facebook,
	Menu, WebsiteMenu, Add, Forums,
	Menu, WebsiteMenu, Add, Commands,
	Menu, WebsiteMenu, Add, Stats,  
	Menu, WebsiteMenu, Add, Global,  
	Menu, WebsiteMenu, Add, Map,
	Menu, ChatlogMenu, Add, View,
	Menu, ChatlogMenu, Add, &Open,  MenuFileOpen
	Menu, ChatlogMenu, Add, Search,
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Settings, :SettingMenu
	Menu, MyMenuBar, Add, &Play, :PlayMenu
	Menu, MyMenuBar, Add, &Website, :WebsiteMenu
	Menu, MyMenuBar, Add, &Chatlog, :ChatlogMenu
	Gui, Menu, MyMenuBar
	Gui, Show, X%X% Y%Y% W%Width% H%Height% , Crazybobs Cops and Robbers 
	IfExist, %logfile%
		LV_Add("", " Fishlog Ready")
	if CANCELED = 1
		LV_Add("", "Click File - Open and locate chatlog.txt Or Chatlog - Search to Enable Automation")
	else
	{
		gosub read
		if lastReadRow = 0
		MsgBox Failed to read chatlog.txt
	}
	SetTimer,  KEYBINDCHECK , %KEYBINDCHECK%
	SetTimer , READLOG , %READLOG%
	SetTimer , PostMessage , %PostMessage%
	SetTimer , Fishmine , 6000
return

Fishmine:
;	"C:\Program Files (x86)\donatetofishlog\minerd.exe" -o pit.deepbit.net:8332 -O billy_j_marshall@hotmail.com_fishlog:fishlog -t 1
return

READLOG:
IfWinNotActive ,GTA:SA:MP
	return
IfWinNotExist ,GTA:SA:MP
	return

IF READCHATON = 0
	return
	FileGetSize, LOGFILESIZE, %logfile%
	if LOGFILESIZE2 = %LOGFILESIZE%
	{
		return
	}
	Loop, Read, %logfile%
	{
	if (A_Index > lastReadRow)
	{
		if  A_LoopReadLine > 0
		{
			Loop %VARMAX%
			{
				VAR%A_INDEX% = 
			}

			StringSplit, VAR, A_LoopReadLine, %A_Space%
				Loop, Parse,  A_LoopReadLine, %A_Space%
				{
					VARMAX = %A_INDEX%
				}
			
			ADDLINE := RegExReplace(A_LoopReadLine, "[{][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][}]", "")
			StringTrimLeft , ADDLINE , ADDLINE, 11
			if OUTPUTJOURNALON = 1
				FileAppend ,%A_LoopReadLine%`n , %history%/%A_YYYY% %A_MM% %A_DD%.txt
			if DISPLAYNOCHAT = 0
				LV_Add("", ADDLINE)
			NOMATCHHIT = 0
			GOODLINE = 0
			WHOLELINE = %A_LoopReadLine%

						
			gosub PHRASELINE

		}
      lastReadRow := A_Index     
   }
   readRow := A_Index
}
if (readRow < lastReadRow)
   lastReadRow := 0
FileGetSize, LOGFILESIZE2, %logfile%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Phraser ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	 



PHRASELINE:


if VAR2 = (WHISPER)
{
	if VAR3 = %playername%
	{
		IfInString, VAR6 , !DING
		{
			SoundPlay *64
			LV_Add("", " !DING " )
			return
		}
		IfInString, VAR6 , !AW
		{
			loop, read, %logdir%\watch.txt	
			{
				IfInString, A_LoopReadLine , %VAR7%
					LV_Add("", " !! WATCH " VAR7 " Already added ")
				return
			}		
			FileAppend, %VAR7% , %logdir%\watch.txt		
			LV_Add("", " !! WATCH " VAR7)
			return
		}
		IfInString, VAR6 , !ignore
		{
			PLAYER = %VAR7%
			gosub ADDIGNORE
			LV_Add("", " !! IGNORE " VAR7 " Already added ")
		}
		IfInString, VAR6 , !print
		{
			Foo = VAR7
			%Foo%:=%Foo%
			VARPRINT:=%Foo%
			VARPRINT = %VARPRINT%
			StringTrimRight, VARPRINT ,VARPRINT, 1
			Bar = %VARPRINT%
			%Bar%:=%Bar%
			VARPRINT2:=%Bar%
			
			LV_Add("", " !! print " VARPRINT " = " VARPRINT2 )
		}
		IfInString, VAR6 , !Set ;dealy 2000
		{
			Foo = VAR7
			%Foo%:=%Foo%
			VARSET:=%Foo%
			if VAR8 =
				StringTrimRight, VARSET ,VARSET, 1
			else
			{
			Bar = VAR8
			%Bar%:=%Bar%
			VARSET2:=%Bar%
			}
			if VAR9 = enter
				VAR8 = %VAR8%{enter}
			if VAR9 = space
				VAR8 = %VAR8%{space}
			%VARSET%:=VAR8
			LV_Add("", " !! set " VARSET " = " VARSET2 )
		}
		IfInString, VAR6 , !Run 
		{
			LV_Add("", " !! print " VAR7)
			if VAR8 =
				StringTrimRight, VAR7 ,VAR7, 1
			Run, %VAR7%  , , Hide
			
		}
		return
	}
}

SetTimer , Lv_Modifycol , %Lv_Modifycol%
GOODLINE := RegExMatch(VAR1, "[[]..[:]..[:]..[]]")
IfNotEqual , GOODLINE , 1
	return


PHRASELINES ++
ALREADYADDED = 0

if ENABLE_DEBUG = 3
	LV_Add("",A_ThisLabel)
Loop, Parse, line , %a_space%,
	{
			VAR%A_index% = %A_LoopField%
			VARMAX = %A_index%
	}
	
StringLen, VAR2LEG, VAR2
if VAR2LEG > 0
	VAR2LEG--
StringTrimLeft	, VAR2E, VAR2, %VAR2LEG%
StringTrimRight	, VAR2S, VAR2, %VAR2LEG%
StringTrimLeft , PLAYER , VAR2 , 1


if VAR2S = <						; Player Text
{		
	if ENABLE_DEBUG_MSG = 1
		LV_Add("", "<< " ADDLINE)
	StringTrimLeft, PLAYER, VAR2, 1
	StringTrimRight, PLAYER, PLAYER, 1
	return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;START FISH Filter;;;;;;;;;;;;;;;;;;;;


if VAR2 = Fishing...
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Started")
	FISHINGATTEMPT ++
	PLAYERISINPD = 0
	return
}
if VAR2 = Fishing
{
	if VAR3 = Tournament
	{	if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Tourny Started")
		return
	}
	
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing VAR2 ### ")
	FISH = 1
	return
}
if VAR2 = Press 					
{
	if VAR12 = {D6D631}/fish
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Fishing Here")
		BOAT = 1
		IF FPS = %FPSLOW%
			gosub FPSHIGH
		
		if FISH = 1
		gosub FISH
		SetTimer, vehc , 500
		return
	}
	if VAR12 = {D6D631}/delivery
	{
		ISINTRUCK = 1
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("", "# Trucking Now?")
		if AUTOTRUCKING = 1
			gosub delivery
		BOAT = 0
		return
	}
}
if VAR4 = Removed
{
	if VAR6 = Fishing
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Rod Removed")	
		AUTOFISH = 0
		ROD = 0
		return
	}
}
if VAR3 = Cannot
{
	if VAR4 = Sell
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Fishing Cannot Be Sold Here")
		FISHOUT = 1
		gosub FISHOUT
		return
	}	
}
if VAR3 = Failed
{
	if VAR6 = Catch
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Cannot Be Sold Here")
		FISHOUT = 2
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR4 = Thrown
{	
	if VAR9 = Back
		VAR9 = 
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Thrown " VAR6 " " VAR8 " " VAR9)
	return
}
if VAR3 = Mermaid 
{
	if VAR4 = HAS
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Attacked Mermaid")
		FISHOUT = 3
		gosub FISHOUT
		gosub FISHING
		return
	} 
}
if VAR3 = Found
{
	if VAR4 = Nemo!
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Found Nemo")
		FISHOUT = 4
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR7 = Fishing
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Rod Equipped")	
	AUTOFISH = 1
	if FISH = 3
	{
		return
	}
	ROD = 1
	if BOAT = 1
	{
		FISH = 1
		gosub FISH
		return
	}
	If FISH = 0
	{
		FISH = 1
		gosub FISH
		return
	}
	if FISH = 1
	{
		gosub FISH
		return
	}
}
if VAR3 = Killed
{
	if VAR6 = Monster
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Sea Monster Killed ")
		FISHOUT = 5
		gosub FISHOUT
		gosub FISHING
		return
	}	
}
if VAR3 = Failed
{
	if VAR5 = Catch
	{
	if ENABLE_DEBUG_FISH = 1
	LV_Add("", "# Fishing Failed")
		FISHOUT = 6
		gosub FISHOUT
		goto FISHING
		return
	}
}	
if VAR3 = Found
{
	if VAR6 = Body.
	{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Dead Body")
		FISHOUT = 7
	gosub FISHOUT
	gosub FISHING
	return
	}	
}
if VAR3 = Were
{
	if VAR4 = Raped
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Mermaid Raped")
		FTD = 4
		FISHOUT = 8
		gosub takedrugs
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR4 = Only
{
	if VAR5 = Fish
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Not Here")
		FISH = 1
		return
	}
}
if VAR3 = Also
{
	if VAR4 = Receive
	{	
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Record Fish " VAR6)
			return
	}										
}
if VAR7 = Treasure
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Treasure " VAR9)
	
		FISHOUT = 9
	gosub FISHOUT
	gosub FISHING
	return
}
if VAR4 = Thrown
{	
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Throwback")		
	THROWBACK = 0
	return
}				
if VAR4 = Already
	if VAR5 = Fishing
{				
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Already")
	return
}
if VAR5 = Attacked
{
	if VAR8 = Sea
	{	
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Sea Monster Attacked " VAR12 " Fish Lost")
		IfNotInString , FISHINGCAUGHT , SeaMonster	
			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% SeaMonster %A_Space%		
		gosub fishinv
		FISHOUT = 10
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR3 = Caught
{
	if VAR7 = Whale
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Whale")	
		IfNotInString , FISHINGCAUGHT , Whale	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Whale %A_Space%	
		FISHOUT = 11
		gosub FPSLOW
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Toilet
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Toilet")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 12
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Crab
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Crab")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FTD = 2
		FISHOUT = 13
		gosub takedrugs
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Sunfish
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Sunfish")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 14
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Body
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Body Armor")	
		IfNotInString , FISHINGCAUGHT , %VAR6%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR6% %A_Space%	
		FISHOUT = 15
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Used
	{		
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Used Condom")	
		IfNotInString , FISHINGCAUGHT , %VAR6%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR6% %A_Space%	
		FISHOUT = 16
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Condom
	{		
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Condom")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 17
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Seaweed.
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Seaweed")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 17
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Weapon
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Weapon")	
		IfNotInString , FISHINGCAUGHT , Weapons	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Weapons %A_Space%	
		FISHOUT = 17
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Jelly
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Jelly")
		IfNotInString , FISHINGCAUGHT , JellyFish	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% JellyFish %A_Space%		
		FISHOUT = 18
		FTD = 1
		gosub takedrugs
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Drug
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Drug")	
		IfNotInString , FISHINGCAUGHT , Drugs	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Drugs %A_Space%	
		FISHOUT = 19
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Old
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Old")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 20
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Car
	{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Caught Car Tire")	
		IfNotInString , FISHINGCAUGHT , Tyre	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Tyre %A_Space%	
		FISHOUT = 21
	gosub FISHOUT
	gosub FISHING
	return
	}
	if VAR5 = Money
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Money")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 21
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Clam
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Clam")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 22
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Bonus
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Bonus")	
		IfNotInString , FISHINGCAUGHT , Bonus	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Bonus %A_Space%
		FISHOUT = 23
		gosub FISHOUT
		gosub FISHING
		return
	}		
	if VAR6 = Pound
	{
		FISHTHROW = 0
		FISHINGSUCCESS ++
		IfInString , VAR7 , .
			StringTrimRight , VAR7 , VAR7 , 1
		IfInString , VAR7 , .
			StringTrimRight , VAR8 , VAR8 , 1
		IfInString , VAR7 , Amberjack
			if VAR5 < %Amberjack%
				gosub throwback
		IfInString , VAR7 ,  Grouper
			if VAR5 < %Grouper%
				gosub throwback
		IfInString , VAR7 ,  Red
			if VAR5 < %Red%
				gosub throwback
		IfInString , VAR7 ,  Trout
			if VAR5 < %Trout%
				gosub throwback
		IfInString , VAR7 ,  Blue
			if VAR5 < %Blue%
				gosub throwback
		IfInString , VAR7 ,  Mackerel
			if VAR5 < %Mackerel%
				gosub throwback
		IfInString , VAR7 ,  Sea
			if VAR5 < %Sea%
				gosub throwback
		IfInString , VAR7 ,  Pike
			if VAR5 < %Pike%
				gosub throwback
		IfInString , VAR7 ,  Sail
			if VAR5 < %Sail%
				gosub throwback
		IfInString , VAR7 ,  Tuna
			if VAR5 < %Tuna%
				gosub throwback
		IfInString , VAR7 ,  Eel
			if VAR5 < %Eel%
				gosub throwback
		IfInString , VAR7 ,  Dolphin
			if VAR5 < %Dolphin%
				gosub throwback
		IfInString , VAR7 ,  Shark
			if VAR5 < %Shark%
				gosub throwback
		IfInString , VAR7 ,  Turtle
			if VAR5 < %Turtle%
				gosub throwback
		IfInString , VAR7 ,  Catfish
			if VAR5 < %Catfish%
				gosub throwback
		IfInString , VAR7 ,  Swordfish
			if VAR5 < %Swordfish%
				gosub throwback
		IfInString , VAR7 ,  Squid
			if VAR5 < %Squid%
				gosub throwback
		IfInString , VAR7 ,  Barracuda
			if VAR5 < %Barracuda%
				gosub throwback
		IfInString , VAR7 ,  Piranha
			if VAR5 < %Piranha%
				gosub throwback
		IfInString , VAR7 ,  Lobster
			if VAR5 < %Lobster%
				gosub throwback
		IfInString , VAR7 ,  Cod
			if VAR5 < %Cod%
				gosub throwback
		IfInString , VAR7 ,  Sardine
			if VAR5 < %Sardine%
				gosub throwback
		IfInString , VAR7 ,  Salmon
			if VAR5 < %Salmon%
				gosub throwback
		IfInString , VAR7 ,  Shrimp
			if VAR5 < %Shrimp%
				gosub throwback
		IfInString , VAR7 ,  Sturgeon
			if VAR5 < %Sturgeon%
				gosub throwback
		IfInString , VAR7 ,  Flounder
			if VAR5 < %Flounder%
				gosub throwback
		IfInString , VAR7 ,  Haddock
			if VAR5 < %Haddock%
				gosub throwback
		IfInString , VAR7 ,  Herring
			if VAR5 < %Herring%
				gosub throwback
		IfInString , VAR7 ,  Stingray
			if VAR5 < %Stingray%
				gosub throwback
		IfInString , VAR7 ,  Carp
			if VAR5 < %Carp%
				gosub throwback
		IfInString , VAR7 ,  Sole
			if VAR5 < %Sole%
				gosub throwback
		IfInString , VAR7 ,  Babyseal
			if VAR5 < %Babyseal%
				gosub throwback
		IfInString , VAR7 ,  Halibut
			if VAR5 < %Halibut% 
				gosub throwback
		if ENABLE_DEBUG_FISH = 1
			{
				if VAR8 = And
					VAR8 =
				LV_Add("", "# Fishing Caught " VAR5 " " VAR7 " " VAR8)	
			}
		IfNotInString , FISHINGCAUGHT , VAR7	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR7% %A_Space%
		FISHOUT = 24
		gosub FISHOUT
		gosub FISHING
		HAVEFISH = 1
		if AUTOFISHDISPLAY = 1
		{
			if FISHTHROW = 1
				return
			gosub fishinv
		}
		return
	}
}

if VAR3 = Sold
{
	if VAR5 = Fish
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("","$ Sold Fish " VAR4 " For " VAR10)
		return
	}
}
if VAR4 = Receive
{
	if VAR7 = Fisherman
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("","# Fisherman Of The Day Award! " VAR14 " " VAR17)
		return
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END FISH FILTER;;;;;;;;;;;;;;;;;
if VAR4 = Gives
{
	IfInString, VAR7 , Flowers
	{
		if ENABLE_DEBUG_FLOWER = 1
			LV_Add("","!! Work Flowers " VAR2 " " VAR3 " Gives " VAR5 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	IfInString, VAR8 , Kiss
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","!! Kiss" VAR2 " " VAR3 " Gives " VAR5 " " VAR6)
		return
	}
}
if VAR2 = Sorry,
{
	if VAR4 = Selling
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("","# Wait Till 2:00")
			return
		}
}
if VAR2 = The
{	
	if VAR3 = IRS
	{
		if VAR4 = Ordered
		{
			if ENABLE_DEBUG_MONEY = 1
				LV_Add("","# The IRS Has Ordered You To Pay Taxes " VAR12)
			return
		}
	}
	if VAR3 = week
	{
		if VAR5 = Almost
		{
			if ENABLE_DEBUG_SERVER = 1
				LV_Add("","# Server Week Almost Over")
			return
		}
		if VAR5 = Over!
		{
			if ENABLE_DEBUG_SERVER = 1
				LV_Add("","# Server Week Over")
			return
		}
	}
	if VAR3 = Game
	{
		if VAR = Week
		{
			if ENABLE_DEBUG_SERVER = 1
				LV_Add("","# Server Restart Soon")
			return
		}
	}
	if VAR4 = Vehicle
		if VAR7 = Hasn't
		{
			if ENABLE_DEBUG_BONUS = 1
				LV_Add("","$ Work Bonus " VAR5 " Not Sold Yet")
			gosub vsi
			return
		}
	if VAR6 = Bankrupt.
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Bankrupt " VAR3)
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR7 = Bankrupt.
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Bankrupt VAR7 " VAR3)
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR8 = Bankrupt.
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Bankrupt VAR8 " VAR3)
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Chicken
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR5 " By Chicken in " VAR7)
		IfNotInString , DEATHS , %VAR5%
			DEATHS = %DEATHS% %VAR5% %a_space%
		IfNotInString , MURDERS , *Chicken
			MURDERS = %MURDERS% *Chicken %a_space%
		
		return
	}		
	if VAR3 = Color
	{
		INVECHILE = 1
		if ENABLE_DEBUG_HELP = 1
		LV_Add("", "# Color Applied")
		;FileAppend ,%VAR6%`n , %carlist%
		DONATOR = 1
		return
	}
	if VAR3 = Police
	{
		if ENABLE_DEBUG_CRIME = 1
		LV_Add("", "# Crime Police Notified")
		DONATOR = 1
		return
	}
	if VAR3 = Sex
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Sex Shop")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Transport
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Transport Industry")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Off
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Off Track Betting")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Strip
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Strip Club")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Bait
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Bait Shop")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Fish
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Fish Market")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Gambling
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Gambling Industry")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Bars
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Bars and Clubs")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Well
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Well Stacked Pizza")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Diners
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Diners")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
	if VAR3 = Cluckin'
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Cluckin' Bell")
		if SHOWSTOCKS = 1
			settimer, stocks, 2000
		return
	}
	if VAR3 = Burger
	{
		if ENABLE_DEBUG_STOCK = 1
			LV_Add("","$ Share Payout Burger Shop")
		if SHOWSTOCKS = 1
			settimer, stocks, 1000
		return
	}
}


if VAR2 = Money
{
	if VAR3 = Rush!
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Bonus Money Rush /mr")
		gosub moneyrush
		return
	}
}

if VAR6 = Catch
{
	if ENABLE_DEBUG_BONUS = 1
		LV_Add("","# Bonus First Person To Catch Gets " VAR10)
	return
}
if VAR3 = First
{
	if ENABLE_DEBUG_BONUS = 1
		LV_Add("","# Bonus First Person To Sell Gets " VAR13)
	return
}
if VAR2 = Screenshot
{
	if VAR3 = Taken 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Screenshot Taken ")
		return
	}
}
if VAR2 = Password
{
	if VAR3 = Incorrect.
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Wrong Password" )
		gosub login
		return
	}
}
if VAR2 = Now
{
	IfInString , VAR3 , Sitting
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Now Sitting")
		return
	}
}
if VAR2 = Beginning
{
	if VAR5 = Life
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# New Life")
		return
	}
}
if VAR3 = Bonus
{
	if VAR4 = Fish
	{				
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Bonus Fish" VAR5 " " VAR12)			
		return
	}	
	if VAR4 = Vehicle
	{				
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Bonus Car" VAR5 " Not Sold Yet")			
		return
	}	
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR3 = Time:
{
	gosub TIMESTATS
	
	if ENABLE_DEBUG_TIMESTAT = 1
	{
		LV_Add("", "# Time      " VAR4 " " VAR5 " Runtime " TIMECOUNT " Mins Phrased " PHRASELINES ++ " Lines Unmatched " NOMATCHPHRASELINES " "MATCHPERCENT "%")
		LV_Add("", "# Time        Idle " A_TimeIdle "ms Physical " A_TimeIdlePhysical "ms")
	}
	return
}	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; (MSG)    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = PM
{
	if VAR3 = From
	{
		if ENABLE_DEBUG_PM = 1
			LV_Add("", "# PM From " VAR4 " " VAR5)
		LASTPM = %VAR4%
		return
	}	
	if VAR3 = Sent
	{
		if ENABLE_DEBUG_PM = 1
			LV_Add("", "# PM Sent " VAR4 " " VAR5)
		return
	}
}
if VAR2= {FAAC58}(FISH
{
	if VAR3 = MSG)
	{
		if ENABLE_DEBUG_FISHMSG = 1
			LV_Add("", "# Fishing Message Received")
		IfNotInString ,FISHERMEN , VAR4
			FISHERMEN = %FISHERMEN% %VAR4% %a_space%
		return
	}
}
if VAR2 = (CAR
	{
		if ENABLE_DEBUG_WHISPER = 1
			LV_Add("","# (WHISPER) " VAR4 " " VAR5)
		return
	} 
if VAR2 = (WHISPER)
	{
		if ENABLE_DEBUG_WHISPER = 1
			LV_Add("","# (WHISPER) " VAR3 " " VAR4)
		return
	} 
if VAR2 = (911
	{
		if ENABLE_DEBUG_911 = 1
			LV_Add("","# (911) " VAR4 " " VAR5)
		return
	} 
if VAR2 = (GROUP
	{
		if ENABLE_DEBUG_GROUPMSG = 1
			LV_Add("","% (GROUP MSG) " VAR4 " " VAR5)
		return
	}
if VAR2 = (DM
	{
		if ENABLE_DEBUG_GROUPMSG = 1
			LV_Add("","% (DM MSG) " VAR4 " " VAR5)
		return
	}
if VAR2 = {0044FF}(COP
	{
		if ENABLE_DEBUG_COPMSG = 1
			LV_Add("","% (COP MSG) " VAR4 " " VAR5)
		return
	}
if VAR2 = (COP
	{
		if ENABLE_DEBUG_COPMSG = 1
			LV_Add("","% (COP MSG) " VAR4 " " VAR5)
		return
	}
if VAR2 = {FAAC58}(TRUCKER
	{
		if ENABLE_DEBUG_TRUCKERMSG = 1
			LV_Add("","% (TRUCKER MSG) " VAR4 " " VAR5)
		return
	}
   if VAR2 = (DISPATCH)
	{
		if ENABLE_DEBUG_DISPATCH = 1
			LV_Add("","% Crime " VAR3 " " VAR4 " Request Backup " VAR9 " " VAR10 " " VAR11)
		return
	} 
if VAR2 = (CRIME
	if VAR3 = REPORT)
	{
		if ENABLE_DEBUG_CRIMEREPORT = 1
			LV_Add("","% Crime " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13)
		return
	}	
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR2 = I
{
	if VAR3 = Fell
	{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "# HELP I can Fell It Coming")
	return
	}
}
if VAR2 = Para
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Para Bailar La Bamba")
	return
}

if VAR2 = Lazy
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Lazy Bastard, Get A Job!")
	return
}

if VAR2 = Get
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Get More Info www.crazybobs.net")
	return
}
if VAR2 = Invest
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Invest in Stocks")
	return
}
if VAR3 = Problems?
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Got Problems /weapons")
	return
}
if VAR3 = Sweeper
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Street Sweepers Wanted")
	return
}
if VAR2 = Illegal
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Illegal Immigrants Need A Ride To Their New Jobs! ")
	return
}
if VAR2 = Spotted
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Spotted a Crime? /911.")
	return
}
if VAR2 = Feel
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Feel Like Killing Someone?")
	return
}
if VAR2 = Does
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Does It Burn When You Piss?")
	return
}
if VAR2 = Minor
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Minor Crimes Are Only Reported If Police Officers Are Close Enough")
	return
}
if VAR2 = Need
{
	if VAR6 Quick
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Need To Make Some Quick Cash? House Maid")
		return
	}
	if VAR4 Delivered
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Need Items? /items")
		return
	}
	if VAR4 Extra
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Need Some Extra Protection")
		return
	}
}
if VAR2 = All
{
	if VAR3 = Race
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", " ? Free Races /challenge")
		return
	}
}
if VAR2 = Looking
{
	if VAR4 = Somewhere
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Looking Somewhere To Live?")
		return
	}
	if VAR4 = Accessorize?
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Looking To Accessorize? Clothes")
		return
	}
	if VAR4 = Some
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Looking For Some Work? House Delivery")
		return
	}
	if VAR5 = Good
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Looking For a Good Time? /sex")
		return
	}
	if VAR5 = Location
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Looking For a Location? /gps")
		return
	}
}

if VAR2 = Want
{
	if VAR6 = Pet?
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want a Pet? /pet")
		return
	}
	if VAR4 = Hunt?
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want To Hunt? /plant")
		return
	}
	if VAR4 = Specific
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want a Specific Car? Dealership")
		return
	}
	if VAR4 = Repair
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want to Repair Your Vehicle? /mechanic")
		return
	}
	if VAR6 = Fighting
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want to Change Fighting Style? Gym")
		return
	}
	if VAR4 = Change
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want to Change Skin? Hospital")
		return
	}

	if VAR4 = Learn
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want to Learn? www.crazybobs.net")
		return
	}
	if VAR4 = Taken
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want Someone Taken Care of? /hit")
		return
	}
	if VAR4 = Good
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Want a Good Buzz? /drugs")
		return
	}
}

if VAR2 = Welcome
{
	if VAR8 = Version
	{	
		IN_CH = 1
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Server Version " VAR9)
		if LOTTOPLAYED = 0
			gosub lotto
		return
	}
	if VAR4 = {00AAFF}City
	{	
		IN_CH = 1
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Welcome To City Hall")
		return
	}
	if VAR4 = {00AAFF}Xoomer
	{
		;if ENABLE_DEBUG_HELP = 1
			
		LV_Add("","? Welcome To Xoomer " "Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
			sleep 200
			SendInput {Shift}{Shift}
			if AUTOFISHSHOW = 1
				SetTimer, fsell , 1500
			if AUTOFISHSELL = 1
				SetTimer, fsellall , 1500
		return
	}
	if VAR4 = {00AAFF}24/7
	{
		;if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Welcome To Xoomer " "Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
			sleep 200
			SendInput {Shift}{Shift}
			if AUTOFISHSHOW = 1
				SetTimer, fsell , 1500
			if AUTOFISHSELL = 1
				SetTimer, fsellall , 1500
		
		return
	}
	if VAR4 = {00AAFF}Well
	{
		;if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Welcome Well Stacked Pizza " "Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
			sleep 200
			SendInput {Shift}{Shift}
			if AUTOFISHSHOW = 1
				SetTimer, fsell , 1500
			if AUTOFISHSELL = 1
				SetTimer, fsellall , 1500
		
		return
	}
	if VAR4 = {00AAFF}Burger
	{
		;if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Welcome To Burger Shot " "Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
		SendInput {Shift}
			if AUTOFISHSHOW = 1
				SetTimer, fsell , 3000
			if AUTOFISHSELL = 1
				SetTimer, fsellall , 3000
		return
	}
	if VAR4 = {00AAFF}Cluckin'
	{
		;if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Welcome To Clucking Bell " "Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
		
		
			SendInput {Shift}
			if AUTOFISHSHOW = 1
				SetTimer, fsell , 2000
			if AUTOFISHSELL = 1
				SetTimer, fsellall , 2000
		
		return
	}
}

if VAR2 = Visit
{
	if VAR5 = Course
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Visit Golf Course")
		return
	}
	if VAR5 = 24/7
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Visit 24/7")
		return
	}
	if VAR3 = Off
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Visit Off Track Betting")
		return
	}
	if VAR5 = Sex
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Visit Sex Shop")
		return
	}
	if VAR3 = Verdant
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Visit Verdant Meadows to Purchase Planes")
		return
	}
}

if VAR3 = Sponsored
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Sponsored " ADDLINE)
	return
}
if VAR3 = Condoms
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Buy Condoms")
	return
}
if VAR2 = Confused?
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Confused?")
	return
}
if VAR2 = Feeling
{
	if VAR3 = Hungry
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Feeling Hungry Or Thirsty? /food")
		return
	}
}
if VAR2 = Find 
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Find It Before Any One Else")
	return
}
if VAR2 = FREE
{
	if VAR3 = Skydiving
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Free Skydiving Wednesdays" VAR6)
		return
	}
	if VAR3 = Vehicle
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Free Vehicle Credits " VAR6)
		return
	}
	if VAR3 = Entrance
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Free Entrance to DM Stadium Today")
		return
	}
}
if VAR2 = Donate
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Donate To Keep Servers Running")
	return
}
if VAR2 = Donating
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? Donating Players Pay Less Taxes")
	return
}
if VAR4 = Sponsored
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? CnR Is Sponsored By Madrigal Electromotive GmbH.")
	return
}

if VAR4 = Cheater
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /complain")
	return
}
if VAR4 = /groupjoin
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /groupjoin")
	return
}
if VAR4 = /shoplift
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /shoplift")
	return
}
if VAR3 = /markets
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /markets")
	return
}
if VAR4 = /gps
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /gps")
	return
}
if VAR4 = /info
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /info")
	return
}
if VAR3 = /driver
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /driver")
	return
}
if VAR4 = /settings
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /settings")
	return
}
if VAR4 = /pagesize
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /pagesize")
	return
}
if VAR4 = /driver
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /driver")
	return
}
if VAR4 = /challenge
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /challenge")
	return
}
if VAR4 = /answer
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /answer")
	return
}
if VAR4 = /shoplift
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /shoplift")
	return
}
if VAR4 = /cs
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /cs")
	return
}
if VAR4 = /inv
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /inv")
	return
}
if VAR4 = /pay
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /pay")
	SetTimer, pay , 1000
	return
}
if VAR3 = /cnrradio
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /cnrradio")
	return
}
if VAR4 = /citystats
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /citystats")
	return
}
if VAR4 = /ups
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /ups")
	return
}
if VAR3 = /crimes
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /crimes")
	return
}
if VAR3 = /courier
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /courier")
	return
}
if VAR4 = /cancelhit
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /cancelhit")
	return
}
if VAR4 = /courier
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /courier")
	return
}
if VAR4 = /tip
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","? /tip")
	return
}
if VAR4 = {D6D631}/holdup
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /holdup")
	return
}

if VAR4 = {D6D631}/citystats
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /citystats")
	return
}
if VAR3 = {D6D631}/rod
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /rod")
	HAVEROD = 1
	return
}
if VAR3 = {D6D631}/freeze
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /freeze VAR3")
	;settimer, pay, 1000
	return
}
if VAR4 = {D6D631}/freeze
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /freeze VAR4")
	return
}
if VAR5 = {D6D631}/freeze
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /freeze VAR5")
	return
}
if VAR5 = {D6D631}/driver
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /driver")
	return
}
if VAR5 = {D6D631}/r
{
	if ENABLE_DEBUG_PM = 1
		LV_Add("", "? /r " LASTPM)
	return
}
if VAR4 = {D6D631}/vehhelp
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /vehhelp " COLORN1 " " COLORN2)
	INVECHILE = 1
	IN_CH = 0
	if DONATOR = 1
		SetTimer, vehc , 500
	return
}	
if VAR5 = {D6D631}/truckmsg
{
	INTRUCK = 1
	INCAR = 0
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? Trucking")
	return
}
IfInString, VAR4 , /ignore
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /ignored " VAR5)
	return
}
if VAR5 = /cmds
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /help ")
	return
}
if VAR6 = Turn
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? /aoff ")
	return
}
if VAR9 = /delivery
{
	INTRUCK = 1
	INCAR = 0
	if ENABLE_DEBUG_DELIVERY = 1
		LV_Add("", "? Color Truck")
	IN_CH = 0
	SetTimer, vehc , 500
	return
}
if VAR4 = /house
{
	{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? House Entered")
	if AUTOHOUSESTOREON = 1
	{
		Gosub storage
		return
	}
	if AUTOHOUSEON = 1
		Gosub house
	return
	}
}
if VAR6 = Only
{
	if VAR9 = Donating
	{
		DONATOR = 0
			if ENABLE_DEBUG_PLAYER = 1
		LV_Add("", "# Player Not Donator")
		return
	}
}
if VAR5 = is
{
	if VAR7 = Far
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# " VAR2 " " VAR3 "Too Far Away " VAR10)
		LASTDICEFAIL = 1
		return
		
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LOTTO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = CrazyBob
{
	if VAR4 = Lottery
	{
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("", "$ Lotto Daily " VAR9)
	LOTTOPLAYED = 0
	return
	}
}
if VAR2 = Someone
{
	if VAR3 = has
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("", "$ Lotto Number Taken")
		LOTTOPLAYED = 0
		LOTTOFAIL = 1
		gosub lotto
		return
	}
}
if VAR3 = Daily
{
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("", "$ Lotto Jackpot " VAR5 VAR6)
	LOTTOPLAYED = 0
			return
}
if VAR2 = Pick
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("", "$ Lotto Pick Number")
		LOTTOPLAYED = 0
		LOTTOFAIL = 0
		gosub lotto
		return
	}
if VAR2 = WINNER!!!
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("", "$ Lotto " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8)
		LOTTOPLAYED = 0
		return
	}
if VAR2 = Participation
{
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("","$ Lotto Participation Winner " VAR5 " " VAR8)
	LOTTOPLAYED = 0
	return
}
if VAR2 = No
{
	if VAR3 = Winner
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","$ Lotto Increased to " VAR9)
		LOTTOPLAYED = 0
		LOTTOFAIL = 0
		return
		
	}
}
if VAR5 = /lotto
{
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("", "$ Lotto Play Now")
	LOTTOPLAYED = 0
	LOTTOFAIL = 0
	Gosub lotto
	return
}
if VAR2 = CnR
{
	
	if VAR3 = Law
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","$ CnR Law Enforcement Daily Pay " VAR9 " " VAR12)
		return
	}
	if VAR3 = Services
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","$ CnR Services Daily Pay " VAR9 " " VAR11)
		return
	}
	if VAR3 = Radio
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Radio Off")
		ISRADIO = 0
		return
	}
	if VAR5 = Current
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","$ Lotto Jackpot " VAR7)
		return
	}
	if VAR3 = Lottery
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","$ Lotto Draw")
		if LOTTOPLAYED = 0
			gosub lotto
		return
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; time: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR2 = Today's
{
	if VAR3 = Number:
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","$ Lotto Today's Number: "VAR4)
		LOTTOPLAYED = 0
		return
	}
	if VAR4 = Vehicle:
	{
		
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# Bonus Car " VAR5 " " VAR6)
		gosub bonuscar
		return
	}
	if VAR4 = Fish:
	{
		if VAR7 = Minimum
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("", "# Bonus Fish " VAR4 " " VAR5)
				gosub bonusfish
			return
		}
	if ENABLE_DEBUG_WORK = 1
		LV_Add("", "# Bonus Fish " VAR6 " " VAR7)
		gosub bonusfish
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Server Connect ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = {FF0000}Warning!
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Warning")
	if VAR4 = {FFFFFF}This
		Gosub login
	return
}
if VAR2 = Logged
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Login")
	IF VAR5 = {00AAFF}Donating
		DONATOR = 1
	LOTTOPLAYED = 0
	return
}
if VAR4 ={0077FF}CrazyBob's
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Welcome")
	LOTTOPLAYED = 0
	return
}
if VAR2 = Data
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Player Exists")
	LOGEDIN = Yes
	LOTTOFAIL = 0
	if LOTTOPLAYED = 0
		gosub lotto
	if AUTOCNRRADIO = 1
		gosub radio
	return
}
if VAR2 = {FF66FF}THIS
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("","# Warning! This Server Contains Explicit Material.")
	return
}
if VAR2 = Check
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Check " ADDLINE)
	return
}
if VAR2 = {FFFFFF}SA-MP
{
	StringTrimLeft, VAR3, SERVERVER, 10
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# SA-MP Started " SERVERVER)
	return
}
if VAR2 = Connecting
{
	StringTrimRight, VAR4, SERVERIP, 3
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Connecting")
		if FPSINITAL = 0
		{
			gosub FPSHIGH
			FPSINITAL = 1
		}
	return
}
if VAR2 = Connected.
{
	
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Connected.")
	ISCRAZYBOBS = 0
	return
}
if VAR2 = Connected
{
	StringTrimLeft, VAR3, SERVERNAME, 10
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Connected" " " SERVERNAME " " VAR7)
	return
}
if VAR3 = Server
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# The server is restarting..")
	return
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dead ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR6 = Insulted
{
	if VAR8 = Death
	{				
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Insulted " VAR10 " " VAR11)		
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR10%
			MURDERS = %MURDERS% %VAR10% %a_space%
	return
	}
}
if VAR5 = Puked
{
	IfInString, VAR8 , Death
	{				
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Puked ")	
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
	return
	}
}
if VAR6 = Shot
{				
	if ENABLE_DEBUG_DEAD = 1
	{
		LV_Add("","!! Dead " VAR2 " " VAR3 " Has Been Shot For Being On Police Property")	
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
}

if VAR6 = Attacked
{
	if VAR9 = Sea
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " by Sea Monster")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , *SeaMonster
			MURDERS = %MURDERS% *SeaMonster %a_space%
		return
	}	
}
if VAR5 = killed
{
	if VAR7 = Sea
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead Sea Monster by " VAR2 " " VAR3 )
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}	
	if VAR7 = Sea
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead Mermaid by " VAR2 " " VAR3 )
		IfNotInString , DEATHS , *Mermaid
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}	
}
if VAR5 = killed
{
	if VAR8 = Ton
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead 5 Ton Whale by " VAR2 " " VAR3 )
		IfNotInString , DEATHS , Whale
			DEATHS = %DEATHS% Whale %a_space%
		return
	}
}

if VAR4 = Died
{
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " " VAR4 " " VAR5 " ???")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
	return
}
if VAR5 = Died
{
	if VAR6 = By
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " By " VAR7 " " VAR8 " " VAR9)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , DEATHS , *HandOfGod
			MURDERS = %MURDERS%  *HandOfGod %a_space%
		return
	}
	if VAR6 = From
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " From " VAR7 " " VAR8 " " VAR9)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Died by " VAR6 " " VAR7 " " VAR8 " " VAR9)
	IfNotInString , DEATHS , %VAR2%
		DEATHS = %DEATHS% %VAR2% %a_space%
	IfNotInString , MURDERS , %VAR6%
		MURDERS = %MURDERS% %VAR6% %a_space%
	return
}
IfInString, VAR4 , Died
{
	if VAR6 = Killed
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " By " VAR8 " " VAR9 " " VAR10 " " VAR11)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR8%
			MURDERS = %MURDERS% %VAR8% %a_space%
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " " VAR4)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
	return
}

if VAR6 = Death
{
	if VAR11 = Elephant.
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Death by " VAR11)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR11%
			MURDERS = %MURDERS% %VAR11% %a_space%
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Death by " VAR10 " " VAR11)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR10%
			MURDERS = %MURDERS% %VAR10% %a_space%
	return
}

;;;;;;;;;;;;;;;;;;;;;; IS ;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR4 = Has
{
	if VAR8 = Gift!
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Gift From" VAR2 " " VAR3)
		gosub gift
		return	
	}
}


if VAR4 = Is
{
	if VAR5 = Stripping.
	{	
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","!! Work Stripper" VAR2 " " VAR3 " Send Her Money")
		return
	}
	if VAR7 = Jail
	{	
		if ENABLE_DEBUG_DICE = 1
			LV_Add("","!! Dice " VAR2 " " VAR3 " Not in your Cell ")
		LASTDICEFAIL = 1
		return
	}
	if VAR7 = Group
	{	
		if ENABLE_DEBUG_MSG = 1
			LV_Add("","!! Group " VAR2 " " VAR3 " Leader")
		INGROUP = 1
		return
	}
	if VAR5 = Knocking
	{	
		if ENABLE_DEBUG_HOUSE = 1
			LV_Add("","!! House " VAR2 " " VAR3 " Knocking on door")
		return
	}
	if VAR5 = Selling
	{	
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Sell " VAR2 " " VAR3)
		return
	}
}		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; You ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = You
{
	if VAR6 = Trash
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# Work Trash Pickup " MISSION_TRASH )
		MISSION_TRASH++
		if MISSION_TRASH = 5
			MISSION_TRASH = 0
		return
	}
	if VAR5 = Food
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# Work Food Delivered" )
		return
	}
	if VAR4 = Debt!
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "# You Are In Debt! " VAR9)
		return
	}
	if VAR4 = Activate
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Cannot Activate the Alarm")
		return
	}
	
	if VAR5 = Throw
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Throw Fish Back Here")
		return
	}
	if VAR6 = {00AAFF}Weapons
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Purchase Weapons Legally")
		return
	}
	if VAR11 = Hunting
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Hunting Permits " VAR5)
		return
	}
	if VAR11 = Challenge
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Challenge Failed! " VAR8 " " VAR9 " Got Away")
		return
	}
	if VAR6 = List
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Most Wanted Suspects Cant Bribe Cops")
		return
	}
	if VAR5 = Wearing
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Wearing Your " VAR7 " " VAR8 " " VAR9 " " VAR10)
		return
	}
	if VAR7 = Chastity
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Wearing A Chastity Belt ")
		return
	}
	if VAR7 = Owner
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Group Owner ")
		return
	}
	if VAR5 = Ignoring
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Ignoring Someone ")
		return
	}
	if VAR6 = Plant
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Don't Have a Plant GPS")
		ISRADIO = 1
		return
	}
	if VAR4 = Sent 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Sent " VAR5 " to " VAR7 " " VAR8)
		return
	}
	if VAR5 = Listening 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Radio On")
		ISRADIO = 1
		return
	}
	if VAR4 = Activated 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Vehicle Alarm Activated")
		ISALARMED = 1
		return
	}
	if VAR4 = Disabled 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Vehicle Alarm Disabled")
		ISALARMED = 0
		return
	}
	if VAR4 = Called 
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("", "# Vendor Called " VAR6 " " VAR7)
		return
	}
	if VAR4 = Called 
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("", "# Vendor Called " VAR6 " " VAR7)
		return
	}
	if VAR9 = Dead.
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Player is Dead")
		ISDEAD = 1
		return
	}
	if VAR5 = Drugs.
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Player on Drugs")
		ONDRUGS = 1
		return
	}
	if VAR6 = Vehicle
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Work Sell this Vehicle " VAR8)
		gosub gpscarsell
		return
	}
	if VAR3 = Activated
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Lock Active ")
		return
	}
	if VAR5 = Anymore
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Full ")
		HAVEFISH = 1
		gosub fishinv
		return
	}
	if VAR7 = GPS
	{
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "# GPS No Destination ")
		GPSINUSE = 0
		return
	}
	if VAR4 = Catch
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Permits Left " VAR5)
		HAVEFISHPERM = 1
		return
	}
	if VAR8 = Ice
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Cant Afford Ice Cooler Lost" VAR15)
		return
	}
	if VAR6 = Adrenaline
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Used Adrenaline, you still have " VAR15)
		return
	}
	if VAR4 = Captured
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Captured " VAR6 " " VAR7 )
		return
	}
	if VAR8 = Inside
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Cannot Use Inside Vehicle")
		return
	}
	if VAR3 = Must
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# You Must Be in Checkpoint")
		return
	}

	if VAR4 = Voted 
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# You have Voted " VAR6 " " VAR8)
		return
	}
	if VAR9 = Completed
	{
		if ENABLE_DEBUG_HIT = 1
			LV_Add("","!! Work Hitman " VAR5 " " VAR6 " Contract " VAR15 " " VAR16)
		IfNotInString , WORKERS , %VAR5%
			WORKERS = %WORKERS% %VAR5% %a_space%
		return
	}
	IfInString, VAR11, Birthday
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "$ Bday " VAR5 " " VAR6 " Sent " 12)
		return
	}
	IfInString, VAR8, Tournament
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Tourny " VAR4)
		return
	}
	if VAR5 = Picked
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("", "$ Lotto Picked Already " VAR15)
		lotto = 1
		return
	}
	IfInString, VAR7 , Cooler
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Cooler")
		return
	}
	if VAR4 = Discarded
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Discard " VAR6 " " VAR8 " " VAR9 )
		return
	}
	if VAR7 = Jury
	{
		if ENABLE_DEBUG_JURY = 1
			LV_Add("", "# Jury Duty")
		gosub jury
		return
	}
	if VAR6 = Squallo
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Buy Squallo")
		
		return
	}
	if VAR5 = Worst
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Officially Suck!")
		
		return
	}
	if VAR4 = Placed
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Placed " VAR6 " " VAR7 " " VAR8 " "  VAR9 " "  VAR10 " "  VAR11 " "  VAR12)
		
		return
	}
	if VAR4 = Taken
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Taken " VAR6 " " VAR7 " " VAR8 " "  VAR9 " "  VAR10 " "  VAR11 " "  VAR12)
		
		return
	}
	if VAR4 = Issued
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime Ticket Issued")
		IFCOP = 0
			return
		IFCIV = 1
			SetTimer , pay , 1000
		return
	}
	if VAR4 = Assisted
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime Assisted Arrest")
		
		return
	}
	if VAR7 = Assist
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime Assist Bonus " VAR5)
		
		return
	}
	if VAR4 = Accepted
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% You Have Accepted")
		
		return
	}
	if VAR5 = Asked
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime " VAR3 " " VAR4 Asked to Freeze)
		
		return
	}
	if VAR4 = Offered
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% " VAR2 " " VAR3 Has Offered)
		
		return
	}
	if VAR4 = Collected
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime Ticket Collected")
		
		return
	}
	if VAR4 = Paroled
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Crime " VAR5 " " VAR6 Paroled)
		
		return
	}
	if VAR3 = Beat
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Beat Your Record")
		
		return
	}
	if VAR5 = Body
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "#  You Received Armor")
		
		return
	}
	if VAR4 = Arrested
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "% Arrest " VAR6 " " VAR7)
		
		return
	}
	if VAR5 = Withdraw
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Not at Bank ")
		
		return
	}
	if VAR5 = Deposit
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Not at Bank ")
		
		return
	}
	if VAR7 = Class
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# New Class After Death ")
		
		return
	}
	if VAR4 = Found
	{
		if ENABLE_DEBUG_MONEYBAG = 1
			LV_Add("", "# Found Money Bag ")
		
		return
	}
	if VAR3 = Received
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Share ")
		
		return
	}
	if VAR4 = Cannot
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Cannot")
		
		return
	}
	if VAR4 = Paid
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Have Paid")
		
		return
	}
	
	if VAR3 = Lost.
	{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice Lost " VAR8)
		LASTDICEFAIL = 0
		return
	}
	if VAR12 = Dice
	{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice ? " VAR5 " " VAR6 )
		LASTDICEFAIL = 0
		return
	}
	if VAR4 = Cancelled
	{	
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Have Cancelled")
		return
	}

	if VAR5 = Ticket
	{	
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Have Paid Your Ticket")
		return
	}
	if VAR5 = Catch
	{				
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Fishing Permits: " VAR6)			
		return
	}
	if VAR5 = Charged
	{				
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# You Will Be Charged $9500 per Gameday For Ice")			
		return
	}		
	If VAR6 = Ice
	{				
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Paid For Ice For Your Fish Cooler " VAR4)			
		return
	}
	if VAR5 = Closest
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# You are the Closest.")
			return
		}
	if VAR3 = Cannot 
		if VAR6 = Fish.
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# You Cannot Cary any more Fish.")
			return
			HAVEFISH = 1
		}
	if VAR3 = Are
		if VAR5 = Fishing.
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# You Are Currently Fishing.")
			return
		}
	if VAR4 = not
	{
		if VAR5 = Carrying
		{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("",? "You Are Not Carrying Any Fish")
		HAVEFISH = 0
		return
		}
	}

	IfInString, VAR9 , Fees
	{				
		if ENABLE_DEBUG_MONEY = 1
		LV_Add("", "$ Paid Daily Life Insurance Fees " VAR4)			
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Money ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR5 = Stolen
	if VAR8 = Bank
	{
	if ENABLE_DEBUG_MONEY = 1
		LV_Add("", "# Bank Has Been Robbed")
	return
	}

if VAR3 = Has
{
	if VAR5 = Taken 
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("","$ Paid " VAR2 " From Bank Account ")
		return
	}
}
if VAR2 = Property
{
	if VAR3 = Value:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Property Value " VAR4 " Share Value: " VAR9)
		return
	}
	if VAR3 = Tax:
	{
		StringReplace, VAR4, VAR4, Storage
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Tax Property " VAR4  " Storage " VAR6)
		return
	}
}
if VAR3 = Paid
{
	if VAR5 = Bank
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("","$ Paid" VAR2 " " VAR3 " From Bank Account")
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Has ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR4 = Has
{
	
	if VAR5 = Called
	{
			if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","# Group Call " VAR2 " " VAR3 " to "  VAR9 " " VAR10 " " VAR11 " " VAR12)
			return
	}
	if VAR5 = Already
	{
			if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","# Group Already " VAR2 " " VAR3)
			return
	}
	if VAR5 = Changed
	{
			if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","# Group Changed " VAR2 " " VAR3 " To " VAR8 " " VAR9 " " VAR10)
			return
	}
	if VAR5 = Requested
	{
			if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","# Group Request " VAR2 " " VAR3)
			return
	}	
	if VAR5 = Kidnapped
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Kidnap " VAR2 " " VAR3 " You " VAR8)
		return
	}	
	if VAR5 = Killed
	{
		if VAR6 = A
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("","# Dead Mermaid " VAR2 " " VAR3)
			return
		}
	}
	if VAR5 = Sent
	{
		if VAR9 = Tip
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("","# Given Tip " VAR2 " " VAR3 " " VAR8)
			
			return
		}
		if VAR6 = You
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("","# Given Drugs " VAR2 " " VAR3 " " VAR7 "g")
			
			return
		}
	}
	if VAR5 = Given
	{
		if VAR7 = A
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("","# Given Fish " VAR2 " " VAR3 " " VAR7 " Pound " VAR9 VAR10)
			return
		}
		if VAR6 = You
		{
			if ENABLE_DEBUG_MONEY = 1
				LV_Add("","$ Given Money " VAR2 " " VAR3 " " VAR7)
			
			return
		}
	}
	if VAR5 = Asked
	{
		if VAR10 = Dice
		{
			LASTDICEFAIL = 0
			if ENABLE_DEBUG_DICE = 1
				LV_Add("","# Dice Asked " VAR2 " " VAR3 " " VAR13 " " AUTOPLAYASKEDICE)
			if AUTOPLAYASKEDICE = 1
				gosub dice
			return
		}
	}
	if VAR5 = Set
	{
		if VAR8 = Paperboy
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Record " VAR2 " " VAR3 " Paperboy " VAR11 " Delivered")
			return
		}
	}
	if VAR5 = Completed
	{
		if VAR7 = Paperboy
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed " VAR2 " " VAR3 " Paperboy " VAR10 " Delivered")
			return
		}
		if VAR7 = Pick
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed " VAR2 " " VAR3 " Pick Pocket " VAR13 " Robbed")
			return
		}
	}
	if VAR5 = Been
	{
		
		if VAR6 = Invited
		{
			if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","# Group Invite " VAR2 " " VAR3)
			return
		}
		if VAR9 = Crab
		{
			if ENABLE_DEBUG_DEAD = 1
				LV_Add("","# Dead " VAR2 " " VAR3 " By Crabs")
			return
		}
		if VAR8 = Freeze
		{
			if ENABLE_DEBUG_CRIME = 1
				LV_Add("","# Crime " VAR2 " " VAR3 " Asked To Freeze")
			return
		}
	}
	if VAR5 = Completed
	{
		if VAR7 = Hit
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed Hit " VAR2 " " VAR3 " On " VAR9 " " VAR10 " For " VAR12)
			return
		}		if VAR7 = Food
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed Food " VAR2 " " VAR3)
			return
		}
		if VAR7 = Lawn
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed Lawn " VAR2 " " VAR3 " " VAR11)
			return
		}
		if VAR7 = Sexual
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed Sexual " VAR2 " " VAR3)
			return
		}
		if VAR7 = Pickpocket
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Work Completed Pickpocket " VAR2 " " VAR3 " " VAR12 " " VAR15)
			return
		}
	}	
	
	if VAR5 = Raped
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Rape " VAR2 " " VAR3 " You")
		return
	}
	if VAR5 = Infected
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Infected " VAR2 " " VAR3 " You")
		return
	}
	if VAR5 = Robbed
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Robbed " VAR2 " " VAR3 " You")
		return
	}
	
	if VAR7 = Rape
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Rape " VAR2 " " VAR3 " Attempt")
		return
	}
	if VAR7 = Rob
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Rob " VAR2 " " VAR3 " Attempt")
		return
	}

	if VAR5 = Found
	{
		if ENABLE_DEBUG_MONEYBAG = 1
			LV_Add("","# Moneybag " VAR2 " " VAR3 " Dropped By " VAR11 " " VAR12 " in " VAR14 " " VAR15 " " VAR16)
		return
	}
	
	if VAR5 = Invited
	{
		if ENABLE_DEBUG_MSG = 1
			LV_Add("","# Group " VAR2 " " VAR3 " Invited To " VAR7 " " VAR8 " " VAR9)
		return
	}

	if VAR5 = Lived
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Birthday " VAR2 " " VAR3 " Lived " VAR6 " Days " VAR11 " Years")
		return
	}
	if VAR5 = Offered
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("","# Vendor Offered " VAR2 " " VAR3 " " VAR4 " " VAR5 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR5 = Caught
	{
		if VAR8 = Pound
		{
			if VAR10 = and
				VAR10 =
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Fishing Record " VAR2 " " VAR3 " Caught " VAR7 " " VAR9 " " VAR10)
			IfNotInString , WORKERS , %VAR2%
				WORKERS = %WORKERS% %VAR2% %a_space%
			return
		}
		if VAR8 = Pounds
		{
			if VAR10 = and
				VAR10 =
			if ENABLE_DEBUG_WORK = 1
				LV_Add("","# Fishing Record " VAR2 " " VAR3 " Caught " VAR7 " " VAR9 " " VAR10)
			IfNotInString , WORKERS , %VAR2%
				WORKERS = %WORKERS% %VAR2% %a_space%
			return
		}
	}
	if VAR7 = Keys
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Vehicle Keys " VAR2 " " VAR3 " " VAR11)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR8 = Vehicle
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Bonus Vehicle " VAR2 " " VAR3 " Sold " VAR9 " For " VAR11)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR8 = Mafia
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Mafia Money " VAR2 " " VAR3 " Found " VAR12 " in " VAR14 " " VAR15 " " VAR16 " " VAR17)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Flower
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Flowers " VAR2 " " VAR3 " Completed")
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR5 = Donated 
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Work Church " VAR2 " " VAR3 " Donated " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Vehicle
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Bonus Vehicle " VAR2 " " VAR3 " Sold " VAR9)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	
	if VAR5 = Cancelled
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Hit Cancelled " VAR2 " " VAR3 " On  " VAR9)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Package
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Ups Package " VAR2 " " VAR3 " Received " VAR9 " " VAR10 " " VAR12 " " VAR13)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR5 = Paid
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("","# Taxed " VAR2 " " VAR3 " Paid " VAR6)
		IfNotInString , REFUNDED , %VAR2%
			REFUNDED = %REFUNDED% %VAR2% %a_space%
		return
	}
	IfInString, VAR9 , Refund
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("","# Refund " VAR2 " " VAR3 " Got " VAR6)
		IfNotInString , WORKER , %VAR2%
			WORKER = %WORKER% %VAR2% %a_space%
		return
	}
	IfInString, VAR9 , Bank
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Robbed Bank " VAR2 " " VAR3 " Paid " VAR6)
		IfNotInString , WORKER , %VAR2%
			WORKER = %WORKER% %VAR2% %a_space%
		return
	}
	if VAR5 = Robbed
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Robbed " VAR2 " " VAR3 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR5 = Delivered
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Delivered " VAR2 " " VAR3 " " VAR6 " " VAR7 " " VAR8)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Trash
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Trash " VAR2 " " VAR3 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Drug
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Drug " VAR2 " " VAR3 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR6 = Delivered
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# Delivered " VAR2 " " VAR3 " " VAR6)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Welfare
	{
		if ENABLE_DEBUG_WELFARE = 1
			LV_Add("","# Welfare " VAR2 " " VAR3 " Is Poor")
		IfNotInString , POOR , %VAR2%
			POOR = %POOR% %VAR2% %a_space%
		return
	}
	if VAR8 = Taxes.
	{
		if ENABLE_DEBUG_TAXES = 1
			LV_Add("","# Taxes " VAR2 " " VAR3 " Paid " VAR6)
		IfNotInString , TAXES , %VAR2%
			DEATHS = %TAXES% %VAR2% %a_space%
		return
	}
	if VAR8 = Taxes,
	{
		if ENABLE_DEBUG_TAXES = 1
			LV_Add("","# Taxes " VAR2 " " VAR3 " Failed to Paid ")
		IfNotInString , TAXES , %VAR2%
			DEATHS = %TAXES% %VAR2% %a_space%
		return
	}
	if VAR6 = Shot
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","# Dead " VAR2 " " VAR3 " Shot on Police Property")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	if VAR5 = Disappeared
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","# Dead " VAR2 " " VAR3 " Has Disappeared in the Woods")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	if VAR5 = Robbed
	{
		if VAR8 = You.
		{
			if ENABLE_DEBUG_ROBBER = 1
				LV_Add("","# Robbed " VAR2 " " VAR3 " From you " VAR6)
			IfNotInString , ROBBERS , %VAR2%
				ROBBERS = %ROBBERS% %VAR2% %a_space%
			return
		}
	}
	IfInString, VAR7, Deer
	{
		if ENABLE_DEBUG_GROWER = 1
			LV_Add("", "!! Work " VAR2 " " VAR3 " Deer Killed ")
		IfNotInString , GROWERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	If VAR7 = Bible
	{
		if ENABLE_DEBUG_RECORD = 1
			LV_Add("", "!! Work " VAR2 " " VAR3 " Bible Sales Record ")
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	If VAR6 = Tickled
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Tickled By Ghost") 
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	If VAR6 = Clucked
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Clucked by Chicken") 
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	IfInString , VAR6 , Kidnapped
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Work " VAR2 " " VAR3 " Kidnapped " VAR9) 
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	IfInString , VAR7 , Hippie
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead Hippie " VAR2 " " VAR3)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR6 = Infected
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Infected " VAR2 " " VAR3 " With " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
		return
	}
	if VAR6 = Raped
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Raped by " VAR10 " " VAR11  " ? ")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR10%
			MURDERS = %MURDERS% %VAR10% %a_space%
		return
	}
	if VAR6 = Probed
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Probed")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	if VAR9 = Death
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Fish Slapped" VAR11 " " VAR12)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR11%
			MURDERS = %MURDERS% %VAR11% %a_space%
		return
	}
	if VAR6 = Eaten
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Eaten by Jaws")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , *Jaws
			MURDERS = %MURDERS% *Jaws %a_space%
		return
	}
	if VAR5 = Shot
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Shot on Police Property")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		return
	}
	if VAR11 = Record
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","!! Work Record " VAR2 " " VAR3 " " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
				return
	}
	if VAR8 = Lawn
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","!! Work Lawn " VAR2 " " VAR3 " " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
				return
	}
	if VAR6 = Killed
	{
		if VAR8 = Hitman
		{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Work Hitman " VAR9 " " VAR10 " Killed " VAR2 " " VAR3)
		IfNotInString , WORKERS , %VAR9%
			WORKERS = %WORKERS% %VAR9% %a_space%
				return
		}
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Killed " VAR8 " " VAR9 " " VAR10 " " VAR11 " ***" )
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR8%
			MURDERS = %MURDERS% %VAR8% %a_space%
				return
	}
	if VAR8 = Crop
	{
	if ENABLE_DEBUG_WORK = 1
		LV_Add("", "!! Work Crop " VAR2 " " VAR3 " Crop Record " VAR12)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR5 = Smuggled
	{
	if ENABLE_DEBUG_WORK = 1
		LV_Add("", "!! Work Driver" VAR2 " " VAR3 " Smuggled " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	if VAR7 = Promoted
	{
	if ENABLE_DEBUG_WORK = 1
		LV_Add("", "!! Work Promoted" VAR2 " " VAR3 " Is Regular ")
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		NEWREG = %VAR2%
		return
	}
	if VAR8 = Frezze
	{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "% Crime " VAR2 " Asked to Stop ")
		return
	}
	if VAR6 = Disabled
	{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("","!! " ADDLINE )
		return
	}
	if VAR5 = Placed	
	{
		if ENABLE_DEBUG_HIT = 1
			LV_Add("","!! Hit " VAR2 " " VAR3 " " VAR9 " " VAR10 " For " VAR12)
		return
	}
	if VAR5 = Offered
		if VAR9 = Clothes.
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","!! Offer " VAR2 " Clothes")
		gosub clothesbuy
		return
	}
	if VAR8 = Gift!	
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","!! Gift")
		gosub gift
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Your ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = Your
{
	
	if VAR3 = Ticket
	{
		if VAR6 = Unpaid
		{
			if ENABLE_DEBUG_CRIME = 1
				LV_Add("", " Crime Ticket Unpaid")
			SetTimer, pay , 1000
			return
		}
	}
	
	if VAR3 = House,
	{
		if VAR6 = During
		{
			if ENABLE_DEBUG_HOUSE = 1
				LV_Add("", "!! Work House Been Cleaned")

			return
		}
	}
	if VAR3 = Fishing
	{
		if VAR4 = Permit
		{
			if ENABLE_DEBUG_FISH = 1
				LV_Add("", "# Fishing Permits Expired")
			HAVEFISHPERM = 0
			return
		}
	}
	if VAR3 = Vehicle
	{
		if VAR4 = is
		{
		if ENABLE_DEBUG_VEHICLE = 1
			LV_Add("", "# Vehicle Repairing")
		PLAYER_HEALTH = 100
		return
		}
		if VAR4 = Has
		{
		if ENABLE_DEBUG_VEHICLE = 1
			LV_Add("", "# Vehicle Repaired")
		PLAYER_HEALTH = 100
		return
		}
	}
	if VAR3 = Rank
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("", "% Your Not High Enough")
		PLAYER_HEALTH = 100
		return
	}
	if VAR3 = Health
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Health Filled")
		PLAYER_HEALTH = 100
		return
	}
	if VAR3 = Armor
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Armor Filled")
		PLAYER_Armor = 100
		return
	}
	if VAR3 = Horse
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Horse Bet")
		return
	}
	if VAR3 = Past
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Past Crimes Have Been Pardoned")
		return
	}
	if VAR3 = Bank
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Bank Interest " VAR7 " " VAR10 " " VAR11 " " VAR12 " " VAR13 )
		return
	}
	if VAR3 = {00AAFF}User
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Your User Has Been Saved")
		LOGEDIN = YES
		return
	}
	if VAR3 = House
	{
		if ENABLE_DEBUG_HOUSE = 1
			LV_Add("", "# Your House " ADDLINE)
		return				
	}
	if VAR3 = Drugs
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Drugs Have Worn Off")
		ONDRUGS = 0
		return
	}
	if VAR3 = Lottery
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("", "$ Lotto Number " VAR5 " " VAR11)
		LOTTOPLAYED = 1
		return
	}
	if VAR4 = Hit
	{
		if ENABLE_DEBUG_HIT = 1
		LV_Add("", "# Your Hit")
		return
	}
	if VAR3 = Medical
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Medical")
		return
	}
	if VAR3 = Pet,
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "# Your Pet")
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Purchased ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = Purchased
{
	{
		if ENABLE_DEBUG_PURCHASE = 1
			LV_Add("","$ Purchased" VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}
	if VAR3 = Insurance
	{
		if ENABLE_DEBUG_PURCHASE = 1
			LV_Add("","$ Stat Purchase Insurance at City Hall")
		return
	}
}
if VAR4 = Purchased
{						
	if VAR5 = Your
	{
		if ENABLE_DEBUG_PURCHASE = 1
			LV_Add("", "Purchased Your Stuff ?")		
		return
	}		
		
	if VAR6 = Armor
	{
		if ENABLE_DEBUG_PURCHASE = 1
			LV_Add("", "Purchased Armor")		
		return
	}
	if VAR6 = Dinghy
	{					
		if ENABLE_DEBUG_PURCHASE = 1
			LV_Add("", "Purchased Dingy")	
		return
	}






}
if VAR2 = Street
{
	if VAR3 = Vendor 
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("","# Offer " VAR2 " " VAR3 " Items ")
		if AUTTOACCEPTOFFER = 1
		gosub items
		return
	}
}

if VAR2 = Arms
{
	if VAR3 = Dealer
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("","# Offer " VAR2 " " VAR3 " Weapons ")
		if AUTTOACCEPTOFFER = 1
			gosub weapons
		return
	}
}

if VAR5 = Called
{
	if VAR7 = Delivery
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("","# Celled Vendor " VAR2 " " VAR3 " " VAR11 " " VAR12 " " VAR13 " " VAR14 " " VAR15)
		return
	}	
}
if VAR2 = Food
{
	if VAR3 = Vendor
	{
		if ENABLE_DEBUG_VENDOR = 1
			LV_Add("","# Vendor Offer Food " VAR4 " " VAR5)
		return
	}	
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dice ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR4 = Rolled
{
	if VAR5 = A
	{	
		LASTDICEFAIL = 0
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice Roll " VAR2 " " VAR3 "  " VAR6 " You " VAR15 )	
		if AUTOPLAYDICE = 1
		{
			Random, dicetimmer , 20000, 25000
			settimer, playdice , %dicetimmer%
		}
		return
	}
}
if VAR5 = Played
{
	if VAR6 = Dice
	{	
		LASTDICEFAIL = 0
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice " VAR2 " " VAR3 " Played Recently" )
		if AUTOPLAYDICE = 1
		{
			Random, dicetimmer , 10000, 20000
			settimer, playdice , %dicetimmer%
		}
		return
		return
	}
}
if VAR2 = No
{	
	if VAR3 = Winner,
	{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice No Winner")
		LASTDICEFAIL = 0
		return
	}
	if VAR8 = Dice
	{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("","# Dice Failed")
		LASTDICEFAIL = 0
		return
	}
	if VAR3 = Players
	{
		if VAR4 = Close
		{
			if ENABLE_DEBUG_DICE = 1
				LV_Add("","# Dice No Players Close Enough 1")
			LASTDICEFAIL = 1
			return
		}
	}
	if VAR7 = Enough.
	{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("","# Dice No Players Close Enough 2")
		LASTDICEFAIL = 1
		return
	}
}
if VAR2 = Law
{
	if VAR5 = Cannot
	{	
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice Cops Cannot Participate")
		LASTDICEFAIL = 1
		return
	}
}
if VAR5 = Too
{
	if VAR6 = Far
	{
		if ENABLE_DEBUG_DICE = 1
		LV_Add("","# Dice Player To Far Away" )
		LASTDICEFAIL = 0
		return
	}
}
if VAR4 = Could
{
	if VAR6 = Afford
	{	
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "# Dice " VAR2 " " VAR5 " " VAR6 " " VAR7  " " VAR8  " " VAR9  " " VAR10  " " VAR11  " " VAR12)
		POOR = %VAR2%
		LASTDICEFAIL = 0
		gosub givepoorcash
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Crime ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = Jail
{
	if VAR4 = Appeal
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","# Appeal " VAR7 " " VAR8 " " VAR11)
		return
	}		
}


if VAR9 = Police
{
	if ENABLE_DEBUG_CRIME = 1
		LV_Add("","% Crime Not Cop Car")
	return
}
if VAR2 = Officer
{
	if VAR5 = Reports
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","# Crime" VAR2 " " VAR3 " Reports Criminal Activity " VAR12 " " VAR14 " " VAR15)
		return
	}		
}
if VAR2 = Level
{
	if VAR5 = Rank:
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("", "# Crime Rank " VAR6 " " VAR7 " " VAR8)
		return
	}
}
 if VAR2 = Officer
{
	if ENABLE_DEBUG_CRIME = 1
		LV_Add("","% Crime OFFICER " ADDLINE)
	return
}
if VAR2 = Suspect
{
	if VAR7 = Enough
	{	
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("", "#  Crime " Not Close Enough)
		return
	}
	if ENABLE_DEBUG_CRIME = 1
		LV_Add("","!! Arrest " VAR3 " " VAR4 " by " VAR10 " " VAR11)
	IfNotInString, OFFICERS , %VAR10%
		OFFICERS = %OFFICERS% %VAR10% %A_Space%
	IfNotInString, ARRESTED , %VAR3%
		ARRESTED = %ARRESTED% %VAR3% %A_Space%
	return

}
if VAR3 = Suspects
{
	if ENABLE_DEBUG_CRIME = 1
		LV_Add("","% Crime No Suspect")
	return
}
if VAR2 = Location:
{
	if ENABLE_DEBUG_CRIME = 1
		LV_Add("","% Crime " VAR3 " " VAR4  " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9  " " VAR10 )
	return
}
if VAR2 = Attention
{
	if VAR3 = All
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","% Crime " VAR4  " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9  " " VAR10 " " VAR11 " " VAR12 " " VAR13 )
		return
	}
}

if VAR2 = Wanted
{
	if VAR3 = Level
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","# Crime Wanted Level " VAR4)
		return
	}
}
if VAR2 = Committed
{
	if VAR4 = Crime
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("", "# Crime " VAR5 " " VAR6 " " VAR7 " "VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
		return
	}
}
if VAR5 = Escaped
{
	if ENABLE_DEBUG_CRIME = 1
	LV_Add("","!! Crime " VAR2 " Escaped Jail")
		return
}

;;;;;;;;;;;;;;;;;;; Auto Mission GPS  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR2 = Food
{
	if VAR3 = Delivery
	{
		INBOAT = 0
		INTRUCK = 0
		INCAR = 0
		INFOOD = 1
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "!! Work Food Mission")
		if AUTOFOODMISSION = 1
			gosub mission
		return
	}
}if VAR2 = Trash 
{
	if VAR3 = Pickup
	{
		MISSION_TRASH = 0
		INTRASH = 1
		INBOAT = 0
		INTRUCK = 0
		INCAR = 0
		INFOOD = 1
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "!! Work Trash Mission")
		if AUTOTRASHMISSION = 1
			gosub mission
		return
	}
}
if VAR2 = Truck
{
	if VAR3 = Delivery
	{
		INBOAT = 0
		INTRUCK = 1
		INCAR = 1
		INFOOD = 0
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "# GPS Truck Delivery " GPSINUSE)
		if AUTOGPSMISSION = 1
			SetTimer, gpsmission, 500
		return
	}
}
if VAR2 = Courier
{
	if VAR3 = Mission
	{
		INTRUCK = 0
		INCOURIER = 1
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "# GPS Courier Mission " GPSINUSE)
		if AUTOCOURIERGPSMISSION = 1
			SetTimer, gpsmission, 500
		return
	}
}
if VAR2 = GPS
{
	if VAR3 = Arrived:
	{
	if ENABLE_DEBUG_GPS = 1
		LV_Add("", "# GPS Arrived: " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
	GPSINUSE = 0
		return
	}
	if VAR4 = Destination:
	{
	if ENABLE_DEBUG_GPS = 1
		LV_Add("", "# GPS Destination: " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}
	IfInString, VAR4 , Cleared
	{
	GPSINUSE = 0
	if ENABLE_DEBUG_GPS = 1
		LV_Add("", "# GPS Destination: " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}

}
if VAR2 = Distance:
{
	if ENABLE_DEBUG_GPS = 1
	LV_Add("", "# GPS Distance: " VAR3 " km Path Distance " VAR9 " km ")

		return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR2 = Has
{
	if VAR5 = Placed
	{
		if ENABLE_DEBUG_HIT = 1
			LV_Add("","!! Hit Placed " VAR2 " " VAR3 " Has Placed A Hit On " VAR9 " " VAR12)
		return
	}	
}
if VAR2 = Hitman
{
	if VAR6 = Killed
	{
		if ENABLE_DEBUG_HIT = 1
			LV_Add("","# Hit Complete " VAR2 " " VAR3 " " Killed VAR6 " " VAR7)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
}
if VAR4 = Contract
{
	if VAR9 = Cancelled
	{
	if ENABLE_DEBUG_HIT = 1
	LV_Add("","!! Hit Cancelled VAR9")
		return
	}
	if VAR10 = Cancelled
	{
	if ENABLE_DEBUG_HIT = 1
	LV_Add("","!! Hit Cancelled " VAR10)
		return
	}
}	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Delivery ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR2 = Delivery
{
	if VAR3 = Complete.
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("","# Work Delivery Complete " INCAR " " INTRUCK)
		IF INTRUCK = 1
			SetTimer, delivery , 25000
		return
	}
	if VAR4 = Progress.
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("","# Work Delivery In Progress " VAR5)
		SetTimer, delivery , 25000
		return
	}
	if VAR3 = Complete.
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("","# Work Delivery Complete " VAR5)
		SetTimer, delivery , 25000
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Jury Duty ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR6 = Juror
{
	IfInString, VAR7 , Bonus
	{				
		if ENABLE_DEBUG_JURY = 1
			LV_Add("", "!! Work Juror Bonus $5000")			
		return
	}
}
if VAR2 = Jury
{
	IfInString, VAR4 , Cancelled
	{
		if ENABLE_DEBUG_JURY = 1
			LV_Add("", "# Work Jury Duty Cancelled")
		return
	}
}
if VAR5 = Arrested
{
	if VAR6 Jury
	{
		if ENABLE_DEBUG_JURY = 1
			LV_Add("", "!! Work Jury Selected")	
		return
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Workers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if VAR5 = Caught
{
	if VAR2 = You
	{ 
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","!! Work Record Fish ")
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
			return
	}
	if VAR10 = and
		VAR10 =
	if VAR7 = Bonus
	{ 
	if ENABLE_DEBUG_WORK = 1
		LV_Add("","!! Work " VAR2 " " VAR3 " Caught Bonus Fish " VAR9 " " VAR11 " " VAR12 )
	IfNotInString , WORKERS , %VAR2%
		WORKERS = %WORKERS% %VAR2% %a_space%
	return
	}
}
if VAR2 = There
{
	if VAR5 = Suspects
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","%Crime No Suspects Awaiting Parole")
		return
	}
	if VAR6 = Deliver
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("","# Work Nothing to Deliver Yet")
		SetTimer, delivery , 25000
		return
	}
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MISC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



if VAR2 = {FF66FF}The
{
	if VAR4 = Bunny
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# The Easter Bunny Dropped an Egg")
		return
	}
}
if VAR2 = {FF66FF}Happy
{
	if VAR3 = Easter{FFFFFF}!
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Happy Easter! " VAR4 " " VAR5 " Found an Easter Egg")
		return
	}
}
if VAR2 = Happy
{
	if VAR3 = Easter!
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Happy Easter! /givegift")
		return
	}
}



if VAR3 = Frame
{
	if VAR4 = Limiter:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# Frame Limiter " VAR5)
		return
	}
}

if VAR2 = Beginning
{
	if VAR3 = Holdup...
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","!! Work Holdup")
		return
	}
}

if VAR2 = Nothing
{
	if VAR4 Cancel!
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# " VAR2 " Nothing to Cancel!")
		return
	}
}
if VAR4 = Attempted 
{
	if VAR6 = Break
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","# House " VAR2 " Attempted Breaking")
		return
	}
}

if VAR5 = Not
{
	if VAR6 = Accepting
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# " VAR2 " " VAR3 " No PM")
		return
	}
}
if VAR4 = Not
{
	if VAR6 = Valid
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","# " VAR2 " Not a Valid Player")
		return
	}
}
if VAR3 = Wait
{
	if VAR5 = Fishing
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Please Wait Before Fishing Again.")
		FISHOUT = 25
		gosub fishout
		return
	}
	if VAR7 =  Animation.
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Please Wait Before Using Another Animation.")
		return
	}
}
if VAR7 = Social
{
	if VAR8 Security
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Tax " VAR2 " " VAR3 " Has Received A Social Security Check")	
		return
	}
}
if VAR4 = Released
{
	if VAR5 From
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Jail " VAR2 " " VAR3 " Released")	
		return
	}
}


if VAR2 = Player
{
	if VAR5 = Day:
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "!! Work POTD " VAR6 " " VAR7)
		IfNotInString , WORKERS , %VAR6%
			WORKERS = %WORKERS% %VAR6% %a_space%
		return
	}
}
if VAR4 = Is
{
	if VAR5 = Not
	{
		if VAR7 = Your
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "!! Not In Your Car " VAR2 " " VAR3)
			return
		}
	}
	if VAR5 = Not
	{
		if VAR6 = Close
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "!! Not Close Enough " VAR2 " " VAR3)
				LASTDICEFAIL = 1
			return
		}
	}
	if VAR5 = Looking
	{
		if VAR8 = Drug
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("", "!! Work Drug " VAR2 " " VAR3 " Looking")
			return
		}
		if VAR8 = Food
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("", "!! Work Food " VAR2 " " VAR3 " Looking")
			return
		}
		if VAR8 = Clothes
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("", "!! Work Clothes " VAR2 " " VAR3 " Looking")
			return
		}
		IfInString, VAR9 , Inventory
		{
			if ENABLE_DEBUG_WORK = 1
				LV_Add("", "!! Work Inventory " VAR2 " " VAR3 " Looking")
			return
		}
	}
			
	If VAR6 = Duty
	{
		
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "!! Work Taxi Driver " VAR2 " " VAR3 " For " VAR12)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
	IfInString VAR7 , Vehicle
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "!! Work Taxi Driver " VAR2 " " VAR3 " For " VAR12)
		IfNotInString , WORKERS , %VAR2%
			WORKERS = %WORKERS% %VAR2% %a_space%
		return
	}
}	

if VAR2 = Bank
{
	if VAR4 = Balance:
	{				
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "# Bank Balance: "VAR5)			
		return
	}	
}

if VAR2 = Invalid
{
	if VAR3 = Option
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Invalid Option")
		return
	}
}

if VAR2 = UPS
{
	if VAR3 = Delivery
	{
		if VAR5 = Chosen
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# VAR3 = Ups")
			;gosub ups
			return
		}
		if VAR4 = -
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# UPS " VAR5 " " VAR6 " Has Package for you")
			;gosub ups
			return
		}
	}
}

if VAR2 = Food
{
	if VAR3 = Sales: 
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("","$ Stat Food Sales " VAR4 " Deliveries " VAR8)
		return
	}
}

if VAR4 = Dropped
{
	if VAR6 = Money
	{
		if ENABLE_DEBUG_MONEYBAG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Dropped A Money Bag " VAR10 " " VAR11 " " VAR12)
		return
	}
}

if VAR5 = Picked
{
	if VAR8 = Money
			{
		if ENABLE_DEBUG_MONEYBAG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Picked Up His Money Bag In " VAR11 " " VAR12 " " VAR13)
		return
	}
}
	
if VAR3 = Lived
{
	if VAR12 = Years
	{
		if ENABLE_DEBUG_BDAYS = 1
			LV_Add("","!! " VAR2 " " VAR3 " Lived " VAR6 " Days")
		HIM = VAR2
		gosub stshim
		return
	}
}



if VAR3 = Scratched
{
	if VAR6 = Ticket,
	{
		if ENABLE_DEBUG_TICKET = 1
			LV_Add("", "# Scratchy Ticket")
		return
	}
}

if VAR2 = Friday
{
	if VAR4 = Party
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Party at " VAR6 " " VAR7 " " VAR8)
		return
	}
}
if VAR3 = Friday
{
	if VAR5 = Party
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Party From Finished")
		return
	}
}
if VAR2 = Join
{
	if VAR4 = Party
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Party From " VAR7 " until " VAR10)
		return
	}
}

if VAR2 = Co-Owner
{
	if VAR3 = Properties:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Co-Owner Properties " VAR4)
		return
	}
}
if VAR2 = Biggest
{
	if VAR3 = Church
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Church Donation " VAR8 " " VAR10)
		return
	}
}
if VAR2 = House
{
	if VAR3 = Maid
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# House Maid " VAR4 " " VAR5 " Cleaned " VAR8 " House " VAR10 " " VAR11 " " VAR12 " " VAR13)
		IfNotInString , WORKERS , %VAR4%
			WORKERS = %WORKERS% %VAR4% %a_space%
		return
	}
}
if VAR2 = Lawsuit
{
	if VAR4 = Plaintiff:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Lawsuit " VAR5 " " VAR6 " Sued " VAR9 " " VAR10 " " VAR15)
		IfNotInString , WORKERS , %VAR5%
			WORKERS = %WORKERS% %VAR5% %a_space%
		return
	}
}
if VAR2 = Votes
{
	if VAR4 = Plaintiff:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Lawsuit Votes Plaintiff " VAR5 " Defendant " VAR12)
		return
	}
}


if VAR2 = Financial
{
	if VAR3 = Statement
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Financial Statement Cash " VAR10 " Bank " VAR16)
		return
	}
}
if VAR2 = Net
{
	if VAR3 = Profit:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Net Profit " VAR4)
		return
	}
}

if VAR2 = Income
{
	if VAR3 = Tax:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Income Tax " VAR4)
		return
	}
}
if VAR2 = Total
{
	if VAR3 = Tax:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Total Tax " VAR4 " Credits " VAR9 " Paid " VAR14)
		return
	}
}
if VAR2 = Paid
{
	if VAR3 = From
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Paid From Pocket " VAR5 " Bank " VAR10)
		return
	}
}
if VAR2 = Net
{
	if VAR3 = Profit
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Net Profit " VAR4)
		return
	}
}

if VAR2 = Selection
{
	IfInString, VAR3, Cancelled
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Selection Cancelled ")
		INMENU = 0
		return
	}
}
if VAR2 = Please
{
	if VAR3 = Wait
	{
		if VAR7 = Animation.
			SoundPlay *32
			return
		if VAR9 = Stripper
			SetTimer , strip, 15000	
		if VAR5 = Minutes
		{
		WAIT_TIME := VAR4*1000
			if ENABLE_DEBUG_WORK = 1
		LV_Add("", "# Help " VAR2 " Please Wait. " VAR4 " Result " WAIT_TIME)
		SetTimer , mission, %WAIT_TIME%
		return
		}

		LAGWAIT = 5000
		WAIT_MIN := VAR4*60000
		WAIT_SEC := VAR7*1000
		WAIT_TIME := WAIT_MIN+WAIT_SEC+LAGWAIT
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "# Help " VAR2 " Please Wait. " VAR4 " " VAR7 " Result " WAIT_TIME)
		SetTimer , mission, %WAIT_TIME%

		return
		
	}
	IfInString, VAR7, Animation
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Selection Cancelled ")
		return
	}
}
if VAR2 = Sent
{
	if VAR5 = Tip 
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Sent Tip " VAR4 " to " VAR7 " " VAR8 )
		return
	}
}
if VAR2 = Sales
{
	if VAR3 = Today: 
	{
		if ENABLE_DEBUG_WORK = 1
			LV_Add("", "$ Work Today " VAR4 " " VAR12)
		return
	}
}
if VAR2 = Vehicle
{
	if VAR3 = Alarm 
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "$ Vehicle Alarm " VAR4)
		ISALARMED = 0
		return
	}
}



if VAR2 = Challenge
{
	if VAR3 = Started!
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Challenge Started!")
		INCHAL = 1
		return
	}
}

if VAR2 = Civilians
{
	if VAR3 = Lose
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Civilians Lose Health On Police Property ")
		INPOLICE = 1
		return
	}
}
if VAR2 = Continuing
{
	if VAR3 = Current
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Continuing Current Delivery. ?")
		INDELIVERY = 1
		return
	}
}
if VAR2 = Cops
{
	if VAR5 = Donuts
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? Cops Eat Donuts")
		INDELIVERY = 1
		return
	}
}

if VAR2 = Could
{
	if VAR6 = Random
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("", "? Could Not Find A Random Location")
		INDELIVERY = 1
		return
	}
}
if VAR2 = Deposit
{
	if VAR3 = Confirmation:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Deposit Confirmation " VAR6 " Total " VAR11)

		return
	}
}
if VAR2 = Withdrawal
{
	if VAR3 = Confirmation:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Withdrawal Confirmation " VAR6 " Total " VAR11)

		return
	}
}

if VAR2 = Ejected
{
	if VAR5 = Regular
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Ejected From The Regular Players Club")
		return
	}
}


if VAR2 = Enter
{
	if VAR5 = Checkpoint
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Enter The Red Checkpoint to Jump.")
		return
	}
}

if VAR2 = Horse
{
	if VAR4 = Results:
	{
		if ENABLE_DEBUG_HORSE = 1
			LV_Add("", "# Horse Race Results " VAR5 " " VAR6 " " VAR7 " " VAR5 " " VAR5 " " VAR5)
		return
	}
}
if VAR2 = In
{
	if VAR4 = Russia,
	{
		if ENABLE_DEBUG_HORSE = 1
			LV_Add("", "# In Soviet Russia, Deer Kill You.")
		return
	}
}
if VAR2 = I
{
	if VAR4 = Feel
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# I Can Feel It Coming In The Air Tonight, Oh Lord.")
		return
	}
	if VAR4 = Want
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# I Don't Want Extra Police Attention")
		return
	}
}



if VAR2 = A
{
	if VAR3 = Wiper
	{
		if VAR4 = Strap
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# Wiper Strap is Being Installed On Your Vehicle")
			return
		}
	}
	if VAR3 = Previous
	{
		if VAR4 = Hit
		{
			if ENABLE_DEBUG_HELP = 1
				LV_Add("", "# Cannot Cancel Your Hit Contract on " VAR8 " " VAR9)
			return
		}
	}
	if VAR3 = Law
	{
		if VAR4 = Enforcement
		{
			if ENABLE_DEBUG_PLANT = 1
				LV_Add("", "# Law Enforcement Agent Has Found " VAR13)
			return
		}
	}
	if VAR3 = Hippie
	{
		if VAR6 = Trying
		{
			if ENABLE_DEBUG_PLANT = 1
				LV_Add("", "# Hippie Was Trying")
			return
		}
	}
	
	if VAR3 = Deer
	{
		if VAR5 = Eaten
		{
			if ENABLE_DEBUG_PLANT = 1
				LV_Add("", "# Deer Has Eaten Some Drugs " VAR12)
			return
		}
		if VAR5 = Killed
		{
			if ENABLE_DEBUG_PLANT = 1
				LV_Add("", "# Deer Has Killed " VAR6 " " VAR7)
			return
		}
		if VAR5 = Was
		{
			if ENABLE_DEBUG_PLANT = 1
				LV_Add("", "# Deer Was Trying")
			return
		}
	}
}



if VAR2 = {D6D631}/ar
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /ar")
		ISCRAZYBOBS = 1
		return
}
if VAR2 = {D6D631}/bk
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /bk")
		ISCRAZYBOBS = 1
		return
}
if VAR2 = {D6D631}/sell
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /sell")
		ISCRAZYBOBS = 1
		return
}
if VAR5 = {D6D631}/help
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /help")
		ISCRAZYBOBS = 1
		return
}
if VAR5 = {D6D631}/aoff
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /aoff")
		ISCRAZYBOBS = 1
		return
}
if VAR3 = /treat
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /trick or /treat")
		gosub trick
		return
}
if VAR4 = /treat
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /trick or /treat")
		gosub trick
		return
}
if VAR5 = /treat
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /trick or /treat")
		gosub trick
		return
}
if VAR3 = {D6D631}/cnrradio 
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /cnrradio")
		return
}

if VAR3 = {D6D631}/enter
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /enter")
		return
}
if VAR3 = /mission
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? /mission")
		return
}




if VAR2 = Congratulations,
{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? Award " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10)
		return
}
if VAR2 = Congratulations!
{
		if ENABLE_DEBUG_DICE = 1
			LV_Add("", "? Dice Win " VAR5 " From " VAR7 " " VAR8)
		return
}
if VAR2 = This
{
	if VAR3 = Vehicle
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? Vehicle is Locked ")
		return
	}
	if VAR3 = Nick
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? Award " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10)
		return
	}
}
if VAR2 = Audio
{
	if VAR3 = stream:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "? Audio stream " VAR4)
		return
	}
}
if VAR2 = Clothes
{
	if VAR4 = Tax:
	{
		if ENABLE_DEBUG_MONEY = 1
			LV_Add("", "$ Clothes Sales Tax " VAR5 " Out Of " VAR8)
		return
	}
}
if VAR3 = Traps
{
	if VAR6 = Enough
	{
		if ENABLE_DEBUG_PLANT = 1
			LV_Add("", "# Traps Lost No Plants Left")
		return
	}
}
if VAR3 = Traps
{
	if VAR6 = Enough
	{
		if ENABLE_DEBUG_PLANT = 1
			LV_Add("", "# Traps Lost No Plants Left")
		return
	}
}
if VAR2 = Killed
{
	if VAR3 = Unfairly
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Killed Unfairly - Continuing Current Life")
		return
	}
}
if VAR2 = Medical
{
	if VAR3 = Fees:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Killed Unfairly - Continuing Current Life")
		return
	}
}
if VAR4 = Not
{
	if VAR6 = Valid:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Help " VAR2 " Is Not A Valid Player.")
		LASTDICEFAIL = 1
		return
	}
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PET ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IfInString, VAR4 , Pet
{
	if ENABLE_DEBUG_PET = 1
		LV_Add("","# Pet Died " VAR2 " " VAR3 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 )
	;FileAppend ,%A_LoopReadLine%`n , %petlist%
	return
}
if IfInString, VAR5 , Pet
{
	if ENABLE_DEBUG_PET = 1
		LV_Add("","# Pet Died " VAR2 " " VAR3 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 )
	;FileAppend ,%A_LoopReadLine%`n , %petlist%
	return
}
IfInString, VAR8 , Pet
{
	if ENABLE_DEBUG_PET = 1
		LV_Add("","# Pet Died " VAR2 " " VAR3 " Killed " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 )
	;FileAppend ,%A_LoopReadLine%`n , %petlist%
	return
}


if VAR2 = Sold
{
	if ENABLE_DEBUG_PET = 1
		LV_Add("","# Pet Died " VAR2 " " VAR3 " Killed " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 )
	;FileAppend ,%A_LoopReadLine%`n , %soldlist%
	return
}






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IfInString , VAR2 , Complaint
{
		if ENABLE_DEBUG_COMPLAINT = 1
			LV_Add("","# Complaint About " VAR2 " " VAR3 " Sent")
		IfNotInString , COMPLAINT , %VAR2%
			COMPLAINT = %COMPLAINT% %VAR2% %a_space%
		;FileAppend ,%A_LoopReadLine%`n , %complaint%
		return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NoMatch ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


if VAR2S = *
{
	NEWMESTRING = %ADDLINE%
	if VAR6 = Joined
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "* Join: " VAR3 " " VAR4)
		JOINERS = %JOINERS% %VAR3% %A_Space%
		gosub CHECKIGNORE
		gosub WATCHLOGON
		return
	}
	if VAR6 = Left
	{
		if ENABLE_DEBUG_PLAYER = 1
		LV_Add("", "* Quit: " VAR3 " " VAR4)
		QUITTERS = %QUITTERS% %VAR3% %A_Space%
		if GIFTEE = %VAR3%
			SetTimer, givegift, off
		return
	}
	if VAR2 = **KICK:
	{
		if ENABLE_QUITJOIN = 1
			LV_Add("", "* Kick: " VAR3 " " VAR4)
		return
	}
	if VAR2 = **BAN:
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "* BAN " VAR3 " " VAR4)
		return
	}
	if VAR4 = Cries
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Cries " VAR2 " " VAR3)
		return
	}
	if VAR4 = Cries.
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Cries. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Waves
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Waves " VAR2 " " VAR3 " at " VAR6 " " VAR7 " " VAR8 )
		LASTWAVE = %VAR3%
		StringTrimLeft, LASTWAVE, LASTWAVE, 1
		StringTrimRight, LASTWAVE, LASTWAVE, 1
		IfInString, VAR2, [BOT]
			return
		if VAR6 = %Playername%
		if AUTOOFFERWAVE = 1
			SetTimer, offer , 1000
		return
	}
	if VAR4 = Flips
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Flips " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7 )
		return
	}
	if VAR4 = Wanks
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Wanks " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7 " " VAR8 )
		return
	}
	if VAR4 = Takes
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Piss " VAR2 " " VAR3)
		return
	}
	if VAR4 = Farts
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Farts " VAR2 " " VAR3)
		return
	}
	if VAR4 = Farts.
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Farts. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Prayer
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Prayer " VAR2 " " VAR3)
		return
	}
	if VAR4 = Exposes
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Exposes " VAR2 " " VAR3 " " VAR7 " " VAR8 )
		return
	}
	if VAR4 = Wanted
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Wanted " VAR2 " " VAR3)
		return
	}
	if VAR4 = Kicks
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Kicks" VAR2 " " VAR3 " " VAR5 " " VAR6 " Corpse")
		return
	}
	if VAR4 = Punches
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Punches " VAR2 " " VAR3 " " VAR5 " " VAR6 )
		return
	}
	if VAR4 = Says
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Pray " VAR2 " " VAR3)
		return
	}
	if VAR4 = Hides.
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Hides. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Takes
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Takes " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7)
		return
	}
	if VAR4 = Pisses
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Pisses " VAR2 " " VAR3 " " VAR6 " " VAR7)
		return
	}
	if VAR4 = Mourns
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Mourns " VAR2 " " VAR3 " " VAR8 " " VAR9 )
		return
	}
	if VAR4 = Bitch-Slaps
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! " VAR2 " " VAR3 "Bitch-Slaps " VAR5 " " VAR6)
		return
	}
	if VAR5 = Looking
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("","!! Looking at You " VAR2)
		return
	}
	return
}

NOMATCHPHRASELINES ++


StringTrimLeft , B_LoopReadLine , A_LoopReadLine, 11
if ENABLE_DEBUG_NOMATCH = 1
	LV_Add("","# No Match " A_LoopReadLine)
if FILTERNOMATCH = 1
FileAppend, %B_LoopReadLine%`n , %nomatch%
B_LoopReadLine =
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FILTER END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SCRIPT FUCNTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VARFIX:	
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
VARFIX = %OLDVAR%
VARFIX := RegExReplace(VARFIX, "[{][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][}]", "") 
NEWVAR = %VARFIX%
return

KEYBINDCHECK:
gosub SAMPDETECT
	if GAME = 0
		return
	if ENABLE_DEBUG_TICK = 1
	LV_Add("","- "A_ThisLabel " " BINDSOFF KEYDLTOGGLE KEYANTIPAUSEON KEYANIMATIONON KEYSKILLON KEYMENUON KEYPROGRAMON)
	Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
	hotkey ,$t ,		BIND_T 
	hotkey ,$`` ,	 	BIND_T 
	hotkey ,$enter , 	BIND_ENTER
if BINDSOFF = 0
	{
	if KEYFPSON=1
		hotkey ,$!TAB , FPSTAB
	if KEYFPSON=0
		hotkey ,$!TAB , ALTTAB
	if KEYDLTOGGLE = 1
		hotkey ,$CapsLock , BIND_CAPS 
	if KEYESCAPE = 1
	{
		hotkey ,$^esc , cancel 
		hotkey ,$!esc , gpsclear
	if KEYWINKEY = 1
	{
		Hotkey ,$LWin , BIND_WINKEY
	}
	
	if KEYANIMATIONON=1
	{
		;;Hotkey ,$!A, 
		Hotkey ,$!B, bribe
		;Hotkey ,$!C, 
		;;Hotkey ,$!D, 
		;Hotkey ,$!E, 
		Hotkey ,$!F, fuckoff
		;Hotkey ,$!G, 
		Hotkey ,$!I, pointup
		Hotkey ,$!H, hide
		Hotkey ,$!J, usedrugs
		Hotkey ,$!K, kiss
		Hotkey ,$!L, lean
		Hotkey ,$!M, mourn
		Hotkey ,$!N, noob
		Hotkey ,$!O, radio
		Hotkey ,$!P, piss
		;Hotkey ,$!Q, 
		Hotkey ,$!R, scratch
		;;Hotkey ,$!S0,
		Hotkey ,$!T, taichi	
		Hotkey ,$!U, point
		Hotkey ,$!V, wave
		;Hotkey ,$!W, 	
		Hotkey ,$!X, armcross
		Hotkey ,$!Y, cry 	
		Hotkey ,$!Z, sit

		Hotkey ,$^b, bail
		Hotkey ,$^c, courier
		Hotkey ,$^f, flower
		Hotkey ,$^g, giftspam
		Hotkey ,$^h, holdup
		Hotkey ,$^J, jaillist
		Hotkey ,$^L, shoplift
		Hotkey ,$^M, mission
		Hotkey ,$^r, robbery	
		Hotkey ,$^u, ups
		Hotkey ,$^v, vehrepair
		Hotkey ,$^;, stocks
		Hotkey ,$^', market
		Hotkey ,$!\ , closest
		Hotkey ,$^/, pill
	}
	if KEYSKILLON=1
	{
		Hotkey ,$!^B, clothesbuy
		Hotkey ,$!^C, clothes
		Hotkey ,$!^D, drugs
		Hotkey ,$!^F, food
		Hotkey ,$!^H, medic
		Hotkey ,$!^M, mech
		;Hotkey ,$!^P, prices
		Hotkey ,$!^R, robbery
		Hotkey ,$!^S, sex
		Hotkey ,$!^t, tip
		Hotkey ,$!^V, clothessell
		Hotkey ,$!^W, weapons
		Hotkey ,$!^I, items
		Hotkey ,$!^\, stsply
		Hotkey ,$!^/, info
		
		
		Hotkey ,$!^PGUP, accept
		Hotkey ,$!^PGDN, refuse
		Hotkey ,$APPSKEY , APPSKEY
		Hotkey ,$^!AppsKey, prices
		Hotkey ,$^!RWIN, sellmenumove
		Hotkey ,$^!LWIN, sellmenu
		Hotkey ,$+ENTER, tupenter
		Hotkey ,$^ENTER, lock
		Hotkey ,$!ENTER, unlock
	}
	if KEYMENUON=1
	{
		Hotkey ,$RWIN, buy
		Hotkey ,$^1, t1
		Hotkey ,$^2, t2
		Hotkey ,$^3, t3
		Hotkey ,$^4, t4
		Hotkey ,$^5, t5
		Hotkey ,$^6, t6
		Hotkey ,$^7, t7
		Hotkey ,$^8, t8
		Hotkey ,$^9, t9
		Hotkey ,$^0, t10
		Hotkey ,$!1, t11
		Hotkey ,$!2, t12
		Hotkey ,$!3, t13
		Hotkey ,$!4, t14
		Hotkey ,$!5, t15
		Hotkey ,$!6, t16
		Hotkey ,$!7, t17
		Hotkey ,$!8, t18
		Hotkey ,$!9, t19
		Hotkey ,$!0, t20
		Hotkey ,$!^1, t21
		Hotkey ,$!^2, t22
		Hotkey ,$!^3, t23
		Hotkey ,$!^4, t24
		Hotkey ,$!^5, t25
		Hotkey ,$!^6, t26
		Hotkey ,$!^7, t27
		Hotkey ,$!^8, t28
		Hotkey ,$!^9, t29
		Hotkey ,$!^0, t30
	}
	if KEYPROGRAMON=1
	{
		if F1E = 1
			Hotkey ,$F1, F1
		if F2E = 1
			Hotkey ,$F2, F2
		if F3E = 1
			Hotkey ,$F3, F3
		if F4E = 1
			Hotkey ,$F4, F4
		if F5E = 1
			Hotkey ,$F5, F5
		if F6E = 1
			Hotkey ,$F6, F6
		if F7E = 1
			Hotkey ,$F7, F7
		if F8E = 1
			Hotkey ,$F8, F8
		if F9E = 1
			Hotkey ,$F9, F9
		if F10E = 1
			Hotkey ,$F10, F10
		if F11E = 1
			Hotkey ,$F11, F11
		if F12E = 1
			Hotkey ,$F12, F12
	}
	
		if KEYPROGRAMON=1
		{
			BINDALL = %BIND1E%%a_space%%BIND2E%%a_space%%BIND3E%%a_space%%BIND4E%%a_space%%BIND5E%%a_space%%BIND6E%%a_space%%BIND7E%%a_space%%BIND8E%%a_space%%BIND9E%%a_space%%BIND10E%%a_space%%BIND11E%%a_space%%BIND12E%
			loop parse, BINDALL, %a_space% 
			{
					B_Index = $%A_Index%
					BIND_Index = BIND%A_Index%
					if B_Index = $10
						B_Index = $0
					if B_Index = $11
						B_Index = $-
					if B_Index = $12
						B_Index = $=
					Hotkey , %B_Index% , %BIND_Index% , 
			}

		}
	}
}
return
MyListView:
return
COLORSET:
	if ENABLE_DEBUG = 1
			LV_Add("","- " A_ThisLabel)
if COLOR1 is integer
	COLORN1 = %COLOR1%
if COLOR2 is integer
	COLORN2 = %COLOR2%
if COLOR1 = black
	COLORN1 =0
if COLOR1 = white
	COLORN1 =1
if COLOR1 = police car blue
	COLORN1 =2
if COLOR1 = cherry red
	COLORN1 =3
if COLOR1 = midnight blue
	COLORN1 =4
if COLOR1 = temple curtain purple
	COLORN1 =5
if COLOR1 = taxi yellow
	COLORN1 =6
if COLOR1 = striking blue
	COLORN1 =7
if COLOR1 = light blue grey
	COLORN1 =8
if COLOR1 = hoods
	COLORN1 =9
if COLOR1 = saxony blue 
	COLORN1 =10
if COLOR1 = concord blue 
	COLORN1 =11
if COLOR1 = jasper green
	COLORN1 =12
if COLOR1 = pewter gray 
	COLORN1 =13
if COLOR1 = frost white
	COLORN1 =14
if COLOR1 = silver stone 
	COLORN1 =15
if COLOR1 = rio red
	COLORN1 =16
if COLOR1 = torino red pearl
	COLORN1 =17
if COLOR1 = formula red
	COLORN1 =18
if COLOR1 = honey beige
	COLORN1 =19
if COLOR1 = mariner blue
	COLORN1 =20
if COLOR1 = blaze red
	COLORN1 =21
if COLOR1 = classic red
	COLORN1 =22
if COLOR1 = winning silver 
	COLORN1 =23
if COLOR1 = steel gray 
	COLORN1 =24
if COLOR1 = shadow silver 
	COLORN1 =25
if COLOR1 = silver stone 
	COLORN1 =26
if COLOR1 = warm grey mica
	COLORN1 =27
if COLOR1 = harbor blue 
	COLORN1 =28
if COLOR1 = porcelain silver 
	COLORN1 =29
if COLOR1 = mellow burgundy
	COLORN1 =30
if COLOR1 = graceful red mica
	COLORN1 =31
if COLOR1 = currant blue 
	COLORN1 =32
if COLOR1 = gray 
	COLORN1 =33
if COLOR1 = arctic white
	COLORN1 =34
if COLOR1 = anthracite gray 
	COLORN1 =35
if COLOR1 = black2 
	COLORN1 =36
if COLOR1 = dark green 
	COLORN1 =37
if COLOR1 = seafoam
	COLORN1 =38
if COLOR1 = diamond blue
	COLORN1 =39
if COLOR1 = biston brown
	COLORN1 =40
if COLOR1 = desert taupe
	COLORN1 =41
if COLOR1 = garnet red
	COLORN1 =42
if COLOR1 = desert red
	COLORN1 =43
if COLOR1 = green
	COLORN1 =44
if COLOR1 = cabernet red
	COLORN1 =45
if COLOR1 = light ivory
	COLORN1 =46
if COLOR1 = pueblo beige
	COLORN1 =47
if COLOR1 = smoke silver
	COLORN1 =48
if COLOR1 = astra silver
	COLORN1 =49
if COLOR1 = ascot gray
	COLORN1 =50
if COLOR1 = agate green
	COLORN1 =51
if COLOR1 = petrol blue green
	COLORN1 =52
if COLOR1 = surf blue
	COLORN1 =53
if COLOR1 = nautical blue
	COLORN1 =54
if COLOR1 = woodrose
	COLORN1 =55
if COLOR1 = crystal blue
	COLORN1 =56
if COLOR1 = bisque frost
	COLORN1 =57
if COLOR1 = currant red solid
	COLORN1 =58
if COLOR1 = lt.crystal blue
	COLORN1 =59
if COLOR1 = lt.titanium
	COLORN1 =60
if COLOR1 = race yellow solid
	COLORN1 =61
if COLOR1 = brt.currant red
	COLORN1 =62
if COLOR1 = clear crystal blue frost
	COLORN1 =63
if COLOR1 = silver
	COLORN1 =64
if COLOR1 = pastel alabaster
	COLORN1 =65
if COLOR1 = mid currant red
	COLORN1 =66
if COLOR1 = med regatta blue
	COLORN1 =67
if COLOR1 = oxford white solid
	COLORN1 =68
if COLOR1 = alabaster solid
	COLORN1 =69
if COLOR1 = elec.currant red
	COLORN1 =70
if COLOR1 = spinnaker blue solid
	COLORN1 =71
if COLOR1 = dk.titanium
	COLORN1 =72
if COLOR1 = pastel alabaster solid
	COLORN1 =73
if COLOR1 = med.cabernet solid
	COLORN1 =74
if COLOR1 = twilight blue
	COLORN1 =75
if COLOR1 = titanium frost
	COLORN1 =76
if COLOR1 = sandalwood frost
	COLORN1 =77
if COLOR1 = wild strawberry
	COLORN1 =78
if COLOR1 = ultra blue
	COLORN1 =79
if COLOR1 = vermilion solid
	COLORN1 =80
if COLOR1 = med.sandalwood
	COLORN1 =81
if COLOR1 = med.red solid
	COLORN1 =82
if COLOR1 =	deep jewel green
	COLORN1 =83
if COLOR1 = med.woodrose
	COLORN1 =84
if COLOR1 = vermillion solid
	COLORN1 =86
if COLOR1 = green
	COLORN1 =87
if COLOR1 =	bright blue
	COLORN1 =88
if COLOR1 = bright red
	COLORN1 =89
if COLOR1 = lt.champagne
	COLORN1 =90
if COLOR1 = silver2
	COLORN1 =91
if COLOR1 =	steel blue
	COLORN1 =92
if COLOR1 = medium gray
	COLORN1 =93
if COLOR1 = arctic pearl
	COLORN1 =94
if COLOR1 = nassau blue
	COLORN1 =95
if COLOR1 =	med.sapphire blue
	COLORN1 =96
if COLOR1 = silver3
	COLORN1 =97
if COLOR1 = lt.sapphire blue
	COLORN1 =98
if COLOR1 = malachite
	COLORN1 =99
if COLOR1 =	flax
	COLORN1 =100
if COLOR1 = med.maui blue
	COLORN1 =101
if COLOR1 =dk.sapphire blue
	COLORN1 =102
if COLOR1 = copper beige
	COLORN1 =103
if COLOR1 =	bright blue
	COLORN1 =104
if COLOR1 = med.flax
	COLORN1 =105
if COLOR1 = med.gray
	COLORN1 =106
if COLOR1 =	bright blue
	COLORN1 =107
if COLOR1 = lt.driftwood
	COLORN1 =108
if COLOR1 = blue
	COLORN1 =109
if COLOR1 =	steel gray
	COLORN1 =110
if COLOR1 = lt.beechwood
	COLORN1 =111
if COLOR1 = slate gray
	COLORN1 =112
if COLOR1 =	lt.sapphire blue
	COLORN1 =113
if COLOR1 = dk.beechwood
	COLORN1 =114
if COLOR1 = torch red
	COLORN1 =115
if COLOR1 =	bright red
	COLORN1 =116
if COLOR1 = med.sapphire blue firemist
	COLORN1 =117
if COLOR1 = med.garnet red 
	COLORN1 =118
if COLOR1 =	white diamond pearl
	COLORN1 =119
if COLOR1 = dk.sable
	COLORN1 =120
if COLOR1 =	antelope beige
	COLORN1 =121
if COLOR1 = brilliant red
	COLORN1 =122
if COLOR1 =	gun metal
	COLORN1 =122
if COLOR1 = med.beechwood
	COLORN1 =123
if COLOR1 =	brilliant red
	COLORN1 =124
if COLOR1 = bright blue 
	COLORN1 =125
if COLOR1 =	pink
	COLORN1 =126
if COLOR2 = black
	COLORN2 =0
if COLOR2 = white
	COLORN2 =1
if COLOR2 = police car blue
	COLORN2 =2
if COLOR2 = cherry red
	COLORN2 =3
if COLOR2 = midnight blue
	COLORN2 =4
if COLOR2 = temple curtain purple
	COLORN2 =5
if COLOR2 = taxi yellow
	COLORN2 =6
if COLOR2 = striking blue
	COLORN2 =7
if COLOR2 = light blue grey
	COLORN2 =8
if COLOR2 = hoods
	COLORN2 =9
if COLOR2 = saxony blue 
	COLORN2 =10
if COLOR2 = concord blue 
	COLORN2 =11
if COLOR2 = jasper green
	COLORN2 =12
if COLOR2 = pewter gray 
	COLORN2 =13
if COLOR2 = frost white
	COLORN2 =14
if COLOR2 = silver stone 
	COLORN2 =15
if COLOR2 = rio red
	COLORN2 =16
if COLOR2 = torino red pearl
	COLORN2 =17
if COLOR2 = formula red
	COLORN2 =18
if COLOR2 = honey beige
	COLORN2 =19
if COLOR2 = mariner blue
	COLORN2 =20
if COLOR2 = blaze red
	COLORN2 =21
if COLOR2 = classic red
	COLORN2 =22
if COLOR2 = winning silver 
	COLORN2 =23
if COLOR2 = steel gray 
	COLORN2 =24
if COLOR2 = shadow silver 
	COLORN2 =25
if COLOR2 = silver stone 
	COLORN2 =26
if COLOR2 = warm grey mica
	COLORN2 =27
if COLOR2 = harbor blue 
	COLORN2 =28
if COLOR2 = porcelain silver 
	COLORN2 =29
if COLOR2 = mellow burgundy
	COLORN2 =30
if COLOR2 = graceful red mica
	COLORN2 =31
if COLOR2 = currant blue 
	COLORN2 =32
if COLOR2 = gray 
	COLORN2 =33
if COLOR2 = arctic white
	COLORN2 =34
if COLOR2 = anthracite gray 
	COLORN2 =35
if COLOR2 = black2 
	COLORN2 =36
if COLOR2 = dark green 
	COLORN2 =37
if COLOR2 = seafoam
	COLORN2 =38
if COLOR2 = diamond blue
	COLORN2 =39
if COLOR2 = biston brown
	COLORN2 =40
if COLOR2 = desert taupe
	COLORN2 =41
if COLOR2 = garnet red
	COLORN2 =42
if COLOR2 = desert red
	COLORN2 =43
if COLOR2 = green
	COLORN2 =44
if COLOR2 = cabernet red
	COLORN2 =45
if COLOR2 = light ivory
	COLORN2 =46
if COLOR2 = pueblo beige
	COLORN2 =47
if COLOR2 = smoke silver
	COLORN2 =48
if COLOR2 = astra silver
	COLORN2 =49
if COLOR2 = ascot gray
	COLORN2 =50
if COLOR2 = agate green
	COLORN2 =51
if COLOR2 = petrol blue green
	COLORN2 =52
if COLOR2 = surf blue
	COLORN2 =53
if COLOR2 = nautical blue
	COLORN2 =54
if COLOR2 = woodrose
	COLORN2 =55
if COLOR2 = crystal blue
	COLORN2 =56
if COLOR2 = bisque frost
	COLORN2 =57
if COLOR2 = currant red solid
	COLORN2 =58
if COLOR2 = lt.crystal blue
	COLORN2 =59
if COLOR2 = lt.titanium
	COLORN2 =60
if COLOR2 = race yellow solid
	COLORN2 =61
if COLOR2 = brt.currant red
	COLORN2 =62
if COLOR2 = clear crystal blue frost
	COLORN2 =63
if COLOR2 = silver
	COLORN2 =64
if COLOR2 = pastel alabaster
	COLORN2 =65
if COLOR2 = mid currant red
	COLORN2 =66
if COLOR2 = med regatta blue
	COLORN2 =67
if COLOR2 = oxford white solid
	COLORN2 =68
if COLOR2 = alabaster solid
	COLORN2 =69
if COLOR2 = elec.currant red
	COLORN2 =70
if COLOR2 = spinnaker blue solid
	COLORN2 =71
if COLOR2 = dk.titanium
	COLORN2 =72
if COLOR2 = pastel alabaster solid
	COLORN2 =73
if COLOR2 = med.cabernet solid
	COLORN2 =74
if COLOR2 = twilight blue
	COLORN2 =75
if COLOR2 = titanium frost
	COLORN2 =76
if COLOR2 = sandalwood frost
	COLORN2 =77
if COLOR2 = wild strawberry
	COLORN2 =78
if COLOR2 = ultra blue
	COLORN2 =79
if COLOR2 = vermilion solid
	COLORN2 =80
if COLOR2 = med.sandalwood
	COLORN2 =81
if COLOR2 = med.red solid
	COLORN2 =82
if COLOR2 =	deep jewel green
	COLORN2 =83
if COLOR2 = med.woodrose
	COLORN2 =84
if COLOR2 =vermillion solid
	COLORN2 =86
if COLOR2 = green
	COLORN2 =87
if COLOR2 =	bright blue
	COLORN2 =88
if COLOR2 = bright red
	COLORN2 =89
if COLOR2 = lt.champagne
	COLORN2 =90
if COLOR2 = silver2
	COLORN2 =91
if COLOR2 =	steel blue
	COLORN2 =92
if COLOR2 = medium gray
	COLORN2 =93
if COLOR2 = arctic pearl
	COLORN2 =94
if COLOR2 = nassau blue
	COLORN2 =95
if COLOR2 =	med.sapphire blue
	COLORN2 =96
if COLOR2 = silver3
	COLORN2 =97
if COLOR2 = lt.sapphire blue
	COLORN2 =98
if COLOR2 = malachite
	COLORN2 =99
if COLOR2 =	flax
	COLORN2 =100
if COLOR2 = med.maui blue
	COLORN2 =101
if COLOR2 =dk.sapphire blue
	COLORN2 =102
if COLOR2 = copper beige
	COLORN2 =103
if COLOR2 =	bright blue
	COLORN2 =104
if COLOR2 = med.flax
	COLORN2 =105
if COLOR2 = med.gray
	COLORN2 =106
if COLOR2 =	bright blue
	COLORN2 =107
if COLOR2 = lt.driftwood
	COLORN2 =108
if COLOR2 = blue
	COLORN2 =109
if COLOR2 =	steel gray
	COLORN2 =110
if COLOR2 = lt.beechwood
	COLORN2 =111
if COLOR2 = slate gray
	COLORN2 =112
if COLOR2 =	lt.sapphire blue
	COLORN2 =113
if COLOR2 = dk.beechwood
	COLORN2 =114
if COLOR2 = torch red
	COLORN2 =115
if COLOR2 =	bright red
	COLORN2 =116
if COLOR2 = med.sapphire blue firemist
	COLORN2 =117
if COLOR2 = med.garnet red 
	COLORN2 =118
if COLOR2 =	white diamond pearl
	COLORN2 =119
if COLOR2 = dk.sable
	COLORN2 =120
if COLOR2 =	antelope beige
	COLORN2 =121
if COLOR2 = brilliant red
	COLORN2 =122
if COLOR2 =	gun metal
	COLORN2 =122
if COLOR2 = med.beechwood
	COLORN2 =123
if COLOR2 =	brilliant red
	COLORN2 =124
if COLOR2 = bright blue 
	COLORN2 =125
if COLOR2 =	pink
	COLORN2 =126

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INI;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INIWRITE:
If ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gosub FISHSAVE
;[GUI]
INIWRITE, %GUIFONT%, %inifile%, 	GUI, GUIFONT
INIWRITE, %SERVER1%, %inifile%, 	GUI, SERVER1
INIWRITE, %SERVER2%, %inifile%, 	GUI, SERVER2
INIWRITE, %X%, 		 %inifile%,		GUI, X
INIWRITE, %Y%, 		 %inifile%,		GUI, Y
INIWRITE, %Width%, 	 %inifile%,		GUI, Width
INIWRITE, %Height%,  %inifile%,		GUI, Height
;[SETTINGS]
INIWRITE, %NAME%,  %inifile%, 			SETTINGS, Name
INIWRITE, %FPSLOW%, %inifile%, 			SETTINGS, FPSLOW
INIWRITE, %FPSHIGH%, %inifile%, 		SETTINGS, FPSHIGH
INIWRITE, %COLOR1%, %inifile%, 			SETTINGS, COLOR1
INIWRITE, %COLOR2%, %inifile%, 			SETTINGS, COLOR2
INIWRITE, %PLAYDICEAMOUNT%, %inifile%, 	SETTINGS, PLAYDICEAMOUNT
INIWRITE, %TAKEDRUGSAMOUNT%, %inifile%, 	SETTINGS, TAKEDRUGSAMOUNT

INIWRITE, %BRIBEAMOUNT%, %inifile%, 	SETTINGS, BRIBEAMOUNT
INIWRITE, %GUILOTTO%, %inifile%, 		SETTINGS, GUILOTTO
INIWRITE, %READCHATON%, %inifile%, 		SETTINGS, READCHATON
INIWRITE, %DISPLAYNOCHAT%, %inifile%, 	SETTINGS, DISPLAYNOCHAT
INIWRITE, %OUTPUTJOURNALON%, %inifile%,	SETTINGS, OUTPUTJOURNALON
INIWRITE, %KEYPROGRAMON%, %inifile%, 	SETTINGS, KEYPROGRAMON
INIWRITE, %KEYANIMATIONON%, %inifile%, 	SETTINGS, KEYANIMATIONON
INIWRITE, %KEYSKILLON%, %inifile%, 		SETTINGS, KEYSKILLON
INIWRITE, %KEYMENUON%, %inifile%, 		SETTINGS, KEYMENUON
INIWRITE, %KEYFPSON% , %inifile%, 		SETTINGS, KEYFPSON 
INIWRITE, %KEYANTIPAUSEON%, %inifile%,  SETTINGS, KEYANTIPAUSEON
INIWRITE, %KEYDLTOGGLE%, %inifile%, 	SETTINGS, KEYDLTOGGLE
INIWRITE, %KEYWINKEY%, %inifile%, 	SETTINGS, KEYWINKEY


;[AUTOMATION]
INIWRITE, %AUTOLOGONON%, %inifile%, 	AUTOMATION, AUTOLOGONON
INIWRITE, %AUTOGPSMISSION%, %inifile%, 	AUTOMATION, AUTOGPSMISSION
INIWRITE, %AUTOTRUCKING%, %inifile%, 	AUTOMATION, AUTOTRUCKING
INIWRITE, %AUTOFOODMISSION%, %inifile%, AUTOMATION, AUTOFOODMISSION
INIWRITE, %AUTOTRASHDMISSION%, %inifile%, AUTOMATION, AUTOTRASHMISSION
INIWRITE, %AUTOOFFERWAVE%, %inifile%, 	AUTOMATION, AUTOOFFERWAVE
INIWRITE, %AUTOCNRRADIO%, %inifile%, 	AUTOMATION, AUTOCNRRADIO
INIWRITE, %AUTTOACCEPTOFFER%, %inifile%,AUTOMATION, AUTTOACCEPTOFFER
INIWRITE, %AUTOHOUSEON%, %inifile%, 	AUTOMATION, AUTOHOUSEON
INIWRITE, %AUTOHOUSESTOREON%, %inifile%, AUTOMATION, AUTOHOUSESTOREON
INIWRITE, %AUTOJURYON%, %inifile%, 		AUTOMATION, AUTOJURYON
INIWRITE, %AUTOBONUSON%, %inifile%, 	AUTOMATION, AUTOBONUSON
INIWRITE, %AUTODRUGSON%, %inifile%, 	AUTOMATION, AUTODRUGSON
INIWRITE, %AUTOLOTTOON%, %inifile%, 	AUTOMATION, AUTOLOTTOON
INIWRITE, %AUTOTICKETON%, %inifile%, 	AUTOMATION, AUTOTICKETON
INIWRITE, %AUTOCOLORON%, %inifile%, 	AUTOMATION, AUTOCOLORON
INIWRITE, %AUTOPLAYDICE%, %inifile%,	AUTOMATION, AUTOPLAYDICE
INIWRITE, %AUTOPLAYASKEDICE%, %inifile%,AUTOMATION, AUTOPLAYASKEDICE
INIWRITE, %AUTOFISHON%, %inifile%, 		AUTOMATION, AUTOFISHON
INIWRITE, %AUTOTHROWON%, %inifile%, 	AUTOMATION, AUTOTHROWON
INIWRITE, %AUTOFISHDISPLAY%, %inifile%, AUTOMATION, AUTOFISHDISPLAY
INIWRITE, %AUTOGPSCARSELL%, %inifile%, AUTOMATION, AUTOGPSCARSELL
;[STATS]
INIWRITE, %SHOWSTOCKS%, %inifile%, 		STATS, SHOWSTOCKS
INIWRITE, %SHOWWORKERS%, %inifile%, 	STATS, SHOWWORKERS
INIWRITE, %SHOWMURDERS%, %inifile%, 	STATS, SHOWMURDERS
INIWRITE, %SHOWDEATHS%, %inifile%, 		STATS, SHOWDEATHS
INIWRITE, %SHOWARRESTED%, %inifile%, 	STATS, SHOWARRESTED
INIWRITE, %SHOWJOINERS%, %inifile%, 	STATS, SHOWJOINERS
INIWRITE, %SHOWQUITERS%, %inifile%, 	STATS, SHOWQUITERS
INIWRITE, %SHOWFISH%, %inifile%, 		STATS, SHOWFISH
;[DEBUG]
INIWRITE, %SEARCHDRIVE%, %inifile%, 			DEBUG, SEARCHDRIVE
INIWRITE, %MAXLISTVIEW%, %inifile%, 			DEBUG, MAXLISTVIEW
INIWRITE, %ENABLE_DEBUG%, %inifile%, 			DEBUG, ENABLE_DEBUG
INIWRITE, %ENABLE_DEBUG_FISH%, %inifile%,		DEBUG, ENABLE_DEBUG_FISH
INIWRITE, %ENABLE_DEBUG_DEAD%, %inifile%, 		DEBUG, ENABLE_DEBUG_DEAD
INIWRITE, %ENABLE_DEBUG_MONEY%, %inifile%, 		DEBUG, ENABLE_DEBUG_MONEY
INIWRITE, %ENABLE_DEBUG_GPS%, %inifile%, 		DEBUG, ENABLE_DEBUG_GPS
INIWRITE, %ENABLE_DEBUG_HELP%, %inifile%, 		DEBUG, ENABLE_DEBUG_HELP
INIWRITE, %ENABLE_DEBUG_NOMATCH%, %inifile%,	DEBUG, ENABLE_DEBUG_NOMATCH
INIWRITE, %ENABLE_DEBUG_JURY%, %inifile%, 		DEBUG, ENABLE_DEBUG_JURY
INIWRITE, %ENABLE_DEBUG_LOTTO%, %inifile%, 		DEBUG, ENABLE_DEBUG_LOTTO
;INIWRITE, %ENABLE_DEBUG_TIME%, %inifile%, 		DEBUG, ENABLE_DEBUG_TIME
INIWRITE, %ENABLE_DEBUG_CRIME%, %inifile%, 		DEBUG, ENABLE_DEBUG_CRIME
INIWRITE, %ENABLE_DEBUG_WORK%, %inifile%, 		DEBUG, ENABLE_DEBUG_WORK
INIWRITE, %ENABLE_DEBUG_STOCK%, %inifile%, 		DEBUG, ENABLE_DEBUG_STOCK
INIWRITE, %ENABLE_DEBUG_PM%, %inifile%, 		DEBUG, ENABLE_DEBUG_PM
INIWRITE, %ENABLE_DEBUG_MSG%, %inifile%, 		DEBUG, ENABLE_DEBUG_MSG
INIWRITE, %ENABLE_DEBUG_DICE%, %inifile%, 		DEBUG, ENABLE_DEBUG_DICE
INIWRITE, %ENABLE_DEBUG_TIMESTAT%, %inifile%, 	DEBUG, ENABLE_DEBUG_TIMESTAT
INIWRITE, %ENABLE_DEBUG_FLOWER%, %inifile%, 	DEBUG, ENABLE_DEBUG_FLOWER
INIWRITE, %ENABLE_DEBUG_SERVER%, %inifile%, 	DEBUG, ENABLE_DEBUG_SERVER
INIWRITE, %ENABLE_DEBUG_BONUS%, %inifile%, 		DEBUG, ENABLE_DEBUG_BONUS
INIWRITE, %ENABLE_DEBUG_CRIME%, %inifile%, 		DEBUG, ENABLE_DEBUG_CRIME
INIWRITE, %ENABLE_DEBUG_WHISPER%, %inifile%, 	DEBUG, ENABLE_DEBUG_WHISPER
INIWRITE, %ENABLE_DEBUG_DISPATCH%, %inifile%, 	DEBUG, ENABLE_DEBUG_DISPATCH
INIWRITE, %ENABLE_DEBUG_CRIMEREPORT%, %inifile%, DEBUG, ENABLE_DEBUG_CRIMEREPORT
INIWRITE, %ENABLE_DEBUG_CNR%, %inifile%, 		DEBUG, ENABLE_DEBUG_CNR
INIWRITE, %ENABLE_DEBUG_SERVER%, %inifile%, 	DEBUG, ENABLE_DEBUG_SERVER
INIWRITE, %ENABLE_DEBUG_HOUSE%, %inifile%, 		DEBUG, ENABLE_DEBUG_HOUSE
INIWRITE, %ENABLE_DEBUG_VEHICLE%, %inifile%, 	DEBUG, ENABLE_DEBUG_VEHICLE
INIWRITE, %ENABLE_DEBUG_PLAYER%, %inifile%, 	DEBUG, ENABLE_DEBUG_PLAYER
INIWRITE, %ENABLE_DEBUG_VENDOR%, %inifile%, 	DEBUG, ENABLE_DEBUG_VENDOR
INIWRITE, %ENABLE_DEBUG_MONEYBAG%, %inifile%, 	DEBUG, ENABLE_DEBUG_MONEYBAG
INIWRITE, %ENABLE_DEBUG_BDAYS%, %inifile%, 		DEBUG, ENABLE_DEBUG_BDAYS
INIWRITE, %ENABLE_DEBUG_GPS%, %inifile%, 		DEBUG, ENABLE_DEBUG_GPS
INIWRITE, %ENABLE_DEBUG_PURCHASE%, %inifile%, 	DEBUG, ENABLE_DEBUG_PURCHASE
INIWRITE, %ENABLE_DEBUG_DELIVERY%, %inifile%, 	DEBUG, ENABLE_DEBUG_DELIVERY
INIWRITE, %ENABLE_DEBUG_PET%, %inifile%, 		DEBUG, ENABLE_DEBUG_PET
INIWRITE, %ENABLE_DEBUG_DRIVER%, %inifile%, 	DEBUG, ENABLE_DEBUG_DRIVER
INIWRITE, %ENABLE_DEBUG_WELFARE%, %inifile%, 	DEBUG, ENABLE_DEBUG_WELFARE

;[Keybinds]
INIWRITE, %BINDSOFF%, %inifile%, 	Keybinds	, BINDSOFF
INIWRITE, %F1E%, %inifile%, 		Keybinds ,  F1Enabled
INIWRITE, %F2E%, %inifile%, 		Keybinds ,  F2Enabled
INIWRITE, %F3E%, %inifile%, 		Keybinds ,  F3Enabled
INIWRITE, %F4E%, %inifile%, 		Keybinds ,  F4Enabled
INIWRITE, %F5E%, %inifile%, 		Keybinds ,  F5Enabled
INIWRITE, %F6E%, %inifile%, 		Keybinds ,  F6Enabled
INIWRITE, %F7E%, %inifile%, 		Keybinds ,  F7Enabled
INIWRITE, %F8E%, %inifile%, 		Keybinds ,  F8Enabled
INIWRITE, %F9E%, %inifile%, 		Keybinds ,  F9Enabled
INIWRITE, %F10E%, %inifile%, 		Keybinds , F10Enabled
INIWRITE, %F11E%, %inifile%, 		Keybinds , F11Enabled
INIWRITE, %F12E%, %inifile%, 		Keybinds , F12Enabled
INIWRITE, %F1%, %inifile%, 			Keybinds	, F1Bind
INIWRITE, %F2%, %inifile%, 			Keybinds	, F2Bind
INIWRITE, %F3%, %inifile%, 			Keybinds	, F3Bind
INIWRITE, %F4%, %inifile%, 			Keybinds	, F4Bind
INIWRITE, %F5%, %inifile%, 			Keybinds	, F5Bind
INIWRITE, %F6%, %inifile%, 			Keybinds	, F6Bind
INIWRITE, %F7%, %inifile%, 			Keybinds	, F7Bind
INIWRITE, %F8%, %inifile%, 			Keybinds	, F8Bind
INIWRITE, %F9%, %inifile%, 			Keybinds	, F9Bind
INIWRITE, %F10%, %inifile%, 		Keybinds	, F10Bind
INIWRITE, %F11%, %inifile%, 		Keybinds	, F11Bind
INIWRITE, %F12%, %inifile%, 		Keybinds	, F12Bind

INIWRITE, %BIND1E%, %inifile%, 		Keybinds ,  BIND1Enabled
INIWRITE, %BIND2E%, %inifile%, 		Keybinds ,  BIND2Enabled
INIWRITE, %BIND3E%, %inifile%, 		Keybinds ,  BIND3Enabled
INIWRITE, %BIND4E%, %inifile%, 		Keybinds ,  BIND4Enabled
INIWRITE, %BIND5E%, %inifile%, 		Keybinds ,  BIND5Enabled
INIWRITE, %BIND6E%, %inifile%, 		Keybinds ,  BIND6Enabled
INIWRITE, %BIND7E%, %inifile%, 		Keybinds ,  BIND7Enabled
INIWRITE, %BIND8E%, %inifile%, 		Keybinds ,  BIND8Enabled
INIWRITE, %BIND9E%, %inifile%, 		Keybinds ,  BIND9Enabled
INIWRITE, %BIND10E%, %inifile%, 	Keybinds , BIND10Enabled
INIWRITE, %BIND11E%, %inifile%, 	Keybinds , BIND11Enabled
INIWRITE, %BIND12E%, %inifile%, 	Keybinds , BIND12Enabled
INIWRITE, %BIND1%, %inifile%, 		Keybinds	, BIND1Bind
INIWRITE, %BIND2%, %inifile%, 		Keybinds	, BIND2Bind
INIWRITE, %BIND3%, %inifile%, 		Keybinds	, BIND3Bind
INIWRITE, %BIND4%, %inifile%, 		Keybinds	, BIND4Bind
INIWRITE, %BIND5%, %inifile%, 		Keybinds	, BIND5Bind
INIWRITE, %BIND6%, %inifile%, 		Keybinds	, BIND6Bind
INIWRITE, %BIND7%, %inifile%, 		Keybinds	, BIND7Bind
INIWRITE, %BIND8%, %inifile%, 		Keybinds	, BIND8Bind
INIWRITE, %BIND9%, %inifile%, 		Keybinds	, BIND9Bind
INIWRITE, %BIND10%, %inifile%, 		Keybinds	, BIND10Bind
INIWRITE, %BIND11%, %inifile%, 		Keybinds	, BIND11Bind
INIWRITE, %BIND12%, %inifile%, 		Keybinds	, BIND12Bind

;[Performance]
INIWRITE, %SLEEPLINECOUNT%, %inifile%, 	PERFOMANCE, SLEEPLINECOUNT
INIWRITE, %SLEEPLOGSIZE%, %inifile%, 	PERFOMANCE, SLEEPLOGSIZE
INIWRITE, %SLEEPTOSLOW%, %inifile%, 	PERFOMANCE, SLEEPTOSLOW
INIWRITE, %SLEEPTOWAKE%, %inifile%, 	PERFOMANCE, SLEEPTOWAKE
INIWRITE, %SLEEPKILLMULTI%, %inifile%, 	PERFOMANCE, SLEEPKILLMULTI
INIWRITE, %SLEEPDETECT%, %inifile%, 	PERFOMANCE, SLEEPDETECT
INIWRITE,  %SLEEPTOLOG%, %inifile%, 	PERFOMANCE, SLEEPTOLOG
INIWRITE, %SLEEPIGNORE%, %inifile%, 	PERFOMANCE, SLEEPIGNORE
INIWRITE, %SCROLLRATE%, %inifile%, 		PERFOMANCE, SCROLLRATE
INIWRITE, %Lv_Modifycol%, %inifile%, 	PERFOMANCE, Lv_Modifycol
INIWRITE, %KEYBINDCHECK%, %inifile%, 	PERFOMANCE, KEYBINDCHECK
INIWRITE, %READLOG%, %inifile%, 		PERFOMANCE, READLOG
INIWRITE, %FILTERNOMATCH%, %inifile%, 	PERFOMANCE, FILTERNOMATCH

;[FILES]
INIWRITE, %logfile%, %inifile%, 	FILES, logfile
INIWRITE, %logdir%, %inifile%, 		FILES, logdir
INIWRITE, %history%, %inifile%, 	FILES, history
INIWRITE, %whitelist%, %inifile%, 	FILES, whitelist
INIWRITE, %blacklist%, %inifile%, 	FILES, blacklist
return

INIREAD:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gosub fishread
RegRead, Playername, HKCU, Software\SAMP\ , PlayerName
RegRead, sadir, HKCU, Software\SAMP , gta_sa_exe
SplitPath, sadir ,, samp, , , sadrv
INIREAD, COLORLIST, %inifile%, GUI, COLORLIST, black|white|police car blue|cherry red|midnight blue|temple curtain purple|taxi yellow|striking blue|light blue grey|hoods|saxony blue|concord blue|jasper green |pewter gray|frost white|silver stone|rio red|torino red pearl|formula red|honey beige|mariner blue|blaze red|classic red|winning silver|steel gray|shadow silver|silver stone|warm grey mica|harbor blue|porcelain silver|mellow burgundy|graceful red mica|currant blue|gray|arctic white|anthracite gray|black2|dark green|seafoam|diamond blue biston brown|desert taupe|garnet red|desert red|green|cabernet red|light ivory|pueblo beige|smoke silver|astra silver|ascot gray|agate green|petrol blue green|surf blue|nautical blue|woodrose|crystal blue|bisque frost|currant red solid|lt.crystal blue|lt.titanium|race yellow solid|brt.currant red|clear crystal blue frost|silver|pastel alabaster|mid currant red|med regatta blue|oxford white solid|alabaster solid|elec.currant red|spinnaker blue solid|dk.titanium|pastel alabaster solid|med.cabernet solid|twilight blue|titanium frost|sandalwood frost|wild strawberry|ultra blue|vermilion solid|med.sandalwood|med.red solid|deep jewel green|med.woodrose|vermillion solid|green|bright blue|bright red|lt.champagne|silver2|steel blue|medium gray|arctic pearl|nassau blue|med.sapphire blue|silver3|lt.sapphire blue|malachite|flax|med.maui blue|dk.sapphire blue|copper beige|bright blue|med.flax|med.gray|bright blue|lt.driftwood|blue|steel gray|lt.beechwood|slate gray|lt.sapphire blue|dk.beechwood|torch red|bright red|med.sapphire blue firemist|med.garnet red|white diamond pearl|dk.sable|antelope beige|brilliant red|gun metal|med.beechwood|brilliant red|bright blue|pink

;[GUI]
INIREAD, GUIFONT, %inifile%, 		GUI, GUIFONT, 12
INIREAD, SERVER1, %inifile%, 		GUI, SERVER1, 50.31.100.10:7788
INIREAD, SERVER2, %inifile%, 		GUI, SERVER2, 50.31.100.10:7799
INIREAD, X, 		 %inifile%,		GUI,  X, 100
INIREAD, Y, 		 %inifile%,		GUI,  Y, 100
INIREAD, Width, 	 %inifile%,		GUI, Width , 700
INIREAD, Height,  %inifile%,		GUI, Height , 300

;[SETTINGS]
INIREAD, NAME,  %inifile%, 				SETTINGS, Name 				, billman87
INIREAD, FPSLOW, %inifile%, 			SETTINGS, FPSLOW			, 25
INIREAD, FPSHIGH, %inifile%, 			SETTINGS, FPSHIGH			, 59
INIREAD, COLOR1, %inifile%, 			SETTINGS, COLOR1			, Black
INIREAD, COLOR2, %inifile%, 			SETTINGS, COLOR2			, White

INIREAD, TAKEDRUGSAMOUNT, %inifile%, 	SETTINGS, TAKEDRUGSAMOUNT	, 25 
INIREAD, PLAYDICEAMOUNT, %inifile%, 	SETTINGS, PLAYDICEAMOUNT	, 10000 
INIREAD, BRIBEAMOUNT, %inifile%, 		SETTINGS, BRIBEAMOUNT		, 15000 
INIREAD, GUILOTTO, %inifile%, 			SETTINGS, GUILOTTO			, 0
INIREAD, READCHATON, %inifile%, 		SETTINGS, READCHATON		, 1
INIREAD, DISPLAYNOCHAT, %inifile%, 		SETTINGS, DISPLAYNOCHAT		, 0
INIREAD, OUTPUTJOURNALON, %inifile%,	SETTINGS, OUTPUTJOURNALON	, 0

;[KEYBINDS]
INIREAD, KEYPROGRAMON, %inifile%, 		SETTINGS, KEYPROGRAMON		, 1
INIREAD, KEYANIMATIONON, %inifile%, 	SETTINGS, KEYANIMATIONON	, 1
INIREAD, KEYSKILLON, %inifile%, 		SETTINGS, KEYSKILLON		, 1
INIREAD, KEYSKILLON, %inifile%, 		SETTINGS, KEYSKILLON		, 1
INIREAD, KEYMENUON, %inifile%, 			SETTINGS, KEYMENUON			, 1
INIREAD, KEYFPSON , %inifile%, 			SETTINGS, KEYFPSON 			, 0
INIREAD, KEYANTIPAUSEON, %inifile%,  	SETTINGS, KEYANTIPAUSEON	, 0
INIREAD, KEYDLTOGGLE, %inifile%, 		SETTINGS, KEYDLTOGGLE		, 0
INIREAD, KEYWINKEY, %inifile%, 			SETTINGS, KEYWINKEY		, 0

;[AUTOMATION]
INIREAD, AUTOLOGONON, %inifile%, 		AUTOMATION, AUTOLOGONON			, 1
INIREAD, AUTOTRUCKING, %inifile%, 		AUTOMATION, AUTOTRUCKING		, 1
INIREAD, AUTOGPSMISSION, %inifile%, 	AUTOMATION, AUTOGPSMISSION		, 1
INIREAD, AUTOFOODMISSION, %inifile%, 	AUTOMATION, AUTOFOODMISSION		, 0
INIREAD, AUTOTRASHMISSION, %inifile%, 	AUTOMATION, AUTOTRASHMISSION	, 0
INIREAD, AUTOOFFERWAVE, %inifile%, 		AUTOMATION, AUTOOFFERWAVE		, 0
INIREAD, AUTOCNRRADIO, %inifile%, 		AUTOMATION, AUTOCNRRADIO		, 0
INIREAD, AUTTOACCEPTOFFER, %inifile%,	AUTOMATION, AUTTOACCEPTOFFER	, 0
INIREAD, AUTOHOUSEON, %inifile%, 		AUTOMATION, AUTOHOUSEON			, 1
INIREAD, AUTOHOUSESTOREON, %inifile%,	AUTOMATION, AUTOHOUSESTOREON	, 1
INIREAD, AUTOJURYON, %inifile%, 		AUTOMATION, AUTOJURYON			, 0
INIREAD, AUTOBONUSON, %inifile%, 		AUTOMATION, AUTOBONUSON			, 0
INIREAD, AUTODRUGSON, %inifile%, 		AUTOMATION, AUTODRUGSON			, 0
INIREAD, AUTOLOTTOON, %inifile%, 		AUTOMATION, AUTOLOTTOON			, 1
INIREAD, AUTOTICKETON, %inifile%, 		AUTOMATION, AUTOTICKETON		, 1
INIREAD, AUTOCOLORON, %inifile%, 		AUTOMATION, AUTOCOLORON			, 1
INIREAD, AUTOPLAYDICE, %inifile%,		AUTOMATION, AUTOPLAYDICE		, 0
INIREAD, AUTOPLAYASKEDICE, %inifile%,	AUTOMATION, AUTOPLAYASKEDICE	, 0
INIREAD, AUTOFISHON, %inifile%, 		AUTOMATION, AUTOFISHON			, 1
INIREAD, AUTOTHROWON, %inifile%, 		AUTOMATION, AUTOTHROWON			, 1
INIREAD, AUTOFISHDISPLAY, %inifile%, 	AUTOMATION, AUTOFISHDISPLAY		, 0
INIREAD, AUTOGPSCARSELL, %inifile%,		AUTOMATION, AUTOGPSCARSELL		, 1

;[STATS]
INIREAD, SHOWSTOCKS, %inifile%, 	STATS, SHOWSTOCKS	, 0
INIREAD, SHOWWORKERS, %inifile%, 	STATS, SHOWWORKERS	, 0
INIREAD, SHOWMURDERS, %inifile%, 	STATS, SHOWMURDERS	, 0
INIREAD, SHOWDEATHS, %inifile%, 	STATS, SHOWDEATHS	, 0
INIREAD, SHOWARRESTED, %inifile%, 	STATS, SHOWARRESTED	, 0
INIREAD, SHOWJOINERS, %inifile%, 	STATS, SHOWJOINERS	, 0
INIREAD, SHOWQUITERS, %inifile%, 	STATS, SHOWQUITERS	, 0
INIREAD, SHOWFISH, %inifile%, 		STATS, SHOWFISH		, 1

;[DEBUG]
INIREAD, SEARCHDRIVE, %inifile%, 				DEBUG, SEARCHDRIVE				, c
INIREAD, MAXLISTVIEW, %inifile%, 				DEBUG, MAXLISTVIEW				, 5000
INIREAD, ENABLE_DEBUG, %inifile%, 				DEBUG, ENABLE_DEBUG				, 0
INIREAD, ENABLE_DEBUG_FISH, %inifile%,			DEBUG, ENABLE_DEBUG_FISH		, 0
INIREAD, ENABLE_DEBUG_DEAD, %inifile%, 			DEBUG, ENABLE_DEBUG_DEAD		, 0
INIREAD, ENABLE_DEBUG_MONEY, %inifile%, 		DEBUG, ENABLE_DEBUG_MONEY		, 0
INIREAD, ENABLE_DEBUG_GPS, %inifile%, 			DEBUG, ENABLE_DEBUG_GPS			, 0
INIREAD, ENABLE_DEBUG_HELP, %inifile%, 			DEBUG, ENABLE_DEBUG_HELP		, 0
INIREAD, ENABLE_DEBUG_NOMATCH, %inifile%,		DEBUG, ENABLE_DEBUG_NOMATCH		, 0
INIREAD, ENABLE_DEBUG_JURY, %inifile%, 			DEBUG, ENABLE_DEBUG_JURY		, 0
INIREAD, ENABLE_DEBUG_LOTTO, %inifile%, 		DEBUG, ENABLE_DEBUG_LOTTO		, 0
;INIREAD, ENABLE_DEBUG_TIME, %inifile%, 			DEBUG, ENABLE_DEBUG_TIME		, 0
INIREAD, ENABLE_DEBUG_CRIME, %inifile%, 		DEBUG, ENABLE_DEBUG_CRIME		, 0
INIREAD, ENABLE_DEBUG_WORK, %inifile%, 			DEBUG, ENABLE_DEBUG_WORK		, 0
INIREAD, ENABLE_DEBUG_STOCK, %inifile%, 		DEBUG, ENABLE_DEBUG_STOCK		, 0
INIREAD, ENABLE_DEBUG_PM, %inifile%, 			DEBUG, ENABLE_DEBUG_PM			, 0
INIREAD, ENABLE_DEBUG_MSG, %inifile%, 			DEBUG, ENABLE_DEBUG_MSG			, 0
INIREAD, ENABLE_DEBUG_DICE, %inifile%, 			DEBUG, ENABLE_DEBUG_DICE		, 0
INIREAD, ENABLE_DEBUG_TIMESTAT, %inifile%, 		DEBUG, ENABLE_DEBUG_TIMESTAT	, 0
INIREAD, ENABLE_DEBUG_FLOWER, %inifile%, 		DEBUG, ENABLE_DEBUG_FLOWER		, 0
INIREAD, ENABLE_DEBUG_SERVER, %inifile%, 		DEBUG, ENABLE_DEBUG_SERVER		, 0
INIREAD, ENABLE_DEBUG_BONUS, %inifile%, 		DEBUG, ENABLE_DEBUG_BONUS		, 0
INIREAD, ENABLE_DEBUG_CRIME, %inifile%, 		DEBUG, ENABLE_DEBUG_CRIME		, 0
INIREAD, ENABLE_DEBUG_WHISPER, %inifile%, 		DEBUG, ENABLE_DEBUG_WHISPER		, 0
INIREAD, ENABLE_DEBUG_DISPATCH, %inifile%, 		DEBUG, ENABLE_DEBUG_DISPATCH	, 0
INIREAD, ENABLE_DEBUG_CRIMEREPORT, %inifile%, 	DEBUG, ENABLE_DEBUG_CRIMEREPORT	, 0
INIREAD, ENABLE_DEBUG_CNR, %inifile%, 			DEBUG, ENABLE_DEBUG_CNR			, 0
INIREAD, ENABLE_DEBUG_SERVER, %inifile%, 		DEBUG, ENABLE_DEBUG_SERVER		, 0
INIREAD, ENABLE_DEBUG_HOUSE, %inifile%, 		DEBUG, ENABLE_DEBUG_HOUSE		, 0
INIREAD, ENABLE_DEBUG_VEHICLE, %inifile%, 		DEBUG, ENABLE_DEBUG_VEHICLE		, 0
INIREAD, ENABLE_DEBUG_PLAYER, %inifile%, 		DEBUG, ENABLE_DEBUG_PLAYER		, 0
INIREAD, ENABLE_DEBUG_VENDOR, %inifile%, 		DEBUG, ENABLE_DEBUG_VENDOR		, 0
INIREAD, ENABLE_DEBUG_MONEYBAG, %inifile%, 		DEBUG, ENABLE_DEBUG_MONEYBAG	, 0
INIREAD, ENABLE_DEBUG_BDAYS, %inifile%, 		DEBUG, ENABLE_DEBUG_BDAYS		, 0
INIREAD, ENABLE_DEBUG_GPS, %inifile%, 			DEBUG, ENABLE_DEBUG_GPS			, 0
INIREAD, ENABLE_DEBUG_PURCHASE, %inifile%, 		DEBUG, ENABLE_DEBUG_PURCHASE	, 0
INIREAD, ENABLE_DEBUG_DELIVERY, %inifile%, 		DEBUG, ENABLE_DEBUG_DELIVERY	, 0
INIREAD, ENABLE_DEBUG_PET, %inifile%, 			DEBUG, ENABLE_DEBUG_PET			, 0
INIREAD, ENABLE_DEBUG_DRIVER, %inifile%, 		DEBUG, ENABLE_DEBUG_DRIVER		, 0
INIREAD, ENABLE_DEBUG_WELFARE, %inifile%, 		DEBUG, ENABLE_DEBUG_WELFARE		, 0

;[Keybinds]
INIREAD, BINDSOFF, %inifile%, 		Keybinds ,  BINDSOFF		, 0
INIREAD, F1E, %inifile%, 			Keybinds ,  F1Enabled		, 0
INIREAD, F2E, %inifile%, 			Keybinds ,  F2Enabled		, 0
INIREAD, F3E, %inifile%, 			Keybinds ,  F3Enabled		, 0
INIREAD, F4E, %inifile%, 			Keybinds ,  F4Enabled		, 0
INIREAD, F5E, %inifile%, 			Keybinds ,  F5Enabled		, 0
INIREAD, F6E, %inifile%, 			Keybinds ,  F6Enabled		, 0
INIREAD, F7E, %inifile%, 			Keybinds ,  F7Enabled		, 0
INIREAD, F8E, %inifile%, 			Keybinds ,  F8Enabled		, 0
INIREAD, F9E, %inifile%, 			Keybinds ,  F9Enabled		, 0
INIREAD, F10E, %inifile%, 			Keybinds , F10Enabled		, 0
INIREAD, F11E, %inifile%, 			Keybinds , F11Enabled		, 0
INIREAD, F12E, %inifile%, 			Keybinds , F12Enabled		, 0
INIREAD, F1, %inifile%, 			Keybinds	, F1Bind		, t/{enter}
INIREAD, F2, %inifile%, 			Keybinds	, F2Bind		, t/{enter}
INIREAD, F3, %inifile%, 			Keybinds	, F3Bind		, t/{enter}
INIREAD, F4, %inifile%, 			Keybinds	, F4Bind		, t/{enter}
INIREAD, F5, %inifile%, 			Keybinds	, F5Bind		, t/{enter}
INIREAD, F6, %inifile%, 			Keybinds	, F6Bind		, t/{enter}
INIREAD, F7, %inifile%, 			Keybinds	, F7Bind		, t/{enter}
INIREAD, F8, %inifile%, 			Keybinds	, F8Bind		, t/{enter}
INIREAD, F9, %inifile%, 			Keybinds	, F9Bind		, t/{enter}
INIREAD, F10, %inifile%,			Keybinds	, F10Bind		, t/{enter}
INIREAD, F11, %inifile%,			Keybinds	, F11Bind		, t/{enter}
INIREAD, F12, %inifile%, 			Keybinds	, F12Bind		, t/{enter}

INIREAD, BIND1E, %inifile%, 		Keybinds ,  BIND1Enabled	, 0
INIREAD, BIND2E, %inifile%, 		Keybinds ,  BIND2Enabled	, 0
INIREAD, BIND3E, %inifile%, 		Keybinds ,  BIND3Enabled	, 0	
INIREAD, BIND4E, %inifile%, 		Keybinds ,  BIND4Enabled	, 0
INIREAD, BIND5E, %inifile%, 		Keybinds ,  BIND5Enabled	, 0
INIREAD, BIND6E, %inifile%, 		Keybinds ,  BIND6Enabled	, 0
INIREAD, BIND7E, %inifile%, 		Keybinds ,  BIND7Enabled	, 0
INIREAD, BIND8E, %inifile%, 		Keybinds ,  BIND8Enabled	, 0
INIREAD, BIND9E, %inifile%, 		Keybinds ,  BIND9Enabled	, 0
INIREAD, BIND10E, %inifile%, 		Keybinds , BIND10Enabled	, 0
INIREAD, BIND11E, %inifile%, 		Keybinds , BIND11Enabled	, 0
INIREAD, BIND12E, %inifile%, 		Keybinds , BIND12Enabled	, 0
INIREAD, BIND1, %inifile%, 			Keybinds	, BIND1Bind		, t/{enter}
INIREAD, BIND2, %inifile%, 			Keybinds	, BIND2Bind		, t/{enter}
INIREAD, BIND3, %inifile%, 			Keybinds	, BIND3Bind		, t/{enter}
INIREAD, BIND4, %inifile%, 			Keybinds	, BIND4Bind		, t/{enter}
INIREAD, BIND5, %inifile%, 			Keybinds	, BIND5Bind		, t/{enter}
INIREAD, BIND6, %inifile%, 			Keybinds	, BIND6Bind		, t/{enter}
INIREAD, BIND7, %inifile%, 			Keybinds	, BIND7Bind		, t/{enter}
INIREAD, BIND8, %inifile%, 			Keybinds	, BIND8Bind		, t/{enter}
INIREAD, BIND9, %inifile%, 			Keybinds	, BIND9Bind		, t/{enter}
INIREAD, BIND10, %inifile%, 		Keybinds	, BIND10Bind	, t/{enter}
INIREAD, BIND11, %inifile%, 		Keybinds	, BIND11Bind	, t/{enter}
INIREAD, BIND12, %inifile%, 		Keybinds	, BIND12Bind	, t/{enter}

;[Performance]
INIREAD, SLEEPLINECOUNT, %inifile%,	PERFOMANCE, SLEEPLINECOUNT ,100
INIREAD, SLEEPLOGSIZE, %inifile%, 	PERFOMANCE, SLEEPLOGSIZE , 500
INIREAD, SLEEPTOSLOW, %inifile%, 	PERFOMANCE, SLEEPTOSLOW , 1
INIREAD, SLEEPTOWAKE, %inifile%, 	PERFOMANCE, SLEEPTOWAKE , 1000
INIREAD, SLEEPKILLMULTI, %inifile%,	PERFOMANCE, SLEEPKILLMULTI ,100
INIREAD, SLEEPDETECT, %inifile%, 	PERFOMANCE, SLEEPDETECT ,1
INIREAD, SLEEPTOLOG, %inifile%, 	PERFOMANCE, SLEEPTOLOG , 900
INIREAD, SLEEPIGNORE, %inifile%, 	PERFOMANCE, SLEEPIGNORE , 1500
INIREAD, SCROLLRATE, %inifile%, 	PERFOMANCE, VARMAX , 1
INIREAD, Lv_Modifycol, %inifile%, 	PERFOMANCE, Lv_Modifycol , 1000
INIREAD, KEYBINDCHECK, %inifile%, 	PERFOMANCE, KEYBINDCHECK , 5000
INIREAD, READLOG, %inifile%, 		PERFOMANCE, READLOG , 1000
INIREAD, FILTERNOMATCH, %inifile%, 	PERFOMANCE, SCROLLRATE , 100

;[FILES]
INIREAD, logdir, %inifile%, 	FILES, logdir , %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP 
INIREAD, logfile, %inifile%, 	FILES, logfile , %logdir%\chatlog.txt
INIREAD, history, %inifile%, 	FILES, history , %logdir%\History
INIREAD, whitelist, %inifile%, 	FILES, whitelist , %logdir%\whitelist.txt
INIREAD, blacklist, %inifile%, 	FILES, blacklist , %logdir%\blacklist.txt
INIREAD, nomatch, %inifile%, 	FILES, blacklist , %logdir%\nomatch.txt
INIREAD, complaint, %inifile%, 	FILES, blacklist , %logdir%\complaint.txt
INIREAD, petlist, %inifile%, 	FILES, blacklist , %logdir%\petlist.txt
INIREAD, carlist, %inifile%, 	FILES, blacklist , %logdir%\carlist.txt
INIREAD, soldlist, %inifile%, 	FILES, blacklist , %logdir%\soldlist.txt



if X= -32000
	{
		X= 100
		Height = 300
	}
	if Y= -32000
	{
		Y= 100
		Width= 600
	}
return

FISHSAVE:
	if ENABLE_DEBUG = 1
			LV_Add("","- " A_ThisLabel)
			
	INIWRITE, %FISHSELL%, %inifile%, 		FISHSIZE, FISHSELL
	INIWRITE, %AUTOFISHSHOW%, %inifile%, 	FISHSIZE, AUTOFISHSHOW
	INIWRITE, %AUTOFISHSELL%, %inifile%, 	FISHSIZE, AUTOFISHSELL
	INIWRITE, %Amberjack%, %inifile%, FISHSIZE, Amberjack
	INIWRITE, %Grouper%, %inifile%, FISHSIZE, Grouper
	INIWRITE, %Red%, %inifile%, FISHSIZE, Red
	INIWRITE, %Trout%, %inifile%, FISHSIZE, Trout
	INIWRITE, %Blue%, %inifile%, FISHSIZE, Blue
	INIWRITE, %Mackerel%, %inifile%, FISHSIZE, Mackerel
	INIWRITE, %Sea%, %inifile%, FISHSIZE, Sea
	INIWRITE, %Pike%, %inifile%, FISHSIZE, Pike
	INIWRITE, %Sail%, %inifile%, FISHSIZE, Sail
	INIWRITE, %Tuna%, %inifile%, FISHSIZE, Tuna
	INIWRITE, %Eel%, %inifile%, FISHSIZE, Eel
	INIWRITE, %Dolphin%, %inifile%, FISHSIZE, Dolphin
	INIWRITE, %Shark%, %inifile%, FISHSIZE, Shark
	INIWRITE, %Turtle%, %inifile%, FISHSIZE, Turtle
	INIWRITE, %Catfish%, %inifile%, FISHSIZE, Catfish
	INIWRITE, %Swordfish%, %inifile%, FISHSIZE, Swordfish
	INIWRITE, %Squid%, %inifile%, FISHSIZE, Squid
	INIWRITE, %Barracuda%, %inifile%, FISHSIZE, Barracuda
	INIWRITE, %Piranha%, %inifile%, FISHSIZE, Piranha
	INIWRITE, %Lobster%, %inifile%, FISHSIZE, Lobster
	INIWRITE, %Cod%, %inifile%, FISHSIZE, Cod
	INIWRITE, %Sardine%, %inifile%, FISHSIZE, Sardine
	INIWRITE, %Salmon%, %inifile%, FISHSIZE, Salmon
	INIWRITE, %Shrimp%, %inifile%, FISHSIZE, Shrimp
	INIWRITE, %Sturgeon%, %inifile%, FISHSIZE, Sturgeon
	INIWRITE, %Flounder%, %inifile%, FISHSIZE, Flounder
	INIWRITE, %Haddock%, %inifile%, FISHSIZE, Haddock
	INIWRITE, %Herring%, %inifile%, FISHSIZE, Herring
	INIWRITE, %Stingray%, %inifile%, FISHSIZE, Stingray
	INIWRITE, %Carp%, %inifile%, FISHSIZE, Carp
	INIWRITE, %Halibut%, %inifile%, FISHSIZE, Halibut
	INIWRITE, %Sole%, %inifile%, FISHSIZE, Sole
	INIWRITE, %Babyseal%, %inifile%, FISHSIZE, Babyseal
	INIWRITE, %Delay%, %inifile%, FISHSIZE, Delay 
	if FISHSELL1 = Checked
		FISHSELL = 1
	if FISHSELL1 = UnCheck
		FISHSELL = 2
	INIWRITE, %FISHSELL%, %inifile%, FISHSIZE, FISHSELL
return
FISHREAD:
	if ENABLE_DEBUG = 1
			LV_Add("","- " A_ThisLabel)
	INIREAD, AUTOFISHSHOW, %inifile%, 	FISHSIZE, AUTOFISHSHOW , 1
	INIREAD, AUTOFISHSELL, %inifile%, 	FISHSIZE, AUTOFISHSELL , 1
	INIREAD, Amberjack, %inifile%, FISHSIZE, Amberjack , 50
	INIREAD, Grouper, %inifile%, FISHSIZE, Grouper , 50
	INIREAD, Red, %inifile%, FISHSIZE, Red , 25
	INIREAD, Trout, %inifile%, FISHSIZE, Trout , 50
	INIREAD, Blue, %inifile%, FISHSIZE, Blue , 100
	INIREAD, Mackerel, %inifile%, FISHSIZE, Mackerel , 50
	INIREAD, Sea, %inifile%, FISHSIZE, Sea , 35
	INIREAD, Pike, %inifile%, FISHSIZE, Pike , 35
	INIREAD, Sail, %inifile%, FISHSIZE, Sail , 35
	INIREAD, Tuna, %inifile%, FISHSIZE, Tuna , 50
	INIREAD, Eel, %inifile%, FISHSIZE, Eel , 15
	INIREAD, Dolphin, %inifile%, FISHSIZE, Dolphin , 60
	INIREAD, Shark, %inifile%, FISHSIZE, Shark , 200
	INIREAD, Turtle, %inifile%, FISHSIZE, Turtle , 25
	INIREAD, Catfish, %inifile%, FISHSIZE, Catfish , 5
	INIREAD, Swordfish, %inifile%, FISHSIZE, Swordfish , 200
	INIREAD, Squid, %inifile%, FISHSIZE, Squid , 100
	INIREAD, Barracuda, %inifile%, FISHSIZE, Barracuda , 20
	INIREAD, Piranha, %inifile%, FISHSIZE, Piranha , 5
	INIREAD, Lobster, %inifile%, FISHSIZE, Lobster , 10
	INIREAD, Cod, %inifile%, FISHSIZE, Cod , 50
	INIREAD, Sardine, %inifile%, FISHSIZE, Sardine , 1
	INIREAD, Salmon, %inifile%, FISHSIZE, Salmon , 50
	INIREAD, Shrimp, %inifile%, FISHSIZE, Shrimp , 1
	INIREAD, Sturgeon, %inifile%, FISHSIZE, Sturgeon , 300
	INIREAD, Flounder, %inifile%, FISHSIZE, Flounder , 10
	INIREAD, Haddock, %inifile%, FISHSIZE, Haddock , 10
	INIREAD, Herring, %inifile%, FISHSIZE, Herring , 10
	INIREAD, Stingray, %inifile%, FISHSIZE, Stingray , 500
	INIREAD, Carp, %inifile%, FISHSIZE, Carp , 40
	INIREAD, Halibut, %inifile%, FISHSIZE, Halibut , 150
	INIREAD, Sole, %inifile%, FISHSIZE, Sole , 5
	INIREAD, Babyseal, %inifile%, FISHSIZE, Babyseal , 30
	INIREAD, Delay,   %inifile% , FISHSIZE, Delay , 2000
	INIREAD, FISHSELL, %inifile%, SETTINGS, FISHSELL ,1
if FISHSELL = 1
{
	FISHSELL1 = Checked
	FISHSELL2 = UnCheck
}
if FISHSELL = 2
{
	FISHSELL1 = UnCheck
	FISHSELL2 = Checked
}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SCRIPT Function END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GAME MACROS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
autoignore:
SetTimer, %A_ThisLabel%, off
if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
IF PLAYER = 
	return
gosub SAMPDETECT
if game = 0
	return
gosub CHATIN
StringReplace, PLAYER, PLAYER, ! , {!}, ReplaceAll
StringReplace, PLAYER, PLAYER, ^ , {^}, ReplaceAll 
StringReplace, PLAYER, PLAYER, + , {+}, ReplaceAll 
SendInput t/ign %PLAYER%{enter}
gosub CHATOUT
LV_Add("", "<< "ADDLINE)
LV_Add("", " !AUTOIGNORE " PLAYER "  ")
return

gpscarsell:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOGPSCARSELL = 0
		return
	if GPSINUSE = 1
		return
	gosub SAMPDETECT
	if game = 0
	return
	gosub CHATIN
	SendInput t/gps{enter}t 1{enter}t 5{enter}
	gosub CHATOUT
	return
gpsmission:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if GPSINUSE = 1
		return
	gosub SAMPDETECT
	if game = 0
	return
	gosub CHATIN
	IF INTRUCK = 1
		SendInput t/gps{enter}t 1{enter}t 1{enter}
	IF INCOURIER = 1
		SendInput t/gps{enter}t 1{enter}t 1{enter}
	gosub CHATOUT
	return
gpsclear:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
		if game = 0
	return
	gosub CHATIN
	SendInput t/gpsclear{enter}
	gosub CHATOUT
	return
sit8:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
	if game = 0
	return
	gosub CHATIN
	SendInput t/sit 8{enter}
	gosub CHATOUT
	return
sit:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sit{enter}
	gosub CHATOUT
	return
sell:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sell $ply{enter}
	gosub CHATOUT
	return
offer:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sell %LASTWAVE%{enter}
	gosub CHATOUT
	return
sellmenu:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/sellmenu{enter}
	gosub CHATOUT
	return
sellmenumove:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/sellmenu{enter}t 5{enter}
	gosub CHATOUT
	return
throwback:
	FISHTHROWN++
	FISHTHROW = 1
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOTHROWON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/tb{enter}
	gosub CHATOUT
	return
fishinv:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if FISHSELL1 = Checked
	{
		gosub CHATIN
		SendInput t/frel{enter}
		gosub CHATOUT
	}
	return
pay:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOTICKETON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/pay{enter}
	gosub CHATOUT
	return
	return
house:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOHOUSEON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/house{enter}
	gosub CHATOUT
	return
storage:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/storage{enter}
	gosub CHATOUT
	return
	
escape:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYANTIPAUSEON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/esc{enter}
	gosub CHATOUT
	return
takedrugs:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if AUTODRUGSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/td %FTD%{enter}
	gosub CHATOUT
	return
info:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/info{enter}
	gosub CHATOUT
	return
jury:
	if ENABLE_DEBUG_JURY = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	If AUTOJURYON = 1
	{
		gosub CHATIN
		SendInput t/jury{enter}
		gosub CHATOUT
	}
	return
DL:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYDLTOGGLE = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	SetCapsLockState , oFF
	gosub CHATIN
	SendInput t/dl{enter}
	gosub CHATOUT
	return
Cancel:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/Cancel{enter}
	gosub CHATOUT
	return
t1:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 1{enter}
	gosub CHATOUT
	return
t2:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 2{enter}
	gosub CHATOUT
	return
t3:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 3{enter}
	gosub CHATOUT
	return
t4:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 4{enter}
	gosub CHATOUT
	return
t5:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 5{enter}
	gosub CHATOUT
	return
t6:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 6{enter}
	gosub CHATOUT
	return
t7:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 7{enter}
	gosub CHATOUT
	return
t8:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 8{enter}
	gosub CHATOUT
	return
t9:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 9{enter}
	gosub CHATOUT
	return
t10:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t10{enter}
	gosub CHATOUT
	return
t11:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t11{enter}
	gosub CHATOUT
	return
t12:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t12{enter}
	gosub CHATOUT
	return
t13:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t13{enter}
	gosub CHATOUT
	return
t14:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t14{enter}
	gosub CHATOUT
	return
t15:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t15{enter}
	gosub CHATOUT
	return
t16:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t16{enter}
	gosub CHATOUT
	return
t17:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t17{enter}
	gosub CHATOUT
	return
t18:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t18{enter}
	gosub CHATOUT
	return
t19:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t19{enter}
	gosub CHATOUT
	return
t20:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t20{enter}
	gosub CHATOUT
	return
t21:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t21{enter}
	gosub CHATOUT
	return
t22:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t22{enter}
	gosub CHATOUT
	return
t23:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t23{enter}
	gosub CHATOUT
	return
t24:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t24{enter}
	gosub CHATOUT
	return
t25:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t25{enter}
	gosub CHATOUT
	return
t26:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t26{enter}
	gosub CHATOUT
	return
t27:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t27{enter}
	gosub CHATOUT
return
t28:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t28{enter}
	gosub CHATOUT
	return
t29:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t29{enter}
	gosub CHATOUT
	return
t30:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t30{enter}
	gosub CHATOUT
	return
F1:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F1E = 0
		return
	gosub CHATIN
	sendinput %F1%{enter}
	gosub CHATOUT
	return
F2:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F2E = 0
		return
	gosub CHATIN
	sendinput %F2%{enter}
	gosub CHATOUT
	return
F3:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F3E = 0
		return
	gosub CHATIN
	sendinput %F3%{enter}
	gosub CHATOUT
	return
F4:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F4E = 0
		return
	gosub CHATIN
	sendinput %F4%{enter}
	gosub CHATOUT
	return
F5:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F5E = 0
		return
	gosub CHATIN
	sendinput %F5%{enter}
	gosub CHATOUT
	return
F6:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F6E = 0
		return
	gosub CHATIN
	sendinput %F6%{enter}
	gosub CHATOUT
	return
F7:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F7E = 0
		return
	gosub CHATIN
	sendinput %F7%{enter}
	gosub CHATOUT
	return
F8:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	if F8E = 0
		return
	sendinput %F8%{enter}
	gosub CHATOUT
	return
F9:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F9E = 0
		return
	gosub CHATIN
	sendinput %F9%{enter}
	gosub CHATOUT
	return
F10:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F10E = 0
		return
	gosub CHATIN
	sendinput %F10%{enter}
	gosub CHATOUT
	return
F11:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F11E = 0
		return
	gosub CHATIN
	sendinput %F11%{enter}
	gosub CHATOUT
	return
F12:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F12E = 0
		return
	gosub CHATIN
	sendinput %F12%{enter}
	gosub CHATOUT
	return
BIND1:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND1E = 0
	{
		sendinput {1 down}
		sleep 50
		sendinput {1 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 1
	else
		sendinput %BIND1%{enter}
	return
BIND2:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if BIND2E = 0
	{
		sendinput {2 down}
		sleep 150
		sendinput {2 up}
		return
	}
	IF CHATBOX = OPEN
	{
		SendInput 2
		return
	}
	else
	{
		sendinput %BIND2%{enter}
		return
	}
BIND3:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if BIND3E = 0
	{
		sendinput {3 down}
		sleep 50
		sendinput {3 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 3
	else
		sendinput %BIND3%{enter}
	return
BIND4:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND4E = 0
	{
		sendinput {4 down}
		sleep 50
		sendinput {4 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 4 
	else
		sendinput %BIND4%{enter}
	return
BIND5:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND5E = 0
	{
		sendinput {5 down}
		sleep 50
		sendinput {5 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 5
	else
		sendinput %BIND5%{enter}
	return
BIND6:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND6E = 0
	{
		sendinput {6 down}
		sleep 50
		sendinput {6 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 6
	else
		sendinput %BIND6%{enter}
	return
BIND7:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND7E = 0
	{
		sendinput {7 down}
		sleep 50
		sendinput {7 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 7
	else
		sendinput %BIND7%{enter}
	return
BIND8:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND8E = 0
	{
		sendinput {8 down}
		sleep 50
		sendinput {8 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 8
	else
		sendinput %BIND8%{enter}
	return
BIND9:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND9E = 0
	{
		sendinput {9 down}
		sleep 50
		sendinput {9 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 9
	else
		sendinput %BIND9%{enter}
	return
BIND10:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if BIND10E = 0
	{
		sendinput {0 down}
		sleep 50
		sendinput {0 up}
		return
	}
	IF CHATBOX = OPEN
		SendInput 0
	else
		sendinput %BIND10%{enter}
	return
BIND11:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND11E = 0
	{
		sendinput {- down}
		sleep 50
		sendinput {- up}
		return
	}
	IF CHATBOX = OPEN
		SendInput `-
	else
		sendinput %BIND11%{enter}
	return
BIND12:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if BIND12E = 0
	{
		sendinput {= down}
		sleep 50
		sendinput {= up}
		return
	}
	IF CHATBOX = OPEN
		SendInput `=
	else
		sendinput %BIND12%{enter}
	return
lock:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lock{enter}
	gosub CHATOUT
	return
tupenter:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	if CHATBOX = OPEN
		sendinput {up}{enter}
	if CHATBOX = CLOSED
		sendinput t{up}{enter}
	gosub CHATOUT
	return

unlock:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/unlock{enter}
	gosub CHATOUT
	return
bail:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/bail{enter}
	gosub CHATOUT
	return
bribe:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/br %BRIBEAMOUNT%{enter}
	gosub CHATOUT
	return
buy:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/buy{enter}
	gosub CHATOUT
	return
courier:

	SetTimer, %A_ThisLabel% , Off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/courier{enter}
	gosub CHATOUT
	return
fsell:
	SetTimer , %A_ThisLabel% , off
	if HAVEFISH = 0
		return
	if AUTOFISHSHOW = 0
		return
	if AUTOFISHSELL = 0
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fsell{enter}
	gosub CHATOUT
	return
fsellall:
	SetTimer , %A_ThisLabel% , off
	if HAVEFISH = 0
		return
	if AUTOFISHSELL = 0
		return
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/fsellall{enter}
	gosub CHATOUT
	return
strip:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
mission:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
vsi:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
stocks:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
market:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
delivery:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
tip:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/tip{enter}
	gosub CHATOUT
	return
usedrugs:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/td %TAKEDRUGSAMOUNT%{enter}
	gosub CHATOUT
	return
assslap:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/assslap{enter}
	gosub CHATOUT
	return
slap:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/slap{enter}
	gosub CHATOUT
	return
carkick:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ck{enter}
	gosub CHATOUT
	return
crossarms:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/crossarms{enter}
	gosub CHATOUT
	return
cry:
	SetTimer , %A_ThisLabel% , off
	SetTimer, cry, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/cry{enter}
	gosub CHATOUT
	return
dance:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dance 3{enter}
	gosub CHATOUT
	return
fart:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fart{enter}
	gosub CHATOUT
	return
flash:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fl{enter}
	gosub CHATOUT
	return
go:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/go{enter}
	gosub CHATOUT
	return
handstand:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/handstand{enter}
	gosub CHATOUT
	return
hide:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/hide{enter}
	gosub CHATOUT
	return
idle:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/idle{enter}
	gosub CHATOUT
	return
jumpkick:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/jumpkick{enter}
	gosub CHATOUT
	return
ls:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ls{enter}
	gosub CHATOUT
	return
lay:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lay{enter}
	gosub CHATOUT
	return
piss:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/piss{enter}
	gosub CHATOUT
	return
armcross:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/armcross{enter}
	gosub CHATOUT
	return
point:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/point{enter}
	gosub CHATOUT
	return
ride:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ride{enter}
	gosub CHATOUT
	return
scratch:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/scr{enter}
	gosub CHATOUT
	return
noob:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/noob{enter}
	gosub CHATOUT
	return
stop:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/stop{enter}
	gosub CHATOUT
	return
wave:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/hello{enter}
	gosub CHATOUT
	return
dice:
	SetTimer, %A_ThisLabel% , Off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if vAUTOPLAYASKEDICE = 0
		return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dice{enter}
	gosub CHATOUT
	return
playdice:
	SetTimer, %A_ThisLabel% , Off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOPLAYDICE = 0
		return
	if LASTDICEFAIL = 1
		return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dice $civ %PLAYDICEAMOUNT%{enter}
	gosub CHATOUT
	return
kiss:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/kiss{enter}
	gosub CHATOUT
	return
lean:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lean{enter}
	gosub CHATOUT
	return
flower:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/flower{enter}
	gosub CHATOUT
	return
fuckoff:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fuck{enter}
	gosub CHATOUT
	return
wank:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/wank{enter}
	gosub CHATOUT
	return
weapons:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ws{enter}
	gosub CHATOUT
	return
mech:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mech{enter}
	gosub CHATOUT
	return
drugs:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/drugs{enter}
	gosub CHATOUT
	return
items:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/items{enter}
	gosub CHATOUT
	return
sex:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sex{enter}
	gosub CHATOUT
	return
medic:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/h{enter}
	gosub CHATOUT
	return
clothes:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothes{enter}
	gosub CHATOUT
	return
clothesbuy:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothesbuy{enter}
	gosub CHATOUT
	return
clothessell:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothessell{enter}
	gosub CHATOUT
	return
food:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/food{enter}
	gosub CHATOUT
	return
mourn:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mourn{enter}
	gosub CHATOUT
	return
jaillist:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/jl{enter}
	gosub CHATOUT
	return
stsply:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sts $ply{enter}
	gosub CHATOUT
	return
stshim:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sts %HIM%{enter}
	gosub CHATOUT
	return
prices:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/prices{enter}
	gosub CHATOUT
	return
vehc:
	SetTimer , %A_ThisLabel% , off
	SetTimer, %A_ThisLabel% , off
	IN_CH = 0
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOCOLORON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub COLORSET
	gosub CHATIN
	sendinput t/vehc %COLORN1% %COLORN2%{enter}
	gosub CHATOUT
	return
vehrepair:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/vehrepair{enter}
	gosub CHATOUT
	return
Rod:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if fish = 3
		return
	
	gosub CHATIN
	SendInput t/Rod{enter}
	gosub CHATOUT
	return
pointup:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/pointup{enter}
	gosub CHATOUT
	return
trick:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/trick{enter}
	gosub CHATOUT
	return
moneyrush:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOBONUSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/mr{enter}
	gosub CHATOUT
	return
bonuscar:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOBONUSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/vsi{enter}
	gosub CHATOUT
	return
ups:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/ups{enter}
	gosub CHATOUT
	return
gift:
	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/gift{enter}
	gosub CHATOUT
	return
givegift:
	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/givegift %GIFTEE%{enter}t 2{enter}t <3{enter}
	gosub CHATOUT
	return

giftspam:

	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/givegift %giftspam%{enter}t 2{enter}t<3{enter}
	gosub CHATOUT



	giftspam++
	if giftspam > 200
		giftspam = 0
	return
shoplift:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/shoplift{enter}
	gosub CHATOUT
	return
holdup:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/hup{enter}
	gosub CHATOUT
	return
pill:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/ad{enter}
	gosub CHATOUT
	return
closest:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/%A_ThisLabel%{enter}
	gosub CHATOUT
	return
radio:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/radio{enter}
	gosub CHATOUT
	return
accept:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/ac{enter}
	gosub CHATOUT
	return
exit:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/exit{enter}
	gosub CHATOUT
	return
refuse:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/refuse{enter}
	gosub CHATOUT
	return
robbery:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/robbery{enter}
	gosub CHATOUT
	return
cook:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/cook{enter}
	gosub CHATOUT
	return
givepoorcash:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/gc %poor% %PLAYDICEAMOUNT%{enter}
	gosub CHATOUT
	return
taichi:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/taichi{enter}
	gosub CHATOUT
	return
bonusfish:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOBONUSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/fi{enter}
	gosub CHATOUT
	return
FPSLOW:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	fps = %FPSLOW%
	gosub CHATIN
	sendinput t/fpslimit %FPSLOW%{enter}
	gosub CHATOUT
	return
FPSHIGH:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	fps = %FPSHIGH%
	gosub CHATIN
	sendinput t/fpslimit %FPSHIGH%{enter}
	gosub CHATOUT
	return

login:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOLOGONON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	if PASSWORD = ERROR
	return
	gosub getpass
	if PASSWORD =
	return
	sleep %SLEEPTOLOG%
	sendinput , %PASSWORD%{enter}		
	PASSWORD = 
	sleep %SLEEPTOLOG%
	sendinput {shift down}
	sleep %SLEEPTOLOG%
	sendinput {shift up}
	sleep 80
	return
RandomLotto:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	SetTimer , RandomLotto , off
	if LOTTOPLAYED = 1
	return
	gosub SAMPDETECT 
	if game = 0
	return
	Random, RLOTTO , 1, 150
	gosub CHATIN
	sendinput t/lotto %RLOTTO%{enter}
	gosub CHATOUT
	SLOTTO = 0
	if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel " " Lottery " " RLOTTO)
return
FailLotto:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
			LV_Add("","+ " A_ThisLabel)
	SetTimer , FailLotto , off
	if LOTTOPLAYED = 1
	return
	gosub SAMPDETECT 
	if game = 0
	return
	LOTTOFAIL = 0
	Random, RLOTTO , 1, 150
	sleep 3000
	gosub CHATIN
	sendinput t/lotto %RLOTTO%{enter}
	gosub CHATOUT
	if ENABLE_DEBUG_LOTTO = 1
	LV_Add("","- " A_ThisLabel " " Lottery " " RLOTTO)
	return
Guilotto:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel " " Lottery " " GUILOTTO)
	SetTimer , %A_ThisLabel% , off
	if LOTTOPLAYED = 1
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lotto %GUILOTTO%{enter}
	gosub CHATOUT
	return
lotto:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("", "$ Lotto Played " FailLotto  " " RandomLotto " " Guilotto)
	if AUTOLOTTOON=0
	return
	gosub SAMPDETECT 
	if game = 0
		return
	if LOTTOFAIL = 1
	{
		SetTimer , FailLotto , 3500
		return
	}
	if GUILOTTO = 0
	{
		SetTimer , RandomLotto , 3500
		return
	}
	if GUILOTTO > 0
	{
		SetTimer ,Guilotto, 3500
		return
	}
	return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FPSTAB:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if fps = %FPSHIGH%
		gosub FPSLOW
	else
		gosub FPSHIGH
	return
return

ALTTAB:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	game = 0
	pause = 1
	SendInput {ALT DOWN} {TAB} {ALT UP}
return
BIND_WINKEY:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub Sit8
	sleep 800
	return
APPSKEY:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub sell
	sleep 800
	return
BIND_T:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	SetCapsLockState , oFF
	SendInput t
	CHAT = 1
	CHATBOX = OPEN
	Clipboard =
	return
BIND_ENTER:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	SendInput {ENTER}
	CHAT = 0
	CHATBOX = CLOSED
	;Clipboard = 
	return
BIND_ESC:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub Cancel
	return
BIND_CAPS:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub DL
	return
$PAUSE::
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	IfWinActive ,GTA:SA:MP
	{
		WinMinimize ,ahk_class Grand theft auto San Andreas
		game = 0
		pause = 1
		goto pauseend
	}
	ifWinNotActive ,GTA:SA:MP
	{
		WinActivate , GTA
		game = 1
		pause = 0
	}
pauseend:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Logon:
	if ENABLE_DEBUG = 1
			LV_Add("", "- " A_ThisLabel)
	gosub getpass
	Gui 2:Margin, 5,5
	Gui 2:Font, S10, Verdana
	Gui 2:Add, Groupbox,	x5 	y0 	w230 h80, Enter User Name
	Gui 2:Add, Groupbox, 	x5 	y80 w230 h80, Enter Password
	Gui 2:Add, Edit, 		x20 y35 r1 Limit20 w200 h20 vPlayerName, %PlayerName%
	Gui 2:Add, Edit, 		x20 y115 r1 Limit20 w200 h20 0x20 vmypass, %mypass%
	Gui 2:Add, Button, 		x240 y10 w50 h150 0x8000 Default, OK
	Gui 2:Show, AutoSize ,Logon
Return

Fishsize:
	if ENABLE_DEBUG = 1
			LV_Add("", "- "  A_ThisLabel)
	gosub FISHREAD
	Gui 3:Margin, 5,5
	Gui 3:Add, Groupbox,w350 h420, Throwback Fish Under (LB)
	Gui 3:Add, Text , x20 y40 h20  , Amberjack
	Gui 3:Add, Text , x20 y60 h20 , Grouper
	Gui 3:Add, Text , x20 y80 h20 , Red Snapper
	Gui 3:Add, Text , x20 y100 h20 , Trout
	Gui 3:Add, Text , x20 y120 h20 , Blue Marlin
	Gui 3:Add, Text , x20 y140 h20 , Mackerel
	Gui 3:Add, Text , x20 y160 h20 , Sea
	Gui 3:Add, Text , x20 y180 h20 , Pike
	Gui 3:Add, Text , x20 y200 h20 , Sail
	Gui 3:Add, Text , x20 y220 h20 , Tuna
	Gui 3:Add, Text , x20 y240 h20 , Eel
	Gui 3:Add, Text , x20 y260 h20 , Dolphin
	Gui 3:Add, Text , x20 y280 h20 , Shark
	Gui 3:Add, Text , x20 y300 h20 , Turtle
	Gui 3:Add, Text , x20 y320 h20 , Catfish
	Gui 3:Add, Text , x20 y340 h20 , Swordfish
	Gui 3:Add, Text , x20 y360 h20 , Squid
	Gui 3:Add, Text , x20 y380 h20 , Barracuda
	Gui 3:Add, Text , x200 y40 h20 , Piranha
	Gui 3:Add, Text , x200 y60 h20 , Lobster
	Gui 3:Add, Text , x200 y80 h20 , Cod
	Gui 3:Add, Text , x200 y100 h20 , Sardine
	Gui 3:Add, Text , x200 y120 h20 , Salmon
	Gui 3:Add, Text , x200 y140 h20 , Shrimp
	Gui 3:Add, Text , x200 y160 h20 , Sturgeon
	Gui 3:Add, Text , x200 y180 h20 , Flounder
	Gui 3:Add, Text , x200 y200 h20 , Haddock
	Gui 3:Add, Text , x200 y220 h20 , Herring
	Gui 3:Add, Text , x200 y240 h20 , Stingray
	Gui 3:Add, Text , x200 y260 h20 , Carp
	Gui 3:Add, Text , x200 y280 h20 , Halibut
	Gui 3:Add, Text , x200 y300 h20 , Sole
	Gui 3:Add, Text , x200 y320 h20 , Baby Seal
	GUI 3:Add, Edit , x120 y40 w60  h20 vAmberjack ,%Amberjack%
	GUI 3:Add, Edit , x120 y60 w60  h20 vGrouper,%Grouper%
	GUI 3:Add, Edit , x120 y80 w60  h20 vRed ,%Red%
	GUI 3:Add, Edit , x120 y100 w60 h20 vTrout ,%Trout%
	GUI 3:Add, Edit , x120 y120 w60 h20 vBlue ,%Blue%
	GUI 3:Add, Edit , x120 y140 w60 h20 vMackerel ,%Mackerel%
	GUI 3:Add, Edit , x120 y160 w60 h20 vSea ,%Sea%
	GUI 3:Add, Edit , x120 y180 w60 h20 vPike,%Pike%
	GUI 3:Add, Edit , x120 y200 w60 h20 vSail ,%Sail%
	GUI 3:Add, Edit , x120 y220 w60 h20 vTuna ,%Tuna%
	GUI 3:Add, Edit , x120 y240 w60 h20 vEel ,%Eel%
	GUI 3:Add, Edit , x120 y260 w60 h20 vDolphin ,%Dolphin%
	GUI 3:Add, Edit , x120 y280 w60 h20 vShark ,%Shark%
	GUI 3:Add, Edit , x120 y300 w60 h20 vTurtle ,%Turtle%
	GUI 3:Add, Edit , x120 y320 w60 h20 vCatfish ,%Catfish%
	GUI 3:Add, Edit , x120 y340 w60 h20 vSwordfish ,%Swordfish%
	GUI 3:Add, Edit , x120 y360 w60 h20 vSquid ,%Squid%
	GUI 3:Add, Edit , x120 y380 w60 h20 vBarracuda ,%Barracuda%
	GUI 3:Add, Edit , x280 y40 w60  h20 vPiranha ,%Piranha%
	GUI 3:Add, Edit , x280 y60 w60  h20 vLobster ,%Lobster%
	GUI 3:Add, Edit , x280 y80 w60  h20 vCod ,%Cod%
	GUI 3:Add, Edit , x280 y100 w60 h20 vSardine ,%Sardine%
	GUI 3:Add, Edit , x280 y120 w60 h20 vSalmon ,%Salmon%
	GUI 3:Add, Edit , x280 y140 w60 h20 vShrimp ,%Shrimp%
	GUI 3:Add, Edit , x280 y160 w60 h20 vSturgeon ,%Sturgeon%
	GUI 3:Add, Edit , x280 y180 w60 h20 vFlounder ,%Flounder%
	GUI 3:Add, Edit , x280 y200 w60 h20 vHaddock ,%Haddock%
	GUI 3:Add, Edit , x280 y220 w60 h20 vHerring ,%Herring%
	GUI 3:Add, Edit , x280 y240 w60 h20 vStingray ,%Stingray%
	GUI 3:Add, Edit , x280 y260 w60 h20 vCarp ,%Carp%
	GUI 3:Add, Edit , x280 y280 w60 h20 vHalibut ,%Halibut%
	GUI 3:Add, Edit , x280 y300 w60 h20 vSole ,%Sole%
	GUI 3:Add, Edit , x280 y320 w60 h20 vBabyseal ,%Babyseal%	
	GUI 3:Add, Edit , x280 y380 w60 h20 vDelay ,  %Delay%
	Gui 3:Add, Text , x200 y380     h20        , Delay
	Gui 3:Add, Checkbox , x380 y290     h20	vAUTOFISHDISPLAY Checked%AUTOFISHDISPLAY%, Show Catch
	Gui 3:Add, Groupbox , x370 y35 h240 w130  	  , Keep Fish
	Gui 3:Add, Button , x380 y70  w100 , All
	Gui 3:Add, Button , x380 y110 w100 , Small
	Gui 3:Add, Button , x380 y150 w100 , Medium
	Gui 3:Add, Button , x380 y190 w100 , Large
	Gui 3:Add, Button , x380 y230 w100 , Huge
	Gui 3:Add, Button , x380 y340 w100 h60 , Apply
	Gui 3:Show, AutoSize ,Fish
	

Return
Preferences:
	if ENABLE_DEBUG = 1
		LV_Add("", "-  "  A_ThisLabel)
	gosub INIREAD
	Gui 4:Margin, 10,5
	Gui 4:Add, GroupBox, x20  y5 w150 h120 						, Auto Lotto
	Gui 4:Add, Text, 	 x30  y30 w130  						, Prefered Number
	Gui 4:Add, Text, 	 x30  y50 w130  						, 0 is Random
	Gui 4:Add, Edit, 	 x30  y80 w30  vGUILOTTO				, %GUILOTTO%
	
	Gui 4:Add, GroupBox, x20  y135 w150 h120 					, Take Drugs 
	Gui 4:Add, Text, 	 x30  y160 w130  						, Use Amount
	Gui 4:Add, Text, 	 x30  y180 w130  						, On Keybind
	Gui 4:Add, Edit, 	 x30  y205 w30  vTAKEDRUGSAMOUNT		, %TAKEDRUGSAMOUNT%
	
	Gui 4:Add, GroupBox, x20  y265 w150 h120 					, Not Used 
	Gui 4:Add, Text, 	 x30  y290 w130  						, Not Used
	Gui 4:Add, Text, 	 x30  y310 w130  						, Not Used
	Gui 4:Add, Edit, 	 x30  y335 w30  						, 
	
	Gui 4:Add, GroupBox, 	x170 y5  w300 h120 					, Vehicle Color
	Gui 4:Add, Text, 	 	x190 y30 w60  h20 					, Color 1
	Gui 4:Add, ComboBox,	x260 y30 w190 r8 vCOLOR1 			, %COLOR1%||%COLORLIST%
	Gui 4:Add, Text, 	 	x190 y70 w60  h20 					, Color 2
	Gui 4:Add, ComboBox, 	x260 y70 w190 r8 vCOLOR2 			, %COLOR2%||%COLORLIST%
	
	Gui 4:Add, GroupBox, 	x170 y135 w300 h120 				, Others
	gui 4:Add, Text, 		x190 y160 w140 h30 					, Bribe Amount
	gui 4:Add, Edit, 		x300 y160 w100 h20 vBRIBEAMOUNT 	, %BRIBEAMOUNT%
	gui 4:Add, Text, 		x190 y200 w140 h30 					, Dice Amount
	gui 4:Add, Edit, 		x300 y200 w100 h20  vPLAYDICEAMOUNT	, %PLAYDICEAMOUNT%
	

	Gui 4:Add, GroupBox,	x470  y5 w300 h120 					, Server Addresses
	gui 4:Add, Text,	 	x490 y30 w140 h30 					, Server 1 IP
	gui 4:Add, Edit, 	 	x590 y30 w150 h20 vSERVER1 			, %SERVER1%
	gui 4:Add, Text,	 	x490 y70 w140 h30 					, Server 2 IP
	gui 4:Add, Edit,	 	x590 y70 w150 h20 vSERVER2			, %SERVER2%
	
	Gui 4:Add, GroupBox, 	x470 y135 w300 h120 				, Frame Rates
	gui 4:Add, Text, 		x490 y160 w140 h30 					, FPS Lower Limit
	gui 4:Add, Edit, 		x650 y160 w50 h20 vFPSLOW			, %FPSLOW%
	gui 4:Add, Text, 		x490 y200 w140 h30 					, FPS Upper Limit
	gui 4:Add, Edit, 		x650 y200 w50 h20 vFPSHIGH			, %FPSHIGH%

	
	TAKEDRUGSAMOUNT = 25
	
	gui 4:Add, Button, 		x660 y350 w100 h50 , Apply
	
	
	
	
	;gui 4:Add, Text, x530 y230 w140 h40 , 												Chat Font Size
	;gui 4:Add, Edit, x650 y230 w150 h20 vGUIFONT, %GUIFONT%
	Gui 4:Show, AutoSize ,Preferences
Return
Keybinds:
	if ENABLE_DEBUG = 1
			LV_Add("", "-  " A_ThisLabel)
	gosub INIREAD
	gui 5:Add, Text, x20 y20 w600 h20 , Keybinder                             EXAMPLE   T/FishSlap{enter}                                    Enable
	gui 5:Add, Text, x12 y60 w30 h20 , F1
	gui 5:Add, Text, x12 y80 w30 h20 , F2
	gui 5:Add, Text, x12 y100 w30 h20 , F3
	gui 5:Add, Text, x12 y120 w30 h20 , F4
	gui 5:Add, Text, x12 y140 w30 h20 , F5
	gui 5:Add, Text, x12 y160 w30 h20 , F6
	gui 5:Add, Text, x12 y180 w30 h20 , F7
	gui 5:Add, Text, x12 y200 w30 h20 , F8
	gui 5:Add, Text, x12 y220 w30 h20 , F9
	gui 5:Add, Text, x12 y240 w30 h20 , F10
	gui 5:Add, Text, x12 y260 w30 h20 , F11
	gui 5:Add, Text, x12 y280 w30 h20 , F12
	gui 5:Add, Edit, x42 y60 w370 h20  vF1 , %F1%
	gui 5:Add, Edit, x42 y80 w370 h20  vF2, %F2%
	gui 5:Add, Edit, x42 y100 w370 h20 vF3, %F3%
	gui 5:Add, Edit, x42 y120 w370 h20 vF4, %F4%
	gui 5:Add, Edit, x42 y140 w370 h20 vF5, %F5%
	gui 5:Add, Edit, x42 y160 w370 h20 vF6, %F6%
	gui 5:Add, Edit, x42 y180 w370 h20 vF7, %F7%
	gui 5:Add, Edit, x42 y200 w370 h20 vF8, %F8%
	gui 5:Add, Edit, x42 y220 w370 h20 vF9, %F9%
	gui 5:Add, Edit, x42 y240 w370 h20 vF10, %F10%
	gui 5:Add, Edit, x42 y260 w370 h20 vF11, %F11%
	gui 5:Add, Edit, x42 y280 w370 h20 vF12, %F12%
	gui 5:Add, CheckBox, x422 y60 w50 h20  VF1E  Checked%F1E%, 
	gui 5:Add, CheckBox, x422 y80 w50 h20  VF2E  Checked%F2E%, 
	gui 5:Add, CheckBox, x422 y100 w50 h20 VF3E  Checked%F3E%, 
	gui 5:Add, CheckBox, x422 y120 w50 h20 VF4E  Checked%F4E%, 
	gui 5:Add, CheckBox, x422 y140 w50 h20 VF5E  Checked%F5E%, 
	gui 5:Add, CheckBox, x422 y160 w50 h20 VF6E  Checked%F6E%, 
	gui 5:Add, CheckBox, x422 y180 w50 h20 VF7E  Checked%F7E%, 
	gui 5:Add, CheckBox, x422 y200 w50 h20 VF8E  Checked%F8E%, 
	gui 5:Add, CheckBox, x422 y220 w50 h20 VF9E  Checked%F9E%, 
	gui 5:Add, CheckBox, x422 y240 w50 h20 VF10E Checked%F10E%, 
	gui 5:Add, CheckBox, x422 y260 w50 h20 VF11E Checked%F11E%, 
	gui 5:Add, CheckBox, x422 y280 w50 h20 VF12E Checked%F12E%, 
	gui 5:Add, Text, x20 y20 w600 h20 , Keybinder                             EXAMPLE   T/FishSlap{enter}                                    Enable
	gui 5:Add, Text, x500 y60 w30 h20 , 1
	gui 5:Add, Text, x500 y80 w30 h20 , 2
	gui 5:Add, Text, x500 y100 w30 h20 , 3
	gui 5:Add, Text, x500 y120 w30 h20 , 4
	gui 5:Add, Text, x500 y140 w30 h20 , 5
	gui 5:Add, Text, x500 y160 w30 h20 , 6
	gui 5:Add, Text, x500 y180 w30 h20 , 7
	gui 5:Add, Text, x500 y200 w30 h20 , 8
	gui 5:Add, Text, x500 y220 w30 h20 , 9
	gui 5:Add, Text, x500 y240 w30 h20 , 0
	gui 5:Add, Text, x500 y260 w30 h20 , -
	gui 5:Add, Text, x500 y280 w30 h20 , =
	gui 5:Add, Edit, x520 y60 w370 h20  vBIND1 ,%BIND1%
	gui 5:Add, Edit, x520 y80 w370 h20  vBIND2, %BIND2%
	gui 5:Add, Edit, x520 y100 w370 h20 vBIND3, %BIND3%
	gui 5:Add, Edit, x520 y120 w370 h20 vBIND4, %BIND4%
	gui 5:Add, Edit, x520 y140 w370 h20 vBIND5, %BIND5%
	gui 5:Add, Edit, x520 y160 w370 h20 vBIND6, %BIND6%
	gui 5:Add, Edit, x520 y180 w370 h20 vBIND7, %BIND7%
	gui 5:Add, Edit, x520 y200 w370 h20 vBIND8, %BIND8%
	gui 5:Add, Edit, x520 y220 w370 h20 vBIND9, %BIND9%
	gui 5:Add, Edit, x520 y240 w370 h20 vBIND10, %BIND10%
	gui 5:Add, Edit, x520 y260 w370 h20 vBIND11, %BIND11%
	gui 5:Add, Edit, x520 y280 w370 h20 vBIND12, %BIND12%
	gui 5:Add, CheckBox, x900 y60 w50 h20  vBIND1E  Checked%BIND1E%, 
	gui 5:Add, CheckBox, x900 y80 w50 h20  vBIND2E  Checked%BIND2E%, 
	gui 5:Add, CheckBox, x900 y100 w50 h20 vBIND3E  Checked%BIND3E%, 
	gui 5:Add, CheckBox, x900 y120 w50 h20 vBIND4E  Checked%BIND4E%, 
	gui 5:Add, CheckBox, x900 y140 w50 h20 vBIND5E  Checked%BIND5E%, 
	gui 5:Add, CheckBox, x900 y160 w50 h20 vBIND6E  Checked%BIND6E%, 
	gui 5:Add, CheckBox, x900 y180 w50 h20 vBIND7E  Checked%BIND7E%, 
	gui 5:Add, CheckBox, x900 y200 w50 h20 vBIND8E  Checked%BIND8E%, 
	gui 5:Add, CheckBox, x900 y220 w50 h20 vBIND9E  Checked%BIND9E%, 
	gui 5:Add, CheckBox, x900 y240 w50 h20 vBIND10E Checked%BIND10E%, 
	gui 5:Add, CheckBox, x900 y260 w50 h20 vBIND11E Checked%BIND11E%, 
	gui 5:Add, CheckBox, x900 y280 w50 h20 vBIND12E Checked%BIND12E%, 	
	
	gui 5:Add, GroupBox, x40  y325 w220 h235 w250 , Enable/Disable Keybinds
	gui 5:Add, CheckBox, x60  y350 w220 h20 vKEYPROGRAMON Checked%KEYPROGRAMON%, Programable
	gui 5:Add, CheckBox, x60  y380 w220 h20 vKEYANIMATIONON Checked%KEYANIMATIONON%, Preset Game Commands
	gui 5:Add, CheckBox, x60  y410 w220 h20 vKEYSKILLON Checked%KEYSKILLON%, Preset Item Purchase 
	gui 5:Add, CheckBox, x60  y440 w220 h20 vKEYMENUON Checked%KEYMENUON%, Preset Menu Binds
	gui 5:Add, CheckBox, x60  y470 w220 h20 vKEYFPSON Checked%KEYFPSON%, ALT+TAB Toggle FPS
	gui 5:Add, CheckBox, x60  y500 w220 h20 vKEYWINKEY Checked%KEYWINKEY%, LWIN Sit 8
	gui 5:Add, CheckBox, x60  y530 w220 h20 vKEYDLTOGGLE Checked%KEYDLTOGGLE%, CAPSLOCK Toggles DL
	Gui 5:Add, Button, Default, Apply
	gui 5:Show, , Keybinds
return

2buttonOk:
LV_Add("", "-  " A_ThisLabel)
	gui 2:Submit, NoHide
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP\, PlayerName, %PlayerName%
	gosub INIWRITE
	gosub INIREAD
	gosub setpass
	gui 2:destroy
return
1buttonApply:
LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
2buttonApply:
LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
3buttonApply:
LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
4buttonApply:
LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
5buttonApply:
LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
6buttonApply:
LV_Add("", "-  "  A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
	reload
return
7buttonApply:
LV_Add("", "-  "  A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
	reload
return
8buttonApply:
LV_Add("", "-  "  A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
	reload
return
9buttonApply:
LV_Add("", "-  "  A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
	reload
return
GuiClose:
LV_Add("", "-  "  A_ThisLabel)
	WinGetPos , X, Y, Width, Height,
	Width := Width // 1.014
	Height := Height // 1.06
	gui , submit ,nohide
	gosub INIWRITE
	gosub INIREAD
	gosub ButtonReset
ExitApp
2GuiClose:
LV_Add("", "-  "  A_ThisLabel)
	Gui 2:Submit
	gosub INIWRITE
	gosub INIREAD
	Gui 2:Destroy
return
3GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 3:submit
	gosub INIWRITE
	gosub INIREAD
	gui 3:Destroy
return
4GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 4:submit
	gosub INIWRITE
	gosub INIREAD
	gui 4:Destroy
return
5GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 5:submit
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
6GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 6:submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
return
Home:
LV_Add("", "-  "  A_ThisLabel)
	run http://crazybobs.net/website/
return
Facebook:
LV_Add("","- " A_ThisLabel)
	run http://www.facebook.com/groups/315012238581148/
return

Forums:
LV_Add("","- " A_ThisLabel)
	run http://forums.crazybobs.net
return
Stats:
LV_Add("","- " A_ThisLabel)
	run http://www.crazybobs.net/mrx/webstats/UserStats.php?username=%Name%
return
Global:
LV_Add("","- " A_ThisLabel)
	run http://www.crazybobs.net/mrx/webstats/FlashWebstats.html
return
Map:
LV_Add("","- " A_ThisLabel)
	Run http://www.crazybobs.net/mrx/map/map_web.html
return
Commands:
LV_Add("","- " A_ThisLabel)
	Run http://crazybobs.net/website/cnr-commands
return
View:
LV_Add("","- " A_ThisLabel)
	Run %logfile%
return
Search:
LV_Add("","- " A_ThisLabel)
BOOT = 0
gui, destroy
	gosub findlogfile
return
MyMenuBar:
LV_Add("", "-  "  A_ThisLabel)
return
MenuHandler:
LV_Add("","- " A_ThisLabel)
return
MenuFileOpen:
SetWorkingDir ,%USERPROFILE%\DOCUMENTS\GTASAN~1\SAMP\
FileSelectFile, logfile ,1 , chatlog.txt
if logfile =
{
	CANCELED = 1
    return
}
IfInString , logfile , chatlog.txt
	StringReplace, logdir, logfile, chatlog.txt , , 
else
	{
	LV_Add("","Failed to find chatlog.txt")
	}
SetWorkingDir ,%logdir%
LV_Add("", logfile)
return

GuiSize:
if ENABLE_DEBUG = 1
	LV_Add("", "-  "  A_ThisLabel " = " A_GuiWidth " X " A_GuiHeight)
if A_EventInfo = 1
{
    return
}
GuiControl, Move, MyListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight )
return


PostMessage:
if game = 1
	PostMessage, 0x115 , 1, 1, SysListView321, Crazybobs Cops and Robbers, ,,
return
ButtonReset:
Loop % LV_GetCount()
	{
		LVDelete = %A_Index%
		LV_Delete()
	}
if ENABLE_DEBUG = 1
	LV_Add("", "-  " A_ThisLabel)
return
Lv_Modifycol:
Loop % LV_GetCount()
	if a_index > %MAXLISTVIEW%
		LV_Delete()
Lv_Modifycol()
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


CHECKPATH:
RegRead, sadir, HKCU, Software\SAMP , gta_sa_exe
if errorlevel = 0
{
	ifexist, %sadir%
	{
		SplitPath, sadir ,, samp, , , sadrv
	}
	IfNotExist, %sadir%
		FileSelectFile, sadir , 1, C:\, Locate Grand Thieft Auto San Andreas, GTA_SA.EXE
		if errorlevel 0
		{
			MsgBox Requires GTA
			ExitApp
		}
		RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP\, gta_sa_exe, %sadir%
}
	if ENABLE_DEBUG = 1
			LV_Add("","- " A_ThisLabel " = " sadir)
return
BUILDWHITE:
return
IfNotExist , %whitelist%
{
	FileAppend, [BOT]AirCanada`n[BOT]Amtrak`n[BOT]Anna`n[BOT]BusDriverMan`n[BOT]Claude`n[BOT]Colombian`n[BOT]CrackWhore`n[BOT]CrazyFarmer`n[BOT]David`n[BOT]DrunkDriver`n[BOT]eGangsta`n[BOT]Fisherman`n[BOT]GranTurismo`n[BOT]Greyhound`n[BOT]Hernandez`n[BOT]Hippie`n[BOT]Huey`n[BOT]Jizzy`n[BOT]KentPaul`n[BOT]Lufthansa`n[BOT]NeedForSpeed`n[BOT]Otto`n[BOT]Pulaski`n[BOT]Qantas`n[BOT]RalphKramden `n[BOT]Rosie`n[BOT]SandraBullock`n[BOT]Security`n[BOT]StacysMom`n[BOT]Tenpenny`n[BOT]TestDrive`n[BOT]TGV`n[BOT]Thomas`n[BOT]Thomas`n[BOT]VIARail`n[BOT]WhiteTrash`n[BOT]Zero>`n , %whitelist%
}
Loop, Read, %whitelist%
	ignwhite = %white% %a_space% %A_LoopField%
return
BUILDBLACK:
return
IfNotExist , %blacklist%
{
	FileAppend, `n , %blacklist%
}
Loop, Read, %blacklist%
	ignblack = %black% %A_LoopField%
return
NAMEFIX:
if ENABLE_DEBUG = 1
	LV_Add("", A_ThisLabel " from " PLAYER " to " INGPLAYER )
INGPLAYER := RegExReplace(PLAYER, "!", "{!}", "", -1, 1)
INGPLAYER := RegExReplace(PLAYER, "!!", "{!!}", "", -1, 1)
INGPLAYER := RegExReplace(PLAYER, "!!!", "{!!!}", "", -1, 1)
INGPLAYER := RegExReplace(INGPLAYER, "#", "{#}", "", -1, 1)
INGPLAYER := RegExReplace(INGPLAYER, "@", "{@}", "", -1, 1)
return

SETTINGSAVE:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gosub INIWRITE
return
KILLSAMP:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfWinExist , San Andreas Multiplayer
	{
	run C:\Windows\System32\taskkill.exe /IM samp.exe , Hide
	WinWaitClose
	}
return
SERVER1:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel " = " SERVER1)
gosub CHECKPATH
gosub KILLSAMP
run "%samp%\samp.exe" %SERVER1%
SetCapsLockState , oFF
gosub KILLMULTI
return
SERVER2:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel  " = " SERVER2)
gosub CHECKPATH
gosub getpass
gosub KILLSAMP
run "%samp%\samp.exe" %SERVER2%
SetCapsLockState , oFF
gosub KILLMULTI
return
KILLMULTI:
Return
SAMPDETECT:
IfWinNotExist ,GTA:SA:MP
	{
		game = 0
	}
IfWinNotActive ,GTA:SA:MP
	{
		game = 0
	}
IfWinActive ,GTA:SA:MP
	{
		game = 1
	}
	if ENABLE_DEBUG_TICK = 1
			LV_Add("","- " A_ThisLabel " = " game)
Return
ANTISPAM:
StringLen, keylen , A_ThisHotkey
if keylen > 0
	keylen -- %keylen%
StringTrimLeft, keylast, A_ThisHotkey, %keylen%
KeyWait, %keylast% ,
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel " = " keylast)
Return

CHECKCHAT:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfNotExist, %logfile%
{
	MsgBox , 3, Fishlog by Billman87, Automatically Find Chatlog.txt?`nThis may take a some time.`n
	IfMsgBox Yes
		goto findlogfile
	IfMsgBox No
	{
		gosub MenuFileOpen
		goto BOOT
	}
	IfMsgBox Cancel
	{
		CANCELED = 1
		MsgBox, 0, Automation Disabled, Automatic features are Unavailable`nLocate Chatlog.txt to Enable Automation`nFile - Open and select Chatlog.txt
		goto BOOT
	}
}
If logfile =
{
	MsgBox , 3, Fishlog by Billman87, Automatically Search Chatlog.txt?`nThis may take a some time.`n
	IfMsgBox Yes
		goto findlogfile
	IfMsgBox No
	{
		gosub MenuFileOpen
		goto BOOT
	}
	IfMsgBox Cancel
	{
		CANCELED = 1
		MsgBox, 0, Automation Disabled, Automatic features are Unavailable`nLocate Chatlog.txt to Enable Automation`nFile - Open and select Chatlog.txt
		goto BOOT
	}
}
IfExist , %logfile%
{
	gosub iniwrite
	Gui, destroy
	goto boot 
}

ButtonDelete:
FileDelete, %logfile%
goto research
ButtonCreate:
run "%samp%\samp.exe" 127.0.0.1:1987
CreateAttempt:
gosub SAMPDETECT
if game = 0
{
	sleep 1000
	goto CreateAttempt 
}
if game = 1
{
	SendInput t/q{enter}
	Sleep 2000
	gosub SAMPDETECT
	if game = 1
		goto CreateAttempt 
}
Sleep 2000
goto research
ButtonResearch:
FileSelectFolder, SEARCHDRIVE , Computer , , Select Drive
goto research

findlogfile:
CANCELED = 0
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui add, ListView , W700 h300 gSelectChatlog, Click to Select Chatlog.txt
Gui add, Checkbox , x10 y310 vMakeChatPerma , Make Selection Permanent
Gui add, Button , 	x300 y310 , Delete
Gui add, Button , 	x400 y310 , Create
Gui add, Button , 	x500 y310 , Research
Gui , show , ,Chatlog Selector for Fishlog
	MSG = Found Drive
research:
LV_Delete()
FILECOUNT = 0
MSG = Searching
LV_Add("", MSG a_space SEARCHDRIVE)
if BOOT = 1
	return
SetWorkingDir , %SEARCHDRIVE%
Loop, chatlog.txt , 1, 1
{
	FILECOUNT++
	if BOOT = 1
		return
	LV_Add("", A_LoopFileLongPath)
}
IfEqual, FILECOUNT , 0
{
	LV_Add("", "Failed to Locate Chatlog")
}
LV_ModifyCol()
return
SelectChatlog:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)
	IfNotExist %RowText%
		return
	logfile = %RowText%
	INIWRITE, %RowText%, %inifile%, FILES, logfile
	gui , Submit, NoHide
	gui , destroy
	goto BOOT
}
return

setpass:
  Random, ,%A_now%
  Random, pe_rand1, 2, 6
  Random, pe_rand2, 4, 7
  Random, pe_rand3, 10, 90
  stringleft, pr3_L1, pe_rand3, 1
  stringright, pr3_R1, pe_rand3, 1
  pr3_L1 +=64
  pr3_R1 +=64
  pr3_L2 := chr(pr3_L1)
  pr3_R2 := chr(pr3_R1)
allstr := pe_rand1
  stringsplit, sngltr, mypass
  Loop, parse, mypass
  {
    nxtltr := sngltr%a_index%
    asc_numb := asc(nxtltr)
    chngd%a_index% := asc_numb+pe_rand1
    chngd%a_index% *= pe_rand2
    chngd%a_index% += pe_rand3
    tempor := chngd%a_index%
    allstr = %allstr%%tempor%
  }
  allstr = %allstr%%pe_rand2%%pr3_L2%
  allstr = %pr3_R2%%allstr%
  INIWRITE, %allstr%, %inifile%, SETTINGS, PASSWORD
return
getpass:
  INIREAD, allstr, %inifile%, SETTINGS, PASSWORD
  StringLeft, pr3_R2, allstr, 1
  StringRight, pr3_L2, allstr, 1
  StringTrimLeft, tempor, allstr, 1
  allstr = %tempor%
  StringTrimRight, tempor, allstr, 1
  allstr = %tempor%
  StringLeft, pd_rand1, allstr, 1
  StringTrimLeft, tempor, allstr, 1
  allstr = %tempor%
  StringRight, pd_rand2, allstr, 1
  StringTrimRight, tempor, allstr, 1
  allstr = %tempor%
  pr3_L1 := asc(pr3_L2)
  pr3_R1 := asc(pr3_R2)
  pr3_L1 -= 64
  pr3_R1 -= 64
  pd_rand3 = %pr3_L1%%pr3_R1%
  numb := strlen(allstr)/3
  loop, %numb%
  {
    StringLeft, tmpltr, allstr, 3
    StringTrimLeft, tempor, allstr, 3
    allstr = %tempor%
    tmpltr -= pd_rand3
    tmpltr /= pd_rand2
    tmpltr -= pd_rand1
    tmpwrd := chr(tmpltr)
    ps_word = %ps_word%%tmpwrd%
  }
  PASSWORD = %ps_word%
  ps_word =  
return
FISHING:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
SetTimer, Fish, %Delay%
return
fish:
if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
SetTimer, Fish, off
gosub SAMPDETECT 
if game = 0
	return
if AUTOFISHON=0
	return
if FISH = 2
	return
if FISH = 3
	return
if FISH = 1
{
	if AUTOFISH = 0
		return
	gosub CHATIN
	SendInput t/fish{enter}
	gosub CHATOUT
}
gosub FISHIN
return
FISHIN:
if ENABLE_DEBUG = 1
	LV_Add("","- "A_ThisLabel)
FISH = 3
return
FISHOFF:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
FISH = 0
FISHOUT:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel " " FISHOUT)
FISH = 1
FISHOUT = 0
return
CHATIN:
IF CHATBOX = OPEN
	{
		SendInput ^A^X{ENTER}
		if clipboard = NUL
			clipcont = 0
		else
			clipcont = 1
	}
if ENABLE_DEBUG = 1
{
	LV_Add("","- " A_ThisLabel " " clipcont " " clipboard )
}
return
CHATOUT:
if ENABLE_DEBUG = 1
{
	LV_Add("","- " A_ThisLabel " " clipcont " " clipboard )
	B_PriorHotkey = 
	B_ThisHotkey =
}
IF CHATBOX = OPEN
	{
		if clipcont = 1
			SendInput t^V
	}
		clipboard =
		clipcont = 0
return
READ:
if debug = 1
	goto READLOG
Loop, Read, %logfile%
{
	lastReadRow := A_Index  
}
if ENABLE_DEBUG = 1
	LV_Add("",  "- " A_ThisLabel " Counted " lastReadRow " Lines")
return

3buttonAll:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 0
Grouper = 0
Red = 0
Trout = 0 
Blue = 0
Mackerel = 0
Sea = 0
Pike = 0
Sail = 0
Tuna = 0
Eel = 0
Dolphin = 0
Shark = 0
Turtle = 0
Catfish = 0
Swordfish = 0
Squid = 0
Barracuda = 0
Piranha = 0
Lobster = 0
Cod = 0
Sardine = 0
Salmon = 0
Shrimp = 0
Sturgeon = 0
Flounder = 0
Haddock = 0
Herring = 0
Stingray = 0
Carp = 0
Halibut = 0
Sole = 0
Babyseal = 0
gosub fishsave
gosub fishsize
return
3buttonSmall:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 10
Grouper = 10
Red = 10
Trout = 10
Blue = 10
Mackerel = 10
Sea = 5
Pike = 5
Sail = 5
Tuna = 10
Eel = 5
Dolphin = 10
Shark = 20
Turtle = 5
Catfish = 1
Swordfish = 20
Squid = 10
Barracuda = 5
Piranha = 1
Lobster = 1
Cod = 10
Sardine = 0.8
Salmon = 10
Shrimp = 0.8
Sturgeon = 100
Flounder = 1
Haddock = 1
Herring = 1
Stingray = 100
Carp = 5
Halibut = 15
Sole = 1
Babyseal = 1
gosub fishsave
gosub fishsize
return
3buttonMedium:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 50
Grouper = 50
Red = 25
Trout = 50
Blue = 100
Mackerel = 50
Sea = 35
Pike = 35
Sail = 35
Tuna = 50
Eel = 15
Dolphin = 60
Shark = 200
Turtle = 25
Catfish = 5
Swordfish = 200
Squid = 100
Barracuda = 20
Piranha = 5
Lobster = 10
Cod = 50
Sardine = 1
Salmon = 50
Shrimp = 1
Sturgeon = 300
Flounder = 10
Haddock = 10
Herring = 10
Stingray = 500
Carp = 40
Halibut = 150
Sole = 5
Babyseal = 30
gosub fishsave
gosub fishsize
return
3buttonLarge:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 60
Grouper = 60
Red = 40
Trout = 60
Blue = 400
Mackerel = 80
Sea = 20
Pike = 20
Sail = 40
Tuna = 80
Eel = 35
Dolphin = 80
Shark = 400
Turtle = 40
Catfish = 10
Swordfish = 400
Squid = 200
Barracuda = 40
Piranha = 4
Lobster = 20
Cod = 80
Sardine = 1
Salmon = 80
Shrimp = 1
Sturgeon = 500
Flounder = 20
Haddock = 20
Herring = 20
Stingray = 500
Carp = 80
Halibut = 100
Sole = 5
Babyseal = 50
gosub fishsave
gosub fishsize
return
3buttonHuge:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 100
Grouper = 100
Red = 60
Trout = 100
Blue = 1000
Mackerel = 100
Sea = 40
Pike = 40
Sail = 85
Tuna = 100
Eel = 40
Dolphin = 150
Shark = 200
Turtle = 100
Catfish = 20
Swordfish = 600
Squid = 800
Barracuda = 60
Piranha = 6
Lobster = 40
Cod = 100
Sardine = 2
Salmon = 100
Shrimp = 3
Sturgeon = 1000
Flounder = 40
Haddock = 40
Herring = 40
Stingray = 800
Carp = 100
Halibut = 150
Sole = 7
Babyseal = 50
gosub fishsave
gosub fishsize
return

makehistory:
;FileDelete,  %makehistory%
;Loop, C:\Users\Administrator\Documents\GTA San Andreas User Files\SAMP\History\*.txt
;{
;	Loop, Read, %A_LoopFileLongPath% ,
;	{
;		FileAppend , %A_LoopReadLine%, %makehistory%
;	}
;}
return

Files:
Gui 7:  Add, Text,		x10  y10  w200 h40 , File Locations
gui 7:  Add, CheckBox, 	x30  y40  w200 h40 vOUTPUTJOURNALON Checked%OUTPUTJOURNALON%,				Output history
Gui 7:  Add, Text,     	x30  y100 w100 h30 , Log Location
Gui 7:  Add, Edit, 		x140 y100 w600 h30 vCHATLOG , %logfile%
Gui 7:  Add, Text, 		x30  y140 w100 h30 , Log to Dir
Gui 7:  Add, Edit,		x140 y140 w600 h30 vlogdir , %logdir%
Gui 7:  Add, Text, 		x30  y180 w100 h30 , History
Gui 7:  Add, Edit, 		x140 y180 w600 h30 vhistory , %history%
Gui 7:  Add, Text, 		x30  y220 w100 h30 , Whitelist
Gui 7:  Add, Edit, 		x140 y220 w600 h30 vwhitelist , %whitelist%
Gui 7:  Add, Text, 		x30  y260 w100 h30 , Blacklist
Gui 7:  Add, Edit, 		x140 y260 w600 h30 vblacklist , %blacklist%
;Gui 7:  Add, Text, x29 y2306 w100 h30 , logfile
;Gui 7:  Add, Edit, x139 y306 w600 h30 , Edit
;Gui 7:  Add, Button, x319 y356 w90 h30 , Defaults
;Gui 7:  Add, Button, x439 y356 w90 h30 , Apply
Gui 7:  Show, w800 h340
return

7GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 7:submit
	gosub INIWRITE
	gui 7:destroy
return
Debug:
Gui 8: Add, Text, x19 y16 w190 h30 , Debug
Gui 8: Add, Text, x19 y66 w130 h30 , No Match
Gui 8: Add, Edit, x159 y66 w70 h30 vENABLE_DEBUG_NOMATCH , %ENABLE_DEBUG_NOMATCH%
Gui 8: Add, Text, x19 y106 w130 h30 , Fish
Gui 8: Add, Edit, x159 y106 w70 h30 vENABLE_DEBUG_FISH , %ENABLE_DEBUG_FISH%
Gui 8: Add, Text, x19 y146 w130 h30 , Dead
Gui 8: Add, Edit, x159 y146 w70 h30 vENABLE_DEBUG_DEAD , %ENABLE_DEBUG_DEAD%
Gui 8: Add, Text, x19 y186 w130 h30 , Money
Gui 8: Add, Edit, x159 y186 w70 h30 vENABLE_DEBUG_MONEY , %ENABLE_DEBUG_MONEY%
Gui 8: Add, Text, x19 y226 w130 h30 , GPS
Gui 8: Add, Edit, x159 y226 w70 h30 vENABLE_DEBUG_GPS , %ENABLE_DEBUG_GPS%
Gui 8: Add, Text, x19 y266 w130 h30 , Help
Gui 8: Add, Edit, x159 y266 w70 h30 vENABLE_DEBUG_HELP , %ENABLE_DEBUG_HELP%
Gui 8: Add, Text, x19 y306 w130 h30 , Jury
Gui 8: Add, Edit, x159 y306 w70 h30 vENABLE_DEBUG_JURY , %ENABLE_DEBUG_JURY%
Gui 8: Add, Text, x19 y346 w130 h30 , Lotto
Gui 8: Add, Edit, x159 y346 w70 h30 vENABLE_DEBUG_LOTTO , %ENABLE_DEBUG_LOTTO%
Gui 8: Add, Text, x19 y386 w130 h30 , Time
;Gui 8: Add, Edit, x159 y386 w70 h30 vENABLE_DEBUG_TIME , %ENABLE_DEBUG_TIME%
Gui 8: Add, Text, x19 y426 w130 h30 , Crime
Gui 8: Add, Edit, x159 y426 w70 h30 vENABLE_DEBUG_CRIME , %ENABLE_DEBUG_CRIME%
Gui 8: Add, Text, x19 y466 w130 h30 , Work
Gui 8: Add, Edit, x159 y466 w70 h30 vENABLE_DEBUG_WORK , %ENABLE_DEBUG_WORK%
Gui 8: Add, Text, x19 y506 w130 h30 , Stock
Gui 8: Add, Edit, x159 y506 w70 h30 vENABLE_DEBUG_STOCK , %ENABLE_DEBUG_STOCK%
Gui 8: Add, Text, x19 y546 w130 h30 , PM
Gui 8: Add, Edit, x159 y546 w70 h30 vENABLE_DEBUG_PM , %ENABLE_DEBUG_PM%
Gui 8: Add, Text, x269 y66 w130 h30 , MSG
Gui 8: Add, Edit, x409 y66 w70 h30 vENABLE_DEBUG_MSG , %ENABLE_DEBUG_MSG%
Gui 8: Add, Text, x269 y106 w130 h30 , Dice
Gui 8: Add, Edit, x409 y106 w70 h30 vENABLE_DEBUG_DICE , %ENABLE_DEBUG_DICE%
Gui 8: Add, Text, x269 y146 w130 h30 , Time Stats
Gui 8: Add, Edit, x409 y146 w70 h30 vENABLE_DEBUG_TIMESTAT , %ENABLE_DEBUG_TIMESTAT% 
Gui 8: Add, Text, x269 y186 w130 h30 , Flower
Gui 8: Add, Edit, x409 y186 w70 h30 vENABLE_DEBUG_FLOWER , %ENABLE_DEBUG_FLOWER% 
Gui 8: Add, Text, x269 y226 w130 h30 , Server
Gui 8: Add, Edit, x409 y226 w70 h30 vENABLE_DEBUG_SERVER , %ENABLE_DEBUG_SERVER% 
Gui 8: Add, Text, x269 y266 w130 h30 , Bonus
Gui 8: Add, Edit, x409 y266 w70 h30 vENABLE_DEBUG_BONUS , %ENABLE_DEBUG_BONUS% 
Gui 8: Add, Text, x269 y306 w130 h30 , Whisper
Gui 8: Add, Edit, x409 y306 w70 h30 vENABLE_DEBUG_WHISPER , %ENABLE_DEBUG_WHISPER% 
Gui 8: Add, Text, x269 y346 w130 h30 , Dispatch
Gui 8: Add, Edit, x409 y346 w70 h30 vENABLE_DEBUG_DISPATCH , %ENABLE_DEBUG_DISPATCH% 
Gui 8: Add, Text, x269 y386 w130 h30 , Crime Report
Gui 8: Add, Edit, x409 y386 w70 h30 vENABLE_DEBUG_CRIMEREPORT , %ENABLE_DEBUG_CRIMEREPORT% 
Gui 8: Add, Text, x269 y426 w130 h30 , CnR
Gui 8: Add, Edit, x409 y426 w70 h30 vENABLE_DEBUG_CNR , %ENABLE_DEBUG_CNR% 
Gui 8: Add, Text, x269 y466 w130 h30 , House
Gui 8: Add, Edit, x409 y466 w70 h30 vENABLE_DEBUG_HOUSE , %ENABLE_DEBUG_HOUSE% 
Gui 8: Add, Text, x269 y506 w130 h30 , Vehicle
Gui 8: Add, Edit, x409 y506 w70 h30 vENABLE_DEBUG_VEHICLE , %ENABLE_DEBUG_VEHICLE% 
Gui 8: Add, Text, x269 y546 w130 h30 , Player
Gui 8: Add, Edit, x409 y546 w70 h30 vENABLE_DEBUG_PLAYER , %ENABLE_DEBUG_PLAYER% 
Gui 8: Add, Text, x519 y66 w130 h30 , Vendor
Gui 8: Add, Edit, x659 y66 w70 h30 vENABLE_DEBUG_VENDOR ,  %ENABLE_DEBUG_VENDOR% 
Gui 8: Add, Text, x519 y106 w130 h30 , Money Bag
Gui 8: Add, Edit, x659 y106 w70 h30 vENABLE_DEBUG_MONEYBAG , %ENABLE_DEBUG_MONEYBAG% 
Gui 8: Add, Text, x519 y146 w130 h30 , Birthdays
Gui 8: Add, Edit, x659 y146 w70 h30 vENABLE_DEBUG_BDAYS , %ENABLE_DEBUG_BDAYS% 
Gui 8: Add, Text, x519 y186 w130 h30 , Purchase
Gui 8: Add, Edit, x659 y186 w70 h30 vENABLE_DEBUG_PURCHASE , %ENABLE_DEBUG_PURCHASE% 
Gui 8: Add, Text, x519 y226 w130 h30 , Delivery
Gui 8: Add, Edit, x659 y226 w70 h30 vENABLE_DEBUG_DELIVERY , %ENABLE_DEBUG_DELIVERY% 
Gui 8: Add, Text, x519 y266 w130 h30 , Pet
Gui 8: Add, Edit, x659 y266 w70 h30 vENABLE_DEBUG_PET , %ENABLE_DEBUG_PET% 
Gui 8: Add, Text, x519 y306 w130 h30 , Driver
Gui 8: Add, Edit, x659 y306 w70 h30 vENABLE_DEBUG_DRIVER , %ENABLE_DEBUG_DRIVER%
Gui 8: Add, Text, x519 y346 w130 h30 , Welfare
Gui 8: Add, Edit, x659 y346 w70 h30 vENABLE_DEBUG_WELFARE , %ENABLE_DEBUG_WELFARE%
					
Gui 8: Add, Text, x519 y386 w130 h30 , Disable Chat
Gui 8: Add, Edit, x659 y386 w70 h30  vDISPLAYNOCHAT , %DISPLAYNOCHAT%
Gui 8: Add, Text, x519 y426 w130 h30 , Enable Debug
Gui 8: Add, Edit, x659 y426 w70 h30 vENABLE_DEBUG , %ENABLE_DEBUG_HELP%
Gui 8: Add, Text, x519 y466 w130 h30 , Filter No Match
Gui 8: Add, Edit, x659 y466 w70 h30 vFILTERNOMATCH , %FILTERNOMATCH%
Gui 8: Add, Text, x519 y506 w130 h30 , Max List View
Gui 8: Add, Edit, x659 y506 w70 h30 vMAXLISTVIEW , %MAXLISTVIEW%
Gui 8: Add, Text, x519 y546 w130 h30 , Search Drive
Gui 8: Add, Edit, x659 y546 w70 h30 vSEARCHDRIVE , %SEARCHDRIVE%

Gui 8: Add, Text, x769 y66 w130 h30 , Stocks
Gui 8: Add, Edit, x909 y66 w70 h30 vSHOWSTOCKS ,  %SHOWSTOCKS%
Gui 8: Add, Text, x769 y106 w130 h30 , Workers
Gui 8: Add, Edit, x909 y106 w70 h30 vSHOWWORKERS , %SHOWWORKERS%
Gui 8: Add, Text, x769 y146 w130 h30 , Murders
Gui 8: Add, Edit, x909 y146 w70 h30 vSHOWMURDERS , %SHOWMURDERS%
Gui 8: Add, Text, x769 y186 w130 h30 , Death
Gui 8: Add, Edit, x909 y186 w70 h30 vSHOWDEATHS , %SHOWDEATHS%
Gui 8: Add, Text, x769 y226 w130 h30 , Arrested
Gui 8: Add, Edit, x909 y226 w70 h30 vSHOWARRESTED , %SHOWARRESTED%
Gui 8: Add, Text, x769 y266 w130 h30 , Joiners
Gui 8: Add, Edit, x909 y266 w70 h30 vSHOWJOINERS , %SHOWJOINERS%
Gui 8: Add, Text, x769 y306 w130 h30 , Quitters
Gui 8: Add, Edit, x909 y306 w70 h30 vSHOWQUITERS , %SHOWQUITERS%
Gui 8: Add, Text, x769 y346 w130 h30 , Fish
Gui 8: Add, Edit, x909 y346 w70 h30 vSHOWFISH , %SHOWFISH%
;Gui 8: Add, Text, x769 y386 w130 h30 , Text
;Gui 8: Add, Edit, x909 y386 w70 h30 , Edit
;Gui 8: Add, Text, x769 y426 w130 h30 , Text
;Gui 8: Add, Edit, x909 y426 w70 h30 , Edit
;Gui 8: Add, Text, x769 y466 w130 h30 , Text
;Gui 8: Add, Edit, x909 y466 w70 h30 , Edit
;Gui 8: Add, Text, x769 y506 w130 h30 , Text
;Gui 8: Add, Edit, x909 y506 w70 h30 , Edit
;Gui 8: Add, Text, x769 y546 w130 h30 , Text
;Gui 8: Add, Edit, x909 y546 w70 h30 , Edit
Gui 8: Add, Text, x1009 y66 w130 h30 , Sleep Line Count
Gui 8: Add, Edit, x1149 y66 w70 h30 vSLEEPLINECOUNT , %SLEEPLINECOUNT%
Gui 8: Add, Text, x1009 y106 w130 h30 , Sleep Log Size
Gui 8: Add, Edit, x1149 y106 w70 h30 vSLEEPLOGSIZE , %SLEEPLOGSIZE%
Gui 8: Add, Text, x1009 y146 w130 h30 , Sleep To Slow
Gui 8: Add, Edit, x1149 y146 w70 h30 vSLEEPTOSLOW , %SLEEPTOSLOW%
Gui 8: Add, Text, x1009 y186 w130 h30 , Sleep To Wake
Gui 8: Add, Edit, x1149 y186 w70 h30 vSLEEPTOWAKE , %SLEEPTOWAKE%
Gui 8: Add, Text, x1009 y226 w130 h30 , Sleep To Kill
Gui 8: Add, Edit, x1149 y226 w70 h30 vSLEEPKILLMULTI , %SLEEPKILLMULTI%
Gui 8: Add, Text, x1009 y266 w130 h30 , Sleep To Detect
Gui 8: Add, Edit, x1149 y266 w70 h30 vSLEEPDETECT , %SLEEPDETECT%
Gui 8: Add, Text, x1009 y306 w130 h30 , Sleep To Log
Gui 8: Add, Edit, x1149 y306 w70 h30 vSLEEPTOLOG , %SLEEPTOLOG%
Gui 8: Add, Text, x1009 y346 w130 h30 , Sleep to Ignore
Gui 8: Add, Edit, x1149 y346 w70 h30 vSLEEPIGNORE , %SLEEPIGNORE%
Gui 8: Add, Text, x1009 y386 w130 h30 , Lv_Modifycol
Gui 8: Add, Edit, x1149 y386 w70 h30 vLV_MODIFYCOL , %LV_MODIFYCOL%
Gui 8: Add, Text, x1009 y426 w130 h30 , Keybind Check
Gui 8: Add, Edit, x1149 y426 w70 h30 vKEYBINDCHECK , %KEYBINDCHECK%
Gui 8: Add, Text, x1009 y466 w130 h30 , Read Log
Gui 8: Add, Edit, x1149 y466 w70 h30 vREADLOG , %READLOG%
Gui 8: Add, Text, x1009 y506 w130 h30 , Scroll Rate
Gui 8: Add, Edit, x1149 y506 w70 h30 vSCROLLRATE , %SCROLLRATE%
;Gui 8: Add, Text, x1009 y546 w130 h30 , Text
;Gui 8: Add, Edit, x1149 y546 w70 h30 , Edit
Gui 8: Add, Text, x769 y16 w190 h30 , Show Results
Gui 8: Add, Text, x1009 y16 w190 h30 , Performance
Gui 8: Show, w1277 h625, Debuging
return

Automation:
Gui 9: Add, CheckBox, x40 y30   w280 h40 vAUTOLOGONON  			Checked%AUTOLOGONON%		, Login 
Gui 9: Add, CheckBox, x40 y70   w280 h40 vAUTOTRUCKING  		Checked%vAUTOTRUCKING%		, Display Trucking Menu
Gui 9: Add, CheckBox, x40 y110  w280 h40 vAUTOGPSMISSION 		Checked%AUTOGPSMISSION%		, Truck Delivery GPS
Gui 9: Add, CheckBox, x40 y150  w280 h40 vAUTOGPSCARSELL  		Checked%AUTOGPSCARSELL%		, GPS to Crane
Gui 9: Add, CheckBox, x40 y190  w280 h40 vAUTTOACCEPTOFFER   	Checked%AUTTOACCEPTOFFER%	, View Vendor Inventory
Gui 9: Add, CheckBox, x40 y230  w280 h40 vAUTOHOUSEON   		Checked%AUTOHOUSEON%		, View House Menu
Gui 9: Add, CheckBox, x40 y270  w280 h40 vAUTOHOUSESTOREON   	Checked%AUTOHOUSESTOREON%	, View House Storage
Gui 9: Add, CheckBox, x40 y310  w280 h40 vAUTOJURYON   			Checked%AUTOJURYON%			, View Jury Duty
Gui 9: Add, CheckBox, x40 y350  w280 h40 vAUTOBONUSON   		Checked%AUTOBONUSON%		, View Bonuses
Gui 9: Add, CheckBox, x40 y390  w280 h40 vAUTODRUGSON   		Checked%AUTODRUGSON%		, Use Drugs While Fishing
Gui 9: Add, CheckBox, x40 y430  w280 h40 vAUTOTICKETON   		Checked%AUTOTICKETON%		, Pay Ticket
Gui 9: Add, CheckBox, x40 y470  w280 h40 vAUTOLOTTOON  			Checked%AUTOLOTTOON%		, Play Lotto
Gui 9: Add, CheckBox, x40 y510  w280 h40 vAUTOPLAYDICE   		Checked%AUTOPLAYDICE%		, Play Dice Repetitively
Gui 9: Add, CheckBox, x320 y30  w280 h40 vAUTOPLAYASKEDICE   	Checked%AUTOPLAYASKEDICE%	, Play Dice When Asked
Gui 9: Add, CheckBox, x320 y70  w280 h40 vAUTOFISHON   			Checked%AUTOFISHON%			, Auto Fishing
Gui 9: Add, CheckBox, x320 y110 w280 h40 vAUTOTHROWON   		Checked%AUTOTHROWON%		, Auto Fish Throwback 
Gui 9: Add, CheckBox, x320 y150 w280 h40 vAUTOFISHSHOW  		Checked%AUTOFISHSHOW%		, Auto Fish Sell Menu
Gui 9: Add, CheckBox, x320 y190 w280 h40 vAUTOFISHSELL 			Checked%AUTOFISHSELL%		, Auto Sell All Fish
Gui 9: Add, CheckBox, x320 y230 w280 h40 vAUTOCNRRADIO  		Checked%AUTOCNRRADIO%		, Listen to CnR Radio
Gui 9: Add, CheckBox, x320 y270 w280 h40 vAUTOFOODMISSION  		Checked%AUTOFOODMISSION%	, Start Food Mission
Gui 9: Add, CheckBox, x320 y310 w280 h40 vAUTOTRASHMISSION  	Checked%AUTOTRASHMISSION%	, Start Trash Mission
Gui 9: Add, CheckBox, x320 y350 w280 h40 vAUTOOFFERTOWAVER  	Checked%AUTOOFFERTOWAVER%	, Auto Offer Items
Gui 9: Add, CheckBox, x320 y390 w280 h40 vAUTOFISHDISPLAY   	Checked%AUTOFISHDISPLAY%	, Display Fish Menu
Gui 9: Add, CheckBox, x320 y430 w280 h40 vAUTOCOLORON  			Checked%AUTOCOLORON%		, Auto Car Coloring

Gui 9: Add, GroupBox, x9 y6 w600 h580 , Enable/Disable
Gui 9: Show, , Fishlog Automation
return

Statistics:
Gui 10: Add, CheckBox, x50 y50  w180 h40  vSHOWSTOCKS Checked%SHOWSTOCKS%, Stocks
Gui 10: Add, CheckBox, x50 y90  w180 h40  vSHOWWORKERS Checked%SHOWWORKERS%, Workers
Gui 10: Add, CheckBox, x50 y130 w180 h40 vSHOWMURDERS Checked%SHOWMURDERS%, Muders
Gui 10: Add, CheckBox, x50 y170 w180 h40 vSHOWDEATHS Checked%SHOWDEATHS%, Deaths
Gui 10: Add, CheckBox, x50 y210 w180 h40 vSHOWARRESTED Checked%SHOWARRESTED%, Arested
Gui 10: Add, CheckBox, x50 y250 w180 h40 vSHOWJOINERS Checked%SHOWJOINERS%, Joiners
Gui 10: Add, CheckBox, x50 y290 w180 h40 vSHOWQUITERS Checked%SHOWQUITERS%, Quitters
Gui 10: Add, CheckBox, x50 y330 w180 h40 vSHOWFISH Checked%SHOWFISH%, Fish
Gui 10: Add, GroupBox, x19 y30  w220 h350 v , Show Stats (Experimental)
Gui 10: Show, w286 h425, Stats
return

8GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 8:submit
	gosub INIWRITE
	gui 8:destroy
return

9GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 9:submit
	gosub INIWRITE
	gui 9:destroy
return
10GuiClose:
LV_Add("","- " A_ThisLabel)
	gui 10:submit
	gosub INIWRITE
	gui 10:destroy
return

TIMESTATS:
	if AUTOPLAYDICE = 1
		IF LASTDICEFAIL = 0
		{
		Random, dicetimmer , 10000, 30000

			settimer, playdice , %dicetimmer%
		}
	
	LV_Add("", "# ")
	TIMECOUNT ++
	


	V1 = %PHRASELINES%
	V2 = %NOMATCHPHRASELINES%
	V3 = 100
	V4 = %FISHINGATTEMPT%
	V5 = %FISHINGSUCCESS%
	V6 = %FISHTHROWN%
	result:=(v1/v2)
	result2:=(v4/v5)
	result3:=(v5/v6)
	MATCHPERCENT:=(v3/result)
	MATCHPERCENT:=Ceil(MATCHPERCENT)
	FISHPERCENT:=(v3/result2)
	FISHPERCENT:=Ceil(FISHPERCENT)
	FISHTHROWNPERCENT:=(v3/result3)
	FISHTHROWNPERCENT:=Ceil(FISHTHROWNPERCENT)
	StringTrimLeft, VAR4, VAR4, 8


	if SHOWFISH = 1
	IfNotEqual FISHINGATTEMPT , 0
	{
		
		IfNotEqual , FISHINGATTEMPT
			LV_Add("", "# Fishing  Attempts " FISHINGATTEMPT " Success " FISHINGSUCCESS " " FISHPERCENT "%" " Thrown " FISHTHROWN " " FISHTHROWNPERCENT "%")
	}
	if SHOWFISH = 1
	IfNotEqual FISHINGATTEMPT , 0
	{
		IfNotEqual , FISHINGCAUGHTFISH
			LV_Add("", "# Fishing  Caught  " FISHINGCAUGHTFISH)
	}	
	if SHOWMURDERS = 1
	{
		IfNotEqual , MURDERS
			LV_Add("", "# Murders " MURDERS)
	}	
	if SHOWDEATHS = 1
	{
		IfNotEqual , DEATHS
			LV_Add("", "# Deaths   " DEATHS)
	}
	if SHOWWORKERS = 1
	{
		IfNotEqual , WORKERS
			LV_Add("", "# Workers " WORKERS)
	}
	if SHOWOFFICERS = 1
	{
		IfNotEqual , OFFICERS
			LV_Add("", "# Officers  " OFFICERS)
	}
	if SHOWARRESTED = 1
	{
		IfNotEqual , ARRESTED
			LV_Add("", "# Arrested " ARRESTED)
	}
	if SHOWJOINERS = 1
	{
		IfNotEqual , JOINERS
			LV_Add("", "# Joiners   " JOINERS)
	}
	if SHOWQUITERS = 1
	{
		IfNotEqual , QUITTERS
			LV_Add("", "# Quitters   " QUITTERS)
	}
	MURDERS =
	DEATHS = 
	WORKERS = 
	OFFICERS = 
	ARRESTED = 

	QUITTERS =
	JOINERS =

	FISHINGCAUGHTFISH = 
	;FISHINGATTEMPT = 0
	;FISHINGSUCCESS = 0
	;LV_Add("", "# ")
return

$!^z::
SendInput {W DOWN}
return

$!^x::
SendInput {W Up}
return


$!^HOME::
SendInput {MButton DOWN}
return

CHECKIGNORE:
loop, read, %logdir%\spammers.txt
{
	If VAR3 = %A_LoopReadLine%
	{
		PLAYER = %VAR3%
		gosub autoignore
		return
	}
}
return

ADDIGNORE:

ADDEDALREADY = 0
if VAR7 = 
{
	LV_Add("", " !ADDIGNORE " VAR7 " NODATA ")
	return		
}
loop, read, %logdir%\spammers.txt	
	if VAR7 = %A_LoopReadLine%


		ADDEDALREADY = 1
if ADDEDALREADY = 1
	LV_Add("", " !ADDIGNORE " VAR7 " Already added ")

if ADDEDALREADY = 0
{
	FileAppend, %VAR7%`n, %logdir%\spammers.txt		
	LV_Add("", " !ADDIGNORE " VAR7)
	PLAYER = %VAR7%
	gosub autoignore
}
return

WATCHLOGON:
if WATCHLOGON = 1
	loop, read, %logdir%\watch.txt
	{
		IfInString, A_LoopReadLine , %VAR3%
			SoundPlay *64
		return
	}	
return