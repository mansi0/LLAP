section .data
	msg db "The number is %d", 10, 0
	var1 dd 1
	
section .bss
	var4 resd 1

section .text
	global main
	extern printf
main:
	
	

	mov eax , 10
	pusha
	push eax
	push msg
	call printf
	add esp, 8
	popa


	mov [var4] , eax
	          


	
	push dword[var4]
	push msg
	call printf
	add esp, 8

