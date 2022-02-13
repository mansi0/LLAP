section .text
	global lenfunc
lenfunc :
	enter 4,0
	mov edi, [ebp+8]
        mov esi, edi
        xor eax, eax
        mov al, 0
        repnz scasb
        sub  edi, esi
	mov dword[ebp-4], edi
	mov eax, dword[ebp-4]
	leave
	ret
