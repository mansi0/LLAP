;;;  loop ; ecx
section .data
	msg1 db "%d",0
	msg db "Sum from 1 to %d is %d",10,0
section .bss
	mynum resd 1
	sum resd 1
section .text
	global main
	extern printf,scanf
main:	
	push mynum
	push msg1
	call scanf
	add esp,8
	
	mov ecx, dword[mynum]
	mov dword[sum],0
lp:	add dword[sum],ecx
	loop lp
	
final:
	push dword[sum]
	push dword[mynum]
	push msg
	call printf
	add esp,12
