section .data
Student db "N20112024, mayuri vinaykumar guldagad, f, mca, 2020",0
	db "N20112002, sagar santosh kivale, m, mca, 2020",0
	db "N18112084, shriram devidas rathod, m, mca, 2018",0
	db "N19112015, shereya dattatraya gunwant , f , mca , 2019",0
	db "N20111004, amol ramdas ghodake, m, msc, 2020",0,-1

	len equ $-Student
	msg db "%s",0
	neline dd 10
section .bss
	section .text
	global main
	extern puts, printf
main:
	mov edi , Student
	mov ecx,len
lp:	cmp byte[edi],-1
	jz terminate
	mov esi,edi
	mov al, ','
	repne scasb
	mov esi, edi
;	mov edx,edi
;	dec edx
;	sub edx,esi
	mov al, ','
	repne scasb

	mov edx, edi
	dec edx
	sub edx, esi

	inc edi
	cmp byte[edi], 'm'
	jz lp1
lp2:	mov al,0
	repne scasb
	jmp lp
lp1:	
	mov al, ','
	repne scasb
	mov al, ','
	repne scasb
	inc edi
	mov al,'2'
	cmp al, byte[edi]
	jne lp2
	inc edi
	mov al,'0'
	cmp al,byte[edi]
	jne lp2
	inc edi
	mov al, '2'
	cmp al,byte[edi]
	jne lp2
	inc edi
	mov al, '0'
	cmp al, byte[edi]
	jne lp2


	
	mov edi, esi
        mov eax, edx
upper:	cmp byte[edi], 32
	jz skipspace
	pusha
	sub byte[edi], 32
	mov al, byte[edi]
	mov byte[edi], al
	popa
skipspace:
        dec eax
        inc edi
        cmp eax, 0
	jg upper

	pusha
	mov ecx, esi
	mov eax,4
	mov ebx,1
	int 0x80
	push neline
	call printf
	add esp, 4
	popa
	mov al,0
	repne scasb
	jmp lp

terminate:	 ret
