;It changes case of each character 10 times and it blinks the changes after we input "Enter" key.
section .data
	string db 10,10,10,10,10,10,10,10,10,10,10,"                          ThiS is JuSt a DeMO",0
	len equ $-string
	cls db "clear",0
	msg db "%c",0
section .bss
	output resb len
	count resd 1
	char resb 1
section .text
	global main
	extern puts,system, scanf
main:
	mov dword[count],0
	
myloop:
	inc dword[count]
	cmp dword[count],10
	jz terminate
	push cls
	call system
	add esp,4
	mov esi,string
	mov edi,output
mylp:
	cmp byte[esi],32
	jz lp1
	cmp byte[esi],10
	jz lp1
	cmp byte[esi],97
	jge lp
	add byte[esi],32
	jmp lp1 
lp:	sub byte[esi],32
lp1:	mov al, byte [esi]
	mov byte[edi],al
	inc esi
	inc edi
	cmp byte[esi],0
	jnz mylp
	push output
	call puts
	add esp,4
		push char
	push msg
	call scanf
	add esp,8
	jmp myloop
terminate:

	ret
