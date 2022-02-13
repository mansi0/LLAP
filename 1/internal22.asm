section .data
	msg db "%d",0
	msg1 db "Enter Size of an Array",10,0
	msg2 db "You have entered %d as total number of elements",10,0
	msg3 db  10,"%d",0
	msg4 db "2nd Maximum  of given numbers is %d",10,0
	msg5 db 10,"Enter nos:",10,0
section .bss
	n resd 1
	numArray resd 50
	max resd 1
section .text
	extern printf,scanf
global main
main:

	;print enter size of array
	push msg1
	call printf
	add esp,4

	push n
	push msg
	call scanf
	add esp,8

	;push dword[n]
	;push msg2
	;call printf
	;add esp,8

	;print enter elements
	push msg5
	call printf
	add esp,4


    xor ecx,ecx
	mov ebx, numArray
lp1:cmp ecx,dword[n]
	jz maxsecond
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp lp1
	
maxsecond:
	
	xor ecx,ecx
	;xor esi,esi
	mov esi, dword[numArray]
	mov edi, dword[numArray+4]
	
	mov ebx, numArray
max1:
	cmp ecx,dword[n]
	jz gotoend
	mov edx,dword[ebx] 	; edx = numarray[i]
    cmp  esi,edx	
	jge maxi
	
	mov edi,esi
	mov esi,edx
maxi:
	;cmp edi,edx 
	;jge max2
	;mov edi, edx

	;pusha
	;push dword[ebx]
	;push msg3
	;call printf
	;add esp,8
	;popa


	inc ecx
	add ebx,4
	jmp max1
gotoend:

	mov dword[max],edi
	push dword[max] 	; push esi
	push msg4
	call printf
	add esp,8
	
	ret

	
