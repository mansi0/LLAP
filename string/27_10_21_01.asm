section .data
	mynum dd 10
	msg db "Sum from 1 to %d is %d",10,0
section .bss
	sum resd 1
section .text
	global main
	extern printf
main:	
	mov ecx, dword[mynum]
	mov dword[sum],0
lp:	cmp ecx,0
	jz final
	add dword[sum],ecx
	dec ecx
	jmp lp
final:
	push dword[sum]
	push dword[mynum]
	push msg
	call printf
	add esp,12
