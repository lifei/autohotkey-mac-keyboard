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

KeepWindowsKeyMap()
{
	return WinActive("ahk_class mintty")
}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Make Ctrl + S work with cmd (windows) key
<#s::Send ^s

; Selecting
<#a::Send ^a

; Copying
Copy()
{
	If KeepWindowsKeyMap()
	{
		Send ^{Insert}
	} else {
		Send ^c
	}
}
<#c::Copy()

; Pasting
Paste()
{
	If KeepWindowsKeyMap()
	{
		Send +{Insert}
	} else {
		Send ^v
	}
}
<#v::Paste()

; Cutting
<#x::Send ^x

; Opening
<#o::Send ^o

; Finding
<#f::Send ^f

; Undo
<#z::Send ^z

; Redo
<#y::Send ^y

; New tab
<#t::Send ^t

; close tab
<#w::Send ^w

; Refresh
<#r::Send ^r


; shortcut for Tabs
<#1::Send ^1
<#2::Send ^2
<#3::Send ^3
<#4::Send ^4
<#5::Send ^5
<#6::Send ^6
<#7::Send ^7
<#8::Send ^8
<#9::Send ^9

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}

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
^b::Send {Left}
^f::Send {Right}

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
