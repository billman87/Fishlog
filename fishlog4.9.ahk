;~ PLAYDICE = 1

;LOTTOFAIL = 1
;DONATOR = 1
SetKeyDelay , -1
SetBatchLines  , -1
#InstallMouseHook
#SingleInstance force
;Perfomace Timers;
SLEEPLINECOUNT=100
SLEEPLOGSIZE=500
SLEEPTOSLOW=1
SLEEPTOWAKE=1000
SLEEPKILLMULTI=100
SLEEPDETECT=1
SLEEPTOLOG=900
SLEEPIGNORE=1500
VARMAX = 1
SCRATCHCOUNT = 0
B_LoopFileTimeModified = 0
inifile = %A_ScriptDir%\fishlog.ini
logfile = chatlog.txt
history = %USERPROFILE%\MYDOCU~1\GTASAN~1\SAMP\History\%A_YYYY%%A_MM%%A_DD%.txt
whitelist = whitelist.txt
blacklist = blacklist.txt
gosub BUILDWHITE
gosub BUILDBLACK
gosub INIREAD
gosub checkchat


return
;;;;;;;;;;;;;;;;;;;;;; GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BOOT:
STATUS = GUI
BOOT = 1 
GUI: 
	Gui, Margin , 0, 0
	Gui, +Resize 
	Gui, Font , s%GUIFONT% w10, Arial
	Gui, Add, ListView, xm w700 vMyListView gMyListView , Chatlog
	Menu, FileMenu, Add, &Open,  MenuFileOpen
	Menu, FileMenu, Add, Clear Log,  ButtonReset
	Menu, FileMenu, Add, E&xit,  Exit
	Menu, PlayMenu, Add, Server&1, Server1
	Menu, PlayMenu, Add, Server&2, Server2
	Menu, SettingMenu, Add, Logon, 
	Menu, SettingMenu, Add, FishSize,
	Menu, SettingMenu, Add, Other,  
	Menu, SettingMenu, Add, Keybinds,  
	Menu, SettingMenu, Add, Advanced,  
	Menu, WebsiteMenu, Add, Home,
	Menu, WebsiteMenu, Add, Readme,
	Menu, WebsiteMenu, Add, Facebook,
	Menu, WebsiteMenu, Add, Fourms,
	Menu, WebsiteMenu, Add, Stats,  
	Menu, WebsiteMenu, Add, Global,  
	Menu, WebsiteMenu, Add, Map,
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Settings, :SettingMenu
	Menu, MyMenuBar, Add, &Play, :PlayMenu
	Menu, MyMenuBar, Add, &Website, :WebsiteMenu
	Gui, Menu, MyMenuBar
	Gui, Show, X%X% Y%Y% W%Width% H%Height% , Crazybobs Cops and Robbers 
	if CANCELED = 1
		LV_Add("", "open chatlog.txt to enable")
	else
		;LV_Add("","chatlog.txt located " A_WorkingDir)

gosub read
if lastReadRow = 0
	MsgBox Failed to read chatlog.txt
SetTimer,  KEYBINDCHECK , 5000
SetTimer , READLOG , 1000
SetTimer , PostMessage , 100

PostMessage:
if game = 1
	PostMessage, 0x115 , 1, 1, SysListView321, Crazybobs Cops and Robbers, ,,
return

return
Logon:
	if ENABLE_DEBUG = 2
			LV_Add("", "- " A_ThisLabel)
	gosub getpass
	Gui 2:Margin, 5,5
	Gui 2:Font, S10, Verdana
	Gui 2:Add, Groupbox,x5 y0 w220 h50, Enter User Name
	Gui 2:Add, Edit, 	x15 y20 r1 Limit20 w200 h20 vPlayerName, %PlayerName%
	Gui 2:Add, Groupbox, x5 y50 w220 h50, Enter Password
	Gui 2:Add, Edit, x15 y70 r1 Limit20 w200 h20 0x20 vmypass, %mypass%
	Gui 2:Add, Button, x+15 y8 w45 h92 0x8000 Default, OK
	Gui 2:Show, AutoSize ,Logon
Return

Fishsize:
	if ENABLE_DEBUG = 2
			LV_Add("", "- "  A_ThisLabel)
	gosub FISHREAD
	Gui 3:Margin, 5,5
	Gui 3:Add, Groupbox,w335 h400, Throwback Fish Under (LB)
	Gui 3:Add, Text , x20 y40  , Amberjack
	Gui 3:Add, Text , x20 y60 , Grouper
	Gui 3:Add, Text , x20 y80 , Red Snapper
	Gui 3:Add, Text , x20 y100 , Trout
	Gui 3:Add, Text , x20 y120 , Blue Marlin
	Gui 3:Add, Text , x20 y140 , Mackerel
	Gui 3:Add, Text , x20 y160 , Sea
	Gui 3:Add, Text , x20 y180 , Pike
	Gui 3:Add, Text , x20 y200 , Sail
	Gui 3:Add, Text , x20 y220 , Tuna
	Gui 3:Add, Text , x20 y240 , Eel
	Gui 3:Add, Text , x20 y260 , Dolphin
	Gui 3:Add, Text , x20 y280 , Shark
	Gui 3:Add, Text , x20 y300 , Turtle
	Gui 3:Add, Text , x20 y320 , Catfish
	Gui 3:Add, Text , x20 y340 , Swordfish
	Gui 3:Add, Text , x20 y360 , Squid
	Gui 3:Add, Text , x20 y380 , Barracuda
	Gui 3:Add, Text , x200 y40 , Piranha
	Gui 3:Add, Text , x200 y60 , Lobster
	Gui 3:Add, Text , x200 y80 , Cod
	Gui 3:Add, Text , x200 y100 , Sardine
	Gui 3:Add, Text , x200 y120 , Salmon
	Gui 3:Add, Text , x200 y140 , Shrimp
	Gui 3:Add, Text , x200 y160 , Sturgeon
	Gui 3:Add, Text , x200 y180 , Flounder
	Gui 3:Add, Text , x200 y200 , Haddock
	Gui 3:Add, Text , x200 y220 , Herring
	Gui 3:Add, Text , x200 y240 , Stingray
	Gui 3:Add, Text , x200 y260 , Carp
	Gui 3:Add, Text , x200 y280 , Halibut
	Gui 3:Add, Text , x200 y300 , Sole
	Gui 3:Add, Text , x200 y320 , Baby Seal
	Gui 3:Add, Text , x350 y40 , Delay (ms)
	GUI 3:Add, Edit , x120 y40 w60 vAmberjack ,%Amberjack%
	GUI 3:Add, Edit , x120 y60 w60 vGrouper,%Grouper%
	GUI 3:Add, Edit , x120 y80 w60 vRed ,%Red%
	GUI 3:Add, Edit , x120 y100 w60 vTrout ,%Trout%
	GUI 3:Add, Edit , x120 y120 w60 vBlue ,%Blue%
	GUI 3:Add, Edit , x120 y140 w60 vMackerel ,%Mackerel%
	GUI 3:Add, Edit , x120 y160 w60 vSea ,%Sea%
	GUI 3:Add, Edit , x120 y180 w60 vPike,%Pike%
	GUI 3:Add, Edit , x120 y200 w60 vSail ,%Sail%
	GUI 3:Add, Edit , x120 y220 w60 vTuna ,%Tuna%
	GUI 3:Add, Edit , x120 y240 w60 vEel ,%Eel%
	GUI 3:Add, Edit , x120 y260 w60 vDolphin ,%Dolphin%
	GUI 3:Add, Edit , x120 y280 w60 vShark ,%Shark%
	GUI 3:Add, Edit , x120 y300 w60 vTurtle ,%Turtle%
	GUI 3:Add, Edit , x120 y320 w60 vCatfish ,%Catfish%
	GUI 3:Add, Edit , x120 y340 w60 vSwordfish ,%Swordfish%
	GUI 3:Add, Edit , x120 y360 w60 vSquid ,%Squid%
	GUI 3:Add, Edit , x120 y380 w60 vBarracuda ,%Barracuda%
	GUI 3:Add, Edit , x280 y40 w60 vPiranha ,%Piranha%
	GUI 3:Add, Edit , x280 y60 w60 vLobster ,%Lobster%
	GUI 3:Add, Edit , x280 y80 w60 vCod ,%Cod%
	GUI 3:Add, Edit , x280 y100 w60 vSardine ,%Sardine%
	GUI 3:Add, Edit , x280 y120 w60 vSalmon ,%Salmon%
	GUI 3:Add, Edit , x280 y140 w60 vShrimp ,%Shrimp%
	GUI 3:Add, Edit , x280 y160 w60 vSturgeon ,%Sturgeon%
	GUI 3:Add, Edit , x280 y180 w60 vFlounder ,%Flounder%
	GUI 3:Add, Edit , x280 y200 w60 vHaddock ,%Haddock%
	GUI 3:Add, Edit , x280 y220 w60 vHerring ,%Herring%
	GUI 3:Add, Edit , x280 y240 w60 vStingray ,%Stingray%
	GUI 3:Add, Edit , x280 y260 w60 vCarp ,%Carp%
	GUI 3:Add, Edit , x280 y280 w60 vHalibut ,%Halibut%
	GUI 3:Add, Edit , x280 y300 w60 vSole ,%Sole%
	GUI 3:Add, Edit , x280 y320 w60 vBabyseal ,%Babyseal%	
	GUI 3:Add, Edit , x420 y40 w80 vDelay ,  %Delay%
	Gui 3:Add, Text , x350 y80  , Display Fish
	Gui 3:Add, Radio , x350 y100	vFISHSELL %FISHSELL1%	, Show Catch
	Gui 3:Add, Radio , x350 y120 			  %FISHSELL2%	, Dont Show Catch
	Gui 3:Add, Button , x350 y150 w120 , Defualt
	Gui 3:Add, Button , x350 y200 w120 , Most
	Gui 3:Add, Button , x350 y250 w120 , Big
	Gui 3:Add, Button , x350 y300 w120 , Killer
	Gui 3:Add, Button , x350 y350 w120 , Apply
	
	Gui 3:Show, AutoSize ,Fish
Return
Other:
	if ENABLE_DEBUG = 2
			LV_Add("", "GUI = "  A_ThisLabel)
	gosub INIREAD
	Gui 4:Margin, 10,5
	Gui 4:Add, Groupbox, x5  y5  w100 h50, Lotto Number
	Gui 4:Add, Edit, 	 x15 y25 w30  h20 vGUILOTTO, %GUILOTTO%
;	GUI 4:Add, Checkbox, x50 y25 w60  h20 vALOTTO %ALOTTO%, Auto
	Gui 4:Add, Groupbox, x5  y55 w100 h90, Jury Duty
	Gui 4:Add, Radio,    x15 y75 vJURY  %radio1%, Ignore
	Gui 4:Add, Radio,    x15 y95		%radio2%, Display
	Gui 4:Add, GroupBox, x110 y5 w300 h140 , Vehicle Color
	Gui 4:Add, Text, 	 x130 y29 w60 h20 , Color 1
	Gui 4:Add, Text, 	 x130 y59 w60 h20 , Color 2
	Gui 4:Add, ComboBox, x200 y29 w190 r8 vCOLOR1 , %COLOR1%||%COLORLIST%
	Gui 4:Add, ComboBox, x200 y59 w190 r8 vCOLOR2 , %COLOR2%||%COLORLIST%
	Gui 4:Show, AutoSize ,Other Settings
Return
Keybinds:
	if ENABLE_DEBUG = 2
			LV_Add("", "GUI = " A_ThisLabel)
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
	gui 5:Add, Button  , x180 y320 w100 h50 , Apply
	gui 5:Add, CheckBox, x20 y340 w150 h20 vBINDSOFF Checked%BINDSOFF%, Disable All Binds
	gui 5:Show, , Progammable Keybinds
return
Advanced:
	if ENABLE_DEBUG = 2
	LV_Add("", "GUI = "  A_ThisLabel )
	gosub INIREAD
	gui 6:Add, Text, x60 y20  h30 , Enable/Disable Functions
	gui 6:Add, CheckBox, x30 y40  h30 	vCHATON  Checked%CHATON%,					Read chatlog.txt
	gui 6:Add, CheckBox, x30 y70  h30 	vLOGONON  Checked%LOGONON%,					Auto Logon
	gui 6:Add, CheckBox, x30 y100  h30 	vFISHON  Checked%FISHON%,					Auto Fishing
	gui 6:Add, CheckBox, x30 y130  h30 	vTHROWON  Checked%THROWON%,					Auto Throwback
	gui 6:Add, CheckBox, x30 y160  h30 vENABLE_DICE  Checked%ENABLE_DICE%,			Auto Play Dice 
	gui 6:Add, CheckBox, x30 y190  h30 	vDRUGSON  Checked%DRUGSON%,					Auto Take Drugs
	gui 6:Add, CheckBox, x30 y220  h30 	vJURYON  Checked%JURYON%,					Auto Jury
	gui 6:Add, CheckBox, x30 y250  h30 	vLOTTOON  Checked%LOTTOON%,					Auto Lotto
	gui 6:Add, CheckBox, x30 y280  h30 	vTICKETON  Checked%TICKETON%,				Auto Ticktepay
	gui 6:Add, CheckBox, x30 y310  h30 	vHOUSEON  Checked%HOUSEON%,					Auto House Menu
	gui 6:Add, CheckBox, x30 y340  h30 	vCOLORON  Checked%COLORON%,					Auto Car Coloring
	gui 6:Add, CheckBox, x30 y370  h30 	vPROGRAMON  Checked%PROGRAMON%,				Progammable Keybinds
	gui 6:Add, CheckBox, x30 y400  h30 	vANIMATIONON  Checked%ANIMATIONON%,			Preset Animation Keybinds
	gui 6:Add, CheckBox, x30 y430  h30 	vSKILLON  Checked%SKILLON%,					Preset Skill Keybinds
	gui 6:Add, CheckBox, x30 y460  h30 	vMENUON	  Checked%MENUON%,				    Menu Selection Keybinds
	gui 6:Add, CheckBox, x30 y490  h30 	vFPSON  Checked%FPSON%,					    ALT + TAB FPS Toggle
	gui 6:Add, CheckBox, x30 y520  h30 	vJOURNALON Checked%JOURNALON%,				Output to journal.txt
	gui 6:Add, CheckBox, x30 y550  h30 	vBONUSON Checked%BONUSON%,					Displays /mr /vsi /finfo
	gui 6:Add, CheckBox, x30 y580  h30 	vANTIPAUSEON Checked%ANTIPAUSEON%,			WINKEY is /sit 8
	gui 6:Add, CheckBox, x30 y610  h30 	vDLTOGGLE Checked%DLTOGGLE%,				CAPSLOCK is /DL
	gui 6:Add, CheckBox, x30 y640  h30 	vCHATIGNORE Checked%CHATIGNORE%,			Ignore Spammers	
	gui 6:Add, CheckBox, x270 y40  h30 	vCNRRADIO  Checked%CNRRADIO% ,				Play Radio
	gui 6:Add, CheckBox, x270 y70  h30  vNOCHAT Checked%NOCHAT%,					Dont Disply Chat Text
	gui 6:Add, CheckBox, x270 y100  h30	vENABLE_DEBUG  Checked%ENABLE_DEBUG%,		Enable Debug Mode
	gui 6:Add, CheckBox, x270 y130  h30 vPLAYDICEA Checked%PLAYDICEA%,				Accept Dice Games
