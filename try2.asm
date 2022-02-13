section .data
        msg db "The number is %d", 10, 0

x dd 32
y dd 17
section .text
global main
extern printf

main :
mov eax, x

pusha
        push eax
        push msg
        call printf
        add esp, 8
        popa

mov ebx, [eax]
pusha
        push ebx
        push msg
        call printf
        add esp, 8
        popa

mov ecx,[eax+4]
pusha
        push ecx
        push msg
        call printf
        add esp, 8
        popa

add ebx, [x]
pusha
        push ebx
        push msg
        call printf
        add esp, 8
        popa

add ecx, ebx
pusha
        push ecx
        push msg
        call printf
        add esp, 8
        popa

mov eax, [eax]
pusha
        push eax
        push msg
        call printf
        add esp, 8
        popa

