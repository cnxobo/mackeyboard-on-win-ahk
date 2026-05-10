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

F4:: {
    Click 10
}

GroupAdd("Terminal", "ahk_class mintty")
GroupAdd("Terminal", "ahk_class Vim")
GroupAdd("Terminal", "ahk_class PuTTY")
GroupAdd("Terminal", "ahk_class VanDyke Software - SecureCRT")
GroupAdd("Terminal", "ahk_class VirtualConsoleClass")
GroupAdd("Terminal", "ahk_class TMobaXtermForm")
GroupAdd("Terminal", "ahk_exe WindowsTerminal.exe")
GroupAdd("Terminal", "ahk_exe idea64.exe")
GroupAdd("Terminal", "ahk_exe Tabby.exe")
GroupAdd("Terminal", "ahk_exe Xshell.exe")

GroupAdd("SingleWindow", "ahk_exe notepad.exe")
GroupAdd("SingleWindow", "ahk_exe cmd.exe")
GroupAdd("SingleWindow", "ahk_class DingImgViewWnd")
GroupAdd("SingleWindow", "ahk_class ImagePreviewWnd")


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
	If InSingleWindow() {
		Send("!{F4}")
	} else If hideWhenClose() {
		Send("#{Down}")
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
;Shift & Tab::ShiftAltTab

; 切换当前窗口置顶状态：Ctrl + Alt + T
^!t::{
    hWnd := WinGetID("A")               ; 当前窗口
    isOnTop := WinGetExStyle(hWnd) & 0x8  ; WS_EX_TOPMOST = 0x8

    if (isOnTop) {
        ; 取消置顶
        WinSetAlwaysOnTop(0, hWnd)
        ToolTip "取消置顶"
    } else {
        ; 设置置顶
        WinSetAlwaysOnTop(1, hWnd)
        ToolTip "设置为置顶"
    }
    SetTimer () => ToolTip(), -1000      ; 1 秒后关闭提示
}
