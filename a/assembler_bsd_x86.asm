; nasm assembler_bsd_x86.asm -o hello.o -f elf && ld hello.o -o hello -s

section .text

msg     db      "Hello World", 0xa
len     equ     $ - msg

global _start
_start:
	mov	eax, 4 ; sys_write
	push	dword len
	push	dword msg
	push	dword 1
	call	syscall

	mov	eax, 1 ; sys_exit
	push	dword 0
	call	syscall

syscall:
	int	0x80
	ret
