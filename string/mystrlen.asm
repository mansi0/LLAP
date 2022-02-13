section .data
	mystring db "this is my string",0
	msg db "Length of string is %d",10,0
section .text
	global main
	extern printf
main:
	mov esi, mystring
	xor ecx,ecx
lp:	cmp byte[esi],0
	jz endpg
	inc ecx
	inc esi
	jmp lp

endpg:
	push ecx
	push msg
	call printf
	add esp,8
