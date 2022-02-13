section .text
	global cmpfunc
cmpfunc :
	enter 8,0
	mov edi, [ebp+8]
	mov esi, [ebp+12]
up:     cmpsb
	jnz lp1
	jz up
	mov dword[ebp-4], 1
	jmp lp2
lp1 :   mov dword[ebp-4], 0
lp2 :   mov eax, dword[ebp-4]
        leave
	ret
