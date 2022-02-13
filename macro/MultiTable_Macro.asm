	%macro multi 1
	mov ebx, %1
	mov ecx, 1
lp:	mov eax, ecx
	mul ebx
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,10
	jle lp

	%endmacro
section .data
	msg db "%d ",0
section .text
	global main
	extern printf
main:
	multi 5
	
	