;	gui 6:Add, CheckBox, x270 y160  h30 	  Checked%RADIO%,						Play Radio 
;	gui 6:Add, CheckBox, x270 y190  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y220  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y250  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y280  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y310  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y340  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y370  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y400  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y430  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y460  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y490  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y520  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y550  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y580  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y610  h30 	  Checked%RADIO%,						Play Radio
;	gui 6:Add, CheckBox, x270 y640  h30 	  Checked%RADIO%,						Play Radio
	gui 6:Add, Text, x530 y70 w140 h30 , 												Server 1 IP
	gui 6:Add, Edit, x650 y70 w150 h20 vSERVER1 , %SERVER1%
	gui 6:Add, Text, x530 y100 w140 h30 , 												Server 2 IP
	gui 6:Add, Edit, x650 y100 w150 h20 vSERVER2, %SERVER2%
	gui 6:Add, Text, x530 y130 w140 h30 , 												FPS Lower Limit
	gui 6:Add, Edit, x650 y130 w150 h20 vFPSLOW, %FPSLOW%
	gui 6:Add, Text, x530 y160 w140 h30 , 												FPS Upper Limit
	gui 6:Add, Edit, x650 y160 w150 h20 vFPSHIGH, %FPSHIGH%
	gui 6:Add, Text, x530 y190 w140 h30 , 												Chat Font Size
	gui 6:Add, Edit, x650 y190 w150 h20 vGUIFONT, %GUIFONT%
	Gui 6:Add, Button, Default, Apply
	Gui 6:Add, Button, Default, INI
	gui 6:Show, , Advanced Settings
return
GuiSize:
if ENABLE_DEBUG = 2
	LV_Add("", "GUI = "  A_ThisLabel " = " A_GuiWidth " X " A_GuiHeight)
if A_EventInfo = 1
{
    return
}
GuiControl, Move, MyListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight )
return
2buttonOk:
LV_Add("", "GUI = " A_ThisLabel)
	gui 2:Submit, NoHide
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP\, PlayerName, %PlayerName%
	gosub INIWRITE
	gosub setpass
	gui 2:destroy
return
5buttonApply:
LV_Add("",  "GUI = " A_ThisLabel)
	gui 5:Submit, NoHide
	gosub INIWRITE
	gui 5:destroy
return
6buttonApply:
LV_Add("", "GUI = "  A_ThisLabel)
	gui 6:Submit
	gosub INIWRITE
	gui 6:destroy
	reload
return
6buttonINI:
LV_Add("", "GUI = " A_ThisLabel)
	run notepad %inifile%
	WinWait, fishlog.ini - Notepad
	WinWaitClose
	Reload
return
GuiClose:
LV_Add("", "GUI = "  A_ThisLabel)
	WinGetPos , X, Y, Width, Height,
	Width := Width // 1.014
	Height := Height // 1.059
	gui , submit ,nohide
	gosub INIWRITE
	gosub ButtonReset
ExitApp
2GuiClose:
LV_Add("", "GUI = "  A_ThisLabel)
	Gui 2:Submit
	gosub INIWRITE
	Gui 2:Destroy
return
3GuiClose:
LV_Add("",  "GUI = " A_ThisLabel)
	gui 3:submit
	gosub INIWRITE
	gui 3:Destroy
return
4GuiClose:
LV_Add("",  "GUI = " A_ThisLabel)
	gui 4:submit
	gosub INIWRITE
	gui 4:Destroy
return
5GuiClose:
LV_Add("",  "GUI = " A_ThisLabel)
	gui 5:submit
	gosub INIWRITE
	gui 5:destroy
return
6GuiClose:
LV_Add("",  "GUI = " A_ThisLabel)
	gui 6:submit
	gosub INIWRITE
	gui 6:destroy
return
Home:
LV_Add("", "GUI = "  A_ThisLabel)
	run http://crazybobs.net/website/
return
Readme:
LV_Add("",  "GUI = " A_ThisLabe)
	run http://sourceforge.net/projects/noobtool/files/Fishlog/README.txt/download
return
Facebook:
LV_Add("",  "GUI = " A_ThisLabel)
	run http://www.facebook.com/groups/315012238581148/
return
Fourms:
LV_Add("",  "GUI = " A_ThisLabel)
	run http://forums.crazybobs.net
return
Stats:
LV_Add("",  "GUI = " A_ThisLabel)
	run http://www.crazybobs.net/mrx/webstats/UserStats.php?username=%Name%
return
Global:
LV_Add("",  "GUI = " A_ThisLabel)
	run http://www.crazybobs.net/mrx/webstats/FlashWebstats.html
return
Map:
LV_Add("",  "GUI = " A_ThisLabel)
	Run http://www.crazybobs.net/mrx/map/map_web.html
return
MyMenuBar:
LV_Add("", "GUI = "  A_ThisLabel)
MenuHandler:
LV_Add("",  "GUI = " A_ThisLabel)
return
MenuFileOpen:
SetWorkingDir ,%USERPROFILE%\DOCUMENTS\GTASAN~1\SAMP\
FileSelectFile, LOGFILE ,1 , chatlog.txt
IfInString , LOGFILE , chatlog.txt
	StringReplace, CHATLOG, LOGFILE, chatlog.txt , , 
else
	{
	LV_Add("","Failed to find chatlog.txt")
	}
SetWorkingDir ,%CHATLOG%
LV_Add("", "GUI = chatlog.txt located " A_WorkingDir)
return

ButtonReset:
Loop % LV_GetCount()
	{
		LVDelete = %A_Index%
		LV_Delete()
	}
if ENABLE_DEBUG = 2
	LV_Add("", "GUI = " A_ThisLabel)
return
READ:
if debug = 1
	goto READLOG
Loop, Read, %LOGFILE%
{
	lastReadRow := A_Index  
}
if ENABLE_DEBUG = 2
	LV_Add("",  "READ = " A_ThisLabel " " lastReadRow)
return
READLOG:
IfWinNotActive ,GTA:SA:MP
	return
IfWinNotExist ,GTA:SA:MP
	return
