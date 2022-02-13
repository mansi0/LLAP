section .data
	a dq 1.9 		; 8 bytes
	b dq 2.6         	; define quad 8 bytes = 64 bit
	msg db " Result is %f",10,0
section .bss
	result resq 1

section .text
	global main
	extern printf
main:
	fld qword[a]
	fld qword[b]
;;; 	fadd st1,st0 		; ;st1 = st1 +st0
	fadd st0,st1 		; st0 = st0+st1
;;; 	fsub st0,st1 		; st0 = st0-st1
;;; 	fsubr st0,st1   	;st0 = st1-st0
	;;  fst qword[result]   ; value from st0 is stored in variable result
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
