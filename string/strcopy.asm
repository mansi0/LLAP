;;; movs movsb,movsw,movsd
;;; source = esi
;;; destination  =edi
	section .data
	Source db "This is my string",10,0
	len equ $-Source
section .bss
	Destination resb len
section .text
	global main
main:
	mov esi, Source
	mov edi, Destination
	mov ecx, len
	;;; 1
	;; lp:	mov al, byte[esi]
	;; mov byte[edi],al
	;; inc esi
	;; inc edi
	;; loop lp

	;; 2
	;; lp:	movsb
	;; loop lp

	;; 3
	rep movsb



	mov eax,4
	mov ebx, 1
	mov ecx, Destination
	mov edx,len
	int 0x80
