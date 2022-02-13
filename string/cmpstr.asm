section .data
	firststring db "First String",0
	secondstring db "First String",0
	same db "Given Strings are same",10,0
	notsame db "Given Strings are not same",10,0
section .text
	global main
	extern puts

main:

	mov esi, firststring
	mov edi, secondstring
	;;  cmp byte[esi],byte[edi]
lp:	xor eax,eax
	;; al bl,cl dl ah bh ch dh
	mov al , byte[esi]
	cmp al , byte[edi]
	jnz ntsame
	inc esi
	inc edi
	cmp byte[esi],0
	jnz lp
	push same
	call puts
	add esp,4
	jmp lp1
ntsame:
	push notsame
	call puts
	add esp,4
lp1:	ret
