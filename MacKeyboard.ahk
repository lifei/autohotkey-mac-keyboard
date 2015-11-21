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

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; --------------------------------------------------------------
; Programs which use Widnows key map
; --------------------------------------------------------------

InTerminal() {
	return WinActive("ahk_class mintty") or WinActive("ahk_class Vim") or WinActive("ahk_class PuTTY") or WinActive("ahk_class VanDyke Software - SecureCRT")
}

InJetbrainIDE() {
	return WinActive("ahk_class SunAwtFrame")
}

InSecureCRT() {
	return WinActive("ahk_class VanDyke Software - SecureCRT")
}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Windows + C
WinC() {
	If InTerminal() or InJetbrainIDE() {
		Send ^{Insert}
	} else {
		Send ^c
	}
}
<#c::WinC()

; Windows + V
WinV() {
	If InTerminal() or InJetbrainIDE() {
		Send +{Insert}
	} else {
		Send ^v
	}
}
<#v::WinV()

; Windows + W
WinW() {
	If InSecureCRT() {
		Send ^{F4}
	} else {
		Send ^w
	}
}
<#w::WinW()

; Save
<#s::^s

; Cut
#x::Send ^x
#z::Send ^z
#y::Send ^y


; Windows + T
WinT() {
	If InJetbrainIDE() {
		Send +^!t
	} else {
		Send #t
	}
}
<#t::WinT()

; Windows + G
WinG() {
	If InJetbrainIDE() {
		Send +^!g
	} else {
		Send #f
	}
}
^#g::WinG()

; Windows + F
WinF() {
	If InJetbrainIDE() {
		Send +^!f
	} else {
		Send ^f
	}
}
<#f::WinF()

; Windows + H
WinH() {
	If InJetbrainIDE() {
		Send +^!h
	} else {
		Send ^h
	}
}
<#h::WinH()


; Windows + A
WinA() {
	If InJetbrainIDE() {
		Send +^!a
	} else {
		Send ^a
	}
}
#a::WinA()

; Windows + O
WinO() {
	If InJetbrainIDE() {
		Send +^!o
	} else {
		Send ^o
	}
}
#o::WinO()

; Windows + R
WinR() {
	If InJetbrainIDE() {
		Send +^!r
	} else {
		Send ^r
	}
}
#r::WinR()

; Windows + /
WinSlash() {
	If InJetbrainIDE() {
		Send +^!/
	} else {
		Send ^/
	}
}
#/::WinSlash()


; Windows + Numbers

CallWinNum(num)
{
	If InSecureCRT()
	{
		Send {Alt Down}
		Send {Alt Up}
		Send !%num%
	}
	else
	{
		Send ^%num%
	}
}

Win1() {
	If InJetbrainIDE() {
		Send +^!1
    } else {
		CallWinNum(1)
	}
}
<#1::Win1()
<#2::CallWinNum(2)
<#3::CallWinNum(3)
<#4::CallWinNum(4)
<#5::CallWinNum(5)
<#6::CallWinNum(6)
<#7::CallWinNum(7)
<#8::CallWinNum(8)
<#9::CallWinNum(9)

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}


#LButton::Send ^{LButton}
#RButton::Send ^{RButton}

; Remap Windows + Tab to Alt + Tab.
<#tab::AltTab
<#CapsLock::ShiftAltTab

; minimize windows
#m::WinMinimize,a

; *nux的Home/End
CtrlA() {
	If InTerminal()
	{
		Send ^a
	} else {
		Send {Home}
	}
}
<^a::CtrlA()
<^e::Send {End}

; Emacs键位
CtrlB() {
	If InTerminal()
	{
		Send ^b
	} else {
		Send {Left}
	}
}
<^b::CtrlB()

CtrlF() {
	If InTerminal() or InJetbrainIDE()
	{
		Send ^f
	} else {
		Send {Right}
	}
}
<^f::CtrlF()

AltB()
{
	If InTerminal()
	{
		Send !b
	} else {
		Send ^{Left}
	}
}
<!b::AltB()

AltF()
{
	If InTerminal()
	{
		Send !f
	} else {
		Send ^{Right}
	}
}
<!f::AltF()

AltBackspace()
{
	If InTerminal()
	{
		Send !{Backspace}
	} else {
		Send ^{Backspace}
	}
}
<!Backspace::AltBackspace()

; ^p::Send {Up}
; ^n::Send {Down}


; =======================
; Windows常用工具

; 搜索功能
!s::Send #s
^Space::Send #s

; 显示桌面
AltD()
{
	If InTerminal()
	{
		Send !d
	} else {
		Send #d
	}
}
<!d::AltD()

; 运行
!r::Send #r

; 资源管理器
!e::Send #e

; 锁屏
!l::Send #l


; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1
{
; Show Web Developer Tools with cmd + alt + i
#!i::Send {F12}
; Show source code with cmd + alt + u
#!u::Send ^u
}

; QQ
#IfWinExist, ahk_class TXGuiFoundation
{
; QQ截图
^#a::Send ^!a
+#a::Send ^!a
}


; vim600: st=4 ts=4 sw=4
