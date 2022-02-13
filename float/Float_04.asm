section .data
	r dq 2.1	; 8 bytes
	b dq 2.6         	; define quad 8 bytes = 64 bit
	two dd 2
	msg db " Result is %f",10,0
section .bss
	result resq 1

section .text
	global main
	extern printf

main:
	fldpi 			; loads pi value to st0
	;;  fld1				; ;loads 1 to st0
;;; 	fldz			; ;loads zero to st0
	fld qword[r]
	fmul qword[r]
	fmul st1
	fild dword[two]
	fmul st1
