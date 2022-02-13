section .data
	a dq 1.9 		; 8 bytes
	b dq 2.6         	; define quad 8 bytes = 64 bit
	a1 dq 3.9 		; 8 bytes
	b1 dq 4.6         	; define quad 8 bytes = 64 bit
	a2 dq 5.9 		; 8 bytes
	b2 dq 6.6         	; define quad 8 bytes = 64 bit
	a3 dq 7.9 		; 8 bytes
	b3 dq 8.6         	; define quad 8 bytes = 64 bit

section .text
	global main
main:
	fld qword[a]
	fld qword[b]
	fld qword[a1]
	fld qword[b1]
	fld qword[a2]
	fld qword[b2]
	fld qword[a3]
	fld qword[b3]
	;; fadd st1,st0 		; ;st1 = st1 +st0
	;; fadd st0,st1 		; st0 = st0+st1
;;; 	fsub st0,st1 		; st0 = st0-st1
	fsubr st0,st1   	; st0 = st1-st0
