section .data
	result db "Length is %d",10,0
	src db "Good Morning",0
section .text
	global main
	extern lenfunc, printf
main :
	mov esi, src
	push esi
	call lenfunc
	add esp,4
	
	push eax
	push result
	call printf
	add esp,8	
