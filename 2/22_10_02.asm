;;;  Program to display a string using write system call with char by char mechanism
section .data
	string db "This is a sample",10,0
	len equ $-string
section .text
	global main
main:

	mov esi,len
	
	xor ecx,ecx
	;;  string_a = strig_a + index* size
lp:	mov ebx, string
	mov eax,1
	mul ecx
	add ebx,eax
	pusha
	mov ecx,ebx
	mov edx,1
	mov ebx,1
	mov eax,4
	int 0x80
	popa
	inc ecx
	cmp ecx,esi
	jle lp
	
