; nasm assembler_win32_x86.asm -o hello.obj -f win32
; link /entry:way /subsystem:windows hello.obj user32.lib kernel32.lib

section .text

_text:	db	'Hello, World', 0
_title:	db	0

extern	_MessageBoxA@16, _ExitProcess@4
global	_way
	
_way:
	push	dword 5 | 0x40	;flags=MB_RETRYCANCEL|MB_ICONASTERISK
	push	dword _title
	push	dword _text
	push	dword 0 	;hWnd
	call	_MessageBoxA@16

	cmp	eax, 4		;result=IDRETRY
	je	_way

	push	0
	call	_ExitProcess@4

	ud2
