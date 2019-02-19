; Fishlog by billman87

; Autohotkey Enviroment Settings
AutoTrim, On
#SingleInstance force
#InstallMouseHook
SetKeyDelay , -1
SetBatchLines  , -1
PostMessage = 1000

; Fishlog Vars

FISH_DISCARD_POUNDS = 0
;OUTPUT_PM = 1
AUTOCOLORON = 1
PLAYER_IN_VEHICLE =  1
ENABLE_DEBUG_ERROR = 1
ENABLE_DEBUG_PERSON = 1
GROUP_INVITE_ENABLED = 1


CHATBOX = 0
giftspam = 43
HK_TARGET = Grand theft auto San Andreas
SetTimer, PERSONALITY_CLIPTO_COOLDOWN, 180000

; GUI Defualt location
X= 100
Y= 100
Width = 640
Height = 480

; Hotkey Tabs 

IniRead, TAB_LIST, Hotkeys.ini , GUI , TAB_LIST ,  	Info|Police|Group|Fishing|Animation|Showoff|Sleep|Pet|GPS|Pimp|House|Nosell|Clothes|Vehicle|Drug|Messaging|Action|Settings|ATM|Crime

IfNotExist, Hotkeys.ini
{
	IniWrite, %TAB_LIST%, Hotkeys.ini , GUI , TAB_LIST
	MsgBox Hotkeys.ini Not Found`n Generating Defaults 
	
	CMD_ATM_DEFUALT=atm|deposit_500000|withdraw_100000
	CMD_INFO_DEFUALT=animations|calls|challengerecords|citystats|closest|commands|dmrecords|faq|getid|getid__civ|getid__cop|getid__ply|getid__sus|getid_war|help|hitinfo|hitlist|information|information__civ|information__cop|information__ply|information__sus|information__war|insuranceinfo|inventory|jailinfo|jailinfo_civ|jaillist|level|level__civ|level__cop|level__ply|level__sus|level__war|locate|locate__civ|locate__cop|locate__ply|locate__sus|locate__war|markets|moneyinfo|moneyrush|morestats|myinfo|myrep|party|permits|records|rules|sellinfo|stats|stats__civ|stats__cop|stats__ply|stats__sus|stats__war|diseases|time|total|total__civ|total__cop|total__ply|total__sus|total__war|vehhelp|version|workers
	CMD_POLICE_DEFUALT=accept|arrest__war|backup|cancellastreport|copmsg|donut|fire|freeze|mostwanted|refuse|report|respond|robberies|suspects|ticket__sus|visualcontact__war|warrants
	CMD_GROUP_DEFUALT=groupcall|groupcall____1|groupcash|grouphelp|groupinvite|groupjoin|groupkick|groupleader|groupleave|grouplist|groupmsg|groups
	CMD_FISHING_DEFUALT=cooler|fish|fishbuy|fisheat|fishgive|fishhelp|fishinfo|fishinventory|fishmsg|fishprices|fishrelease|fishrecords|fishrod|fishsell|fishsellall|fishslap|fishthrow|fishtour
	CMD_ANIMATION_DEFUALT=assslap|bitchslap|carkick|come|cpr|crossarms|cry|dance|fart|flash|flowers|follow|fuckyou|go|gunpoint|handstand|hide|idle|jumpkick|kiss|lean|leansmoke|liedown|mourn|no|piss|point|puke|ride|scratch|shakehead|shout|stab|stop|taichi|yes|wank|wave
	CMD_PET_DEFUALT=pet|petattack|petattack__civ|petattack__cop|petattack__ply|petattack__sus|petattack__war|petcmds|petdiet|peteat|petfeed|petfight|petname|petslap|petstats|pettraining|givepet
	CMD_GPS_DEFUALT=driverdest|gps|gpsclear|gpsgocustom|gpshide|gpsloc|gpsresume|gpssetcustom|gpssettings
	CMD_PIMP_DEFUALT=pimp|pimpcall|pimpaccept|pimphelp|pimpinfo|pimpleave|pimpleaveall|pimpmsg|pimprefus
	CMD_HOUSE_DEFUALT=coownerlist|hotel|hotels|house|houseanswer|housecoowner|houseinvite|housekeys|housekick|fishstore|houserob|houses|housestorage|keys|rent
	CMD_NOSELL_DEFUALT=nocalls|nosell|noselladd|noselladdall|noselldel|nsselldelall|noselllist|sell|sellmenu
	CMD_CLOTHES_DEFUALT=clothes|clothesdiscard|clothesinv|clothesposition|clothesprice|clothesremove|clothessell|clotheswear
	CMD_VEHICLE_DEFUALT=ej|eja|eje|ejm|gk|ifix|lk|ulk|vehc|vehhood|vehl|vehtrunk|vehrepair
	CMD_DRUG_DEFUALT=bait|cook|drugs|drugsell|givedrugs__civ_10|givefreshdrugs|harvest|hidedrugs|hotbox|plant|pgps|plantinfo|smoke|takedrugs_10|trap
	CMD_MSG_DEFUALT=set__1|set__2|set__3|1|2|3|carwhisper|drivermsg|ignore|nopm|pm|reply|say|set_1|set_2|set_3|truckmsg|whisper
	CMD_CRIME_DEFUALT=appeal|jury|breakout|bribe|cell|escape|casinorob|bankrob|box|crowbar|hackatm|holdup|shoplift|rape|infect|kidnap|kidnapall|ransom|crimes|crimes__civ|crimes__ply|crimes__war
	CMD_ACTION_DEFUALT=ad|bail|beer|belt|buy|cancel|cancelhit|challenge|complain|courier|cnrradio|cure|cureme|delivery|dice|driver|enter|exit|fakeskill|food|givecash|givegift|giverep|heal|healcure|healme|hit|horsebet|housedelivery|items|login|lotto|mechanic|mission|moneybag|parole|payticket|police|possess|prices|refill|register|release|releaseall|rob|robbery|santa|sellcar|sex|shares|sharessell|spawn|strip_10000|sue|tip|tree|ups|weapons
	CMD_SETTINGS_DEFUALT=canims|casinosettings|changepassword|clearost|display|displayost|deathmsg|gender|gtamenu|helpmsg|joinmsg|ostsettings|settings|skill|tdsettings|fpslimit_20|fpslimit_30|fpslimit_40|fpslimit_50|fpslimit_60|fpslimit_70|fpslimit_80|fpslimit_90
	CMD_SHOWOFF_DEFUALT=dance_1|dance_2|dance_3|dance_4|stab_1|stab_2|stab_3|stab_4|showoff_1|showoff_2|showoff_3|showoff_4|showoff_5|showoff_6|showoff_7|showoff_8|showoff_9|showoff_10|showoff_11|showoff_12|showoff_13|showoff_14|showoff_15|showoff_16|showoff_17|showoff_18|showoff_19|showoff_20|showoff_21|showoff_22|showoff_23|showoff2_1|showoff2_2|showoff2_3|showoff2_4|showoff2_5|showoff2_6|showoff2_7|showoff2_8|showoff2_9|showoff2_10|showoff2_11|showoff2_12|showoff2_13|showoff2_14|showoff2_15|showoff2_16|showoff2_17|showoff2_18|showoff2_19|showoff2_20|showoff2_21|showoff2_22|showoff2_23
	CMD_SLEEP_DEFUALT=sit_1|sit_2|sit_3|sit_4|sit_5|sit_6|sit_7|sit_8|sit_9|sit_10|sit_11|sit_12|sit_13|sit_14
	CMD_Messaging_DEFUALT=pm|reply|say|set_1|set_2|set_3|truckmsg|whisper
	CMD_action_DEFUALT=ad|bail|beer|belt|buy|cancel|cancelhit|challenge|complain|courier|cnrradio|cure|cureme|delivery|dice|driver|enter|exit|fakeskill|food|givecash|givegift|giverep|heal|healcure|healme|hit|horsebet|housedelivery|items|login|lotto|mechanic|mission|moneybag|parole|payticket|police|possess|prices|refill|register|release|releaseall|rob|robbery|santa|sellcar|sex|shares|sharessell|spawn|strip_10000|sue|tip|tree|ups|weapons
	
}

loop, parse , TAB_LIST, |
{
	CMD_DEFUALT := CMD_%A_loopfield%_DEFUALT
	if A_index = 1
		CMD_LIST_DEFUALT = 
	Iniread, CMD_%A_loopfield%_LIST , Hotkeys.ini , %A_loopfield%, CMD_%A_loopfield%_LIST,  %CMD_DEFUALT%
	INIOUT := CMD_%A_loopfield%_LIST
	IniWrite, %INIOUT% , Hotkeys.ini , %A_loopfield%, CMD_%A_loopfield%_LIST
	
	CMDLIST := CMDLIST "-" CMD_%A_loopfield%_LIST
	;MsgBox %  CMDLIST
}
loop 4
	CMD_SHOWOFF_LIST = %CMD_SHOWOFF_LIST%|dance_%A_Index%
loop 4
	CMD_SHOWOFF_LIST = %CMD_SHOWOFF_LIST%|stab_%A_Index%
loop 23
	CMD_SHOWOFF_LIST = %CMD_SHOWOFF_LIST%|showoff_%A_Index%
loop 23
	CMD_SHOWOFF_LIST = %CMD_SHOWOFF_LIST%|showoff2_%A_Index%
StringTrimLeft CMD_SHOWOFF_LIST,CMD_SHOWOFF_LIST,1
loop 14
	CMD_SLEEP_LIST = %CMD_SLEEP_LIST%|sit_%A_Index%
StringTrimLeft CMD_SLEEP_LIST,CMD_SLEEP_LIST,1
StringTrimLeft CMDLIST,CMDLIST,1

Loop, parse, CMDLIST, -
	loop, parse, a_loopfield
	{
		IfInString, CMDLIST, a_loopfield
		{
			MsgBox, Duplicate found`n %a_loopfield%`nEdit Hotkeys.ini`nRemove Duplicate Commands from CMLIST
			run Hotkeys.ini
		}
	}

