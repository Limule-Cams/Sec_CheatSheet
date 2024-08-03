
bits 64

section .data
msg: db 'Hello people nasm ',10
len: equ $-msg

section .text
global _start
_start:
    mov rbx, 10 ; ici on utilise rbx comme compteur de boucle
    
    boucle:
        ; on affiche la chaine 
        mov rax, 0x01
        mov rdi, 1
        mov rsi, msg
        mov rdx, len
        syscall

        dec rbx ; on décrémente notre compteur
        jnz boucle ; si rdx n'est pas zéro, on boucle

    mov rax, 0x3c
    mov rdi, 0
    syscall

