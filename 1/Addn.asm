section .data
	NumArray dd 10,34,43,56,26,90,-1
	msg db "Addition of Given numbers is %d",10,0
section .bss
	Sum resd 1
section .text
	global main
	extern printf
main:
			mov eax, NumArray 	; moves address of NumArray to eax
			xor edx,edx		; edx = 0
	
repeatsum:
			cmp dword[eax],-1
        		jz gotoend
			add edx, dword[eax] ; edx = edx +[eax]
			add eax,4
			jmp repeatsum
gotoend:
	push edx
	push msg
	call printf
	add esp,8
