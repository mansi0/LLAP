%macro Facto 1
	mov ecx, %1
	mov eax,1
lp:	mul ecx
	loop lp
	mov dword[fact],eax
%endmacro

	
	
	

section .data
	msg db "Factorial of %d is %d",10,0
	numscan db "%d",0
section .bss
	n resd 1
	fact resd 1
section .text
	global main
	extern printf,scanf
main:
	push n
	push numscan
	call scanf
	add esp,8

	Facto dword[n]
	push dword[fact]
	push dword[n]
	push msg
	call printf
	add esp,12
	ret
