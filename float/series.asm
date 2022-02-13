section .data
     i dd 1
  ;  b dd 6
  ;  c dd 4
    msg db " result is is %f",10,0
    val db "%d",0
section .bss
    i resd 1
    n resd 1
section .text
    global main
    extern printf
main:
push n
push val
call scanf
add esp,8
mov ecx, dword[n]

    enter 0,0
    mov dword[Four],4
    
