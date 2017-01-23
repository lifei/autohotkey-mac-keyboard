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
#UseHook On

; --------------------------------------------------------------
; Programs which use Widnows key map
; --------------------------------------------------------------

GroupAdd, Terminal, ahk_class mintty
GroupAdd, Terminal, ahk_class Vim
GroupAdd, Terminal, ahk_class PuTTY
GroupAdd, Terminal, ahk_class VanDyke Software - SecureCRT
GroupAdd, Terminal, ahk_class VirtualConsoleClass
GroupAdd, Terminal, ahk_class TMobaXtermForm
;GroupAdd, Terminal, — Atom ahk_class Chrome_WidgetWin_1

GroupAdd, VSCode, - Visual Studio Code


GroupAdd, Jetbrains, ahk_class SunAwtDialog
GroupAdd, Jetbrains, ahk_class SunAwtFrame

InTerminal() {
	return WinActive("ahk_group Terminal")
}

InJetbrainsIDE() {
	return WinActive("ahk_group Jetbrains")
}

InVSCode() {
	return WinActive("ahk_group VSCode")
}

InSecureCRT() {
	return WinActive("ahk_class VanDyke Software - SecureCRT")
}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

LWin::
RWin::
Return
#Up::Send {LWin}
#ESC::`
+ESC::~

; Windows + C
WinC() {
	If InTerminal() or InJetbrainsIDE() or InVSCode() {
		Send ^{Ins}
	} else {
		Send ^c
	}
}
<#c::WinC()

; Windows + V
WinV() {
	If InTerminal() or InJetbrainsIDE() or InVSCode() {
		Send +{Ins}
	} else {
		Send ^v
	}
}
<#v::WinV()

; Windows + W
WinW() {
	If InSecureCRT() or InVSCode() {
		Send ^{F4}
	} else if InJetbrainsIDE() {
		Send +^!w
	} else {
		Send ^w
	}
}
<#w::WinW()

; Save
WinS() {
	If InJetbrainsIDE() {
		Send +^!s
	} else {
		Send ^s
	}
}
<#s::WinS()

; Cut
#x::Send ^x
#z::Send ^z
#y::Send ^y
#n::Send ^n
#k::Send ^k

; Windows + T
WinT() {
	If InJetbrainsIDE() {
		Send +^!t
	} else {
		Send #t
	}
}
<#t::WinT()

; Windows + G
WinG() {
	If InJetbrainsIDE() {
		Send +^!g
	} else {
		Send #g
	}
}
<#g::WinG()

; Windows + F
WinF() {
	If InJetbrainsIDE() {
		Send +^!f
	} else {
		Send ^f
	}
}
<#f::WinF()

; Windows + H
WinH() {
	If InJetbrainsIDE() {
		Send +^!h
	} else {
		Send ^h
	}
}
<#h::WinH()


; Windows + A
WinA() {
	If InJetbrainsIDE() {
		Send +^!a
	} else {
		Send ^a
	}
}
#a::WinA()

; Windows + O
WinO() {
	If InJetbrainsIDE() {
		Send +^!o
	} else {
		Send ^o
	}
}
#o::WinO()

; Windows + R
WinR() {
	If InJetbrainsIDE() {
		Send +^!r
	} else {
		Send ^r
	}
}
#r::WinR()

; Windows + /
WinSlash() {
	If InJetbrainsIDE() {
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
	If InJetbrainsIDE() {
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

; *nux Home/End
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

CtrlD() {
	If InTerminal() or InJetbrainsIDE() or InVSCode()
	{
		Send ^d
	} else {
		Send {Delete}
	}
}
<^d::CtrlD()

; Emacs键位
CtrlB() {
	If InTerminal() or InJetbrainsIDE() or InVSCode()
	{
		Send ^b
	} else {
		Send {Left}
	}
}
<^b::CtrlB()

CtrlF() {
	If InTerminal() or InJetbrainsIDE()
	{
		Send ^f
	} else {
		Send {Right}
	}
}
<^f::CtrlF()

CtrlN() {
	If InTerminal() or InJetbrainsIDE()
	{
		Send ^n
	} else {
		Send {Down}
	}
}
<^n::CtrlN()

CtrlP() {
	If InTerminal() or InJetbrainsIDE()
	{
		Send ^p
	} else {
		Send {Up}
	}
}
<^p::CtrlP()

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
; Windows Search

; For Windows 10 Bug, use old search instead of {Win}s
;!s::Run, %windir%\system32\rundll32.exe -sta {C90FB8CA-3295-4462-A721-2935E83694BA}
!s::Run, %windir%\system32\rundll32.exe -sta {C90FB8CA-3295-4462-A721-2935E83694BA}
^Space::Send #s
;^Space::Send #s

; 运行
!r::Send #r

; 资源管理器
!e::Send #e

; 锁屏
!l::Send #l

; QQ
^#a::Send ^!a

; vim600: st=4 ts=4 sw=4
