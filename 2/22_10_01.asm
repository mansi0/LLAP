;;  PUSHA  push all general purpose registers on stack eax,ecx,edx,ebx,esp,ebp,esi,edi
;;;  POPA  pop all pushed  general purpose registers from  stack in the reverse order
;;; i.e. edi,esi,ebp,esp,ebx,edx,ecx,eax (POPA)

	section .data
	msg db "This is an overview of PUSHA and POPA instruction",10,0
	section .text
	global main
	extern printf
main:
	pusha
	push msg
	call printf
	add esp,4
	popa
	
