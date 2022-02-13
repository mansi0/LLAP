section .data
	My_Name db 'Nitin P.Patil',10,0
	My_Dept db ' Department of Computer Science'
	My_Designation db 'Assistant Professor'
	New_Line db 10
section .text
	global main
	extern puts, printf
main:
	push My_Name
	call puts
	add esp,4
	push My_Name
	call printf
	add esp,4
	push New_Line
	call printf
	add esp,4
	push My_Name
	call printf
	add esp,4
	push My_Name
	call puts
	add esp,4
