section .data
	result db "%d",10,0
	src1 db "Good Morning",0
	src2 db "Good dorning",0
section .text
	global main
	extern cmpfunc, printf
main :
	mov esi, src1
	mov edi, src2
	push esi
	push edi
	call cmpfunc
	add esp,8
	
	push eax
	push result
	call printf
	add esp,8	