LV_ModifyCol()
IF CHATON = 0
	return
	FileGetSize, LOGFILESIZE, %LOGFILE%
	if LOGFILESIZE2 = %LOGFILESIZE%
	{
		return
	}
	Loop, Read, %LOGFILE%
	{
	if (A_Index > lastReadRow)
	{
	if  A_LoopReadLine > 0
		{
			LINECOUNT++
			if LINECOUNT > 1000
			{
				gosub ButtonReset
				LINECOUNT = 0
			}
			Loop %VARMAX%
			{
				VAR%A_INDEX% = 
			}
			
			ADDLINE := RegExReplace(A_LoopReadLine, "[{][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][}]", "")
			StringTrimLeft , ADDLINE , ADDLINE, 11
			
			CHATTEXT = %ADDLINE%
				if NOCHAT = 0
					LV_Add("",ADDLINE)
			
			CHATLASTLINE = %A_LoopReadLine%
			if CHATLASTLINE = %CHATLASTLINENEW%
				gosub CHATIGNOREOPEN
			CHATLASTLINENEW = %CHATLASTLINE%
			FileAppend ,%A_LoopReadLine%`n , %history%
			StringSplit, VAR, A_LoopReadLine, %A_Space%,
			Loop, Parse, A_LoopReadLine , %A_Space% ,
			{
				VARMAX = %A_INDEX%
			}
			LASTLINE = %CHATTEXT%
			gosub PHASELINE
			
		}
      lastReadRow := A_Index     
   }
   readRow := A_Index
}
if ENABLE_DEBUG = 2
	LV_Add("", A_ThisLabel " = " readRow " " lastReadRow)
if (readRow < lastReadRow)
   lastReadRow := 0
FileGetSize, LOGFILESIZE2, %LOGFILE%
return

PHASELINE:
if ENABLE_DEBUG = 2
	LV_Add("",A_ThisLabel A_Space " = " ADDLINE)
Loop, Parse, line , %a_space%,
	{
			VAR%A_index% = %A_LoopField%
			VARMAX = %A_index%
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	


StringLen, VAR2LEG, VAR2
if VAR2LEG > 0
	VAR2LEG--
StringTrimLeft	, VAR2E, VAR2, %VAR2LEG%
StringTrimRight	, VAR2S, VAR2, %VAR2LEG%
StringTrimLeft , PLAYER , VAR2 , 1
StringTrimRight , PLAYERS , PLAYER , 1
StringTrimLeft , PLAYERID , VAR3 , 1
StringTrimRight , PLAYERID , PLAYERID , 1

if VAR2S = *
{
	CHATLASTME = %PLAYERID% %CHATTEXT%
	if VAR6 = Joined
	{
		if ENABLE_QUITJOIN = 1
			LV_Add("", "* Join: " VAR3 " " VAR4)
		return
	}
	if VAR6 = Left
	{
	if ENABLE_QUITJOIN = 1
	LV_Add("", "* Quit: " VAR3 " " VAR4)
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
	if ENABLE_DEBUG = 1
	LV_Add("", "* BAN " VAR3 " " VAR4)
		return
	}
	if VAR4 = Cries
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Cries " VAR2 " " VAR3)
		return
	}
	if VAR4 = Cries.
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Cries. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Waves
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Waves " VAR2 " " VAR3 " at " VAR6 " " VAR7 " " VAR8 )
		return
	}
	if VAR4 = Flips
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Flips " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7 )
		return
	}
	if VAR4 = Wanks
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Wanks " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7 " " VAR8 )
		return
	}
	if VAR4 = Takes
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Piss " VAR2 " " VAR3)
		return
	}
	if VAR4 = Farts
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Farts " VAR2 " " VAR3)
		return
	}
	if VAR4 = Farts.
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Farts. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Prayer
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Prayer " VAR2 " " VAR3)
		return
	}
	if VAR4 = Exposes
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Exposes " VAR2 " " VAR3 " " VAR7 " " VAR8 )
		return
	}
	if VAR4 = Wanted
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Wanted " VAR2 " " VAR3)
		return
	}
	if VAR4 = Kicks
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Kicks" VAR2 " " VAR3 " " VAR5 " " VAR6 " Corpse")
		return
	}
	if VAR4 = Punches
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Punches " VAR2 " " VAR3 " " VAR5 " " VAR6 )
		return
	}
	if VAR4 = Says
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Pray " VAR2 " " VAR3)
		return
	}
	if VAR4 = Hides.
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Hides. " VAR2 " " VAR3)
		return
	}
	if VAR4 = Takes
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Takes " VAR2 " " VAR3 " " VAR5 " " VAR6 " " VAR7)
		return
	}
	if VAR4 = Pisses
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Pisses " VAR2 " " VAR3 " " VAR6 " " VAR7)
		return
	}
	if VAR4 = Mourns
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Mourns " VAR2 " " VAR3 " " VAR8 " " VAR9 )
		return
	}
	if VAR4 = Bitch-Slaps
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! " VAR2 " " VAR3 "Bitch-Slaps " VAR5 " " VAR6)
		return
	}
	if VAR5 = Looking
	{
	if ENABLE_DEBUG = 1
	LV_Add("","!! Looking at You " VAR2)
		return
	}

	if ENABLE_DEBUG = 2
		LV_Add("", " " A_LoopReadLine " " VAR2)
	if CHATNEWME = %CHATLASTME%
		goto CHATIGNOREME
	CHATNEWME = %CHATLASTME%
	return
}


if VAR2S = <						; Player Text
{	
	if ENABLE_DEBUG = 2
		LV_Add("", "<< " A_LoopReadLine)
	CHATTEXT = %ADDLINE%
	IfInString, CHATTEXT, ____
		goto CHATIGNORE
	IfInString, CHATTEXT, !!!!
		goto CHATIGNORE
	IfInString, CHATTEXT, 111111
		goto CHATIGNORE
	IfInString, CHATTEXT, 222222
		goto CHATIGNORE
	IfInString, CHATTEXT, 333333
		goto CHATIGNORE
	IfInString, CHATTEXT, 444444
		goto CHATIGNORE
	IfInString, CHATTEXT, 555555
		goto CHATIGNORE
	IfInString, CHATTEXT, 666666
		goto CHATIGNORE
	IfInString, CHATTEXT, 777777
		goto CHATIGNORE
	IfInString, CHATTEXT, 888888
		goto CHATIGNORE
	IfInString, CHATTEXT, 999999
		goto CHATIGNORE
	IfInString, CHATTEXT, 000000
		goto CHATIGNORE
	IfInString, CHATTEXT, @@@@
		goto CHATIGNORE
	IfInString, CHATTEXT, ####
		goto CHATIGNORE
	IfInString, CHATTEXT, $$$$
		goto CHATIGNORE
	IfInString, CHATTEXT, ^^^^
		goto CHATIGNORE
	IfInString, CHATTEXT, &&&&
		goto CHATIGNORE
	IfInString, CHATTEXT, ****
		goto CHATIGNORE
	IfInString, CHATTEXT, ((((
		goto CHATIGNORE
	IfInString, CHATTEXT, ))))
		goto CHATIGNORE
	IfInString, CHATTEXT, ----
		goto CHATIGNORE
	IfInString, CHATTEXT, ____
		goto CHATIGNORE
	IfInString, CHATTEXT, ++++
		goto CHATIGNORE
	IfInString, CHATTEXT, ====
		goto CHATIGNORE
	IfInString, CHATTEXT, [[[[
		goto CHATIGNORE
	IfInString, CHATTEXT, ]]]]
		goto CHATIGNORE
	IfInString, CHATTEXT, {{{{
		goto CHATIGNORE
	IfInString, CHATTEXT, }}}}
		goto CHATIGNORE
	IfInString, CHATTEXT, ||||
		goto CHATIGNORE
	IfInString, CHATTEXT, \\\\
		goto CHATIGNORE
	IfInString, CHATTEXT, ////
		goto CHATIGNORE
	IfInString, CHATTEXT, ????
		goto CHATIGNORE
	IfInString, CHATTEXT, <<<<
		goto CHATIGNORE
	IfInString, CHATTEXT, >>>>
		goto CHATIGNORE
	IfInString, CHATTEXT, ,,,,
		goto CHATIGNORE
	IfInString, CHATTEXT, ....
		goto CHATIGNORE
	IfInString, CHATTEXT, ::::
		goto CHATIGNORE
	IfInString, CHATTEXT, ''''
		goto CHATIGNORE
	IfInString, CHATTEXT, ````
		goto CHATIGNORE
	IfInString, CHATTEXT, qqqqqq
		goto CHATIGNORE
	IfInString, CHATTEXT, wwwwww
		goto CHATIGNORE
	IfInString, CHATTEXT, eeeeee
		goto CHATIGNORE
	IfInString, CHATTEXT, rrrrrr
		goto CHATIGNORE
	IfInString, CHATTEXT, tttttt
		goto CHATIGNORE
	IfInString, CHATTEXT, yyyyyy
		goto CHATIGNORE
	IfInString, CHATTEXT, uuuuuu
		goto CHATIGNORE
	IfInString, CHATTEXT, iiiiii
		goto CHATIGNORE
	IfInString, CHATTEXT, oooooo
		goto CHATIGNORE
	IfInString, CHATTEXT, pppppp
		goto CHATIGNORE
	IfInString, CHATTEXT, aaaaaa
		goto CHATIGNORE
	IfInString, CHATTEXT, ssssss
		goto CHATIGNORE
	IfInString, CHATTEXT, dddddd
		goto CHATIGNORE
	IfInString, CHATTEXT, ffffff
		goto CHATIGNORE
	IfInString, CHATTEXT, gggggg
		goto CHATIGNORE
	IfInString, CHATTEXT, hhhhhh
		goto CHATIGNORE
	IfInString, CHATTEXT, jjjjjj
		goto CHATIGNORE
	IfInString, CHATTEXT, kkkkkk
		goto CHATIGNORE
	IfInString, CHATTEXT, llllll
		goto CHATIGNORE
	IfInString, CHATTEXT, zzzzzz
		goto CHATIGNORE
	IfInString, CHATTEXT, xxxxxx
		goto CHATIGNORE
	IfInString, CHATTEXT, cccccc
		goto CHATIGNORE
	IfInString, CHATTEXT, vvvvvv
		goto CHATIGNORE
	IfInString, CHATTEXT, bbbbbb
		goto CHATIGNORE
	IfInString, CHATTEXT, nnnnnn
		goto CHATIGNORE
	IfInString, CHATTEXT, mmmmmm
		goto CHATIGNORE
	IfInString, CHATTEXT, %a_space%%a_space%	
		goto CHATIGNORE
	IfInString, CHATTEXT, qwertyuiop
		goto CHATIGNORE
	IfInString, CHATTEXT, jajaja
		goto CHATIGNORE
	IfInString, CHATTEXT, hahahaha
		goto CHATIGNORE
	IfInString, CHATTEXT, lololol
		goto CHATIGNORE
	IfInString, CHATTEXT, wakwakwak
		goto CHATIGNORE
	return
	if CHATNEWOPEN = %CHATLASTOPEN%
		goto CHATIGNOREOPEN
	CHATNEWOPEN = %CHATLASTOPEN%
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;START FISH Filter;;;;;;;;;;;;;;;;;;;;
 


if VAR2 = Fishing...
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Started")
	PLAYERISINPD = 0
	gosub FISHIN
	return
}
if VAR2 = Fishing
{
	if VAR3 = Tournament
	{	if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Tourny Started")
		return
	}
	
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing VAR2")
	FISH = 1
	return
}
if VAR2 = Press 					
{
	if VAR12 = {D6D631}/fish
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Here")
		BOAT = 1
		IF FPS = %fpslow%
			gosub FPSHIGH
		
		if FISH = 1
		gosub FISH
		return
	}
}
if VAR4 = Removed
{
	if VAR6 = Fishing
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Rod Removed")	
		AUTOFISH = 0
		ROD = 0
		return
	}
}

if VAR5 = Stolen
	if VAR8 = Bank
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Bank Has Been Robbed")
	return
	}

if VAR3 = Cannot
{
	if VAR4 = Sell
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Cannot Be Sold Here")
		gosub FISHOUT
		return
	}	
}
if VAR3 = Failed
{
	if VAR6 = Catch
	{
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR4 = Thrown
{	
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Thrown")
	return
}
if VAR3 = Mermaid 					
	if VAR4 = HAS
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Mermaid")
		gosub FISHOUT
		gosub FISHING
		return
	} 
if VAR3 = Found
{
	if VAR4 = Nemo!
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Nemo")
		gosub FISHOUT
		gosub FISHING
		return
		return
	}
}
if VAR7 = Fishing
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Rod Equiped")	
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
		if ENABLE_DEBUG = 1
			LV_Add("", "# Sea Monster Killed ")
		gosub FISHOUT
		gosub FISHING
		return
	}	
}
if VAR3 = Failed
{
	if VAR5 = Catch
	{
	if ENABLE_DEBUG = 1
	LV_Add("", "# Fishing Failed")
		gosub FISHOUT
		goto FISHING
		return
	}
}	
if VAR3 = Found
{
	if VAR6 = Body.
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Dead Body")
	gosub FISHOUT
	gosub FISHING
	return
	}	
}
if VAR3 = Were
{
	if VAR4 = Raped
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Mermaid Raped")
		FTD = 4
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
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Not Here")
		FISH = 1
		return
	}
}
if VAR3 = Also
{
	if VAR4 = Receive
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# Prize " VAR6)
			return
	}										
}
if VAR7 = Treasure
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Treasure")
	gosub FISHOUT
	gosub FISHING
	return
}
if VAR4 = Thrown
{	
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Throwback")		
	THROWBACK = 0
	return
}				
if VAR4 = Already
	if VAR5 = Fishing
{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Already")
	return
}
if VAR5 = Attacked
{
	if VAR8 = Sea
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Sea Monster Attacked " VAR12 " Fish Lost")		
		gosub fishinv
		gosub FISHOUT
		gosub FISHING
		return
	}
}
if VAR3 = Caught
{
	gosub FISHOUT
	if VAR7 = Whale
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Whale")	
		gosub FPSLOW
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Toilet
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Toilet")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Crab
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Crab")	
		FTD = 2
		gosub takedrugs
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Sunfish
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Sunfish")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Body
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Body Armor")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Used
	{		
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Used")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Condom
	{		
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Condom")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Seaweed.
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Seaweed")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Weapon
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Weapon")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Jelly
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Jelly")	
		gosub FISHOUT
		FTD = 1
		gosub takedrugs
		gosub FISHING
		return
	}
	if VAR5 = Drug
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Drug")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Old
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Old")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Car
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Caught Car Tier")	
	gosub FISHOUT
	gosub FISHING
	return
	}
	if VAR5 = Money
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Money")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Clam
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Clam")	
		gosub FISHOUT
		gosub FISHING
		return
	}
	if VAR5 = Bonus
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Caught Bonus")	
		return
	}		
	if VAR6 = Pound
	{
		IfInString , VAR7 , .
			StringTrimRight , VAR7 , VAR7 , 1
		IfInString , VAR7 , .
			StringTrimRight , VAR8 , VAR8 , 1
		finv = 1
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
			
			if ENABLE_DEBUG = 1
			{
				if VAR8 = And
					VAR8 =
				LV_Add("", "# Fishing Caught " VAR5 " " VAR7 " " VAR8)	
			}
		if finv = 1
			gosub fishinv
		gosub FISHOUT
		goto FISHING
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END FISH FILTER;;;;;;;;;;;;;;;;;


	if VAR4 = Rolled
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# Dice Roll " VAR2 " " VAR3 " " VAR6 " You " VAR15 )
		return
	}
	if VAR5 = Played
		if VAR6 = Dice
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# Dice " VAR2 " " VAR3 " Played Recently" )
		return
	}
	
if VAR4 = Dropped
	if VAR6 = Money
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Dropped A Money Bag " VAR10 " " VAR11 " " VAR12)
		return
	}
if VAR5 = Picked
	if VAR8 = Money
			{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Picked Up His Money Bag In " VAR11 " " VAR12 " " VAR13)
		return
	}
if VAR2 = /lotto
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto /Lotto VAR2")
	Lottery = 0
	LOTTOFAIL = 0
	Gosub lotto
	return
}
if VAR3 = /lotto
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto /Lotto VAR3")
	Lottery = 0
	LOTTOFAIL = 0
	Gosub lotto
	return
}

if VAR4 = /lotto
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto /Lotto VAR4")
	Lottery = 0
	LOTTOFAIL = 0
	Gosub lotto
	return
}
if VAR5 = /lotto
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto /Lotto VAR5")
	Lottery = 0
	LOTTOFAIL = 0
	Gosub lotto
	return
}
	

if VAR3 = Lived
	if VAR12 = Years
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Lived " VAR6 " Days")
		HIM = VAR2
		gosub stshim
		return
	}
 
 if VAR2 = Has

	
	if VAR5 = Placed
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Placed A Hit On " VAR9 " " VAR12)
		return
	}	

 
 if VAR2 = (WHISPER)
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# (WHISPER) " VAR3 " " VAR4)
		return
	} 
 if VAR2 = (911)
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# (911) " VAR4 " " VAR5)
		return
	} 

 if VAR2 = Officer
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% " ADDLINE)
		return
	}
 if VAR2 = Suspect
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Arrest " VAR3 " " VAR4 " by " VAR10 " " VAR11)
		return
	}
	
if VAR3 = Suspects
	{
		LV_Add("","% Crime No Suspect")
		PLAYDICE = 0
		return
	}
 if VAR2 = (Cop
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% (COP MSG) " VAR4 " " VAR5)
		return
	}
   if VAR2 = (DISPATCH)
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% Crime " VAR3 " " VAR4 " Request Backup " VAR9 " " VAR10 " " VAR11)
		return
	} 
 if VAR2 = (CRIME
	if VAR3 = REPORT)
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% Crime " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13)
		return
	}
 if VAR2 = Location:
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% Crime " VAR3 " " VAR4  " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9  " " VAR10 )
		return
	}
 if VAR2 = Attention
	if VAR3 = All
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% Crime " VAR4  " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9  " " VAR10 " " VAR11 " " VAR12 " " VAR13 )
		return
	}
 
if VAR2 = No
	if VAR8 = Dice
	{
		LV_Add("","# Dice Failed")
		PLAYDICE = 0
		return
	}
if VAR5 = Too
	if VAR6 = Far
	{
		LV_Add("","# Dice To Far" )
		PLAYDICE = 0
		return
	}



if VAR2 = Suspect
	if VAR7 = Enough
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "#  " Not Close Enough)
		PLDYDICE = 0
		return
	}
if VAR2 = Law
	if VAR5 = Cannot
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "#  " Cops Cannnot Paricipate)
		PLDYDICE = 0
		return
	}

if VAR2 = Looking
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "#  " ADDLINE)
		return
	}

if VAR2 = Sold
	{	
			LV_Add("","!! Sold " VAR3 " " VAR4 " " VAR5 " " VAR6 " " VAR7)
		return
	}
if VAR4 = Is
	if VAR5 = Selling
	{	
			LV_Add("","!! Sell " VAR2 " " VAR3)
		return
	}
		

if VAR4 = Could
	if VAR6 = Afford
	{	
			LV_Add("", "# Dice " VAR2 " " VAR5 " " VAR6 " " VAR7  " " VAR8  " " VAR9  " " VAR10  " " VAR11  " " VAR12)
			POOR = %VAR2%
				gosub givepoorcash
		return
	}

IfInString, VAR2 ,Congratulations!
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# Dice Win " VAR5)
		return
	}

if VAR2 = Truck
	if VAR3 = Delivery
	{
	LV_Add("", "# Truck Delivery")
		gosub gpsmission
	}
if VAR2 = No
	if VAR3 = Winner,
	{
	LV_Add("", "# No Winner")
		return
	}
if VAR2 = Courier
	if VAR3 = Mission
	{
	LV_Add("", "# Courier Mission")
		gosub gpsmission
		return
	}
if VAR2 = GPS
	if VAR4 = Destination:
	{
	LV_Add("", "# GPS Destination: " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}
if VAR2 = Distance:
	{
	LV_Add("", "# GPS Distance: " VAR3 " km Path Distance " VAR5)
		return
	}
if VAR5 = Escaped
	{
	LV_Add("","!! " VAR2 " Escaped Jail")
		return
	}
	
if VAR4 = Contract
	if VAR9 = Cancelled
	{
	LV_Add("","!! Hit " VAR5 " Cancelled ")
		return
	}
	if VAR10 = Cancelled
	{
	LV_Add("","!! Hit " VAR5 " Cancelled ")
		return
	}
	
if VAR6 = Only
	if VAR9 = Donating
	{
	DONATOR = 0
	LV_Add("", "# Not Donator")
		return
	}

if VAR4 = {D6D631}/vehhelp
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Color Car")
	IN_CH = 0
	if DONATOR = 1
		gosub vehc
	return
}	

if VAR2 = CrazyBob
{
	if VAR4 = Lottery
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# CrazyBob Daily Lottery " VA9)
		return
	}
}

if VAR2 = Someone
{
	if VAR3 = has
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto Number Taken")
		Lottery = 0
		LOTTOFAIL = 1
		gosub lotto
		return
	}
}

if VAR4 = Gives
	IfInString, VAR7 , Flowers
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Flowers " VAR2 " " VAR3 " Gives " VAR5 " " VAR6)
		return
	}
	IfInString, VAR8 , Kiss
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Kiss" VAR2 " " VAR3 " Gives " VAR5 " " VAR6)
		return
	}

if VAR5 = Disappeared
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " " VAR3 "Has Disappeared " VAR8)
		return
	}
if VAR3 = Paid
	if VAR5 = Bank
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Paid" VAR2 " " VAR3 " From Bank Account")
		return
	}


if VAR2 = Purchased
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Purchased" VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}

if VAR3 = Sold
	if VAR5 = Fish
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Fishing Sold " VAR4 " For " VAR10)
		return
	}
	
	
if VAR5 = Called
{
	if VAR7 = Delivery
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Delivery " VAR2 " " VAR3 " " VAR11 " " VAR12 " " VAR13 " " VAR14 " " VAR15)
		return
	}	
}
	
	if VAR9 = Police
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% Not Cop Car ")
		return
	}

if VAR2 = Officer
{
	if VAR5 = Reports
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " " VAR3 " Reports Criminal Activity " VAR12 " " VAR14 " " VAR15)
		return
	}		
}
if VAR4 = Pet,
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Pet" ADDLINE)
		return
	}	
if VAR12 = Pet,
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Pet" ADDLINE)
		return
	}	



if VAR5 = is
	if VAR7 = Far
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " " VAR3 "Too Far Away " VAR10)
		return
	}

if VAR2 = There
	if VAR5 = Suspects
	{
		if ENABLE_DEBUG = 1
			LV_Add("","% No Suspects Awaiting Parole")
		return
	}
		

if VAR2 = CnR
{
	if VAR3 = Law
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Daily Pay " VAR11 " " VAR12)
		return
	}
	if VAR3 = Services
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Daily Pay " VAR9)
		return
	}		
		
	if VAR4 = Sponsored
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# CnR Is Sponsored By Madrigal Electromotive GmbH.")
		return
	}		
	if VAR5 = Current
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Lotto Jackpot: " VAR7)
		return
	}
	if VAR3 = Lottery
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Lotto Draw")
		gosub lotto
		return
	}
}

if VAR2 = The
	{
	if VAR3 = Bars
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Share Payout Bars and Clubs")
		return
	}

	if VAR3 = First
	{
	if ENABLE_DEBUG = 1
		LV_Add("","# First Person To Sell Gets" VAR11 " " VAR12 " " VAR13)
	return
	}
}

if VAR2 = Participation
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Lotto Participation Winner " VAR5 " " VAR8)
	return
}
if VAR2 = No
	if VAR3 = Winner
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Lotto Increased to " VAR9)
		return
	}
if VAR2 = Congratulations,
	if VAR7 = Fisherman
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Fisherman Of The Day Award! " VAR14 " " VAR17)
		return
	}



if VAR2 = Welcome
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Welcome")
	return
}
if VAR2 = Lawn
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Lawn Mowing Mission")
	return
}
if VAR3 = Complete!
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Mission Complete!")
	return
}
if VAR2 = Street
	if VAR3 = Vendor 
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Offer " VAR2 " Items ")
	gosub items
	return
}
if VAR2 = Get
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Para Bailar La Bamba")
	return
}
if VAR2 = Para
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Get More Info www.crazybobs.net")
	return
}
if VAR2 = Invest
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Invest")
	return
}
if VAR3 = Problems?
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Got Problems /weapons")
	return
}
if VAR3 = Sweeper
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Street Sweepers Wanted")
	return
}

if VAR2 = Type
{
	if ENABLE_DEBUG = 1
		LV_Add("","# " ADDLINE)
	return
}
if VAR2 = Press
{
	if ENABLE_DEBUG = 1
		LV_Add("","# " ADDLINE)
	return
}
if VAR2 = Illegal
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Illegal Immigrants Need A Ride To Their New Jobs! ")
	return
}
if VAR2 = Spotted
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Spotted a Crime? /911.")
	return
}
if VAR2 = Feel
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Feel like Killing Someone?")
	return
}
if VAR2 = Does
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Does It Burn When You Piss?")
	return
}
if VAR2 = Minor
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Minor Crimes Are Only Reported If Police Officers Are Close Enough")
	return
}
if VAR2 = Need
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Need Some Extra Protection")
	return
}
if VAR3 = Church
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Church")
	return
}
if VAR2 = Visit
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Visit 24/7")
	return
}
if VAR3 = Sponsored
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Sponsored")
	return
}
if VAR2 = Buy
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Buy Condoms")
	return
}
if VAR2 = Confused?
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Confused?")
	return
}
if VAR2 = Feeling
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Feeling")
	return
}
if VAR2 = Find
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Find It Before Any One Else")
	return
}
if VAR2 = FREE
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Free Entrance to DM Stadium Today" VAR3)
	return
}
if VAR2 = Donate
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Donate")
	return
}
if VAR2 = Donating
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Donating Players Pay Less Taxes")
	return
}

IfInString, VAR7 , Deer
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Deer Killed " VAR2)
		return
	}	
if VAR2 = Beginning
	if VAR3 = Holdup...
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Holdup")
	return
}
if VAR5 = Looking
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Look " VAR2 " " VAR3 " " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8 " " VAR9)
	return
}

if VAR4 = Cheater
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Spotted a Cheater use /complain")
	return
}
if VAR3 = /markets
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Markets")
	return
}
if VAR3 = /info
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Settings")
	return
}
if VAR3 = /settings
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Settings")
	return
}
if VAR3 = /pagesize
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Pagesize")
	return
}
if VAR3 = /shoplift
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Shoplift")
	return
}
if VAR3 = /cs
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Clear Screen")
	return
}
if VAR3 = /cnrradio
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Radio")
	return
}
if VAR3 = Got
{
	if ENABLE_DEBUG = 1
		LV_Add("", " - Got")
	return
}
if VAR2 = Want
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Want a Spefic Car?")
	return
}
if VAR2 = Nothing
	if VAR4 Cancel!
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " Nothing to Cancel!")
		return
	}
if VAR5 = Been
{
	if VAR6 = Infected
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " " VAR3 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
		return
	}
	if VAR6 = Raped
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Raped " VAR10 " " VAR11 )
		return
	}
	if VAR8 = Probed
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Probed")
		return
	}
	if VAR9 = Death
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Fish Slapped" VAR11 " " VAR12)
		return
	}
	if VAR6 = Eaten
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Eaten by Jaws")
		return
	}
	if VAR5 = Shot
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " Shot on Police Property")
		return
	}
}
if VAR4 = Attempted 
{
	if VAR6 = Break
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " Infected")
		return
	}
}
if VAR4 = Slaps
{
	if ENABLE_DEBUG = 1
		LV_Add("","# " VAR2 " Fish Slaps " VAR4 )
	return
}	
if VAR6 = Infected
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Someone Has Attempted to Break in" )
	return
}	

if VAR5 = Lived
{
	if ENABLE_DEBUG = 1
		LV_Add("","# " VAR2 " Happy Birthday" )
	return
}
if VAR5 = Donated
{
	if ENABLE_DEBUG = 1
		LV_Add("","# " VAR2 " Has Donated to Church" )
	return
}

if VAR3 = Week
{
	if ENABLE_DEBUG = 1
		LV_Add("","# The Week Is Almost Over." )
	return
}
	
if VAR2 = Biggest
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Biggest")
	return
}
if VAR6 = Attacked
	if VAR9 = Sea
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dead " VAR2 " " VAR3 " by Sea Monster")
		return
	}	

if VAR5 = killed
	if VAR7 = Sea
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Death Sea Monster by " VAR2 " " VAR3 )
		return
	}	
if VAR5 = killed
	if VAR8 = Ton
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Death 5 Ton Whale by " VAR2 " " VAR3 )
		return
	}	
if VAR7 = Hippie.
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead Hippie" VAR2 " " VAR3)
	return
}
if VAR4 = Died
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
	return
}
if VAR5 = Died
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Died by " VAR6 " " VAR7 " " VAR8 " " VAR9 )
	return
}

if VAR6 = Killed
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Killed by " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
	return
}
if VAR6 = Death
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Death by " VAR10 " " VAR8)
	return
}
if VAR6 = Catch
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Bonus Fish")
	return
}


if VAR5 = Not
	if VAR6 = Accepting
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " " VAR3 " No PM")
		return
	}

if VAR4 = Not
	if VAR6 = Valid
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# " VAR2 " Not a Valid Player")
		return
	}
	

if VAR7 = Cleaned
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Maid " VAR4 " Cleaned " VAR8 " House")
	return
}
if VAR2 = Sent
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Sent")
	return
}
if VAR4 = Droped
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! "VAR2 " Droped Money Bag")
	return
}

if VAR3 = Looking
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Is Looking")
	return
}
if VAR2 = Friday
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Friyday Nite Party " VAR6 " " VAR7 " " VAR8 " " VAR9)
	;gosub gpsmission
	return
}
if VAR3 = Friday
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Friyday Nite Party Ended")
	return
}
if VAR2 = Join
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Join the Party")
	return
}


if VAR3 = Followed
{
	if ENABLE_DEBUG = 1
		LV_Add("", "You Followed The Bot")
	return
}
if VAR4 = Purchased
{								
	if VAR6 = Armor
	{
		{			
			if ENABLE_DEBUG = 1
				LV_Add("", "Purchased Armor")		
			return
		}
		if VAR6 = Dinghy
		{					
			if ENABLE_DEBUG = 1
				LV_Add("", "Purchased Dingy")	
			return
		}
		if VAR6 = Squallo
		{					
			if ENABLE_DEBUG = 1
				LV_Add("", "Purchased Squallo")	
			return
		}
	}
}
if VAR3 = Time:
{
	StringTrimLeft, VAR4, VAR4, 8
	if ENABLE_DICE = 1
	{
	if PLAYDICE = 1 
		SetTimer, playdice, 1000
	}
	if ENABLE_DEBUG = 1
		LV_Add("", "# Time " VAR4 " " VAR5)
	return
}	
if VAR2 = Ejected
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Ejected From The Regular Players Club.")
	return
}

if VAR5 = Vehicle
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# You Can Sell This Vehicle")
	return
}
if VAR5 = Drugs.
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# You Are On Drugs.")
	ONDRUGS = 1
	return
}
if VAR4 = {D6D631}/holdup
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Type /holdup To Begin a Robbery.")
	return
}
if VAR3 = Wait
	if VAR5 = Fishing
			{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Please Wait Before Fishing Again.")
		return
	}
	if VAR7 =  Animation.
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Please Wait Before Using Another Animation.")
		return
	}
	
	
	
if VAR7 = Wait
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Do Not Spam!")
	return
}
if VAR5 = Released
{
	if ENABLE_DEBUG = 1
		LV_Add("",VAR2 "? Released from Jail")
	return
}
if VAR4 = Afford
{
	if ENABLE_DEBUG = 1
		PLAYDICE = 0
		LV_Add("","# You Cannot Afford")
	NOMONEY = 0
	return
}
if VAR4 = {00AAFF}City
{
	IN_CH = 1
	LV_Add("", "# Welcome To City Hall")
	return
}
if VAR2 = Jail
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Appeal " VAR7 " " VAR8 " " VAR11)
	return
}	
if VAR3 = Jail
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Your Jail Sentence Is Complete.")
	return
}	
if VAR6 = Bail
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# You Have Paid Your Bail " VAR7)
	return
}	
if VAR2 = Civilians
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Civilians Lose Health On Police Property.")
	return
}
if VAR7 = Ticket
{	
	if ENABLE_DEBUG = 1
		LV_Add("","!! You Have Been Issued A Ticket " VAR10 " " VAR13)	
	gosub pay
	return
}

if VAR5 = Robbed
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Robbed " VAR6 " " VAR8 " " VAR9 " " VAR10 " " VAR11)
		return
	}
if VAR5 = Delivered
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Delivered Something")
		return
	}
if VAR5 = Received
	{
		if VAR7 = Welfare
		{
		if ENABLE_DEBUG = 1
			LV_Add("","$ " VAR2 " " VAR3 " Has Received A Welfare Check")
		return
		}
		if VAR8 = Tax
		{
		if ENABLE_DEBUG = 1
			LV_Add("","$ Tax " VAR2 " " VAR3 " Received " VAR7 " Refund")
		return
		}
	}
if VAR8 = Taxes,
	{
		if ENABLE_DEBUG = 1
			LV_Add("","$ Tax " VAR2 " " VAR3 " is in Debt ")
		NEWDEBT = %VAR2%
		return
	}
if VAR5 = Paid
	{
		if ENABLE_DEBUG = 1
			LV_Add("","$ Tax " VAR2 " " VAR3 " Has Paid " VAR6)
		return
	}
if VAR5 = Sold
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Sold Today's Bonus " VAR8 " " VAR9)
		return
	}
if VAR5 = Caught
	{
		if VAR10 = and
			VAR10 =
		if ENABLE_DEBUG = 1
			LV_Add("","# Fishing " VAR2 " " VAR3 " Caught " VAR7 " " VAR9 " " VAR10)
		return
	}
if VAR5 = Completed
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Completed " VAR7 " " VAR8 )
		return
	}
if VAR5 = Found
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! " VAR2 " " VAR3 " Has Found The Lost Mafia Money Bag " VAR12 " " VAR14 " " VAR15 " " VAR16)
		return
	}
if VAR10 = Dice
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Dice "VAR2 " " VAR3 " Asked " VAR13)
		PLAYDICEA = 1
		gosub dice
		return
	}
if VAR4 = Smuggled
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! " VAR2 " " VAR3 " Smuggled Something")
			return
}

if VAR5 = Longer
{
	if ENABLE_DEBUG = 1
		LV_Add("","# No Longer Ignoring Someone")
			return
}
if VAR3 = Daily
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Lotto Jackpot " VAR7)
			return
}
if VAR5 = Cancelled
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Someone Cancelled Hit")
			return
}

if VAR2 = No
	if VAR3 = Players
		if VAR4 = Close
		{
			if ENABLE_DEBUG = 1
				LV_Add("","# No Players Close Enough")
			PLAYDICE = 0
			return
		}
if VAR7 = Enough.
		{
			if ENABLE_DEBUG = 1
				LV_Add("","# No Players Close Enough")
			PLAYDICE = 0
			return
		}


if VAR3 = {D6D631}/vehhelp			
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Color Car")
	IN_CH = 0
	if DONATOR = 1
		gosub vehc
	return		
}
if VAR9 = /delivery
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Color Truck")
	IN_CH = 0
	goto vehc
	return
}	
if VAR2 = Today's
{
	if VAR3 = Number:
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Lotto Today's Number: "VAR4)
		Lottery = 0
		;Gosub lotto
		return
	}
	if VAR4 = Vehicle:
	{
		
		if ENABLE_DEBUG = 1
			LV_Add("", "# Bonus Car " VAR5 " " VAR6)
		gosub bonuscar
		return
	}
	if VAR4 = Fish:
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Bonus Fish " VAR5 " " VAR6)
		gosub bonusfish
		return
	}
}
if VAR2 = Money
{
	if VAR3 = Rush!
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Money Rush")
		gosub moneyrush
		return
	}
}
if VAR2 = The
{	
	if VAR3 = Color
	{
		if ENABLE_DEBUG = 1
		LV_Add("", "# Car Colored")
		DONATOR = 1
		return
	}
}
if VAR2 = Player
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Player Data Saved")
	return
}	

if VAR2 = ->
	if VAR3 = Frame
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Frame Rate: " VAR5)
		return
	}	

if VAR2 = WINNER!!!
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Lotto " VAR3 " " VAR4 " " VAR5 " " VAR6 " " VAR7 " " VAR8)
		return
	}
if VAR2 = Financial
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Financial Statement - Cash:" VAR9 " Bank Cash: " VAR14)
		return
	}	
if VAR2 = Property
{
	if VAR3 = Value:
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Property Value " VAR4 " Share Value: " VAR9)
		return
	}
	if VAR3 = Tax:
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Tax Property " VAR4  " " VAR6)
		return
	}
}


if VAR2 = Income
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Tax Income " VAR4)
		return
	}	
if VAR2 = Net
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Net Profit " VAR4)
		return
	}
if VAR2 = Total
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Tax Total " VAR4)
		return
	}
if VAR2 = Paid
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Paid From Pocket: " VAR5 " Paid From Bank: " VAR10)
		return
	}
if VAR2 = Sales
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "$ Sales Today: " VAR4)
		return
	}
if VAR2 = Selection 
	
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Selection Cancelled.")
		return
	}
if VAR2 = Lawsuit 
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Lawsuit Plaintiff: " VAR5 " Defendant: " VAR8 " Verdict: " VAR11 " " VAR13)
		return
	}
if VAR2 = Votes 
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Votes Plaintiff: " VAR5 " Defendant: " 10)
		return
	}

if VAR3 = Bonus
	if VAR4 = Fish
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# Bonus " VAR5 " " VAR12)			
		return
	}	
if VAR2 = Bank
	if VAR4 = Balance:
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# Bank Balance: "VAR5)			
		return
	}	

if VAR2 = Now
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "#  Anamation " VAR3)			
		return
	}
if VAR4 = Released
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "%  Crime " VAR2 " " VAR3 " Released by " VAR9 " " VAR10)			
		return
	}
if VAR2 = Vehicle
	{				
		if ENABLE_DEBUG = 1
			LV_Add("","!! Someone attempted to Steal your Vehicle")			
		return
	}
if VAR5 = restarting..
	{				
		if ENABLE_DEBUG = 1
			LV_Add("","!! Server Restart")			
		return
	}	
if VAR5 = Registered.
	{				
		if ENABLE_DEBUG = 1
			LV_Add("","!! Enter Password")
		LOGEDIN = NO
		return
	}	


if VAR2 = You
{
	
	if VAR5 = Worst
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Officaly Suck!")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Placed
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Placed " VAR6 " " VAR7 " " VAR8 " "  VAR9 " "  VAR10 " "  VAR11 " "  VAR12)
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Taken
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Taken " VAR6 " " VAR7 " " VAR8 " "  VAR9 " "  VAR10 " "  VAR11 " "  VAR12)
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Issued
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime Ticket Issued")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Assisted
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime Assisted Arrest")
		;SetTimer, cry, 3000
		return
	}
	if VAR7 = Assist
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime Assist Bonus " VAR5)
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Accepted
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% You Have Accepted")
		;SetTimer, cry, 3000
		return
	}
	if VAR5 = Asked
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime " VAR3 " " VAR4 Asked to Freeze)
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Offered
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% " VAR2 " " VAR3 Has Offered)
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Collected
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime Ticket Collected")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Paroled
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Crime " VAR5 " " VAR6 Paroled)
		;SetTimer, cry, 3000
		return
	}
	if VAR3 = Beat
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Beat Your Record")
		;SetTimer, cry, 3000
		return
	}
	if VAR5 = Body
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "#  You Received Armor")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Arrested
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Arrest " VAR6 " " VAR7)
		;SetTimer, cry, 3000
		return
	}
	if VAR5 = Withdraw
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Not at Bank ")
		;SetTimer, cry, 3000
		return
	}
	if VAR5 = Deposit
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Not at Bank ")
		;SetTimer, cry, 3000
		return
	}
	if VAR7 = Class
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# New Class After Death ")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Found
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Found Money Bag ")
		;SetTimer, cry, 3000
		return
	}
	if VAR3 = Received
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Share ")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Cannot
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Cannot")
		;SetTimer, cry, 3000
		return
	}
	if VAR4 = Paid
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Have Paid")
		;SetTimer, cry, 3000
		return
	}
	
	if VAR3 = Lost.
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Dice Lost " VAR8)
		;SetTimer, cry, 3000
		return
	}
	if VAR12 = Dice
	{
		PLAYDICE = 1
		if ENABLE_DEBUG = 1
			LV_Add("", "# Dice " VAR5 " " VAR6 )
		
		return
	}
	if VAR4 = Cancelled
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Have Cancelled")
		return
	}

	if VAR5 = Ticket
	{	
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Have Paid Your Ticket")
		return
	}
	if VAR5 = Catch
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# Fishing Permits: " VAR6)			
		return
	}
	
	if VAR5 = Charged
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Will Be Charged $9500 per Gameday For Ice")			
		return
	}	
	if VAR5 = Anymore
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Can Carry More Fish")			
		return
	}	
	If VAR6 = Ice
	{				
		if ENABLE_DEBUG = 1
			LV_Add("", "# You Paid For Ice For Your Fish Cooler " VAR4)			
		return
	}
	if VAR5 = Closest
		{
			if ENABLE_DEBUG = 1
				LV_Add("", "# You are the Closest.")
			return
		}
	if VAR3 = Cannot 
		if VAR6 = Fish.
		{
			if ENABLE_DEBUG = 1
				LV_Add("", "# You Cannot Cary any more Fish.")
			return
		}
	if VAR3 = Are
		if VAR5 = Fishing.
		{
			if ENABLE_DEBUG = 1
				LV_Add("", "# You Are Currently Fishing.")
			return
		}
	if VAR4 = not
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "You are Not " VAR5)
		return
	}

	IfInString, VAR9 , Fees
	{				
		if ENABLE_DEBUG = 1
		LV_Add("", "# You Paid Daily Life Insurance Fees " VAR4)			
		return
}

}

if VAR2 = Your
{
	if VAR3 = Vehicle
	{
		if VAR4 = is
		{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Vehicle Repairing")
		PLAYER_HEALTH = 100
		return
		}
		if VAR4 = Has
		{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Vehicle Repaired")
		PLAYER_HEALTH = 100
		return
		}
	}
	if VAR3 = Rank
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "% Your Not High Enough")
		PLAYER_HEALTH = 100
		return
	}
	if VAR3 = Health
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Health Filled")
		PLAYER_HEALTH = 100
		return
	}
	if VAR3 = Armor
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Armor Filled")
		PLAYER_Armor = 100
		return
	}
	if VAR3 = Horse
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Horse Bet")
		return
	}
	if VAR3 = Past
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Past")
		return
	}
	if VAR3 = Bank
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Bank Interest " VAR7 " " VAR10 " " VAR11 " " VAR12 " " VAR13 )
		return
	}
	if VAR3 = {00AAFF}User
	{
		if ENABLE_DEBUG = 1
			LV_Add("","# Your User Has Been Saved")
		LOGEDIN = YES
		return
	}
	if VAR3 = House
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your House")
		return				
	}
	if VAR3 = Drugs
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Drugs Have Worn Off")
		ONDRUGS = 0
		return
	}
	if VAR3 = Lottery
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Lotto Number " VAR5 " " VAR10)
		Lottery = 1
		return
	}
	if VAR4 = Hit
	{
		if ENABLE_DEBUG = 1
		LV_Add("", "# Your Hit")
		return
	}
	if VAR3 = Medical
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Medical")
		return
	}
	if VAR3 = Pet,
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Your Pet")
		return
	}
}	
if VAR2 = Money
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Money")
	return
}
if VAR2 = Due
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Due")
	return
}
if VAR2 = Committed
{
	if VAR4 = Crime
	{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Crime " VAR5 " " VAR6 " " VAR7 " "VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12 " " VAR13 " " VAR14)
	return
	}
}
if VAR2 = Withdrawal
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Bank Withdraw " VAR5 " " VAR6)
	return
}
if VAR2 = Deposit
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Bank Deposit " VAR5 " " VAR6)
	return
}

if VAR2 = {FAAC58}(FISH
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# " ADDLINE)
	return
}
if VAR2 = Congratulations.
{ 
	if ENABLE_DEBUG = 1
		LV_Add("", "# Congratulations")
	return
}
if VAR2 = PM
{
	if VAR3 = From
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# PM From")
		return
	}	
	if VAR3 = Sent
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# PM Sent")
		return
	}
}
if VAR2 = Horse
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Horse " VAR7 " " VAR8 " " VAR9 " " VAR16 " " VAR17)
	return
}
if VAR2 = Co-Owner
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Co-Owner")
	return
}

if VAR2 = {FF0000}Warning!
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Server Warning")
	if VAR4 = {FFFFFF}This
		Gosub login
	return
}
if VAR2 = Logged
{
	if ENABLE_DEBUG = 2
		LV_Add("", "# Server Logon")
	IF VAR5 = {00AAFF}Donating
		DONATOR = 1
	return
}	
if VAR2 = Data
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Server Player Exists")
	LOGEDIN = Yes
	LOTTOFAIL = 0
	gosub lotto
	if CNRRADIO = 1
		gosub radio
	return
}
if VAR2 = Pick
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Lotto Pick Number")
		Lottery = 0
		LOTTOFAIL = 0
		gosub lotto
		return
	}	
if VAR2 = {FF66FF}THIS
{
	if ENABLE_DEBUG = 1
		LV_Add("","# Warning! This Server Contains Explicit Material.")
	return
}

if VAR2 = Check
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Check")
	return
}
if VAR2 = {FFFFFF}SA-MP
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# SA-MP Started")
	return
}
if VAR2 = Connecting
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Connecting")
	return
}
if VAR2 = Connected.
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Connected.")
	return
}
if VAR2 = Connected
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Server Connected")
	if VAR8 = (0.3d)
		GuiControl, Text , Static1 ,Server 1
	if VAR8 = 2
		GuiControl, Text , Static1 ,Server 2
	return
}

if VAR3 = server
	if VAR5 = restarting..
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# The server is restarting..")
	return
}
if VAR2 = UPS
{
	if VAR2 = Delivery
	{
		if VAR5 = Chosen
		{
			
		if ENABLE_DEBUG = 1
			LV_Add("", "# VAR3 = Ups")
			gosub ups
			return
		}
	}
}

if VAR5 = Broken
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Fishing Record")
	if FISH = 1
	gosub FISH
	return
}	
if VAR2 = Unknown
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Unknown")
	VAR1 = %LCMD%
	return
}
if VAR4 = {D6D631}/ignore
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Ignored " VAR5)
	return
}

if VAR7 = Jury
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# You have Been Selected For Jury Duty")	
	Gosub Jury					
	return
}
if VAR2 = Jury
	if VAR4 = Cancelled.
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# You have Been Selected For Jury Duty")	
		Gosub Jury					
		return
	}
if VAR3 = Have
{
	if VAR4 = Voted 
	{
	
	if ENABLE_DEBUG = 1
		LV_Add("", "# You have Voted " VAR6 " " VAR8)
	return
	}
	if VAR9 = Completed
	{
	
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR5 " " VAR6 " Contract " VAR15 " " VAR16)
	return
	}
}


if VAR5 = Ignoring
{
	StringTrimLeft, VAR10, VAR10, 8
	if ENABLE_DEBUG = 1
		LV_Add("", "# Ignoring " VAR10)
	return
}
if VAR2 = Beginning
	if VAR5 = Life
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# New Life")
		return
	}
if VAR2 = Level
	if VAR5 = Rank:
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Rank " VAR6 " " VAR7 " " VAR8)
		return
	}
if VAR3 = Scratched
{
	if VAR6 = Ticket,
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Scratchy Ticket")
		return
	}
}
if VAR3 = Race
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Race")
	return
}
if VAR3 = Also
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Also")
	return
}
if VAR4 = Sell
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Sell VAR4")
	return
}	
if VAR4 = Sold
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Sold " VAR6 " " VAR7 " " VAR8 " " VAR9 " " VAR10 " " VAR11 " " VAR12)
	return
}
if VAR4 = /treat			
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Trick or Treat")
	if DONATOR = 1
		gosub trick
	return
}		
if VAR4 ={0077FF}CrazyBob's
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Server Welcome")
	Lottery = 0
	OLDVAR = %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% 
	gosub VARFIX
	return
}
if VAR4 = /house
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# House Entered")
	Gosub house
	return
}
if VAR2 = Please
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Dont Spam!")
	return
}
if VAR4 = Has
{
	
	if VAR7 = Promoted
	{
		LV_Add("", "# " VAR2 " " VAR " Is Regular ")
		NEWREG = %VAR2%
		return
	}
	if VAR8 = Frezze
	{
		LV_Add("", "% Crime " VAR2 " Asked to Stop ")
		return
	}
	if VAR6 = Disabled
	{
		LV_Add("","!! " ADDLINE )
		return
	}
	if VAR5 = Placed	
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Hit " VAR2 " " VAR3 " " VAR9 " " VAR10 " For " VAR12)
		return
	}
	if VAR5 = Offered
		if VAR9 = Clothes.
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Offer " VAR2 " Clothes")
		gosub clothesbuy
		return
	}
	if VAR8 = Gift!	
	{
		if ENABLE_DEBUG = 1
			LV_Add("","!! Gift")
		gosub gift
		return
	}
}	
if VAR5 = {D6D631}/truckmsg
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Car Entered Truck")
	return
}
if VAR6 = Police
{
	if ENABLE_DEBUG = 1
		LV_Add("", "# Police")
	PLAYERISINPD = 1
	OLDVAR = %VAR8% %VAR9% %VAR10% %VAR11% %VAR12% %VAR13% %VAR14% 
	gosub VARFIX
	return
}


if VAR4 = Sent
{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# Sent " VAR5 " " VAR6 " " VAR7 " " VAR8)		
	return
}
if VAR4 = Activated
{					
	if ENABLE_DEBUG = 1
		LV_Add("", "# Activated")	
	return
}
if VAR4 = Sold
{					
	if ENABLE_DEBUG = 1
		LV_Add("", "# Sold ")	
	return
}
if VAR4 = Offered
{					
	if ENABLE_DEBUG = 1
		LV_Add("", "# Offered")	
	return
}
if VAR6 = Outstanding
{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# Paid Outstanding")		
	return
}
if VAR6 = Bail
{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# Paid Bail")		
	return
}
if VAR8 = Rent.
{					
	if ENABLE_DEBUG = 1
		LV_Add("", "# Paid Rent")	
	return
}
if VAR7 = Feed
{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# Paid Feed")			
	return
}
if VAR5 = Arrested
{
	if VAR6 Jury
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# Jury Selected")	
		return
	}
}
if VAR7 = Social
{
	if VAR8 Security
	{
		if ENABLE_DEBUG = 1
			LV_Add("", "# " VAR2 " Has Received A Social Security Check")	
		return
	}
}

IfInString, VAR4 , Died
{
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3)
	return
}
if VAR6 = Insulted
	if VAR8 = Death
	{				
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " " VAR3 " Insulted " VAR10 " " VAR11)			
	return
	}
if VAR5 = Puked
	IfInString, VAR8 , Death
	{				
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead " VAR2 " VAR3 " " Puked ")			
	return
}
if VAR6 = Juror
	IfInString, VAR7 , Bonus
	{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# You Received A $5000 Juror Bonus")			
	return
}


if VAR9 = Driver.
	{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# " VAR2 " " VAR3 " Is On Duty As A Driver " VAR12)			
	return
}
if VAR6 = Shot
	{				
	if ENABLE_DEBUG = 1
		LV_Add("","!! Dead" VAR2 " " VAR3 " Has Been Shot For Being On Police Property")			
	return
}
if VAR6 = Social
	{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# " VAR2 " " VAR3 " Has Received A Social Security Check")			
	return
}
if VAR5 = Cancelled
	{				
	if ENABLE_DEBUG = 1
		LV_Add("", "# " VAR2 " " VAR3 " Cancelled Hit " VAR8 " " VAR9 )			
	return
}
if ENABLE_DEBUG = 1
{
	LV_Add("","# No Match " A_LoopReadLine)
	FileAppend, %A_LoopReadLine%`n , C:\nomatch.txt
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FILTER END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SCRIPT FUCNTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
VARFIX:	
VARFIX = %OLDVAR%
VARFIX := RegExReplace(VARFIX, "[{][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][A-F 0-9][}]", "") 
NEWVAR = %VARFIX%
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " = " OLDVAR " " VARFIX)
return
FISHING:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " = " Delay)
SetTimer, Fish, %Delay%
return
FISH:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " = " FISH)
SetTimer, Fish, off
gosub SAMPDETECT 
if game = 0
	return
