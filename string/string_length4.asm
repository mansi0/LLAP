section .data
	myString db "Indi isas my country, alla Indians area my brothers sand sisters ",0
	len equ $-myString
	newl db 10
section .bss
	TempString resb len
section .text
	global main
	extern puts
main:
	mov edi, myString
	mov ecx,len
lp:	mov esi, edi
	cmp byte[edi],0
	jz terminate
	mov al, ' '
	repne scasb
	mov edx,edi
	sub edx,esi
	dec edx
	cmp edx,4
	jnz lp
	pusha
	mov ecx,esi
	mov eax,4
	mov ebx,0
	int 0x80
	mov eax,4
	mov ebx,0
	mov ecx, newl
	mov edx,1
	int 0x80

	
	popa
		jmp lp
terminate:	 ret
