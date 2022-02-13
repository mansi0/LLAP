    %macro palin 2
    mov esi,%1
	mov edi,revstring
	mov ecx,%2
	add esi,%2
	dec esi
%%lp:	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	loop %%lp

	mov esi, string
	mov edi,revstring
	dec edi
	mov ecx, len
%%lp2:	xor eax,eax
	mov al, byte[string]
	cmp al,byte[revstring]
	jnz %%lp1
	dec ecx
	jnz %%lp2
	push palind
	call puts
	add esp,4
	jmp %%lp3
%%lp1:	push notpalin
	call puts
	add esp,4
%%lp3:	ret

%endmacro

section .data
	palind db "String is palindrome",0
	notpalin db "String is not palindrome",0
	string db "madam",0
	len equ $-string

section .bss
	revstring resd len
section .text
	global main
	extern puts

main :
	mov eax,string
	mov ebx,len
	palin eax,ebx