if FISHON=0
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
if ENABLE_DEBUG = 2
	LV_Add("","- "A_ThisLabel)
FISH = 3
return
FISHOFF:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
FISH = 0
FISHOUT:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
FISH = 1
return
CHATIN:


	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel " = " A_PriorHotkey " and " A_ThisHotkey " Clip " clipcont)
IF CHATBOX = OPEN
	{
		if clipboard = NUL
		{
			clipcont = 0
			return
		}
		SendInput ^A^X{ENTER}
		if clipboard = NUL
			clipcont = 0
		else
			clipcont = 1
	}
return
CHATOUT:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
IF CHATBOX = OPEN
	{
		if clipcont = 1
			SendInput t^V
		clipboard =
		clipcont = 0
	}
return

3buttonDefualt:
	if ENABLE_DEBUG = 2
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
Delay = 2000
gosub fishsave
gosub fishsize
return
3buttonMost:
	if ENABLE_DEBUG = 2
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
Sardine = 0
Salmon = 10
Shrimp = 0
Sturgeon = 100
Flounder = 1
Haddock = 1
Herring = 1
Stingray = 100
Carp = 5
Halibut = 15
Sole = 1
Babyseal = 1
Delay = 2000
gosub fishsave
gosub fishsize
return

3buttonBig:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 75
Grouper = 75
Red = 50
Trout = 75
Blue = 200
Mackerel = 100
Sea = 50
Pike = 50
Sail = 50
Tuna = 10
Eel = 35
Dolphin = 120
Shark = 400
Turtle = 50
Catfish = 10
Swordfish = 400
Squid = 200
Barracuda = 40
Piranha = 8
Lobster = 20
Cod = 100
Sardine = 1
Salmon = 100
Shrimp = 1
Sturgeon = 600
Flounder = 20
Haddock = 20
Herring = 20
Stingray = 800
Carp = 80
Halibut = 200
Sole = 8
Babyseal = 50
Delay = 2000
gosub fishsave
gosub fishsize
return
3buttonKiller:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
gui 3:destroy
Amberjack = 120
Grouper = 90
Red = 40
Trout = 100
Blue = 1500
Mackerel = 100
Sea = 35
Pike = 40
Sail = 85
Tuna = 8
Eel = 9
Dolphin = 150
Shark = 200
Turtle = 150
Catfish = 12
Swordfish = 600
Squid = 900
Barracuda = 15
Piranha = 5
Lobster = 35
Cod = 150
Sardine = 1
Salmon = 50
Shrimp = 10
Sturgeon = 1250
Flounder = 25
Haddock = 20
Herring = 20
Stingray = 500
Carp = 40
Halibut = 150
Sole = 5
Babyseal = 30
Delay = 2000
gosub fishsave
gosub fishsize
return

