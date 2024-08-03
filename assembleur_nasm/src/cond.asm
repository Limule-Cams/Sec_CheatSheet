bits 64

section .data

msg: db 'felicitation trouver ',10
msg_len: equ $-msg
msgn: db 'valeurs differentes ',10
len: equ $-msgn

section .text
global _start
    _start:
    mov rax, 5
    mov rdx, 5
    cmp rax, rdx
    je affiche
    jne affiche_diff

    ;on peut utiliser à la place jl pour jump if lower ou jg pour jump if great
    ; jl pour < et jg > et après afficher le label qui convient . on a aussi jge, jle ...

    affiche:
        mov rax, 0x01
        mov rdi, 1
        mov rsi, msg
        mov rdx, msg_len
        syscall
        jmp exit

    affiche_diff:
        mov rax, 0x01
        mov rdi, 1
        mov rsi, msgn
        mov rdx, len
        syscall

    exit:
        mov rax, 0x3c
        mov rdi, 0
        syscall