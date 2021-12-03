	;; scan string = scas
;;; scasb, scasw, scasd
;;;  compares byte in memory represented by EDI with al register value
section .data
	Source db "This is my string",10,0
	msg db "String length is %d",10,0
section .text
	global main
	extern printf
main:
	mov edi, Source
	mov esi,edi
	xor eax,eax
	mov al, 0
	repnz scasb
	sub  edi,esi

	push edi
	push msg
	call printf
	add esp,8