3buttonApply:
Gui 3:Submit
gui 3:destroy
gosub fishsave
gosub fishsize
return

FISHSAVE:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
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
	INIWRITE, %FISHSELL%, %inifile%, SETTINGS, FISHSELL
return
FISHREAD:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
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
SETTINGSAVE:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
	gosub INIWRITE
	return
KILLSAMP:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
IfWinExist , San Andreas Multiplayer
	{
	run C:\Windows\System32\taskkill.exe /IM samp.exe , Hide
	WinWaitClose
	}
return
SERVER1:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " = " SERVER1)
gosub CHECKPATH
gosub KILLSAMP
run "%samp%\samp.exe" %SERVER1%
SetCapsLockState , oFF
gosub KILLMULTI
return
SERVER2:
if ENABLE_DEBUG = 2
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
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel " = " game)
Return
ANTISPAM:
StringLen, keylen , A_ThisHotkey
if keylen > 0
	keylen -- %keylen%
StringTrimLeft, keylast, A_ThisHotkey, %keylen%
KeyWait, %keylast% ,
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " = " keylast)
Return
login:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
if LOGONON=0
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
SetTimer , RandomLotto , off
if Lottery = 1
	return
gosub SAMPDETECT 
if game = 0
	return
Random, RLOTTO , 1, 150
gosub CHATIN
sendinput t/lotto %RLOTTO%{enter}
gosub CHATOUT
SLOTTO = 0
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " " Lottery " " RLOTTO)
return
FailLotto:
SetTimer , FailLotto , off
if Lottery = 1
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
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " " Lottery " " RLOTTO)
return
Guilotto:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel)
SetTimer ,Guilotto, off
if Lottery = 1
	return
gosub SAMPDETECT 
if game = 0
	return
gosub CHATIN
sendinput t/lotto %GUILOTTO%{enter}
gosub CHATOUT
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel " " Lottery " " GUILOTTO)
return
lotto:
if ENABLE_DEBUG = 2
	LV_Add("", "# Lotto Played")