loop, parse, CMDLIST, -
{
	GUI_X_1 = 20
	GUI_X_2 = 0
	GUI_Y_1 = 60
	
	Gui, Tab, %a_index%	
	b_index = %a_index%
	loop, parse, A_Loopfield, |
	{
	z_index = %a_index%
    b_index = %A_Loopfield%
	if ( a_index = 21 or a_index = 41 or a_index = 61)
		{
			GUI_Y_1 = 60
			GUI_X_1 += 230
		}
		
		GUI_ADD_CMD = %A_LoopField%
		GUI_Y_1 += 30
		GUI_X_2 := (GUI_X_1 + 100)
			
		IniRead, savedHK_%A_Loopfield%, Hotkeys.ini, Hotkeys, _%A_Loopfield%, %A_Space%
		If savedHK_%A_Loopfield%       		;Check for saved hotkeys in INI file.
		{
			Hotkey, IfWinActive, ahk_class %HK_TARGET%
			Hotkey, % savedHK_%A_Loopfield%, HOTKEY_%A_Loopfield%                						;Activate saved hotkeys if found.
		}
		StringReplace, noMods, savedHK_%A_Loopfield% , ~                  								;Remove tilde (~) and Win (#) modifiers...
		StringReplace, noMods, noMods, #,,UseErrorLevel             									;They are incompatible with hotkey controls (cannot be shown).
	}
	#ctrls += z_index
}

IfExist %A_ScriptDir%\fishlog.ini
{
	inifile = %A_ScriptDir%\fishlog.ini
	goto PREBOOT
}

; Find My Docs Via Regisrty
RegRead, MYDOCS_REG, HKCU , Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders , Personal
IfExist %MYDOCS_REG%\GTASAN~1\SAMP\fishlog.ini
{
	DOCSFOUND = 1
	inifile = %MYDOCS_REG%\GTASAN~1\SAMP\fishlog.ini
	goto PREBOOT
}
	
; Find My Docs Via Path Enviroment
IfExist %USERPROFILE%\GTASAN~1\SAMP\fishlog.ini
{
	DOCSFOUND = 2
	inifile = %A_ScriptDir%\fishlog.ini	
	goto PREBOOT
}

; Existing INIFILE not found creating from regkey.
MsgBox  %MYDOCS_REG%\GTASAN~1\SAMP\fishlog.ini
FileAppend, `n , %MYDOCS_REG%\GTASAN~1\SAMP\fishlog.ini
if errorlevel = 1
{
	; Failed to locate INIFILE, Creating in same folder.
	inifile = %A_ScriptDir%\fishlog.ini
	DOCSFOUND = 3
	goto PREBOOT
	FileAppend, `n , %inifile%
	if errorlevel = 1
	{
		msgbox Could not create inifile `nSettings will not be saved
		DOCSFOUND = 0
	}
	DOCSFOUND = 4
}

PREBOOT:
if DOCSFOUND = 4
{
	msgbox Setting File Created at `n%inifile%
}
gosub INIREAD

makehistory = %logdir%\history.txt
history		= %logdir%\history
gosub fishread
gosub CHECKCHAT



return

BOOT:

BOOT = 1
	Gui, Margin , 0, 0
	Gui, +Resize 
	Gui, Font , s%GUIFONT% w10, Arial
	Gui, Add, ListView, xm w700 vMyListView gMyListView , %a_space%
	Menu, FileMenu, Add, &Clear Log,  ButtonReset
	Menu, FileMenu, Add, &Save Log,  ButtonSaveOutput
	Menu, FileMenu, Add, E&xit,  Exit
	Menu, PlayMenu, Add, Server&1, Server1
	Menu, PlayMenu, Add, Server&2, Server2
	Menu, SettingMenu, Add, Logon, 
	Menu, SettingMenu, Add, FishSize,
	Menu, SettingMenu, Add, Keybinds,
	Menu, SettingMenu, Add, Hotkeys,
	;Menu, SettingMenu, Add, Mouse,
	Menu, SettingMenu, Add, Automation,
	Menu, SettingMenu, Add, Group,
	Menu, SettingMenu, Add, Personality,
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
	Menu, WebsiteMenu, Add, Players,
	Menu, WebsiteMenu, Add, Schedule,
	Menu, WebsiteMenu, Add, GTASAv1,
	Menu, ChatlogMenu, Add, View,
	Menu, ChatlogMenu, Add, &Open,  MenuFileOpen
	Menu, ChatlogMenu, Add, Search,
	Menu, DiscordMenu, Add, Feedback,
	Menu, DiscordMenu, Add, CnR,
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Settings, :SettingMenu
	Menu, MyMenuBar, Add, &Play, :PlayMenu
	Menu, MyMenuBar, Add, &Website, :WebsiteMenu
	Menu, MyMenuBar, Add, &Chatlog, :ChatlogMenu
	Menu, MyMenuBar, Add, &Discord, :DiscordMenu
	Gui, Menu, MyMenuBar
	Gui, Show, X%X% Y%Y% W%Width% H%Height% , Crazybobs Cops and Robbers 
	IfExist, %logfile%
		LV_Add("", " Fishlog Ready")
	if CANCELED = 1
		LV_Add("", "Click File - Open and locate chatlog.txt Or Chatlog - Search to Enable Automation")
	if CANCELED != 1
	{
		gosub read
		if lastReadRow = 0
		MsgBox Failed to read chatlog.txt
	}
	SetTimer, SAMPDETECT , 10000
	SetTimer, PostMessage , 500
	SetTimer, READLOG , %READLOG%
	gosub  KEYBINDCHECK

	;lastReadRow = 1
return
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
			{
				IfNotExist %history%
					FileCreateDir, %history% 
				FileAppend ,%A_LoopReadLine%`n , %history%/%A_YYYY% %A_MM% %A_DD%.txt
			}

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


givenobot:
settimer, givenobot, off
/*
	cmd("/id "giftspam)
			giftspam++
	if giftspam > 150
		giftspam = 0
*/
return

PHRASELINE:
SetTimer , Lv_Modifycol , %Lv_Modifycol%						; Gui Update
ALREADYADDED = 0
PHRASELINES ++													
 if PHRASELINES > 9000
{
	FileCopy, %logfile%, %logfile%.%A_DD%-%A_MM%-%A_YYYY%.txt
	FileDelete , %logfile%,
	;msgbox OVER 9000!
}

GOODLINE := RegExMatch(VAR1, "[[]..[:]..[:]..[]]")				; inSanity check
IfNotEqual , GOODLINE , 1
{
	BADLINE++
	if BADLINE > 5
		MsgBox BADLINE > 5
	return
}

Loop, Parse, line , %a_space%,									; Convert String to VAR array
{
	VAR%A_index% = %A_LoopField%
	VARMAX = %A_index%
}
	
StringLen, VAR2LEG, VAR2										; what the grep
if VAR2LEG > 0
{
	VAR2LEG--
	StringTrimLeft	, VAR2E, VAR2, %VAR2LEG%
	StringTrimRight	, VAR2S, VAR2, %VAR2LEG%
	StringTrimLeft , PLAYER , VAR2 , 1
}


if (VAR2 = "(WHISPER)") && (VAR3 = PlayerName)					; Command Interpreter
{
	if VAR6 = !DING
	{
		SoundPlay *64
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
		LV_Add("", " !! IGNORE " VAR7 " Was added ")
		return
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
		return
	}
	
	IfInString, VAR6 , !Set
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
		if VAR9 = space
			VAR8 = %VAR8%{space}
		%VARSET%:=VAR8
		LV_Add("", " !! set " VARSET " = " VARSET2 )
		return
	} 
}

if VAR2S = <													; Player Text
{		
	if ENABLE_DEBUG_MSG = 1
		LV_Add("", "<< " ADDLINE)
	
	StringTrimLeft, PLAYER, VAR2, 1
	StringTrimRight, PLAYER, PLAYER, 1
	if DISPLAYNOCHAT = 0
		LV_Add("",PLAYER " " ADDLINE)
	
	return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Ticket filter ;;;;;;;;;;;;;;;;;;;;;;
	if AUTOTICKETON = 1
{
	 if (  VAR2 = "Type" ) && (  VAR3 = "" ) && (  VAR4 = "/pay" ) && (  VAR5 = "" ) && (  VAR6 = "To" ) && (  VAR7 = "Pay" ) && (  VAR8 = "Your" ) && (  VAR9 = "Ticket" ) && (  VAR10 = "And" ) && (  VAR11 = "Lower" ) && (  VAR12 = "Your" ) && (  VAR13 = "Wanted" ) && (  VAR14 = "Level." ) 
	{

		LV_Add("", "<< " ADDLINE)
		SetTimer, pay, 1000
	}

	 if (  VAR2 = "Officer" ) && (  VAR5 = "Has" ) && (  VAR6 = "Asked" ) && (  VAR7 = "You" ) && (  VAR8 = "to" ) && (  VAR9 = "Pay" ) && (  VAR10 = "Your" ) && (  VAR11 = "Ticket." )
	{
		LV_Add("", "<< " ADDLINE)
		SetTimer, pay, 1000
	}

	if (  VAR2 = "You" ) && (  VAR3 = "Have" ) && (  VAR4 = "Been" ) && (  VAR5 = "Issued" ) && (  VAR6 = "A" ) && (  VAR7 = "Ticket" ) 
	{
		LV_Add("", "<< " ADDLINE)
		SetTimer, pay, 1000
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; clipto filter

if ( VAR2 = "You" ) && ( VAR3 = "Shoplifted" )
{ 
	SetTimer, PERSONALITY_CLIPTO_COOLDOWN, 180000
	return
}

 if (  VAR2 = "Committed" ) && (  VAR3 = "A" ) && (  VAR4 = "Crime" ) && (  VAR5 = "(Attempted" ) && (  VAR6 = "Shoplifting)" )
{ 
	;LV_Add("", "<< " ADDLINE)
	PERSONALITY_CLIPTO_COOLDOWN = 1
	SetTimer, PERSONALITY_CLIPTO_COOLDOWN, 180000
}

 if (  VAR2 = "The" ) && (  VAR3 = "Shop" ) && (  VAR4 = "Owner" ) && (  VAR5 = "Has" ) && (  VAR6 = "Spotted" ) && (  VAR7 = "You" ) && (  VAR8 = "Trying" ) && (  VAR9 = "To" ) && (  VAR10 = "Steal" ) && (  VAR11 = "Items," ) && (  VAR12 = "Shoplifting" ) && (  VAR13 = "Failed." ) && (  VAR14 = "" ) && (  VAR15 = "You" ) && (  VAR16 = "Have" ) && (  VAR17 = "Been" ) && (  VAR18 = "Reported." ) 
{ 
	SetTimer, PERSONALITY_CLIPTO_COOLDOWN, 180000
	return
}


 if (  VAR2 = "You" ) && (  VAR3 = "Cannot" ) && (  VAR4 = "Steal" ) && (  VAR5 = "Items" ) && (  VAR6 = "From" ) && (  VAR7 = "The" ) && (  VAR8 = "Same" ) && (  VAR9 = "Location" ) && (  VAR10 = "Twice" ) && (  VAR11 = "In" ) && (  VAR12 = "A" ) && (  VAR13 = "Row." )
{
	PERSONALITY_CLIPTO_COOLDOWN = 0
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if (  VAR2 = "Type" ) && (  VAR3 = "" ) && (  VAR4 = "{D6D631}/holdup" ) && (  VAR5 = "" ) && (  VAR6 = "{FFFFFF}To" ) && (  VAR7 = "Begin" ) && (  VAR8 = "a" ) && (  VAR9 = "Robbery." ) 
{
	if ENABLE_DEBUG = 1
		LV_Add("","? Holdup Location")
	return

}

if ( VAR2 = "Type" ) && ( VAR2 = "{D6D631}/fire" ) && ( VAR2 = "{FFFFFF}To" ) && ( VAR2 = "Start" ) && ( VAR2 = "A" ) && ( VAR2 = "{FF0000}Fire{FFFFFF}." )
if PERSONALITY_ARSON = 1
{
	SetTimer, HOTKEY_Fire, 1000
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;START FISH Filter;;;;;;;;;;;;;;;;;;;;

 if (  VAR2 = "You" ) && (  VAR3 = "Sold" ) && (  VAR5 = "Fish" ) && (  VAR6 = "For" ) && (  VAR7 = "A" ) && (  VAR8 = "Total" )
{
	HAVEFISH = 0
	return
}

if (  VAR2 = "You" ) && (  VAR3 = "Are" ) && (  VAR4 = "Not" ) && (  VAR5 = "Carrying" ) && (  VAR6 = "Any" ) && (  VAR7 = "Fish." ) && (  VAR8 = "" ) && (  VAR9 = "Type" ) && (  VAR10 = "/fish" ) && (  VAR11 = "" ) && (  VAR12 = "to" ) && (  VAR13 = "Fish" ) && (  VAR14 = "From" ) && (  VAR15 = "A" ) && (  VAR16 = "Boat." ) 
{
	HAVEFISH = 0
	return
}

if ( VAR2 = "Please" ) && ( VAR3 = "Wait") && ( VAR5 = "Fishing" )
{
	settimer, fish, off
}

if ( VAR2 = "Fishing...") && ( VAR4 =  "Please" ) 
{
	SetTimer fish, off
}

if ( VAR2 = "Welcome" ) && ( VAR3 = "To" )
{
	LV_Add("","? Welcome")
	if ( VAR4 = "{00AAFF}24/7" ) || ( VAR4 = "{00AAFF}Xoomer") || ( VAR4 = "{00AAFF}Well" ) || ( VAR4 = "{00AAFF}Burger" ) || ( VAR4 = "{00AAFF}Cluckin'" )  || ( VAR4 = "{00AAFF}The" ) || ( VAR4 = "{00AAFF}Ammunation{FFFFFF}.") || ( VAR5 = "Sex" )	|| ( VAR4 = "{00AAFF}Binco{FFFFFF}.") || ( VAR4 = "{00AAFF}SubUrban{FFFFFF}." ) || ( VAR4 = "{00AAFF}ProLaps{FFFFFF}." ) || ( VAR4 = "{00AAFF}Victim{FFFFFF}." ) || ( VAR4 = "{00AAFF}Didier" )	|| ( VAR4 = "{00AAFF}Zip{FFFFFF}.") || ( VAR5 = "Barber" ) || ( VAR6 = "Shop{FFFFFF}." ) || ( VAR5 = "Crack" ) || ( VAR6 = "House{FFFFFF}." ) || ( VAR5 = "Diner{FFFFFF}." ) || ( VAR5 = "Bar{FFFFFF}." )
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("","? Welcome To " VAR4 " Havefish " HAVEFISH " Auto Sell " AUTOFISHSELL)
		
		if HAVEFISH = 1
		{
		if ( VAR4 = "{00AAFF}24/7" ) ( VAR4 = "{00AAFF}Xoomer") || ( VAR4 = "{00AAFF}Well" ) || ( VAR4 = "{00AAFF}Burger"  || ( VAR4 = "{00AAFF}Cluckin'" ) )
			{
				SendInput {Shift}
				if ( AUTOFISHSHOW = 1 ) && (AUTOFISHSELL = 0)
					SetTimer, fsell , 2000
				if AUTOFISHSELL = 1
					SetTimer, fsellall , 2000
					return
			}
		}
		if ENABLE_DEBUG_PERSON = 1
			LV_Add("","? Welcome To " VAR4 " Clipto " PERSONALITY_CLIPTO " Cooldown " PERSONALITY_CLIPTO_COOLDOWN )
		if PERSONALITY_CLIPTO = 1
		{
			if PERSONALITY_CLIPTO_COOLDOWN = 0
			{
				PERSONALITY_CLIPTO_COOLDOWN = 1
				SetTimer, HOTKEY_Shoplift , 3000
				;SetTimer, PERSONALITY_CLIPTO_COOLDOWN, 90000
			}
		}		
	}
}

if ( VAR2 = "You" ) && ( VAR3 = "Sold" ) && ( VAR4 = "2" ) && ( VAR5 = "Fish") ; && VAR6 = "For" && VAR7 = "A" && VAR8 = "Total" && VAR9 = "Of"  && VAR10 = "$95633." && VAR11 = "" && VAR12 = "Thank" && VAR13 = "You," && VAR14 = "Come" && VAR15 = "Again!") 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Sold " VAR4 " for " VAR10 )
	FISH_SOLD := (FISH_SOLD + VAR4)
	FISH_SOLD_CASH += %VAR10%
	HAVEFISH = 0
	
		LV_Add("", "# Fishing Total " FISH_SOLD " for " FISH_SOLD_CASH )
	return
}

if (VAR2 = "Fishing..." ) && ( VAR4 = "Please" ) && ( VAR5 = "Wait" ) && ( VAR6 = "Until" ) && ( VAR7 = "Your" ) && ( VAR8 = "Line" ) && (VAR9 = "Is") && ( VAR10 = "Fully" ) && ( VAR11 = "Reeled" ) && (VAR12 = "In." )
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Started")
	
	FISHINGATTEMPT ++
	PLAYER_IN_PD = 0
	PLAYER_IN_BOAT = 1
	PLAYER_IN_CAR =  0
	PLAYER_IN_TRUCK =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	PLAYER_IN_COURIER = 0
	
	return
}

if (VAR2 = "Fishing" ) && ( VAR3 = "Tournament" ) && ( VAR4 = "Catch" ) ;&& ( VAR5 = "The" ) && ( VAR6 = "Most" ) && ( VAR7 = "Dolphins" ) && ( VAR8 = "To" ) && ( VAR9 = "Win." ) && ( VAR10 = "The" ) && ( VAR11 = "Tournament" ) && ( VAR12 = "Ends" ) && ( VAR13 = "At 20:00." )
{	
	if ENABLE_DEBUG_FISH = 1
	{
		LV_Add("", "# " VAR2 " " VAR3 " " VAR6 " " VAR7)
	return
	}
	
	FISH_TOURN = 1
	return
}

if (VAR2 = "Press" ) && ( VAR3 = "The" ) && ( VAR5 = "{D6D631}SUB-MISSION" ) && ( VAR12 = "{D6D631}/fish" ) && ( VAR16 = "Go") && ( VAR17 = "Fishing." )
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "# Fishing Here")
	
	PLAYER_IN_BOAT = 1
	
	IF FPS = %FPSLOW%
		gosub FPSHIGH
	
	if AUTOFISHON = 1
		settimer, fish, %delay%
	return
}

if ( VAR2 = "You" ) && ( VAR3 = "Failed" ) && ( VAR4 ="To" ) && ( VAR5 = "Catch" ) && ( VAR6 = "Anything." )
{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Failed To Catch")
		FISHOUT = 2
		gosub fishout
		settimer, fish, %delay%
		return

}

if ( VAR2 = "You" ) && (  VAR3 ="Have" ) && ( VAR4 = "Thrown" ) && (VAR5 = "A" ) && VAR6= 7.1 || ( VAR7 = "Pound" ) || ( VAR8 = "Pound" )
{
	
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Thrown " VAR6 " " VAR8 " " VAR9)
	FISH_DISCARD++
	FISH_DISCARD_POUNDS +=  %VAR6%
		LV_Add("", "# Fish Discarded " FISH_DISCARD " " FISH_DISCARD_POUNDS " Pound")
	return
}

if ( VAR2 = "Your" ) && ( VAR3 = "Fish" ) && ( VAR4 = "Was" ) && ( VAR5 = "Eaten" ) && ( VAR6 = "By" ) && ( VAR7 = "A" ) && ( VAR8 = "Bird." )
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Bird ate your fish")
	FISHOUT = 4
	gosub fishout
	settimer, fish, %delay%
	return
} 

if ( VAR2 = "You" ) && ( VAR3 = "Were" ) && ( VAR4 = "Raped" ) && ( VAR5 = "By" ) && ( VAR6 = "A" ) && ( VAR7 = "Mermaid.") 
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Mermaid Raped")
		FTD = 4
		FISHOUT = 8
		gosub fishout
		settimer, fish, %delay%
		if AUTODRUGSON = 1
			gosub takedrugs
		return
	}

if ( VAR2 = "You" ) && ( VAR3 = "Found" ) && ( VAR4 = "Nemo!" ) && ( VAR5 = "" ) && ( VAR6 = "Received" ) && ( VAR7 = "A" ) && ( VAR8 = "$25000" ) && ( VAR9 = "Bonus.") 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Found Nemo " (FISHNEMO++) )
	
	FISHOUT = 4
	gosub fishout
	settimer, fish, %delay%
	return
}
/*
if ( VAR2 = "You" && VAR3 = "Don't" && VAR4 = "Own" && VAR5 = "A" && VAR6 = "Fishing" && VAR7 = "Rod.") 
	return
if ( VAR2 = "Purchased" && VAR3 = "A" && VAR4 = "Fishing" && VAR5 = "Rod" && VAR6 = "For" && VAR7 = "$43500.") 
	return
if ( VAR2 = "Type" && VAR3 = "{D6D631}/rod" && VAR4 = "{FFFFFF}to" && VAR5 = "Take" && VAR6 = "Out" && VAR7 = "or" && VAR8 = "Put" && VAR9 = "Away" && VAR10 = "your" && VAR11 = "Fishing" && VAR12 = "Rod" && VAR13 = "Quickly.") 
	return
*/

if ( VAR2 = "You" ) && ( VAR3 = "Have" ) && ( VAR4 = "Removed" ) && ( VAR5 = "Your" ) && ( VAR6 = "Fishing" ) && ( VAR7 = "Rod." ) 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Rod Removed")	
		
	FISHING_ROD = 0
	AUTOFISH = 0
	
		return
}

 if ( VAR2 = "You" ) && ( VAR3 = "Are" ) && ( VAR4 = "Now" ) && ( VAR5 = "Wearing" ) && ( VAR6 = "Your" ) && ( VAR7 = "Fishing" ) && ( VAR8 = "Rod" ) 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Rod Equipped")	

	FISHING_ROD = 1
	AUTOFISH = 1
	
	if FISH = 3 ; if already fishing dont try again
	{
		return
	}
	
	gosub fish
	return

}

/*
; [12:43:01] palomillo... (82) Has Been Attacked By A Sea Monster While Fishing.
; 
; [19:38:34] You Have Been Attacked By A Sea Monster Who Ate 10 Of Your Fish.
*/

if ( VAR2 = "You" ) && ( VAR3 = "Have" ) && ( VAR4 = "Been" ) && ( VAR5 = "Attacked" ) && ( VAR6 = "By" ) && ( VAR7 = "A" ) && ( VAR8 = "Sea" ) && ( VAR9 = "Monster" ) ; Who Ate 10 Of Your Fish.
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Sea Monster Ate " VAR12 " Fish")
	FISHOUT = 5
	gosub fishout
	settimer, fish, %delay%
	return

}

if ( VAR2 = "You" ) && ( VAR3 = "Killed" ) && ( VAR6 = "Monster" )
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Sea Monster Killed ")
	FISHOUT = 5
	gosub fishout
	settimer, fish, %delay%
	return

}

if ( VAR2 = "You" ) && ( VAR3 = "Failed" ) && ( VAR4 = "To" ) && ( VAR5 = "Catch" ) && ( VAR6 = "Anything.") 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Failed")
	FISHOUT = 6
	gosub fishout
	settimer, fish, %delay%
	return
}
	
if ( VAR2 = "You" ) && ( VAR3 = "Found" ) && ( VAR4 = "A" ) && ( VAR5 = "Dead" ) && ( VAR6 = "Body." )
{
if ENABLE_DEBUG_FISH = 1
	LV_Add("", "# Fishing Dead Body")
	FISHOUT = 7
gosub fishout
settimer, fish, %delay%
return
}	

if ( VAR2 = "You" ) && ( VAR3 = "Can" ) && ( VAR4 = "Only" ) && ( VAR5 = "Fish" ) && ( VAR6 = "On" ) && ( VAR7 = "Water.") 
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Not Here")
	FISH = 1
	return
}


if VAR7 = Treasure
{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Treasure " VAR9)
	
		FISHOUT = 9
	gosub fishout
	settimer, fish, %delay%
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
		gosub fishout
		settimer, fish, %delay%
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
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Toilet
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Toilet")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 12
		gosub fishout
		settimer, fish, %delay%
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
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Sunfish
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Sunfish")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 14
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Body
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Body Armor")	
		IfNotInString , FISHINGCAUGHT , %VAR6%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR6% %A_Space%	
		FISHOUT = 15
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Used
	{		
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Used Condom")	
		IfNotInString , FISHINGCAUGHT , %VAR6%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR6% %A_Space%	
		FISHOUT = 16
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Condom
	{		
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Condom")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 17
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Seaweed.
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Seaweed")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 17
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Weapon
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Weapon")	
		IfNotInString , FISHINGCAUGHT , Weapons	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Weapons %A_Space%	
		FISHOUT = 17
		gosub fishout
		settimer, fish, %delay%
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
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Drug
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Drug")	
		IfNotInString , FISHINGCAUGHT , Drugs	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Drugs %A_Space%	
		FISHOUT = 19
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Old
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Old")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 20
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Car
	{
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Fishing Caught Car Tire")	
		IfNotInString , FISHINGCAUGHT , Tyre	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Tyre %A_Space%	
		FISHOUT = 21
	gosub fishout
	settimer, fish, %delay%
	return
	}
	if VAR5 = Money
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Money")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 21
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Clam
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Clam")	
		IfNotInString , FISHINGCAUGHT , %VAR5%	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% %VAR5% %A_Space%	
		FISHOUT = 22
		gosub fishout
		settimer, fish, %delay%
		return
	}
	if VAR5 = Bonus
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("", "# Fishing Caught Bonus")	
		IfNotInString , FISHINGCAUGHT , Bonus	

			FISHINGCAUGHTFISH = %FISHINGCAUGHTFISH% Bonus %A_Space%
		FISHOUT = 23
		gosub fishout
		settimer, fish, %delay%
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
		gosub fishout
		settimer, fish, %delay%
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


if (  VAR2 = "Congratulations," ) && (  VAR3 = "You" ) && (  VAR4 = "Receive" ) && (  VAR5 = "The" ) && (  VAR6 = "Fisherman" ) && (  VAR7 = "Of" ) && (  VAR8 = "The" ) && (  VAR9 = "Day" ) && (  VAR10 = "Award!" ) ; && (  VAR11 = "" ) && (  VAR12 = "Today's" ) && (  VAR13 = "Fish" ) && (  VAR14 = "Caught:" ) && (  VAR15 = "31" ) && (  VAR16 = "" ) && (  VAR17 = "" ) && (  VAR18 = "Bonus:" ) && (  VAR19 = "$27000." ))
	{
		if ENABLE_DEBUG_FISH = 1
			LV_Add("","# Fisherman Of The Day Award! " VAR15 " " VAR19)
		return
	}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END FISH FILTER;;;;;;;;;;;;;;;;;

 if  ( VAR2 = "{FFFFFF}SA-MP") && ( VAR3 = "{B9C9BF}0.3.7") && ( VAR4 = "{FFFFFF}Started" )
{
	GAME_SAMP_VERSION = VAR3
	PLAYER_IN_VEHICLE =  0
	PLAYER_IN_PD = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_TRUCK =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	PLAYER_IN_COURIER = 0
	return
}

if (VAR2 = "Press" ) && ( VAR3 = "The" ) && ( VAR5 = "{D6D631}SUB-MISSION" ) && ( VAR12 = "{D6D631}/delivery" ) && ( VAR17 = "Truck") && ( VAR18 = "Delivery." )
{	
	if ENABLE_DEBUG_DELIVERY = 1
		LV_Add("", "# Trucking Now?")
	
	PLAYER_IN_TRUCK =  1
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 1
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	PLAYER_IN_COURIER = 0
	if AUTOTRUCKING = 1
		gosub delivery
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Start Lotto FILTER;;;;;;;;;;;;;;;;;
if AUTOLOTTOON = 1

{
	
	if (  VAR2 = "CnR" ) && (  VAR3 = "Lottery" ) && (  VAR4 = "" ) && (  VAR5 = "" ) && (  VAR6 = "Today's" ) && (  VAR7 = "Number:" )
	{
	LOTTOSTOP = 0
	SetTimer , lotto , 3000
	return
	}
	
if (  VAR2 = "The" ) && (  VAR3 = "Game" ) && (  VAR4 = "Week" ) && (  VAR5 = "Is" ) && (  VAR6 = "Almost" ) && (  VAR7 = "Over." ) && (  VAR8 = "" ) && (  VAR9 = "There" ) && (  VAR10 = "Will" ) && (  VAR11 = "Be" ) && (  VAR12 = "No" ) && (  VAR13 = "More" ) && (  VAR14 = "Lottery" ) && (  VAR15 = "Draws" ) && (  VAR16 = "This" ) && (  VAR17 = "Week." )
	{
		SetTimer , lotto , off
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","!! Lotto End Week " )
		LOTTOSTOP = 1
	}
	if (  VAR2 = "Game" ) && (  VAR3 = "Time:" ) && (  VAR4 = "{BDBDBD}Saturday," )
	{
		SetTimer , lotto , off
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","!! Lotto Not Saturday " )
		LOTTOSTOP = 1
	}
		
	if ( VAR2 = "Someone") && ( VAR3 = "Has" ) && ( VAR4 = "Already" ) && ( VAR5 = "Chosen" )
	{
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","!! Lotto Your Number Taken " )
		LOTTOFAIL = 1
		SetTimer, lotto, Off
		Settimer, randomLotto, 3000
	}

	if ( VAR2 = "Your" ) && ( VAR3 = "Lottery" ) && ( VAR4 = "Number:" ) ; VAR5 = 87
	{
		
		if ENABLE_DEBUG_LOTTO = 1
			LV_Add("","!! Lotto Your Number " VAR5 " Jackpot " VAR5 )
		SetTimer, lotto, Off
		LOTTOPLAYED = 1
		LOTTOFAIL = 0
		return
	}

	if ( VAR2 = "CnR" ) && ( VAR3 = "Daily" ) && ( VAR4 = "Lottery" ) && ( VAR5 = "Current" ) && ( VAR6 = "Jackpot:" ) ;&& ( VAR7 = "$2721269" )
	{
		LV_Add("","!! Lotto Jackpot " VAR7)
		SetTimer, lotto, 1000
		LOTTOFAIL = 0
		return
	}

	if ( VAR2 = "Today's" && VAR3 = "Number:" ) ; && VAR4 = "42" && VAR8 = "Jackpot:" && VAR9 = "$9206149" && VAR14 = "Bonus:" && VAR15 = "$60000") 
	{
		LV_Add("","!! Lotto Winning Number " VAR6 " " )
		SetTimer, lotto, 1000
		LOTTOPLAYED = 0
		LOTTOFAIL = 0
		return
	}	

	if ( VAR2 = "WINNER!!!" )  && ( VAR6 = "Wins" ) && (VAR9 = "Congratulations!") ; VAR4 = "[HoUsE]BoR" && VAR5 = "(55)" && VAR7 = "$9206149."
	{
		LV_Add("","!! Lotto Winer " VAR4 " " VAR7)
		SetTimer, lotto, 1000
		LOTTOPLAYED = 0
		LOTTOFAIL = 0
		return
	}	


	if ( VAR2 = "CnR") && ( VAR3 = "Lottery" ) && ( VAR4 = "Today's" ) && ( VAR5 = "Number:" ) ; VAR6 = 55  -  Jackpot: $4898775  - No Winner.
	{
		LV_Add("","!! Lotto Winning Number " VAR6 " " )
		SetTimer, lotto, 1000
		LOTTOPLAYED = 0
		LOTTOFAIL = 0
		return
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END lotto FILTER;;;;;;;;;;;;;;;;;


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

if VAR2 = Type
{
	if VAR4 = /groupjoin
	{
		if ENABLE_DEBUG = 1
				LV_Add("","Join Group")
		if AUTOGROUP_JOIN = 1
			gosub grj
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
			GROUP_ADVERT_COUNT = 0
			AUTOGROUP_CREATED = 0
			AUTOGROUP_INVITE_START = 0
			IF IDLE_ENABLE = 1
			{
				IfGreater, A_TimeIdle, %IDLE_TIMEOUT%000, 
				{
					MsgBox,2,AFK, Welcome back %PlayerName%`nWould you like to play a game?
					Ifmsgbox Retry
						WinActivate , ahk_class Grand theft auto San Andreas
					Ifmsgbox Abort
					{
						gosub KILLSAMP
						exitapp
					}
				}
			}
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
			if AUTOBONUSON = 1
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
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}		
	if VAR3 = Color
	{
		PLAYER_IN_VEHICLE =  1
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Color Applied ")
		;FileAppend ,%VAR6%`n , %carlist%
		DONATOR = 1
		return
	}
	if VAR3 = Police
	{
		if ENABLE_DEBUG_CRIME = 1
		LV_Add("", "# Crime Police Notified")
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
		if AUTOBONUSON = 1
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
	/*
	if AUTOLOTTOON = 1
		if LOTTOPLAYED = 0
			SetTimer, lotto, 1000
*/ 
if (  VAR2 = "Game" ) && (  VAR3 = "Time:" ) && (  VAR4 = "{BDBDBD}Saturday," ) || (  VAR5 = "18:00" ) || (  VAR5 = "19:00" ) || (  VAR5 = "20:00" ) || (  VAR5 = "21:00" ) || (  VAR5 = "22:00" ) || (  VAR5 = "23:00" )
		LOTTOSTOP = 1
	else 
		LOTTOSTOP = 0

	gosub TIMESTATS
	
	if AUTOGROUP_CREATED = 1
	{
		if GROUP_ADVERT_ENABLE = 1
		{
			GROUP_ADVERT_COUNT++
			if GROUP_ADVERT_TIME = %GROUP_ADVERT_COUNT%
			{
				GROUP_ADVERT_COUNT = 0
				settimer, GROUP_ADVERT, 5000
			}
		}
	}	
	
	
	
	if AUTOPLAYDICE = 1
		IF LASTDICEFAIL = 0
		{
			random, dicetimmer , 10000, 30000
			settimer, playdice , %dicetimmer%
		}
	
	if PLAYER_IN_VEHICLE =  1
	{
		if (( COLORN1 = 256 || COLORN2 = 256 ))
		{	
			CAR_COLOR_A++
			if CAR_COLOR_A = %COLOR_TIMER%
			{
				gosub HOTKEY_vehc
				CAR_COLOR_A = 0
			}
		}
	}			


	;cmd("/id  "giftspam)
	
	;		giftspam++
	;if giftspam > 200
	;	giftspam = 0
	
	return
}	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; (MSG)    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


if ((VAR2 = PM) && (VAR3 = From))
	{
		if ENABLE_DEBUG_PM = 1
			LV_Add("", # ADDLINE)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt

		return
	}
	
if ((VAR2 = PM) && (VAR3 = Sent))
	{
		if ENABLE_DEBUG_PM = 1
			LV_Add("", # ADDLINE)
			;LV_Add("", "# PM Sent " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}



if VAR2 = {FAAC58}(FISH
{
	if VAR3 = MSG)
	{
		if ENABLE_DEBUG_FISHMSG = 1
			LV_Add("", "# Fishing Message Received")
		IfNotInString ,FISHERMEN , VAR4
			FISHERMEN = %FISHERMEN% %VAR4% %a_space%
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}
}
if VAR2 = (CAR
	{
		if ENABLE_DEBUG_WHISPER = 1
			LV_Add("","# (WHISPER) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	} 
if VAR2 = (WHISPER)
	{
		if ENABLE_DEBUG_WHISPER = 1
			LV_Add("","# (WHISPER) " VAR3 " " VAR4)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	} 
if VAR2 = (911
	{
		if ENABLE_DEBUG_911 = 1
			LV_Add("","# (911) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	} 
if VAR2 = (GROUP
	{
		if ENABLE_DEBUG_GROUPMSG = 1
			LV_Add("","% (GROUP MSG) " VAR4 " " VAR5)
		if VAR3 = MSG)
		{
			if VAR4 = %PlayerName%
			{
				if VAR6 = !advert
					if VAR7 = off
						GROUP_ADVERT_ENABLE = 0
					if VAR7 = on
						GROUP_ADVERT_ENABLE = 1
					if VAR7 = 0
						GROUP_ADVERT_ENABLE = 0
					if VAR7 = 1
						GROUP_ADVERT_ENABLE = 1
				
					
				if ENABLE_DEBUG_GROUPMSG = 1
				LV_Add("","% (GROUP !ADVERT) " VAR4 " " VAR5 " " VAR6 " " VAR7)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
				return
			}
		}
	}
if VAR2 = (DM
	{
		if ENABLE_DEBUG_GROUPMSG = 1
			LV_Add("","% (DM MSG) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}
if VAR2 = {0044FF}(COP
	{
		if ENABLE_DEBUG_COPMSG = 1
			LV_Add("","% (COP MSG) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}
if VAR2 = (COP
	{
		if ENABLE_DEBUG_COPMSG = 1
			LV_Add("","% (COP MSG) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}
if VAR2 = {FAAC58}(TRUCKER
	{
		if ENABLE_DEBUG_TRUCKERMSG = 1
			LV_Add("","% (TRUCKER MSG) " VAR4 " " VAR5)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}
   if VAR2 = (DISPATCH)
	{
		if ENABLE_DEBUG_DISPATCH = 1
			LV_Add("","% Crime " VAR3 " " VAR4 " Request Backup " VAR9 " " VAR10 " " VAR11)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	} 
if VAR2 = (CRIME
	if VAR3 = REPORT)
	{
		if ENABLE_DEBUG_CRIMEREPORT = 1
			LV_Add("","% Crime " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13)
		if OUTPUT_PM = 1
			FileAppend, %ADDLINE%, %logdir%\PM.txt
		return
	}	
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if VAR2 = I
{
	if VAR3 = Feel
	{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "# HELP I can Feel It Coming")
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



;;;;;;;;;;;;;;;;;;;;;;;;; Car color filter

if (  VAR2 = "Type" ) && (  VAR3 = "" ) && (  VAR4 = "{D6D631}/vehhelp" ) && (  VAR5 = "" ) && (  VAR6 = "{FFFFFF}For" ) && (  VAR7 = "Vehicle" ) && (  VAR8 = "Commands." ) && (  VAR9 = "" ) && (  VAR10 = "-" ) && (  VAR11 = "" ) && (  VAR12 = "" ) && (  VAR13 = "Type" ) && (  VAR14 = "" ) && (  VAR15 = "{D6D631}/display" ) && (  VAR16 = "" ) && (  VAR17 = "{FFFFFF}To" ) && (  VAR18 = "Set" ) && (  VAR19 = "Your" ) && (  VAR20 = "Speedometer" ) && (  VAR21 = "Options." ) 
{
	PLAYER_IN_VEHICLE =  1
	if ENABLE_DEBUG = 1
		LV_Add("", "? /vehhelp " COLORN1 " " COLORN2)
	PLAYER_IN_VEHICLE =  1
	IN_CH = 0
	if DONATOR = 1
		SetTimer, HOTKEY_vehc , 500
	return
}	

if VAR5 = {D6D631}/truckmsg
{
	PLAYER_IN_VEHICLE =  1
	PLAYER_IN_TRUCK =  1
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? Trucking")
	return
}

if VAR9 = /delivery ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
{

	PLAYER_IN_VEHICLE =  1
	PLAYER_IN_TRUCK =  1
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	
	if ENABLE_DEBUG_DELIVERY = 1
		LV_Add("", "? Truck Delivery")
	IN_CH = 0
	return
}


;;;;;;;;;;;;;;;;;;;; House filter

 if (  VAR2 = "Type" ) && (  VAR3 = "" ) && (  VAR4 = "/house" ) && (  VAR5 = "" ) && (  VAR6 = "Or" ) && (  VAR7 = "Press" ) && (  VAR8 = "The" ) && (  VAR9 = "SUB-MISSION" ) && (  VAR10 = "Button" ) && (  VAR11 = "For" ) && (  VAR12 = "House" ) && (  VAR13 = "Options." ) 
{
	if ENABLE_DEBUG_HELP = 1
		LV_Add("", "? House Entered")

	if AUTOHOUSEON = 1
		SetTimer, HOTKEY_house, 100
	if AUTOHOUSEFISH = 1
		SetTimer, HOTKEY_fishstore, 200
	
	return
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
		if AUTOBONUSON = 1
			gosub vsi
		return
	}
	if VAR4 = Fish:
	{
		if VAR7 = Minimum
		{
			if ENABLE_DEBUG_FISH = 1
				LV_Add("", "# Bonus Fish " VAR4 " " VAR5)
			if AUTOBONUSON = 1
				gosub bonusfish
			return
		}
	if ENABLE_DEBUG_FISH = 1
		LV_Add("", "# Bonus Fish " VAR6 " " VAR7)
	if AUTOBONUSON = 1
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
	LOTTOFAIL = 0
		SetTimer, lotto, 3000
	return
}
if VAR4 ={0077FF}CrazyBob's
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Welcome")
	LOTTOSTOP = 0
	return
}
if VAR2 = Data
{
	if ENABLE_DEBUG_SERVER = 1
		LV_Add("", "# Server Player Exists")
	LOGEDIN = Yes
	
	if AUTOLOTTOON = 1
		SetTimer, lotto, 1000
	if AUTOCNRRADIO = 1
		settimer, radio, 1500
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
	reset()
	return
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Dead ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if ( VAR4 = "Mourns" ) && ( VAR5 = "The" ) && ( VAR6 = "Death" )
{
	SetTimer, mourn, off
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Mourn " VAR8 " " VAR9)			
		return
}


if ( VAR4 = "Has" ) && ( VAR5 = "Been" ) && ( VAR6 = "Stabbed" ) && ( VAR7 = "To" ) && ( VAR8 = "Death" )
{
		if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Insulted " VAR10 " " VAR11)		
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR10%
			MURDERS = %MURDERS% %VAR10% %a_space%
		DEAD = %VAR2%
		
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		;settimer, deadgift, 5000
	return
}

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
		DEAD = %VAR2%
		
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		;settimer, deadgift, 5000
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
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}	
	if VAR7 = Sea
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead Mermaid by " VAR2 " " VAR3 )
		IfNotInString , DEATHS , *Mermaid
			DEATHS = %DEATHS% %VAR2% %a_space%
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}
}

if VAR4 = Died
{
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " " VAR4 " " VAR5 " ???")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
	
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}
	if VAR6 = From
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " From " VAR7 " " VAR8 " " VAR9)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Died by " VAR6 " " VAR7 " " VAR8 " " VAR9)
	IfNotInString , DEATHS , %VAR2%
		DEATHS = %DEATHS% %VAR2% %a_space%
	IfNotInString , MURDERS , %VAR6%
		MURDERS = %MURDERS% %VAR6% %a_space%
		;DEAD = %VAR2%
		;; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " " VAR4)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
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
		
		DEAD = %VAR2%
		; settimer, deadgift, 5000
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
		return
	}
	if ENABLE_DEBUG_DEAD = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Death by " VAR10 " " VAR11)
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		IfNotInString , MURDERS , %VAR10%
			MURDERS = %MURDERS% %VAR10% %a_space%
		if PERSONALITY_MOURN = 1
			settimer, mourn, 10
	return
}

;;;;;;;;;;;;;;;;;;;;;; IS ;;;;;;;;;;;;;;;;;;;;;;;;;;

;[01:45:48] Darkey3 (78) Has Sent You a Gift!  Type  /gift  To Accept The Gift.

if VAR4 = Has
{
	if VAR8 = Gift!
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Gift From" VAR2 " " VAR3)
		;if AUTOACCEPTGIFT = 1
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
	if VAR3 = Have 
	{
		If VAR4 = Paid
		{
			if VAR6 = Ticket	
			if ENABLE_DEBUG_CRIME = 1
				LV_Add("", "% Crime Paid Ticket " VAR7 " By " VAR10 " " VAR11)
			SetTimer , pay , off			
		}
	}
	if VAR4 = Issued
	{
		if VAR9 = Officer 
		{
			if VAR13 = Fine:
			if ENABLE_DEBUG_CRIME = 1
				LV_Add("", "% Crime Ticket Issued by " VAR9 " Fine " VAR14)
			SetTimer , pay , 1000
		}
		return
	}
	if VAR4 = Invited
	{
	if ENABLE_DEBUG = 1
		LV_Add(""," Invited")

	IfNotInString,  GROUP_PLAYERS, %VAR5%
		GROUP_PLAYERS = %GROUP_PLAYERS%|%VAR5%
	}
	if VAR6 = Group
	{
		if VAR4 = Joined
		{
			StringTrimRight, AUTOGROUP_JOINED, ADDLINE, 26
		}
		if VAR4 = Left
		{
			GROUP_ADVERT_COUNT = 0
			AUTOGROUP_CREATED = 0
			AUTOGROUP_INVITE_START = 0
		}

	}
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
		GPS_IN_USE = 0
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
		PLAYER_IN_VEHICLE =  1
		return
	}
	
	if VAR3 = Must 
		if VAR7 = Vehicle
			if VAR11 = Color.
			{
			if ENABLE_DEBUG_ERROR = 1
				LV_Add("", "# You Cannot Use Inside Vehicle")

	PLAYER_IN_VEHICLE =  0
	PLAYER_IN_TRUCK =  0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
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
		settimer, jury , 2000
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
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		return
	}
	if VAR5 = Disappeared
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","# Dead " VAR2 " " VAR3 " Has Disappeared in the Woods")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
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
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		return
	}
	If VAR6 = Clucked
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Clucked by Chicken") 
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
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
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		return
	}
	if VAR6 = Probed
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Probed")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
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
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
		return
	}
	if VAR5 = Shot
	{
		if ENABLE_DEBUG_DEAD = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Shot on Police Property")
		IfNotInString , DEATHS , %VAR2%
			DEATHS = %DEATHS% %VAR2% %a_space%
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
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
		
			DEAD = %VAR2%
		; settimer, deadgift, 5000
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
			SetTimer, pay, off
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
			random, dicetimmer , 20000, 25000
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
			random, dicetimmer , 10000, 20000
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
if VAR2 = Officer ; [17:47:12] Officer [ph]Arrest! (49) Has Asked You to Pay Your Ticket.  Type  /pay  To Pay A Ticket.
{
	if VAR10 = Ticket.
	{
		if ENABLE_DEBUG_CRIME = 1
			LV_Add("","# Crime" VAR2 " " VAR3 " Pay Your Ticket")
		SetTimer, pay, 1000
		return		
	}
	
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

	PLAYER_IN_VEHICLE =  0
	PLAYER_IN_TRUCK =  0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 1
	PLAYER_IN_TRASH = 0
	
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

	PLAYER_IN_VEHICLE =  0
	PLAYER_IN_TRUCK =  0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
	
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
	
		if ENABLE_DEBUG_GPS = 1
			LV_Add("", "# GPS Truck Delivery " GPSINUSE)

	PLAYER_IN_VEHICLE =  0
	PLAYER_IN_TRUCK =  1
	PLAYER_IN_BOAT = 0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_BOAT = 0
	PLAYER_IN_CAR =  0
	PLAYER_IN_PLANE = 0
	PLAYER_IN_FOOD = 0
	PLAYER_IN_TRASH = 0
		if AUTOGPSMISSION = 1
			SetTimer, gpsmission, 500
		return
	}
}
if VAR2 = Courier
{
	if VAR3 = Mission
	{
		PLAYER_IN_TRUCK =  0
		PLAYER_IN_COURIER = 1
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
	GPS_IN_USE = 0
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
	GPS_IN_USE = 0
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
			LV_Add("","# Work Delivery Complete " INTRUCK)
		IF PLAYER_IN_TRUCK =  1
			if AUTOTRUCKING = 1
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
		;gosub fishout
		settimer, fish, off
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

if VAR2 = Co Owner
{
	if VAR3 = Properties:
	{
		if ENABLE_DEBUG_HELP = 1
			LV_Add("", "# Co Owner Properties " VAR4)
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
	if VAR6 = random
	{
		if ENABLE_DEBUG_DELIVERY = 1
			LV_Add("", "? Could Not Find A random Location")
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
			LV_Add("", "# Killed Fairly - Paid Fees")
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


if VAR2 = Group
	{
	LV_Add("", "* Group: " VAR3 " " VAR4)	
	if VAR4 = %GROUP_NAME%
		{
			if AUTOGROUP = 1
			{
				AUTOGROUP_INVITE_START = 1
				AUTOGROUP_CREATED = 1
				gosub AUTOGROUP_JOIN_MESSAGE
				gosub AUTOGROUP_INVITE_START
			}
		}
	}

if VAR2S = *
{
	NEWMESTRING = %ADDLINE%
	if VAR6 = Joined
	{
		if ENABLE_DEBUG_PLAYER = 1
			LV_Add("", "* Join: " VAR3 " " VAR4)
		JOINERS = %JOINERS% %VAR3% %A_Space%
		if AUTOIGNORE = 1
			gosub CHECKIGNORE	
		if WATCHLOGON = 1
			gosub WATCHLOGON
		if AUTOGROUP = 1
		{
			AUTOGROUP_INVITE_ADD = %VAR3%
			gosub AUTOGROUP_INVITE
			AUTOGROUP_INVITE_ADD = 
		}
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
		if VAR6 = %PlayerName%
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

KEYSTATECHECK:
ISKEYDOWN = 0
GetKeyState, ISNUMON, NumLock , T
GetKeyState, ISCAPSON, CapsLock , T
GetKeyState, ISSCROLON, ScrollLock , T
GetKeyState, ISINSTERTON, Insert , T

GetKeyState, ISADOWN, A, P
if ISADOWN = D
	ISKEYDOWN++
GetKeyState, ISBDOWN, B, P
if ISBDOWN = D
	ISKEYDOWN++

GetKeyState, ISCDOWN, C, P
if ISCDOWN = D
	ISKEYDOWN++

GetKeyState, ISDDOWN, D, P
if ISDDOWN = D
	ISKEYDOWN++

GetKeyState, ISEDOWN, E, P
if ISEDOWN = D
	ISKEYDOWN++
GetKeyState, ISFDOWN, F, P
if ISFDOWN = D
	ISKEYDOWN++

GetKeyState, ISGDOWN, G, P
if ISGDOWN = D
	ISKEYDOWN++

GetKeyState, ISHDOWN, H, P
if ISHDOWN = D
	ISKEYDOWN++
GetKeyState, ISIDOWN, I, P
if ISIDOWN = D
	ISKEYDOWN++
GetKeyState, ISJDOWN, J, P
if ISJDOWN = D
	ISKEYDOWN++

GetKeyState, ISKDOWN, K, P
if ISKDOWN = D
	ISKEYDOWN++
GetKeyState, ISLDOWN, L, P
if ISLDOWN = D
	ISKEYDOWN++

GetKeyState, ISMDOWN, M, P
if ISMDOWN = D
	ISKEYDOWN++

GetKeyState, ISNDOWN, N, P
if ISNDOWN = D
	ISKEYDOWN++

GetKeyState, ISODOWN, O, P
if ISODOWN = D
	ISKEYDOWN++
GetKeyState, ISPDOWN, P, P
if ISPDOWN = D
	ISKEYDOWN++
GetKeyState, ISQDOWN, Q, P
if ISQDOWN = D
	ISKEYDOWN++
GetKeyState, ISRDOWN, R, P
if ISRDOWN = D
	ISKEYDOWN++
GetKeyState, ISSDOWN, S, P
if ISSDOWN = D
	ISKEYDOWN++
GetKeyState, ISTDOWN, T, P
if ISTDOWN = D
	ISKEYDOWN++
GetKeyState, ISUDOWN, U, P
if ISUDOWN = D
	ISKEYDOWN++
GetKeyState, ISVDOWN, V, P
if ISVDOWN = D
	ISKEYDOWN++
GetKeyState, ISWDOWN, W, P
if ISWDOWN = D
	ISKEYDOWN++
GetKeyState, ISXDOWN, X, P
if ISXDOWN = D
	ISKEYDOWN++
GetKeyState, ISYDOWN, Y, P
if ISYDOWN = D
	ISKEYDOWN++
GetKeyState, ISEDOWN, Z, P
if ISZDOWN = D
	ISKEYDOWN++

GetKeyState, IS_SPACEDOWN, Space, P
if IS_SPACEDOWN = D
	ISKEYDOWN++
GetKeyState, IS_ENTERDOWN, Enter, P
if IS_ENTERDOWN = D
	ISKEYDOWN++
return




KEYBINDCHECK:
	if ENABLE_DEBUG = 1
		;LV_Add("","- "A_ThisLabel " BINDSOFF " BINDSOFF " KEYDLTOGGLE " KEYDLTOGGLE " KEYANTIPAUSEON " KEYANTIPAUSEON " KEYANIMATIONON " KEYANIMATIONON " KEYSKILLON " KEYSKILLON " KEYMENUON " KEYMENUON " KEYPROGRAMON " KEYPROGRAMON)
	LV_Add("","// " A_ThisLabel )
		if GAME = 0
		return

	
	
	hotkey ,$t ,		BIND_T 
	hotkey ,$`` ,	 	BIND_T 
	hotkey ,$enter , 	BIND_ENTER	
	Hotkey ,$+ENTER, 	tupenter			


if BINDSOFF = 0
	{
		Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
		Hotkey, XButton1, MOUSE_XB1
		Hotkey, XButton2, MOUSE_XB2
		Hotkey ,$APPSKEY , APPSKEY
		Hotkey ,$^!AppsKey, prices
		Hotkey ,$^!RWIN, sellmenumove
		Hotkey ,$^!LWIN, sellmenu
	
	;hotkey ,$+w, 		HOTKEY_TAPSHIFT
	;Hotkey ,$^g, giftspam	
		if KEYFPSON=1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			hotkey ,$!TAB , FPSTAB
		}
		if KEYFPSON=0
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			hotkey ,$!TAB , ALTTAB
		}
		if KEYDLTOGGLE = 1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			hotkey ,$CapsLock , BIND_CAPS 
		}
		if KEYESCAPE = 1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			hotkey ,$^esc , cancel 
			hotkey ,$!esc , gpsclear
		}
	
		if KEYWINKEY = 1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			Hotkey ,$LWin , BIND_WINKEY
		}
		if AUTOGROUP_KEYBIND = 1
		{
			IfNotEqual, GROUP_KEYBIND
			{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			Hotkey, %GROUP_KEYBIND%, groupcreate
			}
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
		
		GetKeyState, ISNUMON, NumLock , T
		if ISNUMON=D
		{
			if KEYNUM = 1
			{
				if BINDNUM1E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad1 , NUMPAD1
				}
				if BINDNUM2E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad2 , NUMPAD2
				}
				if BINDNUM3E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad3 , NUMPAD3
				}
				if BINDNUM4E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad4 , NUMPAD4
				}
				if BINDNUM5E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad5 , NUMPAD5
				}
				if BINDNUM6E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad6 , NUMPAD6
				}
				if BINDNUM7E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad7 , NUMPAD7
				}
				if BINDNUM8E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad8 , NUMPAD8
				}
				if BINDNUM9E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad9 , NUMPAD9
				}
				if BINDNUM10E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $Numpad0 , NUMPAD10
				}
				if BINDNUM11E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadSub , NUMPAD11
				}
				if BINDNUM12E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadDiv , NUMPAD12
				}
				if BINDNUM13E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadMult , NUMPAD13
				}
				if BINDNUM14E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadEnter , NUMPAD14
				}
				if BINDNUM15E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadDot , NUMPAD15
				}
				if BINDNUM16E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadAdd , NUMPAD16
				}
			}
		}
		if ISNUMON=U
		{
			if KEYNUMO = 1
			{
				if BINDNUMO1E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadEnd , NUMPADO1
				}
				if BINDNUMO2E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadDown , NUMPADO2
				}
				if BINDNUMO3E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadPgdn , NUMPADO3
				}
				if BINDNUMO4E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadLeft , NUMPADO4
				}
				if BINDNUMO5E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadClear , NUMPADO5
				}
				if BINDNUMO6E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadRight , NUMPADO6
				}
				if BINDNUMO7E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadHome , NUMPADO7
				}
				if BINDNUMO8E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadUp , NUMPADO8
				}
				if BINDNUMO9E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadPgup , NUMPADO9
				}
				if BINDNUMO10E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadIns , NUMPADO10
				}
				if BINDNUMO11E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadSub , NUMPADO11
				}
				if BINDNUMO12E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadDiv , NUMPADO12
				}
				if BINDNUMO13E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadMult , NUMPADO13
				}
				if BINDNUMO14E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadEnter , NUMPADO14
				}
				if BINDNUMO15E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadDel , NUMPADO15
				}
				if BINDNUMO16E = 1
				{
					Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
					Hotkey $NumpadAdd , NUMPADO16
				}
			}
		}
		if KEYANIMATIONON=1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			Hotkey ,$!B, bribe
			Hotkey ,$!F, fuck
			Hotkey ,$!I, pointup
			Hotkey ,$!H, hide
			Hotkey ,$!J, usedrugs
			Hotkey ,$!K, kiss
			Hotkey ,$!L, lean
			Hotkey ,$!M, mourn
			Hotkey ,$!N, noob
			Hotkey ,$!O, radio
			Hotkey ,$!P, piss
			Hotkey ,$!R, scratch
			Hotkey ,$!T, taichi	
			Hotkey ,$!U, point
			Hotkey ,$!V, wave
;			Hotkey ,$!W, 	
			Hotkey ,$!X, armcross
			Hotkey ,$!Y, cry 	
			Hotkey ,$!Z, sit
			Hotkey ,$^b, bail
			Hotkey ,$^c, courier
			Hotkey ,$^f, flower
			Hotkey ,$^h, holdup
			Hotkey ,$^J, givedrugs
			Hotkey ,$^L, shoplift
			Hotkey ,$^M, mission
			Hotkey ,$^r, robbery	
			Hotkey ,$^u, ups
			Hotkey ,$^v, vehrepair
			Hotkey ,$^;, stocks
			Hotkey ,$^', market

		}
		if KEYSKILLON=1
		{
			Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
			Hotkey ,$!^B, clothesbuy
			Hotkey ,$!^C, clothes
			Hotkey ,$!^D, drugs
			Hotkey ,$!^F, food
			Hotkey ,$!^H, medic
			Hotkey ,$!^M, mech
			Hotkey ,$!^P, prices
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

			;Hotkey ,$^ENTER, lock
			;Hotkey ,$!ENTER, unlock
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
	}
	
	loop, parse, CMDLIST, -
{
	
	b_index = %a_index%
	loop, parse, A_Loopfield, |
	{
	z_index = %a_index%
    b_index = %A_Loopfield%
			
		IniRead, savedHK_%A_Loopfield%, Hotkeys.ini, Hotkeys, _%A_Loopfield%, %A_Space%
		If savedHK_%A_Loopfield%       		;Check for saved hotkeys in INI file.
		{
			Hotkey, IfWinActive, ahk_class %HK_TARGET%
			Hotkey, % savedHK_%A_Loopfield%, HOTKEY_%A_Loopfield%                					;Activate saved hotkeys if found.
		}
		StringReplace, noMods, savedHK_%A_Loopfield% , ~                  							;Remove tilde (~) and Win (#) modifiers...
		StringReplace, noMods, noMods, #,,UseErrorLevel             									;They are incompatible with hotkey controls (cannot be shown).
	}
	#ctrls += z_index
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


return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INI;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INIWRITE:
If ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)

;[GUI]
INIWRITE, %GUIFONT%, %inifile%, 	GUI, GUIFONT
INIWRITE, %SERVER1%, %inifile%, 	GUI, SERVER1
INIWRITE, %SERVER2%, %inifile%, 	GUI, SERVER2
INIWRITE, %X%, 		 %inifile%,		GUI, X
INIWRITE, %Y%, 		 %inifile%,		GUI, Y
INIWRITE, %Width%, 	 %inifile%,		GUI, Width
INIWRITE, %Height%,  %inifile%,		GUI, Height

INIWRITE, %FISH_LIST%, %inifile%, 	GUI, FISH_LIST


;[SETTINGS]
INIWRITE, %NAME%,  %inifile%, 			SETTINGS, Name
INIWRITE, %FPSLOW%, %inifile%, 			SETTINGS, FPSLOW
INIWRITE, %FPSHIGH%, %inifile%, 		SETTINGS, FPSHIGH
INIWRITE, %COLOR1%, %inifile%, 			SETTINGS, COLOR1
INIWRITE, %COLOR2%, %inifile%, 			SETTINGS, COLOR2
INIWRITE, %PLAYDICEAMOUNT%, %inifile%, 	SETTINGS, PLAYDICEAMOUNT
INIWRITE, %DRUGS_TAKE_AMOUNT%, %inifile%, SETTINGS, DRUGS_TAKE_AMOUNT
INIWRITE, %DRUGS_GIVE_AMOUNT%, %inifile%, SETTINGS, DRUGS_GIVE_AMOUNT

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
INIWRITE, %KEYWINKEY%, %inifile%, 		SETTINGS, KEYWINKEY
INIWRITE, %KEYNUM%, %inifile%, 			SETTINGS, KEYNUM
INIWRITE, %KEYNUMO%, %inifile%, 		SETTINGS, KEYNUMO


INIWRITE, %IDLE_ENABLE%, %inifile%, 	SETTINGS, IDLE_TIMEOUT
INIWRITE, %IDLE_ENABLE%, %inifile%, 	SETTINGS, IDLE_ENABLE

INIWRITE, %COLOR_TIMER%, %inifile%,		SETTINGS, COLOR_TIMER

;[SAUTOMATION]
INIWRITE, %AUTOLOGONON%, %inifile%, 	AUTOMATION, AUTOLOGONON
INIWRITE, %SPAWNATLOGON%, %inifile%, 	AUTOMATION, SPAWNATLOGON

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
INIWRITE, %AUTOGPSCARSELL%, 	%inifile%, 	AUTOMATION, AUTOGPSCARSELL
INIWRITE, %AUTOIGNORE%,			%inifile%, 	AUTOMATION, AUTOIGNORE

INIWRITE, %AUTOACCEPTGIFT%, 	%inifile%,	AUTOMATION, AUTOACCEPTGIFT
INIWRITE, %AUTOGROUP%, 		%inifile%, 	AUTOMATION, AUTOGROUP
INIWRITE, %WATCHLOGON%, 		%inifile%, 	AUTOMATION, WATCHLOGON

INIWRITE, %WATCHLOGON%, 		%inifile%, 	AUTOMATION, WATCHLOGON

;AUTOGROUP_KEYBIND

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


INIWRITE, %BINDNUM1E%, %inifile%, 		KeyBINDNUM ,  BINDNUM1Enabled
INIWRITE, %BINDNUM2E%, %inifile%, 		KeyBINDNUM ,  BINDNUM2Enabled
INIWRITE, %BINDNUM3E%, %inifile%, 		KeyBINDNUM ,  BINDNUM3Enabled
INIWRITE, %BINDNUM4E%, %inifile%, 		KeyBINDNUM ,  BINDNUM4Enabled
INIWRITE, %BINDNUM5E%, %inifile%, 		KeyBINDNUM ,  BINDNUM5Enabled
INIWRITE, %BINDNUM6E%, %inifile%, 		KeyBINDNUM ,  BINDNUM6Enabled
INIWRITE, %BINDNUM7E%, %inifile%, 		KeyBINDNUM ,  BINDNUM7Enabled
INIWRITE, %BINDNUM8E%, %inifile%, 		KeyBINDNUM ,  BINDNUM8Enabled
INIWRITE, %BINDNUM9E%, %inifile%, 		KeyBINDNUM ,  BINDNUM9Enabled
INIWRITE, %BINDNUM10E%, %inifile%, 		KeyBINDNUM , BINDNUM10Enabled
INIWRITE, %BINDNUM11E%, %inifile%, 		KeyBINDNUM , BINDNUM11Enabled
INIWRITE, %BINDNUM12E%, %inifile%, 		KeyBINDNUM , BINDNUM12Enabled
INIWRITE, %BINDNUM13E%, %inifile%, 		KeyBINDNUM ,  BINDNUM13Enabled
INIWRITE, %BINDNUM14E%, %inifile%, 		KeyBINDNUM , BINDNUM14Enabled
INIWRITE, %BINDNUM15E%, %inifile%, 		KeyBINDNUM , BINDNUM15Enabled
INIWRITE, %BINDNUM16E%, %inifile%, 		KeyBINDNUM , BINDNUM16Enabled
INIWRITE, %BINDNUM1%, %inifile%, 		KeyBINDNUM	, BINDNUM1BINDNUM
INIWRITE, %BINDNUM2%, %inifile%, 		KeyBINDNUM	, BINDNUM2BINDNUM
INIWRITE, %BINDNUM3%, %inifile%, 		KeyBINDNUM	, BINDNUM3BINDNUM
INIWRITE, %BINDNUM4%, %inifile%, 		KeyBINDNUM	, BINDNUM4BINDNUM
INIWRITE, %BINDNUM5%, %inifile%, 		KeyBINDNUM	, BINDNUM5BINDNUM
INIWRITE, %BINDNUM6%, %inifile%, 		KeyBINDNUM	, BINDNUM6BINDNUM
INIWRITE, %BINDNUM7%, %inifile%, 		KeyBINDNUM	, BINDNUM7BINDNUM
INIWRITE, %BINDNUM8%, %inifile%, 		KeyBINDNUM	, BINDNUM8BINDNUM
INIWRITE, %BINDNUM9%, %inifile%, 		KeyBINDNUM	, BINDNUM9BINDNUM
INIWRITE, %BINDNUM10%, %inifile%, 		KeyBINDNUM	, BINDNUM10BINDNUM
INIWRITE, %BINDNUM11%, %inifile%, 		KeyBINDNUM	, BINDNUM11BINDNUM
INIWRITE, %BINDNUM12%, %inifile%, 		KeyBINDNUM	, BINDNUM12BINDNUM
INIWRITE, %BINDNUM13%, %inifile%, 		KeyBINDNUM	, BINDNUM13BINDNUM
INIWRITE, %BINDNUM14%, %inifile%, 		KeyBINDNUM	, BINDNUM14BINDNUM
INIWRITE, %BINDNUM15%, %inifile%, 		KeyBINDNUM	, BINDNUM15BINDNUM
INIWRITE, %BINDNUM16%, %inifile%, 		KeyBINDNUM	, BINDNUM16BINDNUM


INIWRITE, %BINDNUMO1E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO1Enabled
INIWRITE, %BINDNUMO2E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO2Enabled
INIWRITE, %BINDNUMO3E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO3Enabled
INIWRITE, %BINDNUMO4E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO4Enabled
INIWRITE, %BINDNUMO5E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO5Enabled
INIWRITE, %BINDNUMO6E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO6Enabled
INIWRITE, %BINDNUMO7E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO7Enabled
INIWRITE, %BINDNUMO8E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO8Enabled
INIWRITE, %BINDNUMO9E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO9Enabled
INIWRITE, %BINDNUMO10E%, %inifile%, 		KeyBINDNUMO , BINDNUMO10Enabled
INIWRITE, %BINDNUMO11E%, %inifile%, 		KeyBINDNUMO , BINDNUMO11Enabled
INIWRITE, %BINDNUMO12E%, %inifile%, 		KeyBINDNUMO , BINDNUMO12Enabled
INIWRITE, %BINDNUMO13E%, %inifile%, 		KeyBINDNUMO ,  BINDNUMO13Enabled
INIWRITE, %BINDNUMO14E%, %inifile%, 		KeyBINDNUMO , BINDNUMO14Enabled
INIWRITE, %BINDNUMO15E%, %inifile%, 		KeyBINDNUMO , BINDNUMO15Enabled
INIWRITE, %BINDNUMO16E%, %inifile%, 		KeyBINDNUMO , BINDNUMO16Enabled
INIWRITE, %BINDNUMO1%, %inifile%, 		KeyBINDNUMO	, BINDNUMO1BINDNUMO
INIWRITE, %BINDNUMO2%, %inifile%, 		KeyBINDNUMO	, BINDNUMO2BINDNUMO
INIWRITE, %BINDNUMO3%, %inifile%, 		KeyBINDNUMO	, BINDNUMO3BINDNUMO
INIWRITE, %BINDNUMO4%, %inifile%, 		KeyBINDNUMO	, BINDNUMO4BINDNUMO
INIWRITE, %BINDNUMO5%, %inifile%, 		KeyBINDNUMO	, BINDNUMO5BINDNUMO
INIWRITE, %BINDNUMO6%, %inifile%, 		KeyBINDNUMO	, BINDNUMO6BINDNUMO
INIWRITE, %BINDNUMO7%, %inifile%, 		KeyBINDNUMO	, BINDNUMO7BINDNUMO
INIWRITE, %BINDNUMO8%, %inifile%, 		KeyBINDNUMO	, BINDNUMO8BINDNUMO
INIWRITE, %BINDNUMO9%, %inifile%, 		KeyBINDNUMO	, BINDNUMO9BINDNUMO
INIWRITE, %BINDNUMO10%, %inifile%, 		KeyBINDNUMO	, BINDNUMO10BINDNUMO
INIWRITE, %BINDNUMO11%, %inifile%, 		KeyBINDNUMO	, BINDNUMO11BINDNUMO
INIWRITE, %BINDNUMO12%, %inifile%, 		KeyBINDNUMO	, BINDNUMO12BINDNUMO
INIWRITE, %BINDNUMO13%, %inifile%, 		KeyBINDNUMO	, BINDNUMO13BINDNUMO
INIWRITE, %BINDNUMO14%, %inifile%, 		KeyBINDNUMO	, BINDNUMO14BINDNUMO
INIWRITE, %BINDNUMO15%, %inifile%, 		KeyBINDNUMO	, BINDNUMO15BINDNUMO
INIWRITE, %BINDNUMO16%, %inifile%, 		KeyBINDNUMO	, BINDNUMO16BINDNUMO
INIWRITE, %KEYESCAPE%, %inifile%, 		KeyKEYESCAPE	, KEYESCAPE


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
INIWRITE, %IDLE_TIMEOUT%, %inifile%, 	PERFOMANCE, IDLE_TIMEOUT





;[FILES]
INIWRITE, %logfile%, %inifile%, 	FILES, logfile
INIWRITE, %logdir%, %inifile%, 		FILES, logdir
INIWRITE, %history%, %inifile%, 	FILES, history
INIWRITE, %whitelist%, %inifile%, 	FILES, whitelist
INIWRITE, %blacklist%, %inifile%, 	FILES, blacklist
INIWRITE, %spamlist%, %inifile%, 	FILES, spamlist
;[Goups]

INIWRITE, %GROUP_NAME%, %inifile%, 				GROUPS, GROUP_NAME
INIWRITE, %GROUP_PLAYERS%, %inifile%, 			GROUPS, GROUP_PLAYERS
INIWRITE, %GROUP_KEYBIND%, %inifile%, 			GROUPS, GROUP_KEYBIND
INIWRITE, %GROUP_ADVERT_TIME%, %inifile%,		GROUPS, GROUP_ADVERT_TIME
INIWRITE, %GROUP_ADVERT%, %inifile%,			GROUPS, GROUP_ADVERT
INIWRITE, %GROUP_ADVERT_ENABLE%, %inifile%,		GROUPS, GROUP_ADVERT_ENABLE
INIWRITE, %AUTOGROUP_KEYBIND%, %inifile%,		GROUPS, AUTOGROUP_KEYBIND
INIWRITE, %GROUP_JOIN_MESSAGE%, %inifile%,		GROUPS, GROUP_JOIN_MESSAGE
INIWRITE, %GROUP_TYPE%, %inifile%,				GROUPS, GROUP_TYPE
INIWRITE, %AUTOGROUP_JOIN%, %inifile%,			GROUPS, AUTOGROUP_JOIN
INIWRITE, %AUTOGROUP_ADD_INGAME%, %inifile%,	GROUPS, AUTOGROUP_ADD_INGAME

/*
INIWRITE, %MOUSE_BUTTON1%, %inifile%,				MOUSE, 				MOUSE_BUTTON1	
INIWRITE, %MOUSE_BUTTON2%, %inifile%,				MOUSE, 				MOUSE_BUTTON2	
INIWRITE, %MOUSE_BUTTON3%, %inifile%,				MOUSE, 				MOUSE_BUTTON3	
INIWRITE, %MOUSE_BUTTON4%, %inifile%,				MOUSE, 				MOUSE_BUTTON4	
INIWRITE, %MOUSE_BUTTON5%, %inifile%,				MOUSE, 				MOUSE_BUTTON5	
*/

INIWRITE, %PERSONALITY_CLIPTO%, %inifile%,		PERSONALITY, 	PERSONALITY_CLIPTO
INIWRITE, %PERSONALITY_ARSON%, %inifile%,		PERSONALITY, 	PERSONALITY_ARSON
INIWRITE, %PERSONALITY_MOURN%, %inifile%,		PERSONALITY, 	PERSONALITY_MOURN
return


INIREAD:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)

RegRead, Playername, HKCU, Software\SAMP\ , PlayerName
RegRead, sadir, HKCU, Software\SAMP , gta_sa_exe
SplitPath, sadir ,, samp, , , sadrv
INIREAD, COLORLIST, %inifile%, GUI, COLORLIST, black|white|police car blue|cherry red|midnight blue|temple curtain purple|taxi yellow|striking blue|light blue grey|hoods|saxony blue|concord blue|jasper green |pewter gray|frost white|silver stone|rio red|torino red pearl|formula red|honey beige|mariner blue|blaze red|classic red|winning silver|steel gray|shadow silver|silver stone|warm grey mica|harbor blue|porcelain silver|mellow burgundy|graceful red mica|currant blue|gray|arctic white|anthracite gray|black2|dark green|seafoam|diamond blue biston brown|desert taupe|garnet red|desert red|green|cabernet red|light ivory|pueblo beige|smoke silver|astra silver|ascot gray|agate green|petrol blue green|surf blue|nautical blue|woodrose|crystal blue|bisque frost|currant red solid|lt.crystal blue|lt.titanium|race yellow solid|brt.currant red|clear crystal blue frost|silver|pastel alabaster|mid currant red|med regatta blue|oxford white solid|alabaster solid|elec.currant red|spinnaker blue solid|dk.titanium|pastel alabaster solid|med.cabernet solid|twilight blue|titanium frost|sandalwood frost|wild strawberry|ultra blue|vermilion solid|med.sandalwood|med.red solid|deep jewel green|med.woodrose|vermillion solid|green|bright blue|bright red|lt.champagne|silver2|steel blue|medium gray|arctic pearl|nassau blue|med.sapphire blue|silver3|lt.sapphire blue|malachite|flax|med.maui blue|dk.sapphire blue|copper beige|bright blue|med.flax|med.gray|bright blue|lt.driftwood|blue|steel gray|lt.beechwood|slate gray|lt.sapphire blue|dk.beechwood|torch red|bright red|med.sapphire blue firemist|med.garnet red|white diamond pearl|dk.sable|antelope beige|brilliant red|gun metal|med.beechwood|brilliant red|bright blue|pink
INIREAD, FISH_LIST, %inifile%, GUI, FISH_LIST, Amberjack|10|50|60|100|Grouper|10|50|60|100|Red|10|25|40|60|Trout|10|50|60|100|Blue|10|100|400|1000|Mackerel|10|50|80|100|Sea|5|35|20|40|Pike|5|35|20|40|Sail|5|35|40|85|Tuna|10|50|80|100|Eel|5|15|35|40|Dolphin|10|60|80|150|Shark|20|200|400|200|Turtle|5|25|40|100|Catfish|1|5|10|20|Swordfish|20|200|400|600|Squid|10|100|200|800|Barracuda|5|20|40|60|Piranha|1|5|4|6|Lobster|1|10|20|40|Cod|10|50|80|100|Sardine|0.8|1|1|2|Salmon|10|50|80|100|Shrimp|0.8|1|1|3|Sturgeon|100|300|500|1000|Flounder|1|10|20|40|Haddock|1|10|20|40|Herring|1|10|20|40|Stingray|100|500|500|800|Carp|5|40|80|100|Halibut|15|150|100|150|Sole|1|5|5|7|Babyseal|1|30|50|50|

;[GUI]
INIREAD, GUIFONT, %inifile%, 		GUI, GUIFONT, 12
INIREAD, SERVER1, %inifile%, 		GUI, SERVER1, s1.crazybobs.net:7777
INIREAD, SERVER2, %inifile%, 		GUI, SERVER2, s2.crazybobs.net:7777
;INIREAD, X, 		 %inifile%,		GUI,  X, 100
;INIREAD, Y, 		 %inifile%,		GUI,  Y, 100
;INIREAD, Width, 	 %inifile%,		GUI, Width , 700
;INIREAD, Height,  %inifile%,		GUI, Height , 300

;[SETTINGS]
INIREAD, NAME,  %inifile%, 				SETTINGS, Name 				, billman87
INIREAD, FPSLOW, %inifile%, 			SETTINGS, FPSLOW			, 25
INIREAD, FPSHIGH, %inifile%, 			SETTINGS, FPSHIGH			, 59
INIREAD, COLOR1, %inifile%, 			SETTINGS, COLOR1			, cherry red
INIREAD, COLOR2, %inifile%, 			SETTINGS, COLOR2			, taxi yellow

INIREAD, DRUGS_TAKE_AMOUNT, %inifile%, 	SETTINGS, DRUGS_TAKE_AMOUNT	, 25 
INIREAD, DRUGS_GIVE_AMOUNT, %inifile%, 	SETTINGS, DRUGS_GIVE_AMOUNT	, 10 

INIREAD, PLAYDICEAMOUNT, %inifile%, 	SETTINGS, PLAYDICEAMOUNT	, 10000 
INIREAD, BRIBEAMOUNT, %inifile%, 		SETTINGS, BRIBEAMOUNT		, 15000 
INIREAD, GUILOTTO, %inifile%, 			SETTINGS, GUILOTTO			, 0
INIREAD, READCHATON, %inifile%, 		SETTINGS, READCHATON		, 1
INIREAD, DISPLAYNOCHAT, %inifile%, 		SETTINGS, DISPLAYNOCHAT		, 0
INIREAD, OUTPUTJOURNALON, %inifile%,	SETTINGS, OUTPUTJOURNALON	, 0
INIREAD, COLOR_TIMER, %inifile%,		SETTINGS, COLOR_TIMER		, 5


;[KEYBINDS]
INIREAD, KEYPROGRAMON, %inifile%, 		SETTINGS, KEYPROGRAMON		, 0
INIREAD, KEYANIMATIONON, %inifile%, 	SETTINGS, KEYANIMATIONON	, 0
INIREAD, KEYSKILLON, %inifile%, 		SETTINGS, KEYSKILLON		, 0
INIREAD, KEYMENUON, %inifile%, 			SETTINGS, KEYMENUON			, 0
INIREAD, KEYFPSON , %inifile%, 			SETTINGS, KEYFPSON 			, 0
INIREAD, KEYANTIPAUSEON, %inifile%,  	SETTINGS, KEYANTIPAUSEON	, 0
INIREAD, KEYDLTOGGLE, %inifile%, 		SETTINGS, KEYDLTOGGLE		, 0
INIREAD, KEYWINKEY, %inifile%, 			SETTINGS, KEYWINKEY			, 0
INIREAD, KEYNUM, %inifile%, 			SETTINGS, KEYNUM			, 0
INIREAD, KEYNUMO, %inifile%, 			SETTINGS, KEYNUMO			, 0


INIREAD, IDLE_ENABLE, %inifile%, 		SETTINGS, IDLE_TIMEOUT			, 600
INIREAD, IDLE_ENABLE, %inifile%, 		SETTINGS, IDLE_ENABLE			, 0



;[AUTOMATION]
INIREAD, AUTOLOGONON, %inifile%, 		AUTOMATION, AUTOLOGONON			, 0
IniRead, SPAWNATLOGON, %inifile%, 		AUTOMATION, SPAWNATLOGON		, 0
INIREAD, AUTOTRUCKING, %inifile%, 		AUTOMATION, AUTOTRUCKING		, 0
INIREAD, AUTOGPSMISSION, %inifile%, 	AUTOMATION, AUTOGPSMISSION		, 0
INIREAD, AUTOFOODMISSION, %inifile%, 	AUTOMATION, AUTOFOODMISSION		, 0
INIREAD, AUTOTRASHMISSION, %inifile%, 	AUTOMATION, AUTOTRASHMISSION	, 0
INIREAD, AUTOOFFERWAVE, %inifile%, 		AUTOMATION, AUTOOFFERWAVE		, 0
INIREAD, AUTOCNRRADIO, %inifile%, 		AUTOMATION, AUTOCNRRADIO		, 0
INIREAD, AUTTOACCEPTOFFER, %inifile%,	AUTOMATION, AUTTOACCEPTOFFER	, 0
INIREAD, AUTOHOUSEON, %inifile%, 		AUTOMATION, AUTOHOUSEON			, 0
INIREAD, AUTOHOUSESTOREON, %inifile%,	AUTOMATION, AUTOHOUSESTOREON	, 0
INIREAD, AUTOJURYON, %inifile%, 		AUTOMATION, AUTOJURYON			, 0
INIREAD, AUTOBONUSON, %inifile%, 		AUTOMATION, AUTOBONUSON			, 0
INIREAD, AUTODRUGSON, %inifile%, 		AUTOMATION, AUTODRUGSON			, 0
INIREAD, AUTOLOTTOON, %inifile%, 		AUTOMATION, AUTOLOTTOON			, 0
INIREAD, AUTOTICKETON, %inifile%, 		AUTOMATION, AUTOTICKETON		, 0
INIREAD, AUTOCOLORON, %inifile%, 		AUTOMATION, AUTOCOLORON			, 0
INIREAD, AUTOPLAYDICE, %inifile%,		AUTOMATION, AUTOPLAYDICE		, 0
INIREAD, AUTOPLAYASKEDICE, %inifile%,	AUTOMATION, AUTOPLAYASKEDICE	, 0
INIREAD, AUTOFISHON, %inifile%, 		AUTOMATION, AUTOFISHON			, 1
INIREAD, AUTOTHROWON, %inifile%, 		AUTOMATION, AUTOTHROWON			, 1
INIREAD, AUTOFISHDISPLAY, %inifile%, 	AUTOMATION, AUTOFISHDISPLAY		, 0
INIREAD, AUTOGPSCARSELL, %inifile%,		AUTOMATION, AUTOGPSCARSELL		, 0
INIREAD, AUTOIGNORE, %inifile%,			AUTOMATION, AUTOIGNORE			, 0
INIREAD, AUTOACCEPTGIFT, %inifile%, 	AUTOMATION, AUTOACCEPTGIFT	, 0
INIREAD, AUTOGROUP, %inifile%, 		AUTOMATION, AUTOGROUP			, 0
INIREAD, WATCHLOGON, %inifile%, 		AUTOMATION, WATCHLOGON			, 0

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


INIREAD, BINDNUM1E, %inifile%, 		KeyBINDNUM ,  BINDNUM1Enabled	, 0
INIREAD, BINDNUM2E, %inifile%, 		KeyBINDNUM ,  BINDNUM2Enabled	, 0
INIREAD, BINDNUM3E, %inifile%, 		KeyBINDNUM ,  BINDNUM3Enabled	, 0	
INIREAD, BINDNUM4E, %inifile%, 		KeyBINDNUM ,  BINDNUM4Enabled	, 0
INIREAD, BINDNUM5E, %inifile%, 		KeyBINDNUM ,  BINDNUM5Enabled	, 0
INIREAD, BINDNUM6E, %inifile%, 		KeyBINDNUM ,  BINDNUM6Enabled	, 0
INIREAD, BINDNUM7E, %inifile%, 		KeyBINDNUM ,  BINDNUM7Enabled	, 0
INIREAD, BINDNUM8E, %inifile%, 		KeyBINDNUM ,  BINDNUM8Enabled	, 0
INIREAD, BINDNUM9E, %inifile%, 		KeyBINDNUM ,  BINDNUM9Enabled	, 0
INIREAD, BINDNUM10E, %inifile%, 	KeyBINDNUM , BINDNUM10Enabled	, 0
INIREAD, BINDNUM11E, %inifile%, 	KeyBINDNUM , BINDNUM11Enabled	, 0
INIREAD, BINDNUM12E, %inifile%, 	KeyBINDNUM , BINDNUM12Enabled	, 0
INIREAD, BINDNUM13E, %inifile%, 	KeyBINDNUM , BINDNUM13Enabled	, 0
INIREAD, BINDNUM14E, %inifile%, 	KeyBINDNUM , BINDNUM14Enabled	, 0
INIREAD, BINDNUM15E, %inifile%, 	KeyBINDNUM , BINDNUM15Enabled	, 0
INIREAD, BINDNUM16E, %inifile%, 	KeyBINDNUM , BINDNUM16Enabled	, 0
INIREAD, BINDNUM1, %inifile%, 		KeyBINDNUM	, BINDNUM1BINDNUM		, /tk
INIREAD, BINDNUM2, %inifile%, 		KeyBINDNUM	, BINDNUM2BINDNUM		, /i $sus
INIREAD, BINDNUM3, %inifile%, 		KeyBINDNUM	, BINDNUM3BINDNUM		, /sus
INIREAD, BINDNUM4, %inifile%, 		KeyBINDNUM	, BINDNUM4BINDNUM		, /ar
INIREAD, BINDNUM5, %inifile%, 		KeyBINDNUM	, BINDNUM5BINDNUM		, /i $war
INIREAD, BINDNUM6, %inifile%, 		KeyBINDNUM	, BINDNUM6BINDNUM		, /war
INIREAD, BINDNUM7, %inifile%, 		KeyBINDNUM	, BINDNUM7BINDNUM		, /bk
INIREAD, BINDNUM8, %inifile%, 		KeyBINDNUM	, BINDNUM8BINDNUM		, /res
INIREAD, BINDNUM9, %inifile%, 		KeyBINDNUM	, BINDNUM9BINDNUM		, /vc
INIREAD, BINDNUM10, %inifile%, 		KeyBINDNUM	, BINDNUM10BINDNUM		, /mw 
INIREAD, BINDNUM11, %inifile%, 		KeyBINDNUM	, BINDNUM11BINDNUM		, /rb
INIREAD, BINDNUM12, %inifile%, 		KeyBINDNUM	, BINDNUM12BINDNUM		, /rank
INIREAD, BINDNUM13, %inifile%, 		KeyBINDNUM	, BINDNUM13BINDNUM		, /fire

INIREAD, BINDNUM14, %inifile%, 		KeyBINDNUM	, BINDNUM14BINDNUM		, /donut
INIREAD, BINDNUM15, %inifile%, 		KeyBINDNUM	, BINDNUM15BINDNUM		, /refuse
INIREAD, BINDNUM16, %inifile%, 		KeyBINDNUM	, BINDNUM16BINDNUM		, /accept


INIREAD, BINDNUMO1E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO1Enabled	, 0
INIREAD, BINDNUMO2E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO2Enabled	, 0
INIREAD, BINDNUMO3E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO3Enabled	, 0	
INIREAD, BINDNUMO4E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO4Enabled	, 0
INIREAD, BINDNUMO5E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO5Enabled	, 0
INIREAD, BINDNUMO6E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO6Enabled	, 0
INIREAD, BINDNUMO7E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO7Enabled	, 0
INIREAD, BINDNUMO8E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO8Enabled	, 0
INIREAD, BINDNUMO9E, %inifile%, 		KeyBINDNUMO ,  BINDNUMO9Enabled	, 0
INIREAD, BINDNUMO10E, %inifile%, 		KeyBINDNUMO , BINDNUMO10Enabled	, 0
INIREAD, BINDNUMO11E, %inifile%, 		KeyBINDNUMO , BINDNUMO11Enabled	, 0
INIREAD, BINDNUMO12E, %inifile%, 		KeyBINDNUMO , BINDNUMO12Enabled	, 0
INIREAD, BINDNUMO13E, %inifile%, 		KeyBINDNUMO , BINDNUMO13Enabled	, 0
INIREAD, BINDNUMO14E, %inifile%, 		KeyBINDNUMO , BINDNUMO14Enabled	, 0
INIREAD, BINDNUMO15E, %inifile%, 		KeyBINDNUMO , BINDNUMO15Enabled	, 0
INIREAD, BINDNUMO16E, %inifile%, 		KeyBINDNUMO , BINDNUMO16Enabled	, 0
INIREAD, BINDNUMO1, %inifile%, 			KeyBINDNUMO	, BINDNUMO1BINDNUMO		, 1
INIREAD, BINDNUMO2, %inifile%, 			KeyBINDNUMO	, BINDNUMO2BINDNUMO		, /gc $ply 420
INIREAD, BINDNUMO3, %inifile%, 			KeyBINDNUMO	, BINDNUMO3BINDNUMO		, /jumpkick
INIREAD, BINDNUMO4, %inifile%, 			KeyBINDNUMO	, BINDNUMO4BINDNUMO		, t/{enter}
INIREAD, BINDNUMO5, %inifile%, 			KeyBINDNUMO	, BINDNUMO5BINDNUMO		, /I $ply
INIREAD, BINDNUMO6, %inifile%, 			KeyBINDNUMO	, BINDNUMO6BINDNUMO		, /foff $ply
INIREAD, BINDNUMO7, %inifile%, 			KeyBINDNUMO	, BINDNUMO7BINDNUMO		, /wave $ply
INIREAD, BINDNUMO8, %inifile%, 			KeyBINDNUMO	, BINDNUMO8BINDNUMO		, /ra $ply
INIREAD, BINDNUMO9, %inifile%, 			KeyBINDNUMO	, BINDNUMO9BINDNUMO		, /i $law
INIREAD, BINDNUMO10, %inifile%, 		KeyBINDNUMO	, BINDNUMO10BINDNUMO	, t/{enter}
INIREAD, BINDNUMO11, %inifile%, 		KeyBINDNUMO	, BINDNUMO11BINDNUMO	, /fpslimit 20
INIREAD, BINDNUMO12, %inifile%, 		KeyBINDNUMO	, BINDNUMO12BINDNUMO	, t/{enter}
INIREAD, BINDNUMO13, %inifile%, 		KeyBINDNUMO	, BINDNUMO13BINDNUMO	, t/{enter}
INIREAD, BINDNUMO14, %inifile%, 		KeyBINDNUMO	, BINDNUMO14BINDNUMO	, /SIT 8
INIREAD, BINDNUMO15, %inifile%, 		KeyBINDNUMO	, BINDNUMO15BINDNUMO	, /eja
INIREAD, BINDNUMO16, %inifile%, 		KeyBINDNUMO	, BINDNUMO16BINDNUMO	, /fpslimit 90


INIREAD, KEYESCAPE, %inifile%, 		KeyKEYESCAPE	, KEYESCAPE , 0

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
INIREAD, IDLE_TIMEOUT, %inifile%, 	PERFOMANCE, IDLE_TIMEOUT , 60000



;[FILES]
INIREAD, logdir, %inifile%, 	FILES, logdir , %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP 
INIREAD, logfile, %inifile%, 	FILES, logfile , %logdir%\chatlog.txt
;INIREAD, history, %inifile%, 	FILES, history , %logdir%\History
;INIREAD, whitelist, %inifile%, 	FILES, whitelist , %logdir%\whitelist.txt
;INIREAD, blacklist, %inifile%, 	FILES, blacklist , %logdir%\blacklist.txt
;INIREAD, nomatch, %inifile%, 	FILES, nomatch , %logdir%\nomatch.txt
;INIREAD, complaint, %inifile%, 	FILES, complaint , %logdir%\complaint.txt
;INIREAD, petlist, %inifile%, 	FILES, petlist , %logdir%\petlist.txt
;INIREAD, carlist, %inifile%, 	FILES, carlist , %logdir%\carlist.txt
;INIREAD, soldlist, %inifile%, 	FILES, soldlist , %logdir%\soldlist.txt
;INIREAD, spamlist, %inifile%, 	FILES, spammers , %logdir%\spammers.txt

;[Goups]

INIREAD, GROUP_NAME, %inifile%,					GROUPS, 	GROUP_NAME 					, noobtool
INIREAD, GROUP_PLAYERS, %inifile%,				GROUPS, 	GROUP_PLAYERS 				, billman87
INIREAD, GROUP_KEYBIND, %inifile%,				GROUPS, 	GROUP_KEYBIND 				, ^!+g
INIREAD, GROUP_ADVERT, %inifile%,				GROUPS, 	GROUP_ADVERT 				, billman loves you
INIREAD, GROUP_ADVERT_TIME, %inifile%,			GROUPS, 	GROUP_ADVERT_TIME 			, 12
INIREAD, AUTOGROUP_KEYBIND, %inifile%,			GROUPS, 	AUTOGROUP_KEYBIND 			, 0
INIREAD, GROUP_ADVERT_ENABLE, %inifile%,		GROUPS, 	GROUP_ADVERT_ENABLE 		, 0
INIREAD, GROUP_JOIN_MESSAGE, %inifile%,			GROUPS, 	GROUP_JOIN_MESSAGE 			, Welcome
INIREAD, GROUP_TYPE, %inifile%,					GROUPS, 	GROUP_TYPE 					, 1
INIREAD, AUTOGROUP_JOIN, %inifile%,				GROUPS, 	AUTOGROUP_JOIN 				, 0
INIREAD, AUTOGROUP_ADD_INGAME, %inifile%,		GROUPS, 	AUTOGROUP_ADD_INGAME		, 1


INIREAD, PERSONALITY_CLIPTO, %inifile%,		PERSONALITY, 	PERSONALITY_CLIPTO			, 0
INIREAD, PERSONALITY_ARSON, %inifile%,		PERSONALITY, 	PERSONALITY_ARSON			, 0
INIREAD, PERSONALITY_MOURN, %inifile%,		PERSONALITY, 	PERSONALITY_MOURN			, 0

/*
;[MOUSE]
INIREAD, MOUSE_BUTTON1, %inifile%,					MOUSE, 				MOUSE_BUTTON1				, {LButton}
INIREAD, MOUSE_BUTTON2, %inifile%,					MOUSE, 				MOUSE_BUTTON2				, {RButton}
INIREAD, MOUSE_BUTTON3, %inifile%,					MOUSE, 				MOUSE_BUTTON3				, {MButton}
INIREAD, MOUSE_BUTTON4, %inifile%,					MOUSE, 				MOUSE_BUTTON4				, {HOME}
INIREAD, MOUSE_BUTTON5, %inifile%,					MOUSE, 				MOUSE_BUTTON5				, {END}
*/
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
	
	cmd("/tb")
	
	return

MOUSE_XB1:
	if ENABLE_DEBUG = 1
		LV_Add("","MOUSE " A_ThisLabel)
if MOUSE_BIND_DB = 1
{
	while GetKeyState("XButton1", "P")
		{
			Send {XButton1 down}
			Send {LButton down}
		}
	Send {XButton1 up}
	Send {LButton up}
}
return
	
MOUSE_XB2:
	if ENABLE_DEBUG = 1
		LV_Add("","MOUSE " A_ThisLabel)
if MOUSE_BIND_DB = 1
{
	while GetKeyState("XButton2", "P")
		{
			Send {XButton2 down}
			Send {LButton down}
		}
	Send {XButton2 up}
	Send {LButton up}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

gpscarsell:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTOGPSCARSELL = 0
		return
	if GPS_IN_USE = 1
		return
	gosub SAMPDETECT
	if game = 0
		return	
	
	cmd("/gps")
	cmd("1")
	cmd("5")
	
	return
	
gpsmission:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if GPS_IN_USE = 1
		return
	gosub SAMPDETECT
	if game = 0
		return
	if ((PLAYER_IN_TRUCK =  "1" ) || (PLAYER_IN_COURIER = "1"))
	{
		cmd("/gps")
		cmd("1")
		cmd("1")
	}
	return
	
gpsclear:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
	if game = 0
		return
	
	cmd("/gpsclear")
	
	return
	
sit8:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
	if game = 0
		return
	cmd("/sit 8")

	return
	
offer:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/sell "LASTWAVE)
	
	return
	
sellmenumove:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/sellmenu")
	cmd("5")
	
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
	
	cmd("/td "FTD)
	
	return
	
givedrugs:
	SetTimer, %A_ThisLabel%, off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	if AUTODRUGSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/gd $ply " DRUGS_GIVE_AMOUNT)
	
	return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Menu Macro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

t1:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("1")
	
	return
t2:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("2")
	
	return
t3:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("3")
	
	return
t4:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("4")
	
	return
t5:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("5")
	
	return
t6:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("6")
	
	return
t7:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("7")
	
	return
t8:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("8")
	
	return
t9:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("9")
	
	return
t10:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("10")
	
	return
t11:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("11")
	
	return
t12:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("12")
	
	return
t13:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("13")
	
	return
t14:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("14")
	
	return
t15:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("15")
	
	return
t16:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("16")
	
	return
t17:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("17")
	
	return
t18:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("18")
	
	return
t19:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("19")
	
	return
t20:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("20")
	
	return
t21:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("21")
	
	return
t22:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("22")
	
	return
t23:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("23")
	
	return
t24:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("24")
	
	return
t25:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("25")
	
	return
t26:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("26")
	
	return
t27:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("27")
	
return
t28:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("28")
	
	return
t29:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("29")
	
	return
t30:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("30")
	
	return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Funtion key Macro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

F1:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F1E = 0
		return
	
	cmd(F1)
	
	return
F2:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F2E = 0
		return
	
	cmd(F2)
	
	return
F3:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F3E = 0
		return
	
	cmd(F3)
	
	return
F4:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F4E = 0
		return
	
	cmd(F4)
	
	return
F5:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F5E = 0
		return
	
	cmd(F5)
	
	return
F6:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F6E = 0
		return
	
	cmd(F6)
	
	return
F7:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F7E = 0
		return
	
	cmd(F7)
	
	return
F8:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F8E = 0
		return
	
	cmd(F8)
	
	return
F9:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F9E = 0
		return
	
	cmd(F9)
	
	return
F10:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F10E = 0
		return
	
	cmd(F10)
	
	return
F11:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F11E = 0
		return
	
	cmd(F11)
	
	return
F12:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F12E = 0
		return
	
	cmd(F12)
	
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Number Row Macro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	IF CHATBOX = 1
		SendInput 1
	else
		cmd(BIND1)
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
	IF CHATBOX = 1
	{
		SendInput 2
		return
	}
	else
	{
		cmd(BIND2)
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
	IF CHATBOX = 1
		SendInput 3
	else
		cmd(BIND3)
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
	IF CHATBOX = 1
		SendInput 4 
	else
		cmd(BIND4)
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
	IF CHATBOX = 1
		SendInput 5
	else
		cmd(BIND5)
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
	IF CHATBOX = 1
		SendInput 6
	else
		cmd(BIND6)
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
	IF CHATBOX = 1
		SendInput 7
	else
		cmd(BIND7)
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
	IF CHATBOX = 1
		SendInput 8
	else
		cmd(BIND8)
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
	IF CHATBOX = 1
		SendInput 9
	else
		cmd(BIND9)
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
	IF CHATBOX = 1
		SendInput 0
	else
		cmd(BIND10)
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
	IF CHATBOX = 1
		SendInput `-
	else
		cmd(BIND11)
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
	IF CHATBOX = 1
		SendInput `=
	else
		cmd(BIND12)
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NUMPAD macro ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NUMPAD1:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM1E = 0
	{
		sendinput {numpad1 down}
		sleep 50
		sendinput {numpad1 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad1}
	else
		cmd(BINDNUM1)

	return
	
NUMPAD2:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM2E = 0
	{
		sendinput {numpad2 down}
		sleep 50
		sendinput {numpad2 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad2}
	else
		cmd(BINDNUM2)
	return
	
NUMPAD3:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM3E = 0
	{
		sendinput {numpad3 down}
		sleep 50
		sendinput {numpad3 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad3}
	else
		cmd(BINDNUM3)
	return
	
NUMPAD4:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM4E = 0
	{
		sendinput {numpad4 down}
		sleep 50
		sendinput {numpad4 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad4}
	else
		cmd(BINDNUM4)
	return
	
NUMPAD5:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM5E = 0
	{
		sendinput {numpad5 down}
		sleep 50
		sendinput {numpad5 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad5}
	else
		cmd(BINDNUM5)
	return
	
NUMPAD6:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM6E = 0
	{
		sendinput {numpad6 down}
		sleep 50
		sendinput {numpad6 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad6}
	else
		cmd(BINDNUM6)
	return
	
NUMPAD7:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM7E = 0
	{
		sendinput {numpad7 down}
		sleep 50
		sendinput {numpad7 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad7}
	else
		cmd(BINDNUM7)
	return
	
NUMPAD8:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM8E = 0
	{
		sendinput {numpad8 down}
		sleep 50
		sendinput {numpad8 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad8}
	else
		cmd(BINDNUM8)
	return
	
NUMPAD9:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM9E = 0
	{
		sendinput {numpad9 down}
		sleep 50
		sendinput {numpad9 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad9}
	else
		cmd(BINDNUM9)
	return
	
NUMPAD10:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM10E = 0
	{
		sendinput {numpad0 down}
		sleep 50
		sendinput {numpad0 up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad0}
	else
		cmd(BINDNUM10)
	return
	
NUMPAD11:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM11E = 0
	{
		sendinput {NumpadSub down}
		sleep 50
		sendinput {NumpadSub up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadClear}
	else
		cmd(BINDNUM11)
	return
	
NUMPAD12:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM12E = 0
	{
		sendinput {NumpadDiv down}
		sleep 50
		sendinput {NumpadDiv up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadDiv}
	else
		cmd(BINDNUM12)
	return
	
NUMPAD13:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	
	if BINDNUM13E = 0
	{
		sendinput {NumpadMult down}
		sleep 50
		sendinput {NumpadMult up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadMult}
	else
		cmd(BINDNUM13)
	return
	
NUMPAD14:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM14E = 0
	{
		sendinput {NumpadEnter down}
		sleep 50
		sendinput {NumpadEnter up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadEnter}
	else
		cmd(BINDNUM14)
	return
	
NUMPAD15:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM15E = 0
	{
		sendinput {NumpadDel down}
		sleep 50
		sendinput {NumpadDel up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadDel}
	else
		cmd(BINDNUM15)
	return
	
NUMPAD16:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUM16E = 0
	{
		sendinput {NumpadAdd down}
		sleep 50
		sendinput {NumpadAdd up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadAdd}
	else
		cmd(BINDNUM16)
	return

NUMPADO1:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO1E = 0
	{
		sendinput {NumpadEnd down}
		sleep 50
		sendinput {NumpadEnd up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadEnd}
	else
		cmd(BINDNUMO1)
	return
	
NUMPADO2:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO1E = 0
	{
		sendinput {NumpadDown down}
		sleep 50
		sendinput {NumpadDown up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadDown}
	else
		cmd(BINDNUMO2)
	return
	
NUMPADO3:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO3E = 0
	{
		sendinput {NumpadPgdn down}
		sleep 50
		sendinput {NumpadPgdn up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadPgdn}
	else
		cmd(BINDNUMO3)
	return
	
NUMPADO4:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO4E = 0
	{
		sendinput {NumpadLeft down}
		sleep 50
		sendinput {NumpadLeft up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadLeft}
	else
		cmd(BINDNUMO4)
	return
	
NUMPADO5:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	
	if BINDNUMO1E = 0
	{
		sendinput {NumpadClear down}
		sleep 50
		sendinput {NumpadClear up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadClear}
	else
		cmd(BINDNUMO5)
	return
	
NUMPADO6:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO6E = 0
	{
		sendinput {NumpadRight down}
		sleep 50
		sendinput {NumpadRight up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadRight}
	else
		cmd(BINDNUMO6)
	return
	
NUMPADO7:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO1E = 0
	{
		sendinput {NumpadHome down}
		sleep 50
		sendinput {NumpadHome up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadHome}
	else
		cmd(BINDNUMO7)
	return
	
NUMPADO8:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO1E = 0
	{
		sendinput {NumpadUp down}
		sleep 50
		sendinput {NumpadUp up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadUp}
	else
		cmd(BINDNUMO8)
	return
	
NUMPADO9:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO9E = 0
	{
		sendinput {NumpadPgup down}
		sleep 50
		sendinput {NumpadPgup up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {numpad9}
	else
		cmd(BINDNUMO9)
	return
	
NUMPADO10:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO10E = 0
	{
		sendinput {NumpadIns down}
		sleep 50
		sendinput {NumpadIns up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadIns}
	else
		cmd(BINDNUMO10)
	return
	
NUMPADO11:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO11E = 0
	{
		sendinput {NumpadSub down}
		sleep 50
		sendinput {NumpadSub up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadSub}
	else
		cmd(BINDNUMO11)
	return
	
NUMPADO12:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO12E = 0
	{
		sendinput {NumpadDiv down}
		sleep 50
		sendinput {NumpadDiv up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadDiv}
	else
		cmd(BINDNUMO12)
	return
	
NUMPADO13:
	if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	
	if BINDNUMO13E = 0
	{
		sendinput {NumpadMult down}
		sleep 50
		sendinput {NumpadMult up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadMult}
	else
		cmd(BINDNUMO13)
	return
	
NUMPADO14:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO14E = 0
	{
		sendinput {NumpadEnter down}
		sleep 50
		sendinput {NumpadEnter up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadEnter}
	else
		cmd(BINDNUMO14)
	return
	
NUMPADO15:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO15E = 0
	{
		sendinput {NumpadDot down}
		sleep 50
		sendinput {NumpadDot up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadDot}
	else
		cmd(BINDNUMO15)
	return
	
NUMPADO16:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if BINDNUMO16E = 0
	{
		sendinput {NumpadAdd down}
		sleep 50
		sendinput {NumpadAdd up}
		return
	}
	
	IF CHATBOX = 1
		SendInput {NumpadAdd}
	else
		cmd(BINDNUMO16)
	return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Modified Macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
bribe:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/br "BRIBEAMOUNT)
	return

usedrugs:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/td "DRUGS_TAKE_AMOUNT)
	return
	
wave:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return

	cmd("/hello")
	return	
	
bonusfish:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return	
	if AUTOBONUSON=0
		return
	
	cmd("/fi")
	return
	
giftit:
	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	
	;cmd("/givegift "giveto)
	;cmd("20000")
	;cmd("<3")

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
	
	;cmd("/givegift "GIFTEE)
	;cmd("6")
	;cmd("20000")
	;cmd("<3")

	return
	
deadgift:
	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	sleep 3000
	
	;cmd("/givegift "DEAD)
	;cmd("6")
	;cmd("20000")
	;cmd("<3")
	return
	
giveit:	

	SetTimer , %A_ThisLabel% , off
		if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
	if KEYSKILLON = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return

	;	cmd("/givegift " giveto)
		
	;cmd("6")
	;cmd("20000")
	;cmd("<3")
		
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



	;cmd("/id  "giftspam)
		;cmd("/givegift "giftspam)
		;cmd("3")
		;cmd("<3")
		
	giftspam++
	if giftspam > 200
		giftspam = 0
		
	return

stsply:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
		
	cmd("/sts $ply")
	return
	
stshim:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/sts "HIM)
	return
	
HOTKEY_vehc:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel " " invehicle )
	
	gosub SAMPDETECT 
	if (AUTOCOLORON = "0") || (game = "0") || (	if PLAYER_IN_VEHICLE =  "0")
		Return
	
	gosub COLORSET
		
	if COLORN1 = 256
		Random, COLORN1_A, 0 , 255
	else 
		COLORN1_A = %COLORN1%
	
	if COLORN2 = 256
		Random, COLORN2_A, 0 , 255
	else 
		COLORN2_A = %COLORN2%
	
	cmd("/vehc  " COLORN1_A " " COLORN2_A)
return

		
tupenter:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("{up}")
return
	

dance:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/dance 3")
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

	cmd("/"A_ThisLabel)
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
	
	cmd("/dice $civ " PLAYDICEAMOUNT)
return

givepoorcash:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if KEYSKILLON = 0
		return
	
	cmd("/gc " poor " " PLAYDICEAMOUNT)
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
	
	cmd("/"A_ThisLabel)
return

FPSLOW:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	fps = %FPSLOW%
	cmd("/fpslimit " FPSLOW)
	return
	
FPSHIGH:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	fps = %FPSHIGH%
	cmd("/fpslimit "FPSHIGH)
	return

login:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	if AUTOLOGONON=0
		return
	
	if PASSWORD = ERROR
		return
	gosub getpass
	if PASSWORD =
		return
	
	sleep %SLEEPTOLOG%
	sendinput , %PASSWORD%{enter}		
	PASSWORD = 
	
	if SPAWNATLOGON = 1
	{
		sleep %SLEEPTOLOG%
		sendinput {shift down}
		sleep %SLEEPTOLOG%
		sendinput {shift up}
	}
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
sit:
sell:
sellmenu:
fishinv:
pay:
house:
storage:
escape:
info:
jury:
DL:
Cancel:
lock:
unlock:
bail:
buy:
courier:
fsell:
fsellall:
strip:
mission:
vsi:
stocks:
market:
delivery:
tip:
assslap:
slap:
carkick:
crossarms:
cry:
fart:
flash:
go:
handstand:
hide:
idle:
jumpkick:
ls:
lay:
piss:
armcross:
point:
ride:
scratch:
noob:
stop:
kiss:
lean:
flower:
fuck:
wank:
weapons:
mech:
drugs:
items:
sex:
medic:
clothes:
clothesbuy:
clothessell:
food:
mourn:
jaillist:
prices:
vehrepair:
pointup:
trick:
moneyrush:
ups:
gift:
shoplift:
holdup:
ad:
ifix:
closest:
radio:	
accept:	
exit:
refuse:
robbery:
cook:
taichi:
grj:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/"A_ThisLabel)
return

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Just Send IT! ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
SEND_1:
SEND_2:
SEND_3:
SEND_4:
SEND_5:
SEND_6:
SEND_7:
SEND_8:
SEND_9:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel )
	StringTrimRight, SEND_NUM , A_ThisLabel, 5
	cmd(" "SEND_NUM)
	
return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Lotto Function ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


lotto:
	SetTimer , %A_ThisLabel% , off
	;if ENABLE_DEBUG_LOTTO = 1
		LV_Add("","- " A_ThisLabel " " LOOTOPLAYED)
	
	if LOOTOPLAYED = 1
		return
	gosub SAMPDETECT 
	if game = 0
		return
	if LOTTOFAIL = 1
	{
		SetTimer , randomLotto , 1500
		return
	}		
	if GUILOTTO = 0
	{
		SetTimer , randomLotto , 1500
		return
	}
	if GUILOTTO > 0
	{
		SetTimer ,Guilotto, 1500
		return
	}
	LOTTOPLAYED = 1
return

randomLotto:
	SetTimer, randomLotto, off
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("","- " A_ThisLabel " " Lottery " CB random ")
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
			LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/lotto")
	SetTimer, SEND_2, 1000
return

Guilotto:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG_LOTTO = 1
		LV_Add("","- " A_ThisLabel " " Lottery " GUI " GUILOTTO)
	SetTimer , %A_ThisLabel% , off
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/lotto ")
	cmd(" 1")
	cmd(GUILOTTO)
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FPSTAB:
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if fps = %FPSLOW%
		gosub FPSHIGH
	else
		gosub FPSLOW
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
	t := GetKeyState("CapsLock", "T")
	SendInput % t := t = 1 ? "T" : t = 0  ? "t" : "t"
	CHATBOX = 1
return

BIND_TILDE:
	if ENABLE_DEBUG = 1	
		LV_Add("","+ " A_ThisLabel)
	t := GetKeyState("CapsLock", "T")
	SendInput % t := t = 1 ? "~" : t = 0  ? "``" : "t"
	CHATBOX = 1
return

BIND_ENTER:
	if ENABLE_DEBUG = 1	
		LV_Add("","+ " A_ThisLabel)
	SendInput {ENTER}
	CHATBOX = 0
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
		VAR = 1
	}
	else
	{
		WinActivate , ahk_class Grand theft auto San Andreas
		VAR = 0
	}
	sleep 1000
	gosub SAMPDETECT
	gosub KEYBINDCHECK
pauseend:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^!+Escape::
run taskkill /F /IM GTA_SA.exe
return

Logon:
	if ENABLE_DEBUG = 1
			LV_Add("", "- " A_ThisLabel)
	gosub getpass
	Gui 2:destroy
	Gui 2:Margin, 5,5
	Gui 2:Font, S10, Verdana
	Gui 2:Add, Groupbox,	x5 	y0 	w230 h80, Enter User Name
	Gui 2:Add, Groupbox, 	x5 	y80 w230 h80, Enter Password
	Gui 2:Add, Edit, 		x20 y35 r1 Limit20 w200 h20 vPlayerName, %PlayerName%
	Gui 2:Add, Edit, 		x20 y115 r1 Limit20 w200 h20 0x20 vmypass, %mypass%
	Gui 2:Add, Button, 		x240 y10 w50 h150 0x8000 Default, OK
	Gui 2:Show, AutoSize ,Logon
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Fishsize:
		
	if ENABLE_DEBUG = 1
			LV_Add("", "- "  A_ThisLabel)
			
		GUI_ADD_W = 60
		GUI_ADD_X = 20
		GUI_ADD_Y = 40
		GUI_ADD_X_2 = 180
		GUI_ADD_Y_2 = 20
		GUI_ADD_X_3 = 100
		GUI_ADD_Y_3 = 40
		GUI_ADD_H = 20
		FISH_LIST_I = 0
		B_index = 0
			
;	settimer, fish, %delay%READ
	Gui 3:Destroy
	Gui 3:Margin, 5,5
	Gui 3:Add, Groupbox,w350 h420, Throwback Fish Under (LB)
	
	loop, parse, FISH_LIST, |
	{
		if FISH_LIST_I = 5
			FISH_LIST_I = 0
		FISH_LIST_I++
		;MsgBox % FISH_LIST_I
		if FISH_LIST_I = 1
		{
			if A_LoopField !=
			{
				FISH_SAVE := A_LoopField
				B_index++
				if B_index = 19
				{
					GUI_ADD_X := GUI_ADD_X + GUI_ADD_X_2
					GUI_ADD_X_3 := GUI_ADD_X_3 + GUI_ADD_X_2
					GUI_ADD_Y = 40
				}
				GUI_ADD_LOOPFIELD := %A_LoopField%
				GUI 3:ADD, TEXT, x%GUI_ADD_X% y%GUI_ADD_Y% h%GUI_ADD_H%									, %A_LoopField%
				GUI 3:ADD, EDIT, x%GUI_ADD_X_3% y%GUI_ADD_Y% h%GUI_ADD_H% w%GUI_ADD_W%	v%A_LoopField%	, %GUI_ADD_LOOPFIELD%
				
				GUI_ADD_Y := GUI_ADD_Y + GUI_ADD_Y_2

			}
		}
	}

	Gui 3:Add, Text , x380 y340 w40 h20        , Delay
	GUI 3:Add, Edit , x450 y340 w40 h20 vDelay ,  %Delay%
	
	Gui 3:Add, Checkbox , x380 y290     h20	vAUTOFISHDISPLAY Checked%AUTOFISHDISPLAY%, Show Catch
	Gui 3:Add, Checkbox , x380 y310     h20	vAUTOFISHSELL Checked%AUTOFISHSELL%, Auto Sell
	
	Gui 3:Add, Groupbox , x370 y35 h240 w130  	  , Keep Fish
	Gui 3:Add, Button , x380 y70  w100 , All
	Gui 3:Add, Button , x380 y110 w100 , Small
	Gui 3:Add, Button , x380 y150 w100 , Medium
	Gui 3:Add, Button , x380 y190 w100 , Large
	Gui 3:Add, Button , x380 y230 w100 , Huge
	Gui 3:Add, Button , x380 y380 w100 h40 , Apply
	Gui 3:Show, AutoSize ,Fish

Return

3buttonAll:
3buttonSmall:
3buttonMedium:
3buttonLarge:
3buttonHuge:

gui 3:destroy
FISH_LIST_I = 0
Loop, Parse, FISH_LIST , |
{
	if FISH_LIST_I = 5
		FISH_LIST_I = 0
	FISH_LIST_I++
	if FISH_LIST_I = 1
	{
		if A_LoopField !=
			FISH_SAVE := A_LoopField
	}
	if ( FISH_LIST_I = "1" ) && ( A_ThisLabel = "3buttonAll")
	{
		if A_LoopField !=
			%FISH_SAVE% = 0
	}
	if ( FISH_LIST_I = "2" ) && ( A_ThisLabel = "3buttonSmall")
	{
		if A_LoopField !=
			%FISH_SAVE% := A_LoopField
	}
	if ( FISH_LIST_I = "3" ) && ( A_ThisLabel = "3buttonMedium")
	{
		if A_LoopField !=
			%FISH_SAVE% := A_LoopField
	}
	if ( FISH_LIST_I = "4" ) && ( A_ThisLabel = "3buttonLarge")
	{
		if A_LoopField != 
			%FISH_SAVE% := A_LoopField
	}
	if ( FISH_LIST_I = "5" ) && ( A_ThisLabel = "3buttonHuge")
	{
		if A_LoopField != 
			%FISH_SAVE% := A_LoopField
	}
}
goto fishsize
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Preferences:
	if ENABLE_DEBUG = 1
		LV_Add("", "-  "  A_ThisLabel)
	gosub INIREAD
	Gui 4:Destroy
	Gui 4:Margin, 10,5
	Gui 4:Add, GroupBox, x20  y5 w150 h120 						, Auto Lotto
	Gui 4:Add, Text, 	 x30  y30 w130  						, Prefered Number
	Gui 4:Add, Text, 	 x30  y50 w130  						, 0 is random
	Gui 4:Add, Edit, 	 x30  y80 w30  vGUILOTTO				, %GUILOTTO%
	
	Gui 4:Add, GroupBox, x20  y135 w150 h120 					, Take Drugs 
	Gui 4:Add, Text, 	 x30  y160 w130  						, Use Amount
	Gui 4:Add, Text, 	 x30  y180 w130  						, ALT + J
	Gui 4:Add, Edit, 	 x30  y205 w30  vDRUGS_TAKE_AMOUNT		, %DRUGS_TAKE_AMOUNT%
	
	Gui 4:Add, GroupBox, x20  y265 w150 h120 					, Give Drugs
	Gui 4:Add, Text, 	 x30  y290 w130  						, Give Grams
	Gui 4:Add, Text, 	 x30  y310 w130  						, CTRL + J
	Gui 4:Add, Edit, 	 x30  y335 w30  vDRUGS_GIVE_AMOUNT		, %DRUGS_GIVE_AMOUNT%
	
	Gui 4:Add, GroupBox, 	x170 y5  w300 h120 					, Vehicle Color
	Gui 4:Add, Text, 	 	x190 y20 w60  h20 					, Color 1
	Gui 4:Add, ComboBox,	x260 y20 w190 r8 vCOLOR1 			, %COLOR1%||%COLORLIST%
	Gui 4:Add, Text, 	 	x190 y50 w60  h20 					, Color 2
	Gui 4:Add, ComboBox, 	x260 y50 w190 r8 vCOLOR2 			, %COLOR2%||%COLORLIST%
	Gui 4:Add, Text, 	 	x190 y80 w80  h20 					, Timer (mins)
	Gui 4:Add, Edit, 		x260 y80 w190  vCOLOR_TIMER			, %COLOR_TIMER%
	
	Gui 4:Add, GroupBox, 	x170 y135 w300 h120 				, Others
	gui 4:Add, Text, 		x190 y160 w140 h30 					, Bribe Amount
	gui 4:Add, Edit, 		x300 y160 w100 h20 vBRIBEAMOUNT 	, %BRIBEAMOUNT%
	gui 4:Add, Text, 		x190 y200 w140 h30 					, Dice Amount
	gui 4:Add, Edit, 		x300 y200 w100 h20  vPLAYDICEAMOUNT	, %PLAYDICEAMOUNT%
	
	
	Gui 4:Add, GroupBox, 	x170 y265 w300 h120 				, Idle Timeout
	gui 4:Add, Text, 		x190 y290 w140 h30 					, Time (sec)
	gui 4:Add, Edit, 		x300 y290 w100 h20 	vIDLE_TIMEOUT 	, %IDLE_TIMEOUT%
	gui 4:Add, Text, 		x190 y330 w140 h30 					, Enable
	gui 4:Add, Edit, 		x300 y330 w100 h20  vIDLE_ENABLE	, %IDLE_ENABLE%
	

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
	gui 4:Add, Button, 		x660 y350 w100 h50 , Apply
	
	
	
	
	;gui 4:Add, Text, x530 y230 w140 h40 , 												Chat Font Size
	;gui 4:Add, Edit, x650 y230 w150 h20 vGUIFONT, %GUIFONT%
	Gui 4:Show, AutoSize ,Preferences
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Keybinds:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 5:Destroy
	sleep 100
	if ENABLE_DEBUG = 1
			LV_Add("", "-  " A_ThisLabel)
	gosub INIREAD
	gui 5:Add, Text, x20 y20 w600 h20 , Keybinder                             EXAMPLE   /FishSlap                                              Enable
	
		
	gui 5:Add, GroupBox, x1000  y300 w220 h350 w250 , Enable/Disable Keybinds
	Gui 5:Add, Button, x1000  y100 w100, Commands
	Gui 5:Add, Button, x1000  y150 w100, TenCodes
	
	gui 5:Add, CheckBox, x1020  y320 w220 h20 vAUTOGROUP_KEYBIND Checked%AUTOGROUP_KEYBIND%, Group Create
	gui 5:Add, CheckBox, x1020  y350 w220 h20 vKEYPROGRAMON Checked%KEYPROGRAMON%, Programable
	gui 5:Add, CheckBox, x1020  y380 w220 h20 vKEYANIMATIONON Checked%KEYANIMATIONON%, Preset Game Commands
	gui 5:Add, CheckBox, x1020  y410 w220 h20 vKEYSKILLON Checked%KEYSKILLON%, Preset Item Purchase 
	gui 5:Add, CheckBox, x1020  y440 w220 h20 vKEYMENUON Checked%KEYMENUON%, Preset Menu Binds
	gui 5:Add, CheckBox, x1020  y470 w220 h20 vKEYFPSON Checked%KEYFPSON%, ALT+TAB Toggle FPS
	gui 5:Add, CheckBox, x1020  y500 w220 h20 vKEYWINKEY Checked%KEYWINKEY%, LWIN Sit 8
	gui 5:Add, CheckBox, x1020  y530 w220 h20 vKEYDLTOGGLE Checked%KEYDLTOGGLE%, CAPSLOCK Toggles DL
	
	gui 5:Add, CheckBox, x1020  y560 w220 h20 vKEYNUM Checked%KEYNUM%, Numlock On Binds
	gui 5:Add, CheckBox, x1020  y590 w220 h20 vKEYNUMO Checked%KEYNUMO%, Numlock Off Binds
	
	gui 5:Add, CheckBox, x1020  y620 w220 h20 vKEYESCAPE Checked%KEYESCAPE% , Escape key Binds
	
	
	
	Gui 5:Add, Button, Default, Apply
	
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
	
	gui 5:Add, Text, X460 y330 w90 h20 , NUMLOCK OFF
	gui 5:Add, Text, X460 y360 w90 h20 , NUM End
	gui 5:Add, Text, X460 y380 w90 h20 , NUM Down
	gui 5:Add, Text, X460 y400 w90 h20 , NUM PgDn
	gui 5:Add, Text, X460 y420 w90 h20 , NUM Left
	gui 5:Add, Text, X460 y440 w90 h20 , NUM 5
	gui 5:Add, Text, X460 y460 w90 h20 , NUM Right
	gui 5:Add, Text, X460 y480 W90 h20 , NUM Home
	gui 5:Add, Text, X460 y500 W90 h20 , NUM Up
	gui 5:Add, Text, X460 y520 W90 h20 , NUM PgUp
	gui 5:Add, Text, X460 y540 W90 h20 , NUM Ins
	gui 5:Add, Text, X460 y560 W90 h20 , NUM -
	gui 5:Add, Text, X460 y580 W90 h20 , NUM /
	gui 5:Add, Text, X460 y600 W90 h20 , NUM *
	gui 5:Add, Text, X460 y620 W90 h20 , NUM Ent
	gui 5:Add, Text, X460 y640 W90 h20 , NUM Del
	gui 5:Add, Text, X460 y660 W90 h20 , NUM Add
	
	gui 5:Add, Edit, x520 y360 w370 h20  vBINDNUMO1 ,%BINDNUMO1%
	gui 5:Add, Edit, x520 y380 w370 h20  vBINDNUMO2, %BINDNUMO2%
	gui 5:Add, Edit, x520 y400 w370 h20 vBINDNUMO3, %BINDNUMO3%
	gui 5:Add, Edit, x520 y420 w370 h20 vBINDNUMO4, %BINDNUMO4%
	gui 5:Add, Edit, x520 y440 w370 h20 vBINDNUMO5, %BINDNUMO5%
	gui 5:Add, Edit, x520 y460 w370 h20 vBINDNUMO6, %BINDNUMO6%
	gui 5:Add, Edit, x520 y480 w370 h20 vBINDNUMO7, %BINDNUMO7%
	gui 5:Add, Edit, x520 y500 w370 h20 vBINDNUMO8, %BINDNUMO8%
	gui 5:Add, Edit, x520 y520 w370 h20 vBINDNUMO9, %BINDNUMO9%
	gui 5:Add, Edit, x520 y540 w370 h20 vBINDNUMO10, %BINDNUMO10%
	gui 5:Add, Edit, x520 y560 w370 h20 vBINDNUMO11, %BINDNUMO11%
	gui 5:Add, Edit, x520 y580 w370 h20 vBINDNUMO12, %BINDNUMO12%
	gui 5:Add, Edit, x520 y600 w370 h20 vBINDNUMO13, %BINDNUMO13%
	gui 5:Add, Edit, x520 y620 w370 h20 vBINDNUMO14, %BINDNUMO14%
	gui 5:Add, Edit, x520 y640 w370 h20 vBINDNUMO15, %BINDNUMO15%
	gui 5:Add, Edit, x520 y660 w370 h20 vBINDNUMO16, %BINDNUMO16%
	
	gui 5:Add, CheckBox, x900 y360 w50 h20  vBINDNUMO1E  Checked%BINDNUMO1E%, 
	gui 5:Add, CheckBox, x900 y380 w50 h20  vBINDNUMO2E  Checked%BINDNUMO2E%, 
	gui 5:Add, CheckBox, x900 y400 w50 h20 vBINDNUMO3E  Checked%BINDNUMO3E%, 
	gui 5:Add, CheckBox, x900 y420 w50 h20 vBINDNUMO4E  Checked%BINDNUMO4E%, 
	gui 5:Add, CheckBox, x900 y440 w50 h20 vBINDNUMO5E  Checked%BINDNUMO5E%, 
	gui 5:Add, CheckBox, x900 y460 w50 h20 vBINDNUMO6E  Checked%BINDNUMO6E%, 
	gui 5:Add, CheckBox, x900 y480 w50 h20 vBINDNUMO7E  Checked%BINDNUMO7E%, 
	gui 5:Add, CheckBox, x900 y500 w50 h20 vBINDNUMO8E  Checked%BINDNUMO8E%, 
	gui 5:Add, CheckBox, x900 y520 w50 h20 vBINDNUMO9E  Checked%BINDNUMO9E%, 
	gui 5:Add, CheckBox, x900 y540 w50 h20 vBINDNUMO10E Checked%BINDNUMO10E%, 
	gui 5:Add, CheckBox, x900 y560 w50 h20 vBINDNUMO11E Checked%BINDNUMO11E%, 
	gui 5:Add, CheckBox, x900 y580 w50 h20 vBINDNUMO12E Checked%BINDNUMO12E%, 
	gui 5:Add, CheckBox, x900 y600 w50 h20 vBINDNUMO13E  Checked%BINDNUMO13E%, 
	gui 5:Add, CheckBox, x900 y620 w50 h20 vBINDNUMO14E Checked%BINDNUMO14E%, 
	gui 5:Add, CheckBox, x900 y640 w50 h20 vBINDNUMO15E Checked%BINDNUMO15E%, 
	gui 5:Add, CheckBox, x900 y660 w50 h20 vBINDNUMO16E Checked%BINDNUMO16E%, 
	gui 5:Add, Text, x12 y330 w90 h20 , NUMLOCK ON
	gui 5:Add, Text, x12 y360 w90 h20 , NUM 1
	gui 5:Add, Text, x12 y380 w90 h20 , NUM 2
	gui 5:Add, Text, x12 y400 w90 h20 , NUM 3
	gui 5:Add, Text, x12 y420 w90 h20 , NUM 4
	gui 5:Add, Text, x12 y440 w90 h20 , NUM 5
	gui 5:Add, Text, x12 y460 w90 h20 , NUM 6
	gui 5:Add, Text, x12 y480 W90 h20 , NUM 7
	gui 5:Add, Text, x12 y500 W90 h20 , NUM 8
	gui 5:Add, Text, x12 y520 W90 h20 , NUM 9
	gui 5:Add, Text, x12 y540 W90 h20 , NUM 0
	gui 5:Add, Text, x12 y560 W90 h20 , NUM -
	gui 5:Add, Text, x12 y580 W90 h20 , NUM /
	gui 5:Add, Text, x12 y600 W90 h20 , NUM *
	gui 5:Add, Text, x12 y620 W90 h20 , NUM Ent
	gui 5:Add, Text, x12 y640 W90 h20 , NUM .
	gui 5:Add, Text, x12 y660 W90 h20 , NUM +
	
	gui 5:Add, Edit, x60 y360 w350 h20  vBINDNUM1 ,%BINDNUM1%
	gui 5:Add, Edit, x60 y380 w350 h20  vBINDNUM2, %BINDNUM2%
	gui 5:Add, Edit, x60 y400 w350 h20 vBINDNUM3, %BINDNUM3%
	gui 5:Add, Edit, x60 y420 w350 h20 vBINDNUM4, %BINDNUM4%
	gui 5:Add, Edit, x60 y440 w350 h20 vBINDNUM5, %BINDNUM5%
	gui 5:Add, Edit, x60 y460 w350 h20 vBINDNUM6, %BINDNUM6%
	gui 5:Add, Edit, x60 y480 w350 h20 vBINDNUM7, %BINDNUM7%
	gui 5:Add, Edit, x60 y500 w350 h20 vBINDNUM8, %BINDNUM8%
	gui 5:Add, Edit, x60 y520 w350 h20 vBINDNUM9, %BINDNUM9%
	gui 5:Add, Edit, x60 y540 w350 h20 vBINDNUM10, %BINDNUM10%
	gui 5:Add, Edit, x60 y560 w350 h20 vBINDNUM11, %BINDNUM11%
	gui 5:Add, Edit, x60 y580 w350 h20 vBINDNUM12, %BINDNUM12%
	gui 5:Add, Edit, x60 y600 w350 h20 vBINDNUM13, %BINDNUM13%
	gui 5:Add, Edit, x60 y620 w350 h20 vBINDNUM14, %BINDNUM14%
	gui 5:Add, Edit, x60 y640 w350 h20 vBINDNUM15, %BINDNUM15%
	gui 5:Add, Edit, x60 y660 w350 h20 vBINDNUM16, %BINDNUM16%
	
	gui 5:Add, CheckBox, x422 y360 w30 h20  vBINDNUM1E  Checked%BINDNUM1E%, 
	gui 5:Add, CheckBox, x422 y380 w30 h20  vBINDNUM2E  Checked%BINDNUM2E%, 
	gui 5:Add, CheckBox, x422 y400 w30 h20 vBINDNUM3E  Checked%BINDNUM3E%, 
	gui 5:Add, CheckBox, x422 y420 w30 h20 vBINDNUM4E  Checked%BINDNUM4E%, 
	gui 5:Add, CheckBox, x422 y440 w30 h20 vBINDNUM5E  Checked%BINDNUM5E%, 
	gui 5:Add, CheckBox, x422 y460 w30 h20 vBINDNUM6E  Checked%BINDNUM6E%, 
	gui 5:Add, CheckBox, x422 y480 w30 h20 vBINDNUM7E  Checked%BINDNUM7E%, 
	gui 5:Add, CheckBox, x422 y500 w30 h20 vBINDNUM8E  Checked%BINDNUM8E%, 
	gui 5:Add, CheckBox, x422 y520 w30 h20 vBINDNUM9E  Checked%BINDNUM9E%, 
	gui 5:Add, CheckBox, x422 y540 w30 h20 vBINDNUM10E Checked%BINDNUM10E%, 
	gui 5:Add, CheckBox, x422 y560 w30 h20 vBINDNUM11E Checked%BINDNUM11E%, 
	gui 5:Add, CheckBox, x422 y580 w30 h20 vBINDNUM12E Checked%BINDNUM12E%, 
	gui 5:Add, CheckBox, x422 y600 w30 h20 vBINDNUM13E Checked%BINDNUM13E%, 
	gui 5:Add, CheckBox, x422 y620 w30 h20 vBINDNUM14E Checked%BINDNUM14E%, 
	gui 5:Add, CheckBox, x422 y640 w30 h20 vBINDNUM15E Checked%BINDNUM15E%, 
	gui 5:Add, CheckBox, x422 y660 w30 h20 vBINDNUM16E Checked%BINDNUM16E%, 

	gui 5:Show, , Keybinds
	TOOLTIP_Keybinds = 1|2|3|4
;	OnMessage(0x200, "Help")	
	
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group:


if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Gui 11:Destroy
	LISTBOX_GROUP_PLAYERS =
	loop, parse, GROUP_PLAYERS, %a_space%
	{ 
		IfNotEqual, a_loopfield, %a_space%
			LISTBOX_GROUP_PLAYERS = %LISTBOX_GROUP_PLAYERS%|%A_LoopField%
	}
	StringTrimLeft, LISTBOX_GROUP_PLAYERS, LISTBOX_GROUP_PLAYERS, 1
	Gui 11:Add, Text, 		x40 	y20 	w90 	h30 , Name
	Gui 11:Add, Edit, 		x140 	y10 	w200 	h30 vGROUP_NAME , %GROUP_NAME%
	
	Gui 11:Add, Text, 		x40 	y50 	w90 	h30  , Hotkey
	Gui 11:Add, Hotkey, 	x140 	y40 	w200 	h30 vGROUP_KEYBIND gGROUP_KEYBIND, %GROUP_KEYBIND%
	
	Gui 11:Add, Text, 		x40 	y80 	w90 	h30 , Advert
	Gui 11:Add, Edit, 		x140 	y70 	w200 	h30 vGROUP_ADVERT , %GROUP_ADVERT%
	Gui 11:Add, Text, 		x40 	y110 	w90 	h30 , Interval (Mins)
	Gui 11:Add, Text, 		x140 	y100 	w30 	h30 ,
	Gui 11:Add, Updown, 	x130 	y100 	w30 	h30 Range0-24 vGROUP_ADVERT_TIME , %GROUP_ADVERT_TIME%
	Gui 11:Add, Text, 		x180 	y110 	w110 	h30 , /GM !advert on/off
	
	Gui 11:Add, Text, 		x40 	y140 	w90 	h30 , Join Message
	Gui 11:Add, Edit, 		x140 	y130 	w200 	h30 vGROUP_JOIN_MESSAGE , %GROUP_JOIN_MESSAGE%
	Gui 11:Add, Text, 		x40 	y160 	w90 	h30 , Group Type
	Gui 11:Add, Text, 		x140 	y160 	w30 	h30 ,
	Gui 11:Add, Updown, 	x130 	y160 	w30 	h30 Range1-24 vGROUP_TYPE , %GROUP_TYPE%
	Gui 11:Add, Text, 		x180 	y170 	w150	h30 , 1 Request 2 Open 3 Invite
	
	Gui 11:Add, Checkbox, 	x250 	y210	w100 	h30 vAUTOGROUP_JOIN  Checked%vAUTOGROUP_JOIN%, Auto Join
	Gui 11:Add, Checkbox, 	x250 	y240 	w100 	h30 vGROUP_ADVERT_ENABLE  Checked%GROUP_ADVERT_ENABLE% , Enable Advert
	Gui 11:Add, Checkbox, 	x250 	y270 	w120 	h30 vAUTOGROUP_ADD_INGAME  Checked%AUTOGROUP_ADD_INGAME% , Add Ingame Invties
	
	Gui 11:Add, ListBox,	x40 	y210 	w200 	h210 vGROUP_PLAYER_SELECTED , %LISTBOX_GROUP_PLAYERS%
	
	Gui 11:Add, Button, 	x40 	y420 	w90 	h30 , Add
	Gui 11:Add, Button, 	x150 	y420 	w90 	h30 , Remove
	Gui 11:Add, Button, 	x260 	y420 	w90 	h30 , Edit
	Gui 11:Show, w400 h500, 
	gui 11:Show, , Group
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Hotkeys:

gui 12:destroy
gui 12:Add, Tab3,, %TAB_LIST%

loop, parse, CMDLIST, -
{
	GUI_X_1 = 20
	GUI_X_2 = 0
	GUI_Y_1 = 60
	
	gui 12:Tab, %a_index%	
	b_index = %a_index%
	loop, parse, A_Loopfield, |
	{
	z_index = %a_index%
	if ( a_index = 21 or a_index = 41 or a_index = 61)
		{
			GUI_Y_1 = 60
			GUI_X_1 += 230
		}
		
		GUI_ADD_CMD = %A_LoopField%
		GUI_Y_1 += 30
		GUI_X_2 := (GUI_X_1 + 100)
			
			
		gui 12:Add, Button, x%GUI_X_1% 	y%GUI_Y_1% w100 , %A_Loopfield%
		IniRead, savedHK_%A_Loopfield%, Hotkeys.ini, Hotkeys, _%A_Loopfield%, %A_Space%
		If savedHK_%A_Loopfield%       		;Check for saved hotkeys in INI file.
		{
			Hotkey, IfWinActive, ahk_class %HK_TARGET%
			Hotkey, % savedHK_%A_Loopfield%, HOTKEY_%A_Loopfield%               					;Activate saved hotkeys if found.
		}
		StringReplace, noMods, savedHK_%A_Loopfield%, ~                  							;Remove tilde (~) and Win (#) modifiers...
		StringReplace, noMods, savedHK_%A_Loopfield%, $                 							;Remove tilde (~) and Win (#) modifiers...
		StringReplace, noMods, noMods, #,,UseErrorLevel             									;They are incompatible with hotkey controls (cannot be shown).
		if A_Loopfield != ERROR
			gui 12:Add, Hotkey, x+5 w100  vHK_%A_Loopfield% gLabel, %noMods%           					;Add hotkey controls and show saved hotkeys.

		Label_%b_index%_%A_Index% = %A_Loopfield%
		savedHK_%A_Loopfield% = 
	}
	#ctrls += z_index
}

gui 12:Show,,Dynamic Hotkeys
;OnMessage(0x200, "Help")
return


/*
mouse:
Gui, 14:Add, GroupBox, x32 y19 w260 h190 , Remap
Gui, 14:Add, Text, x52 y49 w100 h30 , Button 1 (LMB)
Gui, 14:Add, Text, x52 y79 w100 h30 , Button 2 (RMB)
Gui, 14:Add, Text, x52 y109 w100 h30 , Button 3 (MMB)
Gui, 14:Add, Text, x52 y139 w100 h30 , Button 4 (XB1)
Gui, 14:Add, Text, x52 y169 w100 h30 , Button 5 (XB2)
;Gui, 14:Add, Hotkey, x152 y49 w100 h30 	vMOUSE_BUTTON1 gHOTKEY_SUBMIT		, %MOUSE_BUTTON1%
;Gui, 14:Add, Hotkey, x152 y79 w100 h30 	vMOUSE_BUTTON2  gHOTKEY_SUBMIT		, %MOUSE_BUTTON2%
;Gui, 14:Add, Hotkey, x152 y109 w100 h30 	vMOUSE_BUTTON3  gHOTKEY_SUBMIT		, %MOUSE_BUTTON3%
Gui, 14:Add, Hotkey, x152 y139 w100 h30 	vMOUSE_BUTTON4  gHOTKEY_SUBMIT		, %MOUSE_BUTTON4%
Gui, 14:Add, Hotkey, x152 y169 w100 h30 	vMOUSE_BUTTON5  gHOTKEY_SUBMIT		, %MOUSE_BUTTON5%
Gui, 14:Add, CheckBox, x262 y49 w20 h30 	, 
Gui, 14:Add, CheckBox, x262 y79 w20 h30 	, 
Gui, 14:Add, CheckBox, x262 y109 w20 h30 	, 
Gui, 14:Add, CheckBox, x262 y139 w20 h30 	, 
Gui, 14:Add, CheckBox, x262 y169 w20 h30 	, 
Gui, 14:Show, w316 h235, Mouse
return
*/

HOTKEY_SUBMIT:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	gui, submit, nohide
return
	
GROUP_KEYBIND:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	
	IfNotEqual, GROUP_KEYBIND,
		GROUP_KEYBIND = %GROUP_KEYBIND%
		gui, submit, nohide
return

11buttonEdit:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	
	inputbox, GROUP_PLAYERS,,,,,,,,,, %GROUP_PLAYERS%
	if ErrorLevel
		MsgBox, CANCEL was pressed.
	else
	{
		GuiControl,, GROUP_PLAYER_SELECTED , |
		loop, parse, GROUP_PLAYERS, %a_space% |
		{ 
			IfNotEqual, a_loopfield, %a_space%
			{
				if a_index = 1
					GROUP_PLAYERS = 
				GROUP_PLAYERS = %GROUP_PLAYERS%|%A_LoopField%
			}
		}
		StringTrimLeft, GROUP_PLAYERS, GROUP_PLAYERS, 1
		gui 11:destroy
		gosub INIWRITE
		goto group
	}
return

11buttonAdd:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	
	InputBox, GROUP_PLAYERS_ADD, Add Player
	if GROUP_PLAYERS = 
		GROUP_PLAYERS = %GROUP_PLAYERS_ADD%
	IfNotInString, GROUP_PLAYERS , %GROUP_PLAYERS_ADD%
	{
		GROUP_PLAYERS := GROUP_PLAYERS "|" GROUP_PLAYERS_ADD
	}

	LISTBOX_GROUP_PLAYERS := GROUP_PLAYERS
	GuiControl,, GROUP_PLAYER_SELECTED , |
	GuiControl,, GROUP_PLAYER_SELECTED, %LISTBOX_GROUP_PLAYERS% 

	
;	gui 11:destroy
	gosub INIWRITE
;	goto group
return

11buttonRemove:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	Gui,Submit,NoHide
	IfEqual,GROUP_PLAYER_SELECTED,, 
		Return
	GuiControl,, GROUP_PLAYER_SELECTED , |
	LISTBOX_GROUP_PLAYERS := DelItem( GROUP_PLAYER_SELECTED, LISTBOX_GROUP_PLAYERS )
	GuiControl,, GROUP_PLAYER_SELECTED, %LISTBOX_GROUP_PLAYERS% 
	GROUP_PLAYERS = %LISTBOX_GROUP_PLAYERS% 
	Return
	
	
	
		LV_Add("","- " A_ThisLabel)
	gui 11:submit
	loop, parse, GROUP_PLAYERS, %a_space% |
	{ 
		IfNotEqual, a_loopfield, %a_space%
		{
			if a_index = 1
				GROUP_PLAYERS = 
			IfNotEqual, GROUP_PLAYER_SELECTED , %a_loopfield%
			GROUP_PLAYERS = %GROUP_PLAYERS%|%A_LoopField%
		}
	}
	StringTrimLeft, GROUP_PLAYERS, GROUP_PLAYERS, 1
	gui 11:destroy
	gosub INIWRITE
	goto group
return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

2buttonOk:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 2:Submit, NoHide
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP\, PlayerName, %PlayerName%
	gosub INIWRITE
	gosub INIREAD
	gosub setpass
	gui 2:destroy
return
1buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 1:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 1:destroy
return

2buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 2:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 2:destroy
return
3buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 3:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 3:destroy
return
4buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 4:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 4:destroy
return
5buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
6buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
	reload
return
7buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 7:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 7:destroy
	reload
return
8buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 8:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 8:destroy
	reload
return
9buttonApply:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 9:Submit
	gosub INIWRITE
	gosub INIREAD
	gui 9:destroy
	reload
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiClose:
if ENABLE_DEBUG = 1, LV_Add("","- " A_ThisLabel)
	SetTimer,  KEYBINDCHECK , off
	SetTimer,  SAMPDETECT , off
	SetTimer , READLOG , off
	SetTimer , PostMessage , off
	WinGetPos , X, Y, Width, Height,
	Width := Width // 1.014
	Height := Height // 1.06
	gosub INIWRITE
	gosub fishsave
	gui , submit

	ExitApp
2GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Gui 2:Submit
	gosub INIWRITE
	gosub INIREAD
	Gui 2:Destroy
return
3GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 3:submit
	gosub INIWRITE
	gosub INIREAD
	gui 3:Destroy
return
4GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 4:submit
	gosub INIWRITE
	gosub INIREAD
	gui 4:Destroy
return
5GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 5:submit
	gosub INIWRITE
	gosub INIREAD
	gui 5:destroy
return
6GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 6:submit
	gosub INIWRITE
	gosub INIREAD
	gui 6:destroy
return
11GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 11:submit
	gosub INIWRITE
	gosub INIREAD
	gui 11:destroy
return
12GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 12:submit
	gui 12:destroy
loop, parse, CMDLIST, -
{
	GUI_X_1 = 20
	GUI_X_2 = 0
	GUI_Y_1 = 60
	
	Gui, Tab, %a_index%	
	b_index = %a_index%
	loop, parse, A_Loopfield, |
	{
	z_index = %a_index%
    b_index = %A_Loopfield%
	if ( a_index = 21 or a_index = 41 or a_index = 61)
		{
			GUI_Y_1 = 60
			GUI_X_1 += 230
		}
		
		GUI_ADD_CMD = %A_LoopField%
		GUI_Y_1 += 30
		GUI_X_2 := (GUI_X_1 + 100)
			
			
		IniRead, savedHK_%A_Loopfield%, Hotkeys.ini, Hotkeys, _%A_Loopfield%, %A_Space%
		If savedHK_%A_Loopfield%       		;Check for saved hotkeys in INI file.
		{
			Hotkey, IfWinActive, ahk_class %HK_TARGET%
			Hotkey, % savedHK_%A_Loopfield%, HOTKEY_%A_Loopfield%                					;Activate saved hotkeys if found.
		}
		StringReplace, noMods, savedHK_%A_Loopfield% , ~                  							;Remove tilde (~) and Win (#) modifiers...
		StringReplace, noMods, noMods, #,,UseErrorLevel             									;They are incompatible with hotkey controls (cannot be shown).
	}
	#ctrls += z_index
}	


	
;	OnMessage(0x200, "")
return
13GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 12:submit
	gosub INIWRITE
	gosub INIREAD
	gui 13:destroy
return
14GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 14:submit
	gosub INIWRITE
	gosub INIREAD
	gui 14:destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Links ;;;;;;;;;;;;;;;;

5ButtonTenCodes:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://crazybobs.net/website/cnr-10-Codes
return

5ButtonCommands:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://crazybobs.net/website/cnr-commands
return

Home:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://crazybobs.net/website/
return

Facebook:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://www.facebook.com/groups/315012238581148/
return

Forums:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://forums.crazybobs.net
return

Stats:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://www.crazybobs.net/mrx/webstats/UserStats.php?username=%Name%
return

Global:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://www.crazybobs.net/mrx/webstats/FlashWebstats.html
return

Map:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run http://www.cbcnr.com/mrx/map/map_web.php
return

Players:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run https://cnr-online-players.000webhostapp.com
return

Feedback:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://discord.gg/bAsW3n7
return

CnR:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	run https://discord.gg/ymPJAeC
return

Schedule:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run https://cnr.nooruse8.ee/
return

Commands:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run http://crazybobs.net/website/cnr-commands
return

GTASAv1:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run https://www.4shared.com/folder/WQeYTJmq/GTASA_V1.html
return

View:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	Run %logfile%
return

Search:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
BOOT = 0
gui, destroy
	gosub findlogfile
return

MyMenuBar:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
return


MenuHandler:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
return

MenuFileOpen:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
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
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Loop % LV_GetCount()
	{
		LVDelete = %A_Index%
		LV_Delete()
	}
return

ButtonSaveOutput:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)

TempFile := "fishlog" A_Now ".txt"

loop, % LV_GetCount() {		
	LV_GetText(col, A_Index,1)
	FileAppend, %col%`n, %TempFile%
}

