	;;  using Printf
	section .rodata
	msg db "This is a Sample",10,0
	section .text
	global main
	extern printf
main:
	push msg		; every push will comprise 4 bytes
	call printf
	add esp,4
	