if Lottery = 1
	return
if LOTTOON=0
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
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
return
checkchat:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
if CHATLOG = nul
{
	MsgBox , 3, Fishlog by Billman, Automaticly Find Chatlog.txt?`nThis may take a some time.`n
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
		MsgBox, 0, Automation Disabled, Automatic featuers are Unavalible`nLocate Chatlog.txt to Enable Automation`nFile - Open and select Chatlog.txt
		goto BOOT
	}
}
IfExist , %CHATLOG%\chatlog.txt
{
	SetWorkingDir ,%CHATLOG%
	Gui, destroy
	goto boot 
}

findlogfile:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
Gui add, ListView , W700 h300 gSelectChatlog, Chatlog.txt Locations|Modified
Gui add, Checkbox , x10 y310 vMakeChatPerma , Make Selection Permanent 
Gui , show , ,Chatlog Selector for Fishlog

	MSG = Found Drive
	DriveGet, LocalDrives, List
	LV_Add("", MSG a_space LocalDrives)
	Loop, Parse, LocalDrives , ,
	{
		DUDFILECOUNT++
		MSG = Searching Drive
		LV_Add("", MSG a_space A_LoopField)
		if BOOT = 1
		return
		SetWorkingDir , %A_LoopField%:\ 
		Loop, chatlog.txt , 1, 1
		{
			FILECOUNT++
			if BOOT = 1
				return
			StringReplace, CHATFOUNDAT, A_LoopFileLongPath, \%logfile% ,, All 
			LV_Add("", CHATFOUNDAT , A_LoopFileTimeModified)
		}
	}
	LV_Add("", "Search Complete Counted" A_Space FILECOUNT)

	if FILECOUNT = 1
	{
		SetWorkingDir %CHATFOUNDAT%
		INIWRITE, %CHATFOUNDAT%, %inifile%, OVERRIDE, CHATLOG
		gui , destroy
		goto BOOT
	}
;LV_ModifyCol(2, "SortDesc")
return
SelectChatlog:
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)
	IfExist %RowText%\chatlog.txt
		SetWorkingDir, %RowText%
	else
		return
	gui , Submit, NoHide
	if MakeChatPerma = 1
		INIWRITE, %RowText%, %inifile%, OVERRIDE, CHATLOG
	gui , destroy
	goto BOOT
}
return

KEYBINDCHECK:
gosub SAMPDETECT
	if GAME = 0
		return
	if ENABLE_DEBUG = 2
	LV_Add("", A_ThisLabel " " BINDSOFF DLTOGGLE ANTIPAUSEON ANIMATIONON SKILLON MENUON PROGRAMON)
	Hotkey, IfWinActive, ahk_class Grand theft auto San Andreas
	hotkey ,$t , BIND_T 
	hotkey ,$`` , BIND_T 
	hotkey ,$enter , BIND_ENTER
