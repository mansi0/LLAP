section .data
	Student   db "n20112038, SHUBHAM KOUL, M, MCA",0
			db "n20112023, MANSI MANDHARE, F, MCA, 2020",0
			db "n20111009, vishesh malik, M, MSC, 2020",0
			db "n20112002, sagar kivale, M, MCA, 2020",0
			db "n20112024, MAYURI GULDAGAD, F, MCA, 2019",0
			db "n20112003, DURGA PATIL, F, MCA, 2019",0
			db "n20112015, chetan bisht, M, MCA, 2020",0, -1
	len equ $-Student
	msg db "%s",0
	neline db 10
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
	cmp byte[edi], 'M'
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
upper:  sub byte[edi], 32
        dec eax
        add edi, 8
        cmp eax, 0
        jg upper



	pusha
	mov ecx, esi
	mov eax,4
	mov ebx,1
	int 0x80
;	push neline
;	call printf
	popa
	mov al,0
	repne scasb
	jmp lp
terminate:	 ret
