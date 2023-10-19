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


GroupAdd, Terminal, ahk_class mintty
GroupAdd, Terminal, ahk_class Vim
GroupAdd, Terminal, ahk_class PuTTY
GroupAdd, Terminal, ahk_class VanDyke Software - SecureCRT
GroupAdd, Terminal, ahk_class VirtualConsoleClass
GroupAdd, Terminal, ahk_class TMobaXtermForm
GroupAdd, Terminal, ahk_exe WindowsTerminal.exe
GroupAdd, Terminal, ahk_exe idea64.exe

GroupAdd, SingleWindow, ahk_exe notepad.exe
GroupAdd, SingleWindow, ahk_exe cmd.exe

GroupAdd, HideWhenClose, ahk_exe WeChat.exe
GroupAdd, HideWhenClose, ahk_exe WeChatStore.exe
GroupAdd, HideWhenClose, ahk_exe QQ.exe
GroupAdd, HideWhenClose, ahk_exe WXWork.exe
GroupAdd, HideWhenClose, ahk_exe OUTLOOK.EXE

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
<^a::Send {Home}
<^e::Send {End}
<^d::Send {Del}

CtrlK(){
	If InTerminal() {
		send ^k
	} else {
		send +{End}
		send {Del}
	}
}
<^k::CtrlK()

; Ctrl + C
CtrlC() {
	If InTerminal() {
		Send ^{Ins}
	} else {
		Send ^c
	}
}
>^c::CtrlC()

; Ctrl + V
CtrlV() {
	If InTerminal() {
		Send +{Ins}
	} else {
		Send ^v
	}
}
>^v::CtrlV()

CtrlF(){
	send {Right}
}
<^f::CtrlF()

CtrlB(){
	send {Left}
}
<^b::CtrlB()


; Command key binding
MetaW(){
	if hideWhenClose() {
		send #{Down}
	} else If InSingleWindow() {
		send !{F4}
	} else {
		send ^w
	}
}
>^w::MetaW()

MetaD(){
	send #d
}
>^d::MetaD()

MetaE(){
	send #e
}
>^e::MetaE()

MetaR(){
	send {F5}
}
>^r::MetaR()

RCtrl & Tab::AltTab

!t::  Winset, Alwaysontop, , A