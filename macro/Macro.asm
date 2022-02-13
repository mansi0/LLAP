	%macro Macroname 2 	; %macro name    number of parameters for a macro defn
	mov eax , %1
	mov ebx, %2
	add eax,ebx
	%endmacro
	section .text
	global main
main:
	Macroname 10,20
	Macroname 40,60
	