Run, % TempFile
return

Lv_Modifycol:
Loop % LV_GetCount()
	if a_index > %MAXLISTVIEW%
		LV_Delete()
Lv_Modifycol()
return


makehistory:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %makehistory%
{
	FileDelete, %makehistory%
}
Loop, %logdir%\History\*.txt
{
	Loop, Read, %A_LoopFileLongPath% ,
	{
		FileAppend , %A_LoopReadLine%, %makehistory%
	}
}
return

Personality:

gui 15:destroy
Sleep 1
Gui 15:Add, CheckBox, x30 y30 w100 h20 vPERSONALITY_CLIPTO  	Checked%PERSONALITY_CLIPTO%	, Kleptomania
Gui 15:Add, CheckBox, x30 y60 w100 h20 vPERSONALITY_ARSON  		Checked%PERSONALITY_ARSON%	, Arsonist
Gui 15:Add, CheckBox, x30 y90 w100 h20 vPERSONALITY_MOURN 	 	Checked%PERSONALITY_MOURN%	, Mournfull
; Generated using SmartGUI Creator for SciTE
Gui 15:Show, w479 h379, Personality Disorders
return

15GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 15:submit
	gosub INIWRITE
	gui 15:destroy
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GUI END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


CHECKPATH:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
RegRead, sadir, HKCU, Software\SAMP , gta_sa_exe
if errorlevel = 0
{
	ifexist, %sadir%
	{
		SplitPath, sadir ,, samp, , , sadrv
	}
	IfNotExist, %sadir%
		FileSelectFile, sadir , 1, C:\, Locate Grand Theft Auto San Andreas Multiplayer, GTA_SA.EXE
		if errorlevel 0
		{
			MsgBox, 4, Prerequisite,Grand Theft Auto San Andreas V1.0`nSA-MP Client`n`nWould you like to Download Now?`nI assume you already own this game.
			IfMsgBox Yes
			{
				run https://www.4shared.com/folder/WQeYTJmq/GTASA_V1.html
				run https://www.sa-mp.com/
			}
			ExitApp
		}
		RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP\, gta_sa_exe, %sadir%
}
	if ENABLE_DEBUG = 1
			LV_Add("","- " A_ThisLabel " = " sadir)
