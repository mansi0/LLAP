section .data
	msg db "%d",0
	msg1 db "Enter the Number of Elements",10,0
	Four dd 4
section .bss
	N resd 1
	Array resd 50
	section .text
	global main
	extern printf, scanf
main:
;;;  for i = 0 to n-1 sum = sum + a[i] ; 
;;;  Address = Base + Index * size
	;;  Address = 100 + 0*4 = 100
;;;  Address = 100 + 1*4  = 104
;;;  Address=100 + 2* 4 = 108

	push msg1
	call printf
	add esp,4

	push N
	push msg
	call scanf
	add esp,8

	
	mov esi, dword[N]
	xor ecx,ecx
lp:	mov ebx, Array
	mov eax, dword[Four]
	mul ecx
	add ebx,eax
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,esi
	jb lp


	mov esi, dword[N]
	xor ecx,ecx
lp1:	mov ebx, Array
	mov eax, dword[Four]
	mul ecx
	add ebx,eax
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,esi
	jb lp1
