section .data
	msg db "%d",0
	msg1 db "Enter Size of an Array",10,0
	msg2 db "You have entered %d as total number of elements",10,0
	msg3 db  10,"%d",0
	msg4 db " Minimum  of given numbers is %d",10,0
section .bss
	n resd 1
	numArray resd 50
	min resd 1
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
	
	xor ecx,ecx
	xor esi,esi
	
	mov ebx, numArray
	mov esi,dword[ebx]
	mov edi,dword[ebx+4]
repeatsum1:	cmp ecx,dword[n]

	jz gotoend1
	mov edx,dword[ebx] 	; edx = numarray[i]
        cmp  esi,edx	; if (a > b) max = a else max = b
	jle maxi
	mov edi, esi
	mov esi,edx
maxi:	
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
	mov dword[min],edi
	push dword[min] 	; push esi
	push msg4
	call printf
	add esp,8
	
	ret

	