return

BUILDWHITE:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
return
IfNotExist , %whitelist%
{
	FileAppend, [BOT]AirCanada`n[BOT]Amtrak`n[BOT]Anna`n[BOT]BusDriverMan`n[BOT]Claude`n[BOT]Colombian`n[BOT]CrackWhore`n[BOT]CrazyFarmer`n[BOT]David`n[BOT]DrunkDriver`n[BOT]eGangsta`n[BOT]Fisherman`n[BOT]GranTurismo`n[BOT]Greyhound`n[BOT]Hernandez`n[BOT]Hippie`n[BOT]Huey`n[BOT]Jizzy`n[BOT]KentPaul`n[BOT]Lufthansa`n[BOT]NeedForSpeed`n[BOT]Otto`n[BOT]Pulaski`n[BOT]Qantas`n[BOT]RalphKramden `n[BOT]Rosie`n[BOT]SandraBullock`n[BOT]Security`n[BOT]StacysMom`n[BOT]Tenpenny`n[BOT]TestDrive`n[BOT]TGV`n[BOT]Thomas`n[BOT]Thomas`n[BOT]VIARail`n[BOT]WhiteTrash`n[BOT]Zero>`n , %whitelist%
}
Loop, Read, %whitelist%
	ignwhite = %white% %a_space% %A_LoopField%
return

BUILDBLACK:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
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
	run C:\Windows\System32\taskkill.exe /IM gta_sa.exe , Hide
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
return

SERVER2:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel  " = " SERVER2)
	gosub CHECKPATH
	gosub getpass
	gosub KILLSAMP
	run "%samp%\samp.exe" %SERVER2%
	SetCapsLockState , oFF
return

SAMPDETECT:
	SetTimer, SAMPDETECT, off
	IfWinNotExist 	, GTA:SA:MP
	{
		game = 0
		SetTimer, SAMPDETECT, %SAMPDETECT%
	}
	IfWinNotActive 	, GTA:SA:MP 
	{
		game = 0	
		SetTimer, SAMPDETECT, %SAMPDETECT%
	}	
	IfWinActive 	, GTA:SA:MP
	{
		game = 1
		SetTimer, SAMPDETECT, %SAMPDETECT%
	}

	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel " = " game)
	if 	game = 1
	{
		SetTimer , PostMessage , %PostMessage%
		gosub KEYBINDCHECK
	}
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ANTISPAM:
StringLen, keylen , A_ThisHotkey
if keylen > 0
	keylen -- %keylen%
StringTrimLeft, keylast, A_ThisHotkey, %keylen%
KeyWait, %keylast% ,
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel " = " keylast)
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHECKCHAT:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfNotExist, %logfile%
{
	MsgBox , 3, Fishlog by Billman87, Automatically Find Chatlog.txt?`nThis may take a some time.`nDouble Click to select chatlog`nIf not Found Click Reseach and find your Documents folder`n
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
	;gosub iniwrite
	Gui, destroy
	goto boot 
}
return

ButtonDelete:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
FileDelete, %logfile%
goto research

ButtonCreate:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
run "%samp%\samp.exe" 127.0.0.1:1987
CreateAttempt = 0
CreateAttempt:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
CreateAttempt++
if CreateAttempt 60
{
	MsgBox, Attempt Count Limit
	return
}
gosub SAMPDETECT
if game = 0
{
	sleep 1000
	goto CreateAttempt 
}
if game = 1
{
	SendInput t/test{enter}
	SendInput t/q{enter}
	Sleep 2000
	gosub SAMPDETECT
	if game = 1
		goto CreateAttempt 
}
Sleep 2000
goto research
return

ButtonResearch:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
FileSelectFolder, SEARCHDRIVE , Computer , , Select Drive
goto research

findlogfile:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
CANCELED = 0
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui add, ListView , W700 h300 gSelectChatlog, Double Click to Select Chatlog.txt
Gui add, Checkbox , x10 y310 vMakeChatPerma , Make Selection Permanent
Gui add, Button , 	x300 y310 , Delete
Gui add, Button , 	x400 y310 , Create
Gui add, Button , 	x500 y310 , Research
Gui , show , ,Chatlog Selector for Fishlog
	MSG = Found Drive
SEARCHDRIVE = %USERPROFILE%

research:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
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
  random, ,%A_now%
  random, pe_rand1, 2, 6
  random, pe_rand2, 4, 7
  random, pe_rand3, 10, 90
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

fish:
	if ENABLE_DEBUG_FISH = 1
		LV_Add("","+ " A_ThisLabel)	
	gosub SAMPDETECT 
	if game = 0
		return

	if FISH = 2
		return
	
	if FISH = 3
		return
	
	if FISH = 1
		cmd("/"A_ThisLabel)
	gosub fishin
	return
	
FISHIN:
if ENABLE_DEBUG_FISH = 1
	LV_Add("","- "A_ThisLabel)
FISH = 3
return

FISHOUT:
if ENABLE_DEBUG_FISH = 1
	LV_Add("","- " A_ThisLabel " " FISHOUT)
FISH = 1
FISHOUT = 0
SetTimer, fish, %delay%
return

CHATIN:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
gosub KEYSTATECHECK
IfNotEqual, ISKEYDOWN , 0
{
	ISKEYHELD++
	if ISKEYHELD < 10
	{
		Sleep 100
		goto CHATIN
	}
}
IF CHATBOX = 1
	{
		Input , CHATFIXTEXT, T0.2
		SendInput ^A^X{ENTER}
		if clipboard = NUL
			clipcont = 0
		if clipboard != NUL
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
IF CHATBOX = 1
	{
		if clipcont = 1
			SendInput t^V{right}%CHATFIXTEXT%
		;SoundPlay *16
	}
	sleep 100
		clipboard =
		clipcont = 0
return

READ:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
if debug = 1
	goto READLOG
Loop, Read, %logfile%
{
	lastReadRow := A_Index  
}
if ENABLE_DEBUG = 1
	LV_Add("",  "- " A_ThisLabel " Counted " lastReadRow " Lines")
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Files:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui 7:Destroy
Gui 7:  Add, Text,		x10  y10  w200 h40 , File Locations
gui 7:  Add, CheckBox, 	x30  y40  w200 h40 vOUTPUTJOURNALON Checked%OUTPUTJOURNALON%,				Output history
Gui 7:  Add, Text,     	x30  y100 w100 h30 , Location
Gui 7:  Add, Edit, 		x140 y100 w500 h30 vCHATLOG , %logfile%
Gui 7:  Add, Button, 	x640 y100 w100 h30 , Chat
Gui 7:  Add, Text, 		x30  y140 w100 h30 , Log to Dir
Gui 7:  Add, Edit,		x140 y140 w500 h30 vlogdir , %logdir%
Gui 7:  Add, Button, 	x640 y140 w100 h30 , Dir
Gui 7:  Add, Text, 		x30  y180 w100 h30 , History
Gui 7:  Add, Edit, 		x140 y180 w500 h30 vhistory , %history%
Gui 7:  Add, Button, 	x640 y180 w100 h30 , History
Gui 7:  Add, Text, 		x30  y220 w100 h30 , Whitelist
Gui 7:  Add, Edit, 		x140 y220 w500 h30 vwhitelist , %whitelist%
Gui 7:  Add, Button, 	x640 y220 w100 h30 , Whitelist
Gui 7:  Add, Text, 		x30  y260 w100 h30 , Blacklist
Gui 7:  Add, Edit, 		x140 y260 w500 h30 vblacklist , %blacklist%
Gui 7:  Add, Button, 	x640 y260 w100 h30 , Blacklist
Gui 7:  Add, Text, 		x30  y300 w100 h30 , Spammers
Gui 7:  Add, Edit, 		x140 y300 w500 h30 vspamlist , %spamlist%
Gui 7:  Add, Button, 	x640 y300 w100 h30 , Settings
Gui 7:  Add, Text, 		x30  y340 w100 h30 , IniFile
Gui 7:  Add, Edit, 		x140 y340 w500 h30 vinifile, %inifile%
Gui 7:  Add, Button, 	x640 y340 w100 h30 , Inifile
;Gui 7:  Add, Text, x29 y2306 w100 h30 , logfile
;Gui 7:  Add, Edit, x139 y306 w600 h30 , Edit
;Gui 7:  Add, Button, x319 y356 w90 h30 , Defaults
;Gui 7:  Add, Button, x439 y356 w90 h30 , Apply
Gui 7:  Show, w800 h380
return

7buttonChat:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %logfile%
run %logfile%
return

7buttonDir:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
run %logdir%
return

7buttonHistory:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfNotExist %history%
	FileCreateDir, %history%
IfExist %history%
run %history%
return

7buttonWhitelist:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %whitelist%
run %whitelist%
return

7buttonBlacklist:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %blacklist%
run %blacklist%
return

7buttonSpammers:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %spamlist%
run %spamlist%
return

7buttonInifile:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
IfExist %inifile%
run %inifile%
return


7GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 7:submit
	gosub INIWRITE
	gui 7:destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Debug:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui 8:Destroy
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
Gui 8: Add, Edit, x159 y386 w70 h30 vENABLE_DEBUG_TIME , %ENABLE_DEBUG_TIME%
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
Gui 8: Add, Text, x1009 y546 w130 h30 , Idle Detection EW
Gui 8: Add, Edit, x1149 y546 w70 h30 vIDLE_TIMEOUT , %IDLE_TIMEOUT%
Gui 8: Add, Text, x769 y16 w190 h30 , Show Results
Gui 8: Add, Text, x1009 y16 w190 h30 , Performance
Gui 8: Show, w1277 h625, Debuging
return

8GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 8:submit
	gosub INIWRITE
	gui 8:destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Automation:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui 9:Destroy
Gui 9: Add, CheckBox, x40 y30   w280 h40 vAUTOLOGONON  			Checked%AUTOLOGONON%		, Login Automatically
Gui 9: Add, CheckBox, x40 y70   w280 h40 vSPAWNATLOGON			Checked%SPAWNATLOGON%		, Spawn after Login
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
Gui 9: Add, CheckBox, x320 y470 w280 h40 vAUTOIGNORE			Checked%AUTOIGNORE%			, Auto Ignore Spammers
Gui 9: Add, CheckBox, x320 y510 w280 h40 vAUTOACCEPTGIFT		Checked%AUTOACCEPTGIFT%		, Auto Accept Gifts
Gui 9: Add, CheckBox, x640 y30  w280 h40 vWATCHLOGON  			Checked%WATCHLOGON%			, Watch Logon 
Gui 9: Add, CheckBox, x640 y70  w280 h40 vAUTOGROUP				Checked%AUTOGROUP%			, Auto Group
Gui 9: Add, CheckBox, x640 y110   w280 h40 vAUTOTRUCKING		Checked%AUTOTRUCKING%	, Display Trucking Menu
Gui 9: Add, GroupBox, x9 y6 w800 h580 , Enable/Disable
Gui 9: Show, , Fishlog Automation
return

9GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 9:submit
	gosub INIWRITE
	gui 9:destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Statistics:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
Gui 10:Destroy
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

10GuiClose:
if ENABLE_DEBUG = 1
	LV_Add("","- " A_ThisLabel)
	gui 10:submit
	gosub INIWRITE
	gui 10:destroy
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TIMESTATS:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WATCHLOGON:
if ENABLE_DEBUG = 1
	LV_Add("",A_ThisLabel)
	loop, read, %logdir%\watch.txt
	{
		IfInString, A_LoopReadLine , %VAR3%
			SoundPlay *64
		return
	}	
return

CHECKIGNORE:
if ENABLE_DEBUG = 1
	LV_Add("",A_ThisLabel)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Auto Ignore ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

autoignore:
SetTimer, %A_ThisLabel%, off
if ENABLE_DEBUG = 1
	LV_Add("","+ " A_ThisLabel)
IF PLAYER = 
	return
gosub SAMPDETECT
if game = 0
	return

StringReplace, PLAYER, PLAYER, ! , {!}, ReplaceAll
StringReplace, PLAYER, PLAYER, ^ , {^}, ReplaceAll 
StringReplace, PLAYER, PLAYER, + , {+}, ReplaceAll 
cmd("/ign "PLAYER)

LV_Add("", "<< "ADDLINE)
LV_Add("", " !AUTOIGNORE " PLAYER "  ")
return

ADDIGNORE:
if ENABLE_DEBUG = 1
	LV_Add("",A_ThisLabel)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Auto Group ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AUTOGROUP_JOIN_MESSAGE:
if ENABLE_DEBUG = 1
	LV_Add("",A_ThisLabel)

	cmd("/group")
	cmd("10")
	txt(GROUP_JOIN_MESSAGE)
	
return

AUTOGROUP_INVITE_START:
if ENABLE_DEBUG = 1
	LV_Add("",A_ThisLabel)

	loop, parse, GROUP_PLAYERS, %A_Space% |
	{
		IfNotEqual, A_LoopField
		{
			cmd("/gri " A_LoopField " ")
			b_index++
			sleep 2000
		}
	}
return

AUTOGROUP_INVITE:
	if ENABLE_DEBUG = 1
		LV_Add("",A_ThisLabel)
	
	loop, parse, GROUP_PLAYERS, %A_Space% |
	{
		If A_LoopField = %VAR3%
		{
			IfNotInString, GROUP_PLAYERS_INVITE, %VAR3%
			{
				GROUP_PLAYERS_INVITE = %VAR3% %GROUP_PLAYERS_INVITE% %a_space%
				IfNotEqual, GROUP_PLAYERS_INVITE
					settimer, GROUP_PLAYERS_INVITE, 5000
			}
		}
	}	
return

GROUP_PLAYERS_INVITE:
	if ENABLE_DEBUG = 1
		LV_Add("",A_ThisLabel)
	SetTimer, %A_ThisLabel%, off

	loop, parse, GROUP_PLAYERS_INVITE, %a_space% |
		{
			IfNotEqual, A_LoopField
			{
				STATS_GROUP_INVITE_SENT++
				cmd("/gri "A_LoopField a_space)
				sleep 2000
			}
		}
	b_index = 0
	GROUP_PLAYERS_INVITE = 
return

GROUP_ADVERT:
	if ENABLE_DEBUG = 1
		LV_Add("",A_ThisLabel " " GROUP_ADVERT_ENABLE)
	SetTimer, %A_ThisLabel%, off
	
		cmd("/gm "GROUP_ADVERT)
	return
	

groupcreate:
	SetTimer , %A_ThisLabel% , off
	if ENABLE_DEBUG = 1
		LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	
	cmd("/grc " GROUP_NAME)
	return

DelItem( Item="", Items="" ) 
{                
  Loop,Parse,Items, |
    {
      IfEqual, A_LoopField, %Item%, Continue
      ItemList := ItemList . A_LoopField . "|"
    }
  StringTrimRight, ItemList, ItemList, 1
Return ItemList
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


cmd(x) 
{
	
	GLOBAL CHATBOX
    IF CHATBOX = 1
	{
		IfNotEqual, x,  NUL
		{
			FoundPos := RegExMatch(x, "^t")
			if FoundPos = 1
			{
				StringTrimLeft, x , x , 1
				clipboard =
				SendInput ^a^x 
				SendInput %x%{ENTER}
			}
			if FoundPos != 1
			{
				clipboard =
				SendInput ^a^x 
				SendInput %x%{ENTER}			
			}
		}
 		IfNotEqual, clipboard , NUL
		{
			SendInput t^V
		}
	}
	IF CHATBOX = 1
	{
			FoundPos := RegExMatch(x, "^t")
			if FoundPos = 1
				StringTrimLeft, x , x , 1
			SendInput t%x%{enter}
	}
	
	if ENABLE_DEBUG = 1
	{
		LV_Add("","CMD " A_ThisLabel " " x)
		;FileAppend, %CHATBOX% %X% %clipboard%`n, FishlogCMD.txt
	}
	gosub ANTISPAM

}
return

