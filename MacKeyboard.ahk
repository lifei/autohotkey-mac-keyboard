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

KeepWindowsKeyMap() {
	return WinActive("ahk_class mintty") or WinActive("ahk_class Vim") or WinActive("ahk_class PuTTY") or WinActive("ahk_class VanDyke Software - SecureCRT")
}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Copying
Copy() {
	If KeepWindowsKeyMap() {
		Send ^{Insert}
	} else {
		Send ^c
	}
}
<#c::Copy()

; Pasting
Paste() {
	If KeepWindowsKeyMap() {
		Send +{Insert}
	} else {
		Send ^v
	}
}
<#v::Paste()


; Save
<#s::^s

; Select All
<#a::^a
<#x::^x
<#o::^o
<#f::^f
<#z::^z
<#y::^y
<#t::^t
<#r::^r

; Close Tab
CloseTab() {
	If WinActive("ahk_class VanDyke Software - SecureCRT") {
		Send ^{F4}
	} else {
		Send ^w
	}
}
<#w::CloseTab()


; shortcut for Tabs
IsSecureCRT() {
	return WinActive("ahk_class VanDyke Software - SecureCRT")
}

WindowsNumber(num)
{
	If IsSecureCRT()
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
<#1::WindowsNumber(1)
<#2::WindowsNumber(2)
<#3::WindowsNumber(3)
<#4::WindowsNumber(4)
<#5::WindowsNumber(5)
<#6::WindowsNumber(6)
<#7::WindowsNumber(7)
<#8::WindowsNumber(8)
<#9::WindowsNumber(9)

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}


#LButton::Send ^{LButton}
#RButton::Send ^{RButton}

; Remap Windows + Tab to Alt + Tab.
Lwin & Tab::AltTab

; minimize windows
#m::WinMinimize,a

; *nux的Home/End
CtrlA() {
	If KeepWindowsKeyMap()
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
	If KeepWindowsKeyMap()
	{
		Send ^b
	} else {
		Send {Left}
	}
}
<^b::CtrlB()

CtrlF() {
	If KeepWindowsKeyMap()
	{
		Send ^f
	} else {
		Send {Right}
	}
}
<^f::CtrlF()

AltB()
{
	If KeepWindowsKeyMap()
	{
		Send !b
	} else {
		Send ^{Left}
	}
}
<!b::AltB()

AltF()
{
	If KeepWindowsKeyMap()
	{
		Send !f
	} else {
		Send ^{Right}
	}
}
<!f::AltF()

AltBackspace()
{
	If KeepWindowsKeyMap()
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
	If KeepWindowsKeyMap()
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