if BINDSOFF = 0
	{
	if DLTOGGLE = 1
		hotkey ,$CapsLock , BIND_CAPS 
	if ANTIPAUSEON = 1
	{
		hotkey ,$^esc , cancel 
		hotkey ,$!esc , exit
		Hotkey ,$LWin , BIND_WINKEY
	}
	if ANIMATIONON=1
	{
		Hotkey ,$APPSKEY , APPSKEY
		Hotkey ,$^ENTER, lock
		Hotkey ,$!ENTER, unlock
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
		Hotkey ,$^B, bail
		Hotkey ,$^C, courier
		Hotkey ,$^F, flower
		Hotkey ,$^M, mission
		Hotkey ,$^J, jaillist
		Hotkey ,$^/, pill
		Hotkey ,$^v, vehrepair
	}
	if SKILLON=1
	{
		Hotkey ,$!^F, food
		Hotkey ,$!^H, medic
		Hotkey ,$!^t, tip
		Hotkey ,$!^W, weapons
		Hotkey ,$!^D, drugs
		Hotkey ,$!^I, items
		Hotkey ,$!^S, sex
		Hotkey ,$!^M, mech
		Hotkey ,$!^C, clothes
		Hotkey ,$!^V, clothessell
		Hotkey ,$!^B, clothesbuy
		Hotkey ,$!^\, stsply
		Hotkey ,$!^P, prices
		Hotkey ,$!^PGUP, accept
		Hotkey ,$!^PGDN, refuse
		Hotkey ,$!^R, robbery
		Hotkey ,$^!AppsKey, sellmenu
		Hotkey ,$^L, shoplift
		Hotkey ,$^h, holdup
		Hotkey ,$^u, ups
		Hotkey ,$^r, robbery	
		Hotkey ,$^k, cook	
		if FPSON=1
			hotkey ,$!TAB , FPSTAB
		if FPSON=0
			hotkey ,$!TAB , ALTTAB
	}
	if MENUON=1
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
	if PROGRAMON=1
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
	
		if PROGRAMON=1
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

return
MyListView:
return
COLORSET:
	if ENABLE_DEBUG = 2
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
if COLOR1 =vermillion solid
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
INIWRITE:
	if ENABLE_DEBUG = 2
			LV_Add("","- " A_ThisLabel " = " inifile)
			
			
INIWRITE, %GUIFONT%, %inifile%, GUI, GUIFONT
INIWRITE, %SERVER1%, %inifile%, GUI, SERVER1
INIWRITE, %SERVER2%, %inifile%, GUI, SERVER2
INIWRITE, %X%, %inifile%, GUI, X
INIWRITE, %Y%, %inifile%, GUI, Y
INIWRITE, %Width%, %inifile%, GUI, Width
INIWRITE, %Height%, %inifile%, GUI, Height
INIWRITE, %F1E%, %inifile%, Keybinds ,  F1Enabled
INIWRITE, %F2E%, %inifile%, Keybinds ,  F2Enabled
INIWRITE, %F3E%, %inifile%, Keybinds ,  F3Enabled
INIWRITE, %F4E%, %inifile%, Keybinds ,  F4Enabled
INIWRITE, %F5E%, %inifile%, Keybinds ,  F5Enabled
INIWRITE, %F6E%, %inifile%, Keybinds ,  F6Enabled
INIWRITE, %F7E%, %inifile%, Keybinds ,  F7Enabled
INIWRITE, %F8E%, %inifile%, Keybinds ,  F8Enabled
INIWRITE, %F9E%, %inifile%, Keybinds ,  F9Enabled
INIWRITE, %F10E%, %inifile%, Keybinds , F10Enabled
INIWRITE, %F11E%, %inifile%, Keybinds , F11Enabled
INIWRITE, %F12E%, %inifile%, Keybinds , F12Enabled
INIWRITE, %F1%, %inifile%, Keybinds	, F1Bind
INIWRITE, %F2%, %inifile%, Keybinds	, F2Bind
INIWRITE, %F3%, %inifile%, Keybinds	, F3Bind
INIWRITE, %F4%, %inifile%, Keybinds	, F4Bind
INIWRITE, %F5%, %inifile%, Keybinds	, F5Bind
INIWRITE, %F6%, %inifile%, Keybinds	, F6Bind
INIWRITE, %F7%, %inifile%, Keybinds	, F7Bind
INIWRITE, %F8%, %inifile%, Keybinds	, F8Bind
INIWRITE, %F9%, %inifile%, Keybinds	, F9Bind
INIWRITE, %F10%, %inifile%, Keybinds	, F10Bind
INIWRITE, %F11%, %inifile%, Keybinds	, F11Bind
INIWRITE, %F12%, %inifile%, Keybinds	, F12Bind
INIWRITE, %BINDSOFF%, %inifile%, Keybinds	, BINDSOFF
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
INIWRITE, %NAME%,  %inifile%, SETTINGS, Name
INIWRITE, %LOTTO%, %inifile%, SETTINGS, LOTTO
INIWRITE, %GUILOTTO%, %inifile%, SETTINGS, GUILOTTO
INIWRITE, %ALOTTO%, %inifile%, SETTINGS, ALOTTO
INIWRITE, %Jury%,   %inifile%, SETTINGS, Jury
INIWRITE, %F1E%, %inifile%, Keybinds ,  F1Enabled
INIWRITE, %F2E%, %inifile%, Keybinds ,  F2Enabled
INIWRITE, %F3E%, %inifile%, Keybinds ,  F3Enabled
INIWRITE, %F4E%, %inifile%, Keybinds ,  F4Enabled
INIWRITE, %F5E%, %inifile%, Keybinds ,  F5Enabled
INIWRITE, %F6E%, %inifile%, Keybinds ,  F6Enabled
INIWRITE, %F7E%, %inifile%, Keybinds ,  F7Enabled
INIWRITE, %F8E%, %inifile%, Keybinds ,  F8Enabled
INIWRITE, %F9E%, %inifile%, Keybinds ,  F9Enabled
INIWRITE, %F10E%, %inifile%, Keybinds , F10Enabled
INIWRITE, %F11E%, %inifile%, Keybinds , F11Enabled
INIWRITE, %F12E%, %inifile%, Keybinds , F12Enabled
INIWRITE, %F1%, %inifile%, Keybinds	, F1Bind
INIWRITE, %F2%, %inifile%, Keybinds	, F2Bind
INIWRITE, %F3%, %inifile%, Keybinds	, F3Bind
INIWRITE, %F4%, %inifile%, Keybinds	, F4Bind
INIWRITE, %F5%, %inifile%, Keybinds	, F5Bind
INIWRITE, %F6%, %inifile%, Keybinds	, F6Bind
INIWRITE, %F7%, %inifile%, Keybinds	, F7Bind
INIWRITE, %F8%, %inifile%, Keybinds	, F8Bind
INIWRITE, %F9%, %inifile%, Keybinds	, F9Bind
INIWRITE, %F10%, %inifile%, Keybinds	, F10Bind
INIWRITE, %F11%, %inifile%, Keybinds	, F11Bind
INIWRITE, %F12%, %inifile%, Keybinds	, F12Bind
INIWRITE, %BIND1E%, %inifile%, Keybinds ,  BIND1Enabled
INIWRITE, %BIND2E%, %inifile%, Keybinds ,  BIND2Enabled
INIWRITE, %BIND3E%, %inifile%, Keybinds ,  BIND3Enabled
INIWRITE, %BIND4E%, %inifile%, Keybinds ,  BIND4Enabled
INIWRITE, %BIND5E%, %inifile%, Keybinds ,  BIND5Enabled
INIWRITE, %BIND6E%, %inifile%, Keybinds ,  BIND6Enabled
INIWRITE, %BIND7E%, %inifile%, Keybinds ,  BIND7Enabled
INIWRITE, %BIND8E%, %inifile%, Keybinds ,  BIND8Enabled
INIWRITE, %BIND9E%, %inifile%, Keybinds ,  BIND9Enabled
INIWRITE, %BIND10E%, %inifile%, Keybinds , BIND10Enabled
INIWRITE, %BIND11E%, %inifile%, Keybinds , BIND11Enabled
INIWRITE, %BIND12E%, %inifile%, Keybinds , BIND12Enabled
INIWRITE, %BIND1%, %inifile%, Keybinds	, BIND1Bind
INIWRITE, %BIND2%, %inifile%, Keybinds	, BIND2Bind
INIWRITE, %BIND3%, %inifile%, Keybinds	, BIND3Bind
INIWRITE, %BIND4%, %inifile%, Keybinds	, BIND4Bind
INIWRITE, %BIND5%, %inifile%, Keybinds	, BIND5Bind
INIWRITE, %BIND6%, %inifile%, Keybinds	, BIND6Bind
INIWRITE, %BIND7%, %inifile%, Keybinds	, BIND7Bind
INIWRITE, %BIND8%, %inifile%, Keybinds	, BIND8Bind
INIWRITE, %BIND9%, %inifile%, Keybinds	, BIND9Bind
INIWRITE, %BIND10%, %inifile%, Keybinds	, BIND10Bind
INIWRITE, %BIND11%, %inifile%, Keybinds	, BIND11Bind
INIWRITE, %BIND12%, %inifile%, Keybinds	, BIND12Bind
INIWRITE, %COLOR1%, %inifile%, VEHCOLOR	, COLOR1
INIWRITE, %COLOR2%, %inifile%, VEHCOLOR	, COLOR2
INIWRITE, %COLORENABLE%, %inifile%, VEHCOLOR	, COLORENABLE
INIWRITE, %FISHSELL%, %inifile%, SETTINGS, FISHSELL
INIWRITE, %fps%, %inifile%, SETTINGS, fps
INIWRITE, %fpslow%, %inifile%, SETTINGS, fpslow
INIWRITE, %fpshigh%, %inifile%, SETTINGS, fpshigh
INIWRITE, %DONATOROVERIDE%, %inifile%, SETTINGS, DONATOROVERIDE
INIWRITE, %CHATON%, %inifile%, OVERRIDE,  CHATON
INIWRITE, %LOGONON%, %inifile%, OVERRIDE, LOGONON
INIWRITE, %FISHON%, %inifile%, OVERRIDE, FISHON
INIWRITE, %THROWON%, %inifile%, OVERRIDE, THROWON
INIWRITE, %SELLON%, %inifile%, OVERRIDE, SELLON
INIWRITE, %DRUGSON%, %inifile%, OVERRIDE, DRUGSON
INIWRITE, %JURYON%, %inifile%, OVERRIDE, JURYON
INIWRITE, %LOTTOON%, %inifile%, OVERRIDE, LOTTOON
INIWRITE, %TICKETON%, %inifile%, OVERRIDE, TICKETON
INIWRITE, %HOUSEON%, %inifile%, OVERRIDE, HOUSEON
INIWRITE, %COLORON%, %inifile%, OVERRIDE, COLORON
INIWRITE, %PROGRAMON%, %inifile%, OVERRIDE, PROGRAMON
INIWRITE, %ANIMATIONON%, %inifile%, OVERRIDE, ANIMATIONON
INIWRITE, %SKILLON%, %inifile%, OVERRIDE, SKILLON
INIWRITE, %MENUON%, %inifile%, OVERRIDE, MENUON
INIWRITE, %FPSON% , %inifile%, OVERRIDE, FPSON 
INIWRITE, %JOURNALON%, %inifile%, OVERRIDE, JOURNALON
INIWRITE, %BONUSON%, %inifile%, OVERRIDE, BONUSON
INIWRITE, %ANTIPAUSEON%, %inifile%, OVERRIDE, ANTIPAUSEON
INIWRITE, %DLTOGGLE%, %inifile%, OVERRIDE, DLTOGGLE
INIWRITE, %CHATIGNORE%, %inifile%, OVERRIDE, CHATIGNORE
INIWRITE, %CNRRADIO%, %inifile%, OVERRIDE, CNRRADIO
INIWRITE, %ENABLE_DICE%, %inifile%, OVERRIDE, ENABLE_DICE
INIWRITE, %PLAYDICEA%, %inifile%, OVERRIDE, PLAYDICEA
INIWRITE, %NOCHAT%, %inifile%, OVERRIDE, NOCHAT
INIWRITE, %ENABLE_DEBUG%, %inifile%, OVERRIDE, ENABLE_DEBUG
INIWRITE, %DICE%, %inifile%, OVERRIDE, DICE
INIWRITE, %DONATOR%, %inifile%, OVERRIDE, DONATOR


return
INIREAD:
	if ENABLE_DEBUG = 2
		LV_Add("","- " A_ThisLabel " = " inifile)
	STATUS = INIREAD
	gosub fishread
	CHATLOG_STATUS = 
	RegRead, Playername, HKCU, Software\SAMP\ , PlayerName
	RegRead, sadir, HKCU, Software\SAMP , gta_sa_exe
	SplitPath, sadir ,, samp, , , sadrv
	INIREAD, COLORLIST, %inifile%, GUI, COLORLIST, black|white|police car blue|cherry red|midnight blue|temple curtain purple|taxi yellow|striking blue|light blue grey|hoods|saxony blue|concord blue|jasper green |pewter gray|frost white|silver stone|rio red|torino red pearl|formula red|honey beige|mariner blue|blaze red|classic red|winning silver|steel gray|shadow silver|silver stone|warm grey mica|harbor blue|porcelain silver|mellow burgundy|graceful red mica|currant blue|gray|arctic white|anthracite gray|black2|dark green|seafoam|diamond blue biston brown|desert taupe|garnet red|desert red|green|cabernet red|light ivory|pueblo beige|smoke silver|astra silver|ascot gray|agate green|petrol blue green|surf blue|nautical blue|woodrose|crystal blue|bisque frost|currant red solid|lt.crystal blue|lt.titanium|race yellow solid|brt.currant red|clear crystal blue frost|silver|pastel alabaster|mid currant red|med regatta blue|oxford white solid|alabaster solid|elec.currant red|spinnaker blue solid|dk.titanium|pastel alabaster solid|med.cabernet solid|twilight blue|titanium frost|sandalwood frost|wild strawberry|ultra blue|vermilion solid|med.sandalwood|med.red solid|deep jewel green|med.woodrose|vermillion solid|green|bright blue|bright red|lt.champagne|silver2|steel blue|medium gray|arctic pearl|nassau blue|med.sapphire blue|silver3|lt.sapphire blue|malachite|flax|med.maui blue|dk.sapphire blue|copper beige|bright blue|med.flax|med.gray|bright blue|lt.driftwood|blue|steel gray|lt.beechwood|slate gray|lt.sapphire blue|dk.beechwood|torch red|bright red|med.sapphire blue firemist|med.garnet red|white diamond pearl|dk.sable|antelope beige|brilliant red|gun metal|med.beechwood|brilliant red|bright blue|pink
	INIREAD, CNRRADIO, %inifile%, OVERRIDE, CNRRADIO , 0
	INIREAD, CHATLOG, %inifile%, OVERRIDE, CHATLOG , nul
	INIREAD, GUIFONT, %inifile%, GUI, GUIFONT, 12
	INIREAD, SERVER1, %inifile%, GUI, SERVER1, 50.31.100.10:7788
	INIREAD, SERVER2, %inifile%, GUI, SERVER2, 50.31.100.10:7799
	INIREAD, X, %inifile%, GUI, X, 100
	INIREAD, Y, %inifile%, GUI, Y, 100
	INIREAD, Width, %inifile%, GUI, Width , 700
	INIREAD, Height, %inifile%, GUI, Height , 300
	INIREAD, F1E,     %inifile% , Keybinds, F1Enabled , 1
	INIREAD, F2E, %inifile% , Keybinds, F2Enabled , 1
	INIREAD, F3E, %inifile% , Keybinds, F3Enabled , 1
	INIREAD, F4E, %inifile% , Keybinds, F4Enabled , 1
	INIREAD, F5E, %inifile% , Keybinds, F5Enabled , 1
	INIREAD, F6E, %inifile% , Keybinds, F6Enabled , 1
	INIREAD, F7E, %inifile% , Keybinds, F7Enabled , 1
	INIREAD, F8E, %inifile% , Keybinds, F8Enabled , 1
	INIREAD, F9E, %inifile% , Keybinds, F9Enabled , 1
	INIREAD, F10E, %inifile% , Keybinds, F10Enabled , 1
	INIREAD, F11E, %inifile% , Keybinds, F11Enabled , 1 
	INIREAD, F12E, %inifile% , Keybinds, F12Enabled , 1
	INIREAD, F1, %inifile% ,	Keybinds, F1Bind , t/gps{enter}
	INIREAD, F2, %inifile% , Keybinds, F2Bind , t/pgps{enter}
	INIREAD, F3, %inifile% , Keybinds, F3Bind , t/inv{enter}
	INIREAD, F4, %inifile% , Keybinds, F4Bind , t/bankinfo{enter}
	INIREAD, F5, %inifile% , Keybinds, F5Bind , t/fs{enter}
	INIREAD, F6, %inifile% , Keybinds, F6Bind , t/calls{enter}
	INIREAD, F7, %inifile% , Keybinds, F7Bind , t/mr{enter}
	INIREAD, F8, %inifile% , Keybinds, F8Bind , t/vsi{enter}
	INIREAD, F9, %inifile% , Keybinds, F9Bind , t/finfo{enter}
	INIREAD, F10, %inifile% , Keybinds, F10Bind , t/frel{enter}
	INIREAD, F11, %inifile% , Keybinds, F11Bind , t/rod{enter}
	INIREAD, F12, %inifile% , Keybinds, F12Bind , t/crowbar{enter}	
	INIREAD, BIND1E, %inifile% , Keybinds, BIND1Enabled , 1
	INIREAD, BIND2E, %inifile% , Keybinds, BIND2Enabled , 0
	INIREAD, BIND3E, %inifile% , Keybinds, BIND3Enabled , 1
	INIREAD, BIND4E, %inifile% , Keybinds, BIND4Enabled , 1
	INIREAD, BIND5E, %inifile% , Keybinds, BIND5Enabled , 1
	INIREAD, BIND6E, %inifile% , Keybinds, BIND6Enabled , 1
	INIREAD, BIND7E, %inifile% , Keybinds, BIND7Enabled , 1
	INIREAD, BIND8E, %inifile% , Keybinds, BIND8Enabled , 1
	INIREAD, BIND9E, %inifile% , Keybinds, BIND9Enabled , 1
	INIREAD, BIND10E, %inifile% , Keybinds, BIND10Enabled , 1
	INIREAD, BIND11E, %inifile% , Keybinds, BIND11Enabled , 1 
	INIREAD, BIND12E, %inifile% , Keybinds, BIND12Enabled , 1
	INIREAD, BIND1, %inifile% ,	Keybinds, BIND1Bind , t/gps{enter}
	INIREAD, BIND2, %inifile% , Keybinds, BIND2Bind , t/pgps{enter}
	INIREAD, BIND3, %inifile% , Keybinds, BIND3Bind , t/inv{enter}
	INIREAD, BIND4, %inifile% , Keybinds, BIND4Bind , t/bankinfo{enter}
	INIREAD, BIND5, %inifile% , Keybinds, BIND5Bind , t/fs{enter}
	INIREAD, BIND6, %inifile% , Keybinds, BIND6Bind , t/calls{enter}
	INIREAD, BIND7, %inifile% , Keybinds, BIND7Bind , t/mr{enter}
	INIREAD, BIND8, %inifile% , Keybinds, BIND8Bind , t/vsi{enter}
	INIREAD, BIND9, %inifile% , Keybinds, BIND9Bind , t/finfo{enter}
	INIREAD, BIND10, %inifile% , Keybinds, BIND10Bind , t/frel{enter}
	INIREAD, BIND11, %inifile% , Keybinds, BIND11Bind , t/rod{enter}
	INIREAD, BIND12, %inifile% , Keybinds, BIND12Bind , t/crowbar{enter}	
	INIREAD, BINDSOFF, %inifile%, Keybinds	, BINDSOFF , 0
	INIREAD, COLOR1, %inifile% , VEHCOLOR, COLOR1  , Black
	INIREAD, COLOR1, %inifile% , VEHCOLOR, COLOR2  , White
	INIREAD, NAME, %inifile%, SETTINGS, Name , billman87
	INIREAD, LOTTO, %inifile%, SETTINGS, LOTTO , 0
	INIREAD, GUILOTTO, %inifile%, SETTINGS, GUILOTTO , 0
	INIREAD, ALOTTO, %inifile%, SETTINGS, ALOTTO , 1
	INIREAD, JURY,	 %inifile%, SETTINGS, Jury , 0
	INIREAD, COLOR1, %inifile%, VEHCOLOR, COLOR1 , Black
	INIREAD, COLOR2, %inifile%, VEHCOLOR, COLOR2 , White
	INIREAD, COLORENABLE, %inifile%, VEHCOLOR	, COLORENABLE ,0
	INIREAD, FISHSELL, %inifile%, SETTINGS, FISHSELL ,1
	INIREAD, DONATOROVERIDE, %inifile%, SETTINGS, DONATOROVERIDE
	INIREAD, CHATON, %inifile%, OVERRIDE, CHATON ,1
	INIREAD, LOGONON, %inifile%, OVERRIDE, LOGONON ,1
	INIREAD, FISHON, %inifile%, OVERRIDE, FISHON ,1
	INIREAD, THROWON, %inifile%, OVERRIDE, THROWON ,1
	INIREAD, SELLON, %inifile%, OVERRIDE, SELLON ,1
	INIREAD, DRUGSON, %inifile%, OVERRIDE, DRUGSON ,0
	INIREAD, JURYON, %inifile%, OVERRIDE, JURYON ,1
	INIREAD, LOTTOON, %inifile%, OVERRIDE, LOTTOON ,1
	INIREAD, TICKETON, %inifile%, OVERRIDE, TICKETON ,0
	INIREAD, HOUSEON, %inifile%, OVERRIDE, HOUSEON ,1
	INIREAD, COLORON, %inifile%, OVERRIDE, COLORON ,0
	INIREAD, PROGRAMON, %inifile%, OVERRIDE, PROGRAMON ,1
	INIREAD, ANIMATIONON, %inifile%, OVERRIDE, ANIMATIONON ,1
	INIREAD, SKILLON, %inifile%, OVERRIDE, SKILLON ,1
	INIREAD, MENUON, %inifile%, OVERRIDE, MENUON ,1
	INIREAD, FPSON , %inifile%, OVERRIDE, FPSON  ,0
	INIREAD, JOURNALON, %inifile%, OVERRIDE, JOURNALON ,0
	INIREAD, BONUSON, %inifile%, OVERRIDE, BONUSON ,0
	INIREAD, ANTIPAUSEON, %inifile%, OVERRIDE, ANTIPAUSEON ,0
	INIREAD, DLTOGGLE, %inifile%, OVERRIDE, DLTOGGLE ,0
	INIREAD, CHATIGNORE, %inifile%, OVERRIDE, CHATIGNORE ,0
	INIREAD, fps, %inifile%, SETTINGS, fps ,60
	INIREAD, fpslow, %inifile%, SETTINGS, fpslow ,20
	INIREAD, fpshigh, %inifile%, SETTINGS, fpshigh ,60
	INIREAD, AUTOFISH, %inifile%, SETTINGS, AUTOFISH ,1
	INIREAD, FISH, %inifile%, SETTINGS, FISH ,0
	INIREAD, ENABLE_DICE, %inifile%, OVERRIDE, ENABLE_DICE , 0 
	INIREAD, PLAYDICEA, %inifile%, OVERRIDE, PLAYDICEA , 0
	INIREAD, NOCHAT, %inifile%, OVERRIDE, NOCHAT , 0
	INIREAD, ENABLE_DEBUG, %inifile%, OVERRIDE, ENABLE_DEBUG , 0
	INIREAD, DICE, %inifile%, OVERRIDE, DICE, 10000
	INIREAD, DONATOR, %inifile%, OVERRIDE, DONATOR , 1
	
	if JURY = 1
		radio1 = Checked
	if JURY = 2
		radio2 = Checked
	if JURY = 3
		radio3 = Checked
	if ALOTTO = 0
		BLOTTO = UnCheck
	if ALOTTO = 1
		BLOTTO = Checked
	if X= -32000
	{
		X= 100
		Height = 250
	}
	if Y= -32000
	{
		Y= 100
		Width= 500
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
	if ENABLE_DEBUG = 2
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
	FileAppend, Play2Hard`n , %blacklist%
}
Loop, Read, %blacklist%
	ignblack = %black% %A_LoopField%
return
NAMEFIX:
if ENABLE_DEBUG = 2
	LV_Add("", A_ThisLabel " from " PLAYER " to " INGPLAYER )
INGPLAYER := RegExReplace(PLAYER, "!", "{!}", "", -1, 1)
INGPLAYER := RegExReplace(PLAYER, "!!", "{!!}", "", -1, 1)
INGPLAYER := RegExReplace(PLAYER, "!!!", "{!!!}", "", -1, 1)
INGPLAYER := RegExReplace(INGPLAYER, "#", "{#}", "", -1, 1)
INGPLAYER := RegExReplace(INGPLAYER, "@", "{@}", "", -1, 1)
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SCRIPT Function END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GAME MACROS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

gpsmission:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
	if game = 0
	return
	gosub CHATIN
	SendInput t/gps{enter}t 1{enter}t 1{enter}
	gosub CHATOUT
	goto antispam

sit8:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT
	if game = 0
	return
	gosub CHATIN
	SendInput t/sit 8{enter}
	gosub CHATOUT
	goto antispam
sit:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sit{enter}
	gosub CHATOUT
	goto antispam
sell:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sell $ply{enter}
	gosub CHATOUT
	goto antispam
sellmenu:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/sellmenu{enter}
	gosub CHATOUT
	goto antispam
throwback:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if THROWON=0
	return
	finv = 0
	gosub SAMPDETECT 
	if game = 0
	return
	gosub FISHOUT	
	gosub CHATIN
	sendinput t/tb{enter}
	gosub CHATOUT
	goto antispam
fishinv:
	if ENABLE_DEBUG = 2
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
	goto antispam
pay:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if TICKETON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/pay{enter}
	gosub CHATOUT
	goto antispam
	return
house:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if HOUSEON=0
	return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/house{enter}
	gosub CHATOUT
	goto antispam
escape:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if ANTIPAUSEON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t/esc{enter}
	gosub CHATOUT
	goto antispam
takedrugs:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if DRUGSON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/td %FTD%{enter}
	gosub CHATOUT
	goto antispam
jury:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if JURYON=0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	IF Jury = 1
		return
	If Jury = 2
	{
		gosub CHATIN
		SendInput t/jury{enter}
		gosub CHATOUT
	}
	goto antispam
DL:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if DLTOGGLE = 0
		return
	gosub SAMPDETECT 
	if game = 0
		return
	SetCapsLockState , oFF
	gosub CHATIN
	SendInput t/dl{enter}
	gosub CHATOUT
	goto antispam
Cancel:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	SendInput t/Cancel{enter}
	gosub CHATOUT
	return
t1:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 1{enter}
	gosub CHATOUT
	goto antispam
t2:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 2{enter}
	gosub CHATOUT
	goto antispam
t3:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 3{enter}
	gosub CHATOUT
	goto antispam
t4:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 4{enter}
	gosub CHATOUT
	goto antispam
t5:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 5{enter}
	gosub CHATOUT
	goto antispam
t6:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 6{enter}
	gosub CHATOUT
	goto antispam
t7:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 7{enter}
	gosub CHATOUT
	goto antispam
t8:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 8{enter}
	gosub CHATOUT
	goto antispam
t9:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t 9{enter}
	gosub CHATOUT
	goto antispam
t10:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t10{enter}
	gosub CHATOUT
	goto antispam
t11:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t11{enter}
	gosub CHATOUT
	goto antispam
t12:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t12{enter}
	gosub CHATOUT
	goto antispam
t13:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t13{enter}
	gosub CHATOUT
	goto antispam
t14:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t14{enter}
	gosub CHATOUT
	goto antispam
t15:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t15{enter}
	gosub CHATOUT
	goto antispam
t16:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t16{enter}
	gosub CHATOUT
	goto antispam
t17:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t17{enter}
	gosub CHATOUT
	goto antispam
t18:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t18{enter}
	gosub CHATOUT
	goto antispam
t19:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t19{enter}
	gosub CHATOUT
	goto antispam
t20:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t20{enter}
	gosub CHATOUT
	goto antispam
t21:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t21{enter}
	gosub CHATOUT
	goto antispam
t22:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t22{enter}
	gosub CHATOUT
	goto antispam
t23:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t23{enter}
	gosub CHATOUT
	goto antispam
t24:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t24{enter}
	gosub CHATOUT
	goto antispam
t25:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t25{enter}
	gosub CHATOUT
	goto antispam
t26:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t26{enter}
	gosub CHATOUT
	goto antispam
t27:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t27{enter}
	gosub CHATOUT
goto antispam
t28:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t28{enter}
	gosub CHATOUT
	goto antispam
t29:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t29{enter}
	gosub CHATOUT
	goto antispam
t30:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	sendinput t30{enter}
	gosub CHATOUT
	goto antispam
F1:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F1E = 0
		return
	gosub CHATIN
	sendinput %F1%{enter}
	gosub CHATOUT
	goto antispam
F2:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F2E = 0
		return
	gosub CHATIN
	sendinput %F2%{enter}
	gosub CHATOUT
	goto antispam
F3:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F3E = 0
		return
	gosub CHATIN
	sendinput %F3%{enter}
	gosub CHATOUT
	goto antispam
F4:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F4E = 0
		return
	gosub CHATIN
	sendinput %F4%{enter}
	gosub CHATOUT
	goto antispam
F5:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F5E = 0
		return
	gosub CHATIN
	sendinput %F5%{enter}
	gosub CHATOUT
	goto antispam
F6:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F6E = 0
		return
	gosub CHATIN
	sendinput %F6%{enter}
	gosub CHATOUT
	goto antispam
F7:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F7E = 0
		return
	gosub CHATIN
	sendinput %F7%{enter}
	gosub CHATOUT
	goto antispam
F8:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	gosub CHATIN
	if F8E = 0
		return
	sendinput %F8%{enter}
	gosub CHATOUT
	goto antispam
F9:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F9E = 0
		return
	gosub CHATIN
	sendinput %F9%{enter}
	gosub CHATOUT
	goto antispam
F10:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F10E = 0
		return
	gosub CHATIN
	sendinput %F10%{enter}
	gosub CHATOUT
	goto antispam
F11:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F11E = 0
		return
	gosub CHATIN
	sendinput %F11%{enter}
	gosub CHATOUT
	goto antispam
F12:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if F12E = 0
		return
	gosub CHATIN
	sendinput %F12%{enter}
	gosub CHATOUT
	goto antispam
BIND1:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND1E = 0
	{
		sendinput {1 down}
		sleep 50
		sendinput {1 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 1
	else
		sendinput %BIND1%{enter}
	goto antispam
	
BIND2:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if BIND2E = 0
	{
		sendinput {2 down}
		sleep 50
		sendinput {2 up}
		goto antispam
	}
	IF CHATBOX = OPEN
	{
		SendInput 2
		goto antispam
	}
	else
	{
		sendinput %BIND2%{enter}
		goto antispam
	}
	

BIND3:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
		return
	if BIND3E = 0
	{
		sendinput {3 down}
		sleep 50
		sendinput {3 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 3
	else
		sendinput %BIND3%{enter}
	goto antispam
BIND4:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND4E = 0
	{
		sendinput {4 down}
		sleep 50
		sendinput {4 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 4 
	else
		sendinput %BIND4%{enter}
	goto antispam
BIND5:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND5E = 0
	{
		sendinput {5 down}
		sleep 50
		sendinput {5 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 5
	else
		sendinput %BIND5%{enter}
	goto antispam
BIND6:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND6E = 0
	{
		sendinput {6 down}
		sleep 50
		sendinput {6 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 6
	else
		sendinput %BIND6%{enter}
	goto antispam
BIND7:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND7E = 0
	{
		sendinput {7 down}
		sleep 50
		sendinput {7 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 7
	else
		sendinput %BIND7%{enter}
	goto antispam
BIND8:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND8E = 0
	{
		sendinput {8 down}
		sleep 50
		sendinput {8 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 8
	else
		sendinput %BIND8%{enter}
	goto antispam
BIND9:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND9E = 0
	{
		sendinput {9 down}
		sleep 50
		sendinput {9 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 9
	else
		sendinput %BIND9%{enter}
	goto antispam
BIND10:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if BIND10E = 0
	{
		sendinput {0 down}
		sleep 50
		sendinput {0 up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput 0
	else
		sendinput %BIND10%{enter}
	goto antispam
BIND11:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
		if BIND11E = 0
	{
		sendinput {- down}
		sleep 50
		sendinput {- up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput `-
	else
		sendinput %BIND11%{enter}
	goto antispam
BIND12:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if BIND12E = 0
	{
		sendinput {= down}
		sleep 50
		sendinput {= up}
		goto antispam
	}
	IF CHATBOX = OPEN
		SendInput `=
	else
		sendinput %BIND12%{enter}
	goto antispam
lock:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lock{enter}
	gosub CHATOUT
	goto antispam
unlock:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/unlock{enter}
	gosub CHATOUT
	goto antispam
bail:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/bail{enter}
	gosub CHATOUT
	goto antispam
bribe:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/br 15000{enter}
	gosub CHATOUT
	goto antispam
buy:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/buy{enter}
	gosub CHATOUT
	goto antispam
courier:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/courier{enter}
	gosub CHATOUT
	goto antispam
mission:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mission{enter}
	gosub CHATOUT
	goto antispam
tip:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/tip{enter}
	gosub CHATOUT
	goto antispam
usedrugs:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/td 28{enter}
	gosub CHATOUT
	goto antispam
assslap:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/assslap{enter}
	gosub CHATOUT
	goto antispam
slap:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/slap{enter}
	gosub CHATOUT
	goto antispam
carkick:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ck{enter}
	gosub CHATOUT
	goto antispam
crossarms:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/crossarms{enter}
	gosub CHATOUT
	goto antispam
cry:
	SetTimer, cry, off
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/cry{enter}
	gosub CHATOUT
	goto antispam
dance:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dance 3{enter}
	gosub CHATOUT
	goto antispam
fart:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fart{enter}
	gosub CHATOUT
	goto antispam
flash:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fl{enter}
	gosub CHATOUT
	goto antispam
go:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/go{enter}
	gosub CHATOUT
	goto antispam
handstand:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/handstand{enter}
	gosub CHATOUT
	goto antispam
hide:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/hide{enter}
	gosub CHATOUT
	goto antispam
idle:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/idle{enter}
	gosub CHATOUT
	goto antispam
jumpkick:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/jumpkick{enter}
	gosub CHATOUT
	goto antispam
ls:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ls{enter}
	gosub CHATOUT
	goto antispam
lay:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lay{enter}
	gosub CHATOUT
	goto antispam
piss:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/piss{enter}
	gosub CHATOUT
	goto antispam
armcross:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/armcross{enter}
	gosub CHATOUT
	goto antispam
point:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/point{enter}
	gosub CHATOUT
	goto antispam
ride:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ride{enter}
	gosub CHATOUT
	goto antispam
scratch:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/scr{enter}
	gosub CHATOUT
	goto antispam
noob:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/noob{enter}
	gosub CHATOUT
	goto antispam
stop:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/stop{enter}
	gosub CHATOUT
	goto antispam
wave:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/hello{enter}
	gosub CHATOUT
	goto antispam
dice:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dice{enter}
	gosub CHATOUT
	goto antispam
playdice:
	SetTimer, playdice, off
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/dice $civ %dice%{enter}
	gosub CHATOUT
	goto antispam
kiss:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/kiss{enter}
	gosub CHATOUT
	goto antispam
lean:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/lean{enter}
	gosub CHATOUT
	goto antispam
flower:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/flower{enter}
	gosub CHATOUT
	goto antispam
fuckoff:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fuck{enter}
	gosub CHATOUT
	goto antispam
wank:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/wank{enter}
	gosub CHATOUT
	goto antispam
weapons:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ws{enter}
	gosub CHATOUT
	goto antispam
mech:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mech{enter}
	gosub CHATOUT
	goto antispam
drugs:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/drugs{enter}
	gosub CHATOUT
	goto antispam
items:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/items{enter}
	gosub CHATOUT
	goto antispam
sex:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sex{enter}
	gosub CHATOUT
	goto antispam
medic:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/h{enter}
	gosub CHATOUT
	goto antispam
clothes:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothes{enter}
	gosub CHATOUT
	goto antispam
clothesbuy:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothesbuy{enter}
	gosub CHATOUT
	goto antispam
clothessell:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/clothessell{enter}
	gosub CHATOUT
	goto antispam
food:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/food{enter}
	gosub CHATOUT
	goto antispam
mourn:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mourn{enter}
	gosub CHATOUT
	goto antispam
jaillist:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/jl{enter}
	gosub CHATOUT
	goto antispam
stsply:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sts $ply{enter}
	gosub CHATOUT
	goto antispam
stshim:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/sts %HIM%{enter}
	gosub CHATOUT
	goto antispam
prices:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/prices{enter}
	gosub CHATOUT
	goto antispam
vehc:
		IN_CH = 0
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if COLORON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub COLORSET
	gosub CHATIN
	sendinput t/vehc %COLORN1% %COLORN2%{enter}
	gosub CHATOUT
	goto antispam
vehrepair:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/vehrepair{enter}
	gosub CHATOUT
	goto antispam
Rod:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/Rod{enter}
	gosub CHATOUT
	goto antispam
pointup:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/pointup{enter}
	gosub CHATOUT
	goto antispam
trick:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	SendInput t/trick{enter}
	gosub CHATOUT
	goto antispam
moneyrush:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if BONUSON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/mr{enter}
	gosub CHATOUT
	goto antispam
bonuscar:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if BONUSON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/vsi{enter}
	gosub CHATOUT
	goto antispam
ups:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ups{enter}
	gosub CHATOUT
	goto antispam
gift:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/gift{enter}
	gosub CHATOUT
	goto antispam
shoplift:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/shoplift{enter}
	gosub CHATOUT
	goto antispam
holdup:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/hup{enter}
	gosub CHATOUT
	goto antispam
pill:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if ANIMATIONON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ad{enter}
	gosub CHATOUT
	goto antispam
radio:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/radio{enter}
	gosub CHATOUT
	goto antispam
accept:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/ac{enter}
	gosub CHATOUT
	goto antispam
exit:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/exit{enter}
	gosub CHATOUT
	goto antispam
refuse:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/refuse{enter}
	gosub CHATOUT
	goto antispam
robbery:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/robbery{enter}
	gosub CHATOUT
	goto antispam
cook:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/cook{enter}
	gosub CHATOUT
	goto antispam

givepoorcash:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/gc %poor% %dice%{enter}
	gosub CHATOUT
	goto antispam
taichi:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if SKILLON = 0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/taichi{enter}
	gosub CHATOUT
	goto antispam
	
	
bonusfish:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	if BONUSON=0
	return
	gosub SAMPDETECT 
	if game = 0
	return
	gosub CHATIN
	sendinput t/fi{enter}
	gosub CHATOUT
	goto antispam

fpslow:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	fps = %fpslow%
	gosub CHATIN
	sendinput t/fpslimit %fpslow%{enter}
	gosub CHATOUT
	
	
return

fpshigh:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	fps = %fpshigh%
	gosub CHATIN
	sendinput t/fpslimit %fpshigh%{enter}
	gosub CHATOUT
return

;;;;;;;;;;HARD BOUND MACRO;;;;;;;;;;;;;;;;

FPSTAB:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if fps = %fpshigh%
		gosub fpslow
	else
		gosub fpshigh
	goto antispam
return
ALTTAB:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	game = 0
	pause = 1
	SendInput {ALT DOWN} {TAB} {ALT UP}
return
BIND_WINKEY:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub SAMPDETECT 
	if game = 0
	return
	if ANTIPAUSE = 0
	return
	gosub Sit8
	sleep 800
	goto antispam
APPSKEY:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub sell
	sleep 800
	goto antispam
BIND_T:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	SetCapsLockState , oFF
	SendInput t
	CHAT = 1
	CHATBOX = OPEN
	Clipboard =
	goto antispam
BIND_ENTER:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	SendInput {ENTER}
	CHAT = 0
	CHATBOX = CLOSED
	;Clipboard = 
	goto antispam
BIND_ESC:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub Cancel
	goto antispam
BIND_CAPS:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	gosub DL
	goto antispam
LButton:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	goto antispam
RButton:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	goto antispam
MButton:
	if ENABLE_DEBUG = 2
	LV_Add("","+ " A_ThisLabel)
	goto antispam

$PAUSE::
	if ENABLE_DEBUG = 2
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
if ENABLE_DEBUG = 2
	LV_Add("","- " A_ThisLabel)
return

;;;Broken;;;

CHATIGNORE:
FileAppend, %INGPLAYER% `n , blacklist.txt
	gosub SAMPDETECT 
	if game = 0
		return
	IfInString , ignwhite, %INGPLAYER%
		return
	if PlayerName = %PLAYER%
		return
	if PLAYER = %LASTIGNORE%
			return
	if CHATIGNORE = 1
	{	
		IfInString ,PLAYER , >
			StringTrimRight, PLAYER , PLAYER, 1
		BADLINE := RegExReplace(ADDLINE, "[[][0-9][0-9]:[0-9][0-9]:[0-9][0-9][]]" , "")
		StringReplace, BADLINE , BADLINE , %PLAYER%
		StringReplace, BADLINE , BADLINE , <>
		INGPLAYER := RegExReplace(INGPLAYER, "!" , "{!}")
		INGPLAYER := RegExReplace(INGPLAYER, "!!" , "{!!}")
		
		gosub CHATIN
			SendInput	t/ign %INGPLAYER%{enter}
		gosub CHATOUT

		if ENABLE_DEBUG = 1
			LV_Add("", "# Ignore "INGPLAYER " for " BADLINE)
		;sleep %SLEEPIGNORE%
		LASTIGNORE = %PLAYER%
	}
return
CHATIGNOREME:
FileAppend, %INGPLAYER% `n , blacklist.txt
	gosub SAMPDETECT 
	if game = 0
		return
	IfEqual , PLAYER ,
		return
	if PlayerName = %PLAYER%
		return
	if CHATIGNORE = 1
	{
		BADLINE := RegExReplace(ADDLINE, "[[][0-9][0-9]:[0-9][0-9]:[0-9][0-9][]]" , "")
		StringReplace, BADLINE , BADLINE , %PLAYER%
		StringReplace, BADLINE , BADLINE , <>
		
		IfInString , ignwhite, %INGPLAYER%
			return
		if PlayerName = %PLAYER%
			return
		
		INGPLAYER := RegExReplace(INGPLAYER, "!" , "{!}")
		INGPLAYER := RegExReplace(INGPLAYER, "!!" , "{!!}")
		if PLAYER = %LASTIGNORE%
			return
		gosub CHATIN
		sendinput t/ign %INGPLAYER%{enter}
		gosub CHATOUT
		
		
		LV_Add("", "Ignore "INGPLAYER " for " BADLINE)
		LASTIGNORE = %PLAYER%
	}

return
CHATIGNOREOPEN:
FileAppend, %INGPLAYER% `n , blacklist.txt
	gosub SAMPDETECT 
	if game = 0
		return
	IfEqual , PLAYER ,
		return
	if CHATIGNORE = 1
	{
		IfInString , ignwhite, %INGPLAYER%
			return
		if PlayerName = %PLAYER%
			return
		INGPLAYER := RegExReplace(PLAYER, "[[][0-9][0-9]:[0-9][0-9]:[0-9][0-9][]]" , "")
		INGPLAYER := RegExReplace(INGPLAYER, ".*<" , "")
		INGPLAYER := RegExReplace(INGPLAYER, ">.*" , "")
		INGPLAYER := RegExReplace(INGPLAYER, "!" , "{!}")
		INGPLAYER := RegExReplace(INGPLAYER, "!!" , "{!!}")
		INGPLAYER := RegExReplace(INGPLAYER, "!!!" , "{!!!}")
		if PLAYER = %LASTIGNORE%
			return
		gosub CHATIN
			sendinput t/ign %INGPLAYER%{enter}
		gosub CHATOUT

		LV_Add("", "IgnoreOPEN "INGPLAYER "for " ADDLINE)
		LASTIGNORE = %PLAYER%
	}
return