hotcmd(x,y) 
{
	GLOBAL CHATBOX
	LV_Add("","// HOTCMD " x " Key: " y " Chatbox: " CHATBOX) 
	
	IF CHATBOX = 1
	{
		StringLen, HOTKEY_LEN , y
		if HOTKEY_LEN > 1
		{
			IfInString, y , +
			{
				StringTrimLeft, y_1 , y , 1
				LV_Add("","// HOTCMD "  y_1) 
				SendInput  {shift Down}%y_1%{shift UP}
				return
			}
			HOTKEY_SEND := "{" y "}"
    		SendInput % HOTKEY_SEND
			return
		}
	SendInput %y%

		
	}
	IF CHATBOX = 0
	{
		
		IfInString ,x , _
		{
			StringReplace, z , x , ____ , {enter} , all
			StringReplace, z , z , __ , _$ , all
			StringReplace, z , z , _ , %a_space% , all
			SendInput t/%z%{enter}
		}
		IfNotInString ,x , _
			SendInput t/%x%{enter}
	}
	
	
	gosub ANTISPAM

}
return

txt(x) 
{
	GLOBAL CHATBOX
	
    IF CHATBOX = 1
	{
		clipboard =
		SendInput ^a^x 
		SendInput %x%{ENTER}	
		IfNotEqual, clipboard , NUL
		{
			SendInput t^V
		}		
	}
	
	IF CHATBOX = 0
	{
		SendInput t%x%{enter}
	}
	
	if ENABLE_DEBUG = 1
	{
		LV_Add("","CMD " A_ThisLabel " " x)
		;FileAppend, %CHATBOX% %X% %clipboard%`n, FishlogCMD.txt
	}
	gosub ANTISPAM
	; Clipboard =
}
return






StringTrimLeft, button_press , A_ThisLabel, 8
;MsgBox % button_press
loop, parse, CMDLIST, -
{
   b_index = %A_Index%
   loop, parse, A_Loopfield, |
  {
	if button_press = %A_Loopfield%
	MsgBox, 4, % button_press , Edit Command ;% savedHK_%b_index%_%a_index%
   
  }
}
return

Label:
 If %A_GuiControl% in +,^,!,+^,+!,^!,+^!    															;If the hotkey contains only modifiers, return to wait for a key.
  return

 num := SubStr(A_GuiControl,3)  
 If (HK%num% != "") 
 {                       																				;If the hotkey is not blank...
	Gui, Submit, NoHide
	

} ;Get the index number of the hotkey control.
   loop, parse, CMDLIST, -
	{
		b_index = %A_Index%
		loop, parse, A_Loopfield, |
		{
			
            
            If (HK%num% = savedHK_%A_Loopfield%)  												;  Check for duplicate hotkey...
			{      
               if HK%num% !=
               {
                MsgBox % HK%num% " already assigned to`n " A_Loopfield
				dup := A_Index
                GuiControl,% "Disable" b:=!b, HK%dup%  												;    Flash the original hotkey to alert the user.
				}
				
				GuiControl,,HK%num%,% HK%num% :=""      												;    Delete the hotkey and clear the control.
				break
			}
		}
	}


	
 If (savedHK%num% || HK%num%)
{
	MsgBox % num " = " savedHK%num% " = " HK%num%

	setHK(num, savedHK%num%, HK%num%)
}
 IfNotEqual (savedHK%num% || HK%num%)
	setHK(num, savedHK%num%, HK%num%)
return


Help(wParam, lParam, Msg) 
{
	MouseGetPos,,,, OutputVarControl

	IfWinActive, Dynamic Hotkeys
	{
		GLOBAL TOOLTIP_Hotkeys
		Loop, parse, TOOLTIP_Hotkeys , |
		{
			if OutputVarControl = Button%A_Index%
			{
				Help := A_LoopField
			;	break
			}
		}
	}

	IfWinActive, Keybinds
	{
		GLOBAL TOOLTIP_Keybinds
		Loop, parse, TOOLTIP_Keybinds , |
		{
			if OutputVarControl = Edit%A_Index%
			{
				Help := A_LoopField
				break
			}
			if OutputVarControl = Button%A_Index%
			{
				Help := A_LoopField
				break
			}
		}
	}
	ToolTip % Help
}
return

setHK(num,INI,GUI) {
	;MsgBox % "num = " num " ini = " INI " gui = " GUI
	If INI
    {
		Hotkey, %INI%, HOTKEY%num%, Off
        
        ;MsgBox,,Hotkey Disabled , % Label%num%
    }
	If GUI
	{
		;MsgBox %GUI%  =  HOTKEY%num%
		Hotkey, IfWinActive, ahk_class %HK_TARGET%
		Hotkey, %GUI%, HOTKEY%num%, On
	}
	IfNotEqual, %num%, ERROR
	{
		IniWrite,% GUI ? GUI:null, Hotkeys.ini, Hotkeys, %num%
		savedHK%num%  := HK%num%
	}
	;MsgBox % savedHK%num%  " = " HK%num%
}

