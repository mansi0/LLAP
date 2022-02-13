section .data
	msg db "%d",0
	msg1 db "Enter Size of an Array",10,0
	msg2 db "You have entered %d as total number of elements",10,0
	msg3 db  10,"%d",0
	msg4 db " Addition of given numbers is %d",10,0
section .bss
	n resd 1
	numArray resd 50
	sum resd 1
section .text
	extern printf,scanf
global main
main:
	push msg1
	call printf
	add esp,4
	push n
	push msg
	call scanf
	add esp,8

	push dword[n]
	push msg2
	call printf
	add esp,8

;;;  for ( i = 0 ; i <n ; i++) scanf("%d",&a[i])
        xor ecx,ecx
	mov ebx, numArray
repeatsum:	cmp ecx,dword[n]
	jz gotoend
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp repeatsum
	
gotoend:
	mov dword[sum],0
	xor ecx,ecx
	xor esi,esi
	mov ebx, numArray
repeatsum1:	cmp ecx,dword[n]

	jz gotoend1
	mov edx,dword[ebx] 	; edx = numarray[i]
        add esi,edx	; esi = esi + edx
	pusha
	push dword[ebx]
	push msg3
	call printf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp repeatsum1
gotoend1:
	mov dword[sum],esi
	push dword[sum] 	; push esi
	push msg4
	call printf
	add esp,8
	
	ret
