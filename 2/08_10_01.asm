	;;  using PUTS
	section .rodata
	msg db "This is a Sample",10,0
	section .text
	global main
	extern puts
main:
	push msg		; every push will comprise 4 bytes
	call puts
	add esp,4
	