reset()
{
	return
}

;action
;vars
HOTKEY_crimes:
HOTKEY_crimes__civ:
HOTKEY_crimes__war:

HOTKEY_arrest:
HOTKEY_arrest__war:

HOTKEY_ticket:
HOTKEY_ticket__sus:

HOTKEY_visualcontact:
HOTKEY_visualcontact__sus:
HOTKEY_visualcontact__war:


HOTKEY_freeze:
HOTKEY_freeze__sus:
HOTKEY_freeze__war:

HOTKEY_report__ply:
HOTKEY_report__war:
HOTKEY_report__civ:

HOTKEY_stats:
HOTKEY_stats__ply:
HOTKEY_stats__war:
HOTKEY_stats__civ:
HOTKEY_stats__cop:
HOTKEY_stats__sus:

HOTKEY_total:
HOTKEY_total__ply:
HOTKEY_total__war:
HOTKEY_total__cop:
HOTKEY_total__civ:
HOTKEY_total__sus:

HOTKEY_getid:
HOTKEY_getid__war:
HOTKEY_getid__cop:
HOTKEY_getid__civ:
HOTKEY_getid__ply:

HOTKEY_information:
HOTKEY_information__war:
HOTKEY_information__cop:
HOTKEY_information__civ:
HOTKEY_information__ply:

