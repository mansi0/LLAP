;;Find minimum no from given 2 nos.
section .data
	msg db "%d",0
	msg1 db "Enter no :",10,0
	msg3 db  10,"%d",0
	msg4 db " Minimum  of given numbers is %d",10,0
section .bss
	n1 resd 1
	n2 resd 2
	min resd 1
section .text
	extern printf,scanf
global main
main:
	push msg1
	call printf
	add esp,4

	push n1
	push msg
	call scanf
	add esp,8

	push n2
	push msg
	call scanf
	add esp,8

	mov eax, dword[n1]
	mov ebx, dword[n2]
	cmp eax,ebx
	jl lp1

	push dword[n2]
	push msg
	call printf
	add esp,8 
	jmp lp2
lp1:
	push dword[n1]
	push msg
	call printf
	add esp,8 
lp2:	ret
