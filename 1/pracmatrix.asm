section .data
    msg db "%d",0
    mat dd 10,20,30,
        dd    40,50,60,
        dd 70,80,90
    n db 3
    m db 3
    msg4 db "Given Matrix is:",10,0
    msg5 db "Trasnspose Matrix is:",10,0
    sp1  db 9,0
    sp2  db 10,0

 

section .bss
;    mat resd 50
;    n   resd 1
;    m   resd 1
    c   resd 1
    p   resd 1
    f   resd 1

 

section .text
    global main
    extern printf,scanf

 

main:

 

    mov eax,dword[n]
    mul dword[m]
    mov dword[c],eax

 

;print " given matrix is :"

 

    pusha
    push msg4
    call printf
    add esp,4
    popa

 

;print matrix :    
    mov ecx,dword[c]
    mov ebx,mat

 

;print new line
back:    xor edx,edx
    pusha
    push sp2
    call printf
    add esp,4
    popa

 

;if edx == noof col go to print new lin

 

pqr:    cmp edx,dword[m]
    je back
    
;print matrix ele

 

    pusha
    push dword[ebx]
    push msg
    call printf
    add esp,8
    popa

 

;print tab

 

    pusha
    push sp1
    call printf
    add esp,4
    popa

 

;inc edx(counting cols in a row) counter,;
;ebx= ebx+4 (pointing to matrix),
; ecx has count of of total nos if matrix dec it by 1 and jump pqr unless it becomes 0
 
    inc edx
    add ebx,4
    loop pqr

 

;print new line

 

    pusha
    push sp2
    call printf
    add esp,4
    popa