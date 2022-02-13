section .data
   ; n db 7
	msg db "%d",0
    msg1 db 10,"Enter nos:",10,0
	msg5 db "Enter Size of an Array",10,0
	msg4 db "Value of n is :",10,0
	msg2 db  10,"%d",0
	msg3 db " Addition of given numbers is %d",10,0
    n dd 5
section .bss
    ;n resd 1
	numArray resd 50
	sum resd 1
section .text
	extern printf,scanf
global main
main:
    ;push msg5
	;call printf
	;add esp,4
	;push n
	;push msg
	;call scanf
	;add esp,8

    push msg4
	call printf
	add esp,4

    mov eax, dword[n]
    pusha
    push eax
	push msg
	call printf
    popa
	add esp,8


    push msg1
	call printf
	add esp,4

    xor ecx,ecx
	mov ebx, numArray
lp1:cmp ecx,dword[n]
	jz gotoend
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp lp1
	
gotoend:
	mov dword[sum],0
	xor ecx,ecx
	xor esi,esi
	mov ebx, numArray
lp2:cmp ecx,dword[n]

	jz gotoend1
	mov edx,dword[ebx] 	
        add esi,edx	
	;pusha
	;push dword[ebx]
	;push msg2
	;call printf
	;add esp,8
	;popa
	inc ecx
	add ebx,4
	jmp lp2
gotoend1:
	mov dword[sum],esi
	push dword[sum] 	
	push msg3
	call printf
	add esp,8
	
	ret
