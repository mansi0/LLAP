section .data
	msg3 db "Enter the values",10,0
	msg2 db "Sorted Array is",10,0
	msg db "Input Size of Array",0
	msg1 db "%d",0
	msg4 db "%d ",0
section .bss
	Num resd 1
	Array resd 20
	SortedArray resd 20
section .text
	global main
	extern printf, puts,scanf
main:
	push msg
	call puts
	add esp,4

	push Num
	push msg1
	call scanf
	add esp,8
	mov ecx, 0
	
	
lp:   mov esi, Array
	mov eax, 4
	mul ecx
	add esi,eax
	pusha
	push esi
	push msg1
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[Num]
	jnz lp

mov ecx, 0
	
	
lp1:   mov esi, Array
	mov eax, 4
	mul ecx
	add esi,eax
	pusha
	push dword[esi]
	push msg4
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[Num]
	jnz lp1


	xor esi, esi		;i
lp2: cmp esi,dword[Num]
	jge final
	mov edi,dword[Array+esi*4]
	mov ebx,esi
lp3:	
	inc ebx			; j
	cmp ebx,dword[Num]
	jge outer
	cmp edi,dword[Array+ebx*4]
	jb lp3
	xchg edi,dword[Array+ebx*4]
	jmp lp3
	;; for (i = 0 ; i<n;i++)
	;;edi= a[i]
	;; for (j = i+1;	j<n j++)
	;; if (edi> a[j])
	;;            temp = edi;
	;;            edi = a[j];
	;;           a[j] = temp;
outer:	
	;; a[i] = edi
	 	mov dword[Array+esi*4],edi
	jmp lp2

	
final:	xor ecx,ecx
final1:	mov esi, Array
	mov eax, 4
	mul ecx
	add esi,eax
	pusha
	push dword[esi]
	push msg4
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[Num]
	jnz final1
	
	
	
