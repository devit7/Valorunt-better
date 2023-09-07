#NoEnv 
#persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
Menu, Tray, Icon, ./resize200.ico, 1
global triggerBotEnabled := false
global Operator_mode := "off"
global triggerBotPaused := false
global color_status := "red"

if (FileExist("config-v4.ini")) {
}Else{
IniWrite, 0xB82C29, config-v4.ini, main, Warna
IniWrite, 30, config-v4.ini, main, Radiuswarna
IniWrite, 0, config-v4.ini, main, FireRate
IniWrite, 0, config-v4.ini, main, HoldMouse1
IniWrite, 70, config-v4.ini, main, DelayAutostop
IniWrite, 0, config-v4.ini, main, FireRateXbutton1
IniWrite, 0, config-v4.ini, main, HoldMouse1Xbutton1
}

IniRead, warna, config-v4.ini, main, warna
IniRead, Radiuswarna, config-v4.ini, main, Radiuswarna
IniRead, FireRate, config-v4.ini, main, FireRate
IniRead, HoldMouse1, config-v4.ini, main, HoldMouse1
IniRead, DelayAutostop, config-v4.ini, main, DelayAutostop
IniRead, FireRateXbutton1, config-v4.ini, main, FireRateXbutton1
IniRead, HoldMouse1Xbutton1, config-v4.ini, main, HoldMouse1Xbutton1

key_start_script:= 	"F2"
key_pause	:= 	"F1"
key_reload	:= 	"F3"

StaticX := (A_ScreenHeight // 160)
StaticY := (A_ScreenHeight // 128)
X1 := (A_ScreenWidth // 2)
Y1 := (A_ScreenHeight // 2) 
ScreenNearL := X1 - StaticX
ScreenNearT := Y1 - StaticY
ScreenNearR := X1 + StaticX
ScreenNearB := Y1 + StaticY

Gui, Margin, 100
Gui, color , 0x000000
Gui, Add, Text, c3434eb, = = = = = = = = K TRIGGERBOT = = = = = = = = 
Gui, Add, Text, cWhite, --> Gunakan File [Config] Untuk Merubah [Config]
Gui, Add, Text, cWhite, --> Config File : config-v4.ini
Gui, Add, Text, cGreen, ==> Tekan F2 Untuk Enable Cheat
Gui, Add, Text, cf57842, ==> Tekan F1 Untuk Pause Cheat
Gui, Add, Text, cf542f2, ==> Tekan F3 Untuk Reload Cheat
Gui, Add, Text, cRed, ==> Tekan F4 Untuk Exit Cheat
Gui, Add, Text, cWhite, << - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >>
Gui, Add, Text, cYellow, !! Akan Terdengar Suara Beeb Saat Tommbol Dipencet !! 


Gui, Add, StatusBar,, Bar's starting text (omit to start off empty).
SB_SetText("Made By: Mpiie#9428")

Gui, Show

Gui,2:Font,Cdefault,Fixedsys
Gui,2:Color,Black
Gui,2:Color, EEAA99
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundBlue vC3
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB3 gStart,Cheat On

Gui,2:Add,Progress, xp yp wp hp Disabled BackgroundRED vC1
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB1 gStart,Cheat Off

Gui,2: Show, x10 y1 w200 h60

Gui 2:+LastFound +ToolWindow +AlwaysOnTop -Caption


WinSet, TransColor, EEAA99

Gui,3:Font,Cdefault,Fixedsys
Gui,3:Color,Black
Gui,3:Color, EEAA99
Gui,3:Add,Progress, x10 y20 w100 h23 Disabled BackgroundBlue vC2
Gui,3:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB2 gStar,Script Pause

Gui,3:Add,Progress, x10 y20 w100 h23 Disabled BackgroundRed vC4
Gui,3:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB4 gStar,Script Pause

Gui,3: Show, x10 y50 w200 h60

Gui 3:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99

Gui,4:Font,Cdefault,Fixedsys
Gui,4:Color,Black
Gui,4:Color, EEAA99
Gui,4:Add,Progress, x10 y20 w100 h23 Disabled BackgroundBlue vC5
Gui,4:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB5 gStar2,Operator Mode

Gui,4:Add,Progress, x10 y20 w100 h23 Disabled BackgroundRed vC6
Gui,4:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB6 gStar2,Operator Mode

Gui,4: Show, x10 y100 w200 h60

Gui 4:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99

return

start:
gui,2:submit,nohide

star:
gui,3:submit,nohide

star2:
gui,4:submit,nohide


~F3::
  Reload
SoundBeep, 750, 500
GuiControl,2: show,B1
GuiControl,2: show,C1
GuiControl,2: hide,B3
GuiControl,2: hide,C3
Return

*space::
	Loop                                                                                                                
	{
		GetKeyState,state,space,P
		If state = U
			Break
		Send,{space}              
		Sleep,20
	}
return

~F2::
SoundBeep, 750, 500
GuiControl, 2: show, B3
GuiControl, 2: show, C3
GuiControl, 2: hide, B1
GuiControl, 2: hide, C1
  triggerBotEnabled := !triggerBotEnabled
  if (triggerBotEnabled) {
    
    Loop {
      if (triggerBotPaused) {
        Sleep, 100
        continue
      }
      a_key := GetKeyState("a","P") 
      s_key := GetKeyState("s","P")
      w_key := GetKeyState("w","P")
      d_key := GetKeyState("d","P")
      CoordMode, Pixel, Screen
      if GetKeyState("Xbutton1"){
        PixelSearch, FoundX, FoundY,  ScreenNearL, ScreenNearT, ScreenNearR, ScreenNearB,warna, Radiuswarna, Fast RGB
          if (ErrorLevel = 0){
              if(a_key == 0 && s_key == 0 && w_key == 0 && d_key == 0){ ; --> when i not press any a s w d key
                Sleep, FireRateXbutton1 ; delay shoot
                  send, {Lbutton down}
                Sleep, HoldMouse1Xbutton1
                  send, {Lbutton up}
            }else{ ; --> when i press one of a s w d key
              Hotkey, s, off, on
              Hotkey, w, off, on
              Hotkey, a, off, on
              Hotkey, d, off, on
              Send, {a up}{d up}{w up}{s up}
              Sleep, DelayAutostop ; delay stop
              Send, {LButton down}{LButton up}
              Hotkey, a, off, Off
              Hotkey, d, off, Off
              Hotkey, w, off, Off
              Hotkey, s, off, Off
            }
          }
      }else{
        PixelSearch, FoundX, FoundY,  ScreenNearL, ScreenNearT, ScreenNearR, ScreenNearB, warna, Radiuswarna, Fast RGB
          if(ErrorLevel = 0){
            Sleep, FireRateXbutton1 ; delay shoot
              send, {Lbutton down}
            Sleep, HoldMouse1Xbutton1 ; delay hold
              Send, {Lbutton up}
          }
      }
    }
  }
Return

~Xbutton2::

if (Operator_mode= "off") {
    Operator_mode := "on"
    GuiControl, 4: show, B5
    GuiControl, 4: show, C5
    GuiControl, 4: hide, B6
    GuiControl, 4: hide, C6
    ;script yang akan dijalankan ketika Xbutton2 ditekan
    CoordMode, Pixel, Screen
    Loop{
      PixelSearch, FoundX, FoundY,  ScreenNearL, ScreenNearT, ScreenNearR, ScreenNearB, warna, Radiuswarna, Fast RGB
        if (ErrorLevel = 0){
          Sleep, 1 ; delay shoot
            send, {Lbutton down}
          Sleep, 1 ; delay hold
            Send, {Lbutton up}
        }
    }
}else{
    Operator_mode := "off"
    GuiControl, 4: show, B6
    GuiControl, 4: show, C6
    GuiControl, 4: hide, B5
    GuiControl, 4: hide, C5
}

return 


~F1::
  triggerBotPaused := !triggerBotPaused 
SoundBeep, 750, 500
if (color_status = "red") {
    color_status := "blue"
    GuiControl, 3: show, B2
    GuiControl, 3: show, C2
    GuiControl, 3: hide, B4
    GuiControl, 3: hide, C4

} else {
    color_status := "red"
    GuiControl, 3: show, B4
    GuiControl, 3: show, C4
    GuiControl, 3: hide, B2
    GuiControl, 3: hide, C2
}
Return

Off:
return

F4::
ExitApp

