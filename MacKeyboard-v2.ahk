;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.


GroupAdd("Terminal", "ahk_class mintty")
GroupAdd("Terminal", "ahk_class Vim")
GroupAdd("Terminal", "ahk_class PuTTY")
GroupAdd("Terminal", "ahk_class VanDyke Software - SecureCRT")
GroupAdd("Terminal", "ahk_class VirtualConsoleClass")
GroupAdd("Terminal", "ahk_class TMobaXtermForm")
GroupAdd("Terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("Terminal", "ahk_exe idea64.exe")

GroupAdd("SingleWindow", "ahk_exe notepad.exe")
GroupAdd("SingleWindow", "ahk_exe cmd.exe")

GroupAdd("HideWhenClose", "ahk_exe WeChat.exe")
GroupAdd("HideWhenClose", "ahk_exe WeChatStore.exe")
GroupAdd("HideWhenClose", "ahk_exe QQ.exe")
GroupAdd("HideWhenClose", "ahk_exe WXWork.exe")
GroupAdd("HideWhenClose", "ahk_exe OUTLOOK.EXE")

InTerminal() {
	return WinActive("ahk_group Terminal")
}

InSingleWindow() {
	return WinActive("ahk_group SingleWindow")
}

hideWhenClose() {
	return WinActive("ahk_group HideWhenClose")
}

; Emacs Key binding
<^a::Send("{Home}")
<^e::Send("{End}")
<^d::Send("{Del}")

CtrlK(){
	If InTerminal() {
		Send("^k")
	} else {
		Send("+{End}")
		Send("{Del}")
	}
}
<^k::CtrlK()

; Ctrl + C
CtrlC() {
	If InTerminal() {
		Send("^{Ins}")
	} else {
		Send("^c")
	}
}
>^c::CtrlC()

; Ctrl + V
CtrlV() {
	If InTerminal() {
		Send("+{Ins}")
	} else {
		Send("^v")
	}
}
>^v::CtrlV()

CtrlF(){
	Send("{Right}")
}
<^f::CtrlF()

CtrlB(){
	Send("{Left}")
}
<^b::CtrlB()


; Command key binding
MetaW(){
	if hideWhenClose() {
		Send("#{Down}")
	} else If InSingleWindow() {
		Send("!{F4}")
	} else {
		Send("^w")
	}
}
>^w::MetaW()

MetaD(){
	Send("#d")
}
>^d::MetaD()

MetaE(){
	Send("#e")
}
>^e::MetaE()

MetaR(){
	Send("{F5}")
}
>^r::MetaR()

RCtrl & Tab::AltTab

Shift & Tab::ShiftAltTab

!t::WinSetAlwaysontop(, "A")