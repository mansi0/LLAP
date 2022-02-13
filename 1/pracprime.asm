section .data
	msg db "%d",0
	msg1 db "Enter no :",10,0
	msg4 db " %d is prime no",10,0
	msg5 db " %d is not prime no",10,0
	zero dd 0
	one dd 1
section .bss
	n1 resd 1
	n2 resd 2
	min resd 1
section .text
	extern printf,scanf
global main
main:
	push msg1
	call printf
	add esp,4

	push n1
	push msg
	call scanf
	add esp,8

	mov ecx,zero	;;used for flags

	;cmp zero, [n1]
	;je pr2
	;cmp one, [n1]
	;je pr2

	


	mov ebx, 2   ;;as i

	mov eax, [n1]  ;;calculating n/2
	div ebx
	mov esi, eax

lp3:
	mov edx, 0
	mov eax, [n1]
	div ebx
	cmp edx, 0
	jz lp2
	inc ebx
	cmp ebx, n1
	jl lp3
	jmp pr1
lp2:
	mov ecx, 1
	jmp pr2

pr1:
	push dword[n1]
	push msg4
	call printf
	add esp, 8
	jmp end
pr2:
push dword[n1]
	push msg5
	call printf
	add esp, 8
	jmp end
end :ret
	



    