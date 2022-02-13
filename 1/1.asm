section .data
; everything which is initialized
; db = byte(1) dw = word(2) dd = double(4) dq = quad(8) and dt= ten(10)
	a db 'a'
	b db 10
	a1 dw 'ab'
	b1 dw 10
	a2 dd 'abcd'
	b2 dd 10
section .rodata
	;;  readonly data
	msg db 'This is a sample',10,0
section .bss
	;uninitialized variable/identifiers
	;; resb,resw,resd,resq,rest
	;; 		identifier res(b/w/d/q/t) Count = count*(b/w/d/q/t)
	a3 resb 10 		; ; 10 bytes reserved
	b3 resw 10 		; ; 20 bytes
	c3 resd 10 		; 40 bytes
	d4 resq 10 		; 80 bytes
section .text
	global main
	extern printf
main:
	push msg 		; 4 bytes 
	call printf
	add esp,4
	
