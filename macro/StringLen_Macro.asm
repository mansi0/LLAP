%macro mystringlen 1
	mov edi, %1
	mov al, 0
	mov esi, edi
	mov ecx,10000
	repne scasb
	sub edi,esi
%endmacro
	section .data
	string db "This is Sample Assembly program using Macro",0
	strlen db "String length is %d",10,0
	section .text
	global main
	extern printf
main:
	mystringlen string
	push edi
	push strlen
	call printf
	add esp,8
	