HOTKEY_locate:
HOTKEY_locate__war:
HOTKEY_locate__cop:
HOTKEY_locate__civ:
HOTKEY_locate__ply:


HOTKEY_level:
HOTKEY_level__civ:
HOTKEY_level__cop:
HOTKEY_level__ply:
HOTKEY_level__war:




;atm
HOTKEY_deposit:
HOTKEY_deposit_500000:
HOTKEY_withdraw:
HOTKEY_withdraw_100000:

; cop
HOTKEY_accept:
HOTKEY_refuse:
HOTKEY_cancellastreport:
HOTKEY_donut:
HOTKEY_backup:
HOTKEY_calls:
HOTKEY_respond:
HOTKEY_warrants:
HOTKEY_suspects:
HOTKEY_mostwanted:
HOTKEY_jaillist:
HOTKEY_robberies:

;crime
HOTKEY_fire:

;fish
HOTKEY_cooler:
HOTKEY_fish:
HOTKEY_fishrod:

;group
HOTKEY_groups:
HOTKEY_grouphelp:
HOTKEY_groupcash:
HOTKEY_groupcall:
HOTKEY_groupjoin:
HOTKEY_groupleave:
HOTKEY_groupinvite:
HOTKEY_groupkick:
HOTKEY_groupleader:


HOTKEY_groupmsg:
HOTKEY_copmsg:
HOTKEY_fishmsg:

;fish
HOTKEY_fishbuy:
HOTKEY_fisheat:
HOTKEY_fishgive:
HOTKEY_fishhelp:
HOTKEY_fishinfo:
HOTKEY_fishinventory:
HOTKEY_fishprices:
HOTKEY_fishrelease:
HOTKEY_fishrecords:
HOTKEY_fishsell:
HOTKEY_fishthrow:
HOTKEY_fishtour:

;bonus

HOTKEY_challengerecords:
HOTKEY_records:
HOTKEY_moneyrush:
HOTKEY_sellinfo:

;info



HOTKEY_animations:
HOTKEY_citystats:
HOTKEY_commands:
HOTKEY_dmrecords:
HOTKEY_faq:
HOTKEY_help:
HOTKEY_hitinfo:
HOTKEY_insuranceinfo:
HOTKEY_inventory:
HOTKEY_jailinfo:
HOTKEY_markets:
HOTKEY_moneyinfo:
HOTKEY_morestats:
HOTKEY_myinfo:
HOTKEY_myrep:
HOTKEY_party:
HOTKEY_permits:
HOTKEY_rules:
HOTKEY_diseases:
HOTKEY_time:
HOTKEY_vehhelp:
HOTKEY_version:
HOTKEY_workers:

;Animations



HOTKEY_follow:
HOTKEY_follow__civ:
HOTKEY_follow__cop:
HOTKEY_follow__ply:
HOTKEY_follow__sus:
HOTKEY_follow__war:

HOTKEY_come:
HOTKEY_come__civ:
HOTKEY_come__cop:
HOTKEY_come__ply:
HOTKEY_come__sus:
HOTKEY_come__war:

HOTKEY_go:
HOTKEY_go__civ:
HOTKEY_go__cop:
HOTKEY_go__ply:
HOTKEY_go__sus:
HOTKEY_go__war:

HOTKEY_stop:
HOTKEY_stop__civ:
HOTKEY_stop__cop:
HOTKEY_stop__ply:
HOTKEY_stop__sus:
HOTKEY_stop__war:

HOTKEY_kiss:
HOTKEY_kiss__civ:
HOTKEY_kiss__cop:
HOTKEY_kiss__ply:
HOTKEY_kiss__sus:
HOTKEY_kiss__war:

HOTKEY_fuckyou:
HOTKEY_fuckyou__civ:
HOTKEY_fuckyou__cop:
HOTKEY_fuckyou__ply:
HOTKEY_fuckyou__sus:
HOTKEY_fuckyou__war:

HOTKEY_wank:
HOTKEY_wank__civ:
HOTKEY_wank__cop:
HOTKEY_wank__ply:
HOTKEY_wank__war:

HOTKEY_puke:
HOTKEY_puke__civ:
HOTKEY_puke__cop:
HOTKEY_puke__ply:
HOTKEY_puke__sus:
HOTKEY_puke__war:


HOTKEY_petattack:
HOTKEY_petattack__civ:
HOTKEY_petattack__cop:
HOTKEY_petattack__ply:
HOTKEY_petattack__sus:
HOTKEY_petattack__war:

HOTKEY_dance:
HOTKEY_dance_1:
HOTKEY_dance_2:
HOTKEY_dance_3:
HOTKEY_dance_4:

HOTKEY_idle:
HOTKEY_idle_1:
HOTKEY_idle_2:
HOTKEY_idle_3:
HOTKEY_idle_4:
HOTKEY_idle_5:
HOTKEY_idle_6:
HOTKEY_idle_7:
HOTKEY_idle_8:
HOTKEY_stab_1:
HOTKEY_stab_2:
HOTKEY_stab_3:
HOTKEY_stab_4:
HOTKEY_showoff:
HOTKEY_showoff_1:
HOTKEY_showoff_2:
HOTKEY_showoff_3:
HOTKEY_showoff_4:
HOTKEY_showoff_5:
HOTKEY_showoff_6:
HOTKEY_showoff_7:
HOTKEY_showoff_8:
HOTKEY_showoff_9:
HOTKEY_showoff_10:
HOTKEY_showoff_11:
HOTKEY_showoff_12:
HOTKEY_showoff_13:
HOTKEY_showoff_14:
HOTKEY_showoff_15:
HOTKEY_showoff_16:
HOTKEY_showoff_17:
HOTKEY_showoff_18:
HOTKEY_showoff_19:
HOTKEY_showoff_20:
HOTKEY_showoff_21:
HOTKEY_showoff_22:
HOTKEY_showoff_23:
HOTKEY_showoff2_1:
HOTKEY_showoff2_2:
HOTKEY_showoff2_3:
HOTKEY_showoff2_4:
HOTKEY_showoff2_5:
HOTKEY_showoff2_6:
HOTKEY_showoff2_7:
HOTKEY_showoff2_8:
HOTKEY_showoff2_9:
HOTKEY_showoff2_10:
HOTKEY_showoff2_11:
HOTKEY_showoff2_12:
HOTKEY_showoff2_13:
HOTKEY_showoff2_14:
HOTKEY_showoff2_15:
HOTKEY_showoff2_16:
HOTKEY_showoff2_17:
HOTKEY_showoff2_18:
HOTKEY_showoff2_19:
HOTKEY_showoff2_20:
HOTKEY_showoff2_21:
HOTKEY_showoff2_22:
HOTKEY_showoff2_23:

HOTKEY_sit_1:
HOTKEY_sit_2:
HOTKEY_sit_3:
HOTKEY_sit_4:
HOTKEY_sit_5:
HOTKEY_sit_6:
HOTKEY_sit_7:
HOTKEY_sit_8:
HOTKEY_sit_9:
HOTKEY_sit_10:
HOTKEY_sit_11:
HOTKEY_sit_12:
HOTKEY_sit_13:
HOTKEY_sit_14:

HOTKEY_shout:

HOTKEY_bitchslap:
HOTKEY_cpr:
HOTKEY_assslap:
HOTKEY_carkick:
HOTKEY_crossarms:
HOTKEY_cry:
HOTKEY_fart:
HOTKEY_gunpoint:
HOTKEY_handstand:
HOTKEY_hide:
HOTKEY_jumpkick:
HOTKEY_lean:
HOTKEY_leansmoke:
HOTKEY_liedown:
HOTKEY_yes:
HOTKEY_no:
HOTKEY_point:
HOTKEY_ride:
HOTKEY_scratch:
HOTKEY_shakehead:
HOTKEY_taichi:

; Pet
HOTKEY_pet:
HOTKEY_petcmds:
HOTKEY_petdiet:
HOTKEY_peteat:
HOTKEY_petfeed:
HOTKEY_petfight:
HOTKEY_petname:
HOTKEY_petslap:
HOTKEY_petstats:
HOTKEY_pettraining:

; GPS
HOTKEY_driverdest:
HOTKEY_gps:
HOTKEY_gpsclear:
HOTKEY_gpsgocustom:
HOTKEY_gpshide:
HOTKEY_gpsloc:
HOTKEY_gpsresume:
HOTKEY_gpssetcustom:
HOTKEY_gpssettings:

; Pimp
HOTKEY_pimp__$ply:

HOTKEY_pimp:
HOTKEY_pimpcall:
HOTKEY_pimpaccept:
HOTKEY_pimphelp:
HOTKEY_pimpinfo:
HOTKEY_pimpleave:
HOTKEY_pimpleaveall:
HOTKEY_pimpmsg:
HOTKEY_pimprefus:

;Houses
HOTKEY_coownerlist:
HOTKEY_hotel:
HOTKEY_hotels:
HOTKEY_house:
HOTKEY_houseanswer:
HOTKEY_housecoowner:
HOTKEY_houseinvite:
HOTKEY_housekeys:
HOTKEY_housekick:
HOTKEY_fishstore:
HOTKEY_houserob:
HOTKEY_houses:
HOTKEY_housestorage:
HOTKEY_keys:
HOTKEY_rent:

; Sell
HOTKEY_sell:
HOTKEY_sell__civ:
HOTKEY_sell__cop:
HOTKEY_sell__sus:
HOTKEY_sell__ply:
HOTKEY_sell__war:

HOTKEY_nocalls:
HOTKEY_nosell:
HOTKEY_nosell__ply:
HOTKEY_noselladd:
HOTKEY_noselladdall:
HOTKEY_noselldel:
HOTKEY_nsselldelall:
HOTKEY_noselllist:
HOTKEY_sellmenu:

; Clothes
HOTKEY_clothes:
HOTKEY_clothesdiscard:
HOTKEY_clothesinv:
HOTKEY_clothesposition:
HOTKEY_clothesprice:
HOTKEY_clothesremove:
HOTKEY_clothessell:
HOTKEY_clotheswear:

; Vehicle
HOTKEY_ej:
HOTKEY_EJA:
HOTKEY_eje:
HOTKEY_eje__ply:
HOTKEY_ejm:
HOTKEY_gk:
HOTKEY_ifix:
HOTKEY_lk:
HOTKEY_ulk:
HOTKEY_vehhood:
HOTKEY_vehl:
HOTKEY_vehtrunk:

; Drugs
HOTKEY_bait:
HOTKEY_cook:
HOTKEY_drugsell:
HOTKEY_givefreshdrugs:
HOTKEY_hidedrugs:
HOTKEY_hotbox:
HOTKEY_pgps:
HOTKEY_plantinfo:
HOTKEY_smoke:
HOTKEY_takedrugs:
HOTKEY_takedrugs_10:
HOTKEY_takedrugs_20:
HOTKEY_takedrugs_30:
HOTKEY_takedrugs_40:
HOTKEY_takedrugs_50:

; var
HOTKEY__set_1:
HOTKEY__set_2:
HOTKEY__set_3:
HOTKEY_1:
HOTKEY_2:
HOTKEY_3:

; message
HOTKEY_carwhisper:
HOTKEY_drivermsg:
HOTKEY_ignore:
HOTKEY_nopm:
HOTKEY_pm:
HOTKEY_reply:
HOTKEY_say:
HOTKEY_set_1:
HOTKEY_set_2:
HOTKEY_set_3:
HOTKEY_truckmsg:
HOTKEY_whisper:

; action

; Crime
HOTKEY_appeal:
HOTKEY_jury:
HOTKEY_bankrob:
HOTKEY_breakout:
HOTKEY_breakout__civ:
HOTKEY_escape:
HOTKEY_cell:
HOTKEY_parole:
HOTKEY_payticket:
HOTKEY_sue:


; robbery
HOTKEY_casinorob:

; Service
HOTKEY_dice:
HOTKEY_dice__civ_10000:
HOTKEY_atm:
HOTKEY_horsebet:
HOTKEY_lotto:
HOTKEY_hit:
HOTKEY_cancelhit:
HOTKEY_moneybag:
HOTKEY_police:
HOTKEY_prices:
HOTKEY_refill:
HOTKEY_shares:
HOTKEY_sharessell:
HOTKEY_weapons:

; skill
HOTKEY_skill:
HOTKEY_beer:
HOTKEY_buy:
HOTKEY_cure:
HOTKEY_drugs:
HOTKEY_driver:
HOTKEY_heal:

HOTKEY_items:
HOTKEY_food:
HOTKEY_mechanic:
HOTKEY_sex:

HOTKEY_healcure:
HOTKEY_hitlist:


HOTKEY_strip:
HOTKEY_strip__10000:

HOTKEY_kidnap:
HOTKEY_kidnap__civ:
HOTKEY_kidnap__cop:
HOTKEY_kidnap__ply:
HOTKEY_kidnap__sus:
HOTKEY_kidnap__war:

HOTKEY_kidnapall:
HOTKEY_release:
HOTKEY_releaseall:
HOTKEY_ransom:

; PPE
HOTKEY_belt:
HOTKEY_cureme:
HOTKEY_healme:

; Mission
HOTKEY_crowbar:
HOTKEY_box:
HOTKEY_drop:
HOTKEY_cancel:
HOTKEY_challenge:
HOTKEY_delivery:
HOTKEY_fakeskill:
HOTKEY_housedelivery:
HOTKEY_possess:
HOTKEY_santa:
HOTKEY_tree:
HOTKEY_sellcar:

; Server Functions
HOTKEY_enter:
HOTKEY_exit:
HOTKEY_complain:
HOTKEY_cnrradio:
HOTKEY_login:
HOTKEY_register:
HOTKEY_spawn:
HOTKEY_changepassword:
HOTKEY_FPSLIMIT_20:
HOTKEY_FPSLIMIT_30:
HOTKEY_FPSLIMIT_40:
HOTKEY_FPSLIMIT_50:
HOTKEY_FPSLIMIT_60:
HOTKEY_FPSLIMIT_70:
HOTKEY_FPSLIMIT_80:
HOTKEY_FPSLIMIT_90:

; Give
HOTKEY_givecash:
HOTKEY_givegift:
HOTKEY_givepet:
HOTKEY_giverep:

; Settings
HOTKEY_canims:
HOTKEY_casinosettings:
HOTKEY_clearost:
HOTKEY_display:
HOTKEY_displayost:
HOTKEY_deathmsg:
HOTKEY_gender:
HOTKEY_gtamenu:
HOTKEY_helpmsg:
HOTKEY_joinmsg:
HOTKEY_ostsettings:
HOTKEY_settings:
HOTKEY_tdsettings:
HOTKEY_hackatm:

HOTKEY_BRIBE:
HOTKEY_AD:
HOTKEY_SHOPLIFT:
HOTKEY_ROBBERY:
HOTKEY_STOCKS:
HOTKEY_MARKET:

HOTKEY_fishslap:
HOTKEY_fishslap__civ:
HOTKEY_fishslap__cop:
HOTKEY_fishslap__ply:
HOTKEY_fishslap__sus:
HOTKEY_fishslap__war:

HOTKEY_wave:
HOTKEY_wave__civ:
HOTKEY_wave__cop:
HOTKEY_wave__ply:
HOTKEY_wave__sus:
HOTKEY_wave__war:

HOTKEY_flash:
HOTKEY_flash__civ:
HOTKEY_flash__cop:
HOTKEY_flash__ply:
HOTKEY_flash__sus:
HOTKEY_flash__war:

HOTKEY_fuckoff:
HOTKEY_fuckoff__civ:
HOTKEY_fuckoff__cop:
HOTKEY_fuckoff__ply:
HOTKEY_fuckoff__sus:
HOTKEY_fuckoff__war:

HOTKEY_infect:
HOTKEY_infect__civ:
HOTKEY_infect__cop:
HOTKEY_infect__ply:
HOTKEY_infect__sus:
HOTKEY_infect__war:
HOTKEY_rape:
HOTKEY_rape__civ:
HOTKEY_rape__cop:
HOTKEY_rape__ply:
HOTKEY_rape__sus:
HOTKEY_rape__war:
HOTKEY_piss:
HOTKEY_piss__civ:
HOTKEY_piss__cop:
HOTKEY_piss__ply:
HOTKEY_piss__sus:
HOTKEY_piss__war:
HOTKEY_rob:
HOTKEY_rob__civ:
HOTKEY_rob__cop:
HOTKEY_rob__ply:
HOTKEY_rob__sus:
HOTKEY_rob__war:
HOTKEY_stab:
HOTKEY_stab__civ:
HOTKEY_stab__cop:
HOTKEY_stab__ply:
HOTKEY_stab__sus:
HOTKEY_stab__war:
HOTKEY_mourn:
HOTKEY_mourn__civ:
HOTKEY_mourn__cop:
HOTKEY_mourn__ply:
HOTKEY_mourn__sus:
HOTKEY_mourn__war:

HOTKEY_pay:

HOTKEY_LOCK:
HOTKEY_VEHREPAIR:
HOTKEY_BAIL:
HOTKEY_CLOSEST:
HOTKEY_GRCALL:
HOTKEY_GROUPLIST:
HOTKEY_FLOWERS:
HOTKEY_PLANT:
HOTKEY_FERTILIZE:
HOTKEY_TRAP:
HOTKEY_HARVEST:
HOTKEY_FISHINV:
HOTKEY_FISHSELLALL:
HOTKEY_MISSION:
HOTKEY_COURIER:
HOTKEY_UPS:
HOTKEY_HOLDUP:

HOTKEY_givedrugs__civ_10:
HOTKEY_tip:
HOTKEY_tip_1000:
HOTKEY_tip_10000:
HOTKEY_tip_100000:

HOTKEY_groupcall____1:

SetTimer, %A_ThisLabel%, off
StringTrimLeft, HOTCMD , A_ThisLabel , 7
hotcmd(HOTCMD,A_ThisHotkey)
KeyWait, %A_ThisHotkey%
return

PERSONALITY_CLIPTO_COOLDOWN:
SetTimer, %A_ThisLabel%, off
if ENABLE_DEBUG = 1
	LV_Add("", " Person Clipto Cooldown")
PERSONALITY_CLIPTO_COOLDOWN = 0
;SoundPlay *64
return


/*

MOUSE_BUTTON1:

	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	
	SendInput, {LButton}
return

MOUSE_BUTTON2:

	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)
	
	SendInput, {RButton}
return

MOUSE_BUTTON3:

	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel)	
	SendInput, {MButton}
return

MOUSE_BUTTON4:

	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel " " MOUSE_BUTTON4 )
return

MOUSE_BUTTON5:
	if ENABLE_DEBUG = 1
		LV_Add("","- " A_ThisLabel " " MOUSE_BUTTON5)
	return

*/