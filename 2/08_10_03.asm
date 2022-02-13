	;;  display string using write system call
	section .data
	;; msg db "This is a sample",10,0
	msg db 'asdf',0
	len equ $-msg
	section .text
	global main
main:
	;; Whenever one uses system call use registers as described below

mov ecx,msg 		; Second  parameter value of system call
	mov ebx,1 		; first parameter value of system call
	
	mov eax,4 		; system call number
	mov edx, len         	; Third  parameter value of system call\
	int 0x80 		; instruction to be used to execute interrupt
	
	
	;; 	mov eax,1mov ebx, 0 int 0x80
