bits 64

%define MAX 5

section .data

msg: db 'entré non pour quitter ',10
msg_len: equ $-msg
ms: db 'non ',0

section .bss
entry: resb MAX

section .text
global _start
_start:

    push rbp
    mov rbp, rsp
    sub rsp, 8 ; pour alligner la pile 8+ l'adresse de retour de strcmp

    boucle:
        mov rax, 0x01
        mov rdi, 1
        mov rsi, msg
        mov rdx, msg_len
        syscall

        mov rax, 0x00
        mov rdi, 0
        mov rsi, entry
        mov rdx, MAX
        syscall
        mov byte [entry + rax - 1], 0; on supprime le saut de ligne

        mov rsi, entry ; les arguments de la fonction strcmp
        mov rdi, ms
        call strcmp
        test rax, rax
        jne boucle

    add rsp, 8
    mov rsp, rbp
    pop rbp

    exit:
        mov rax, 0x3C
        mov rdi, 0
        syscall

    strcmp:
        .compare:
            mov al, [rsi]
            mov bl, [rdi]
            cmp al, bl
            jne .not_equal
            test al, al
            je .equal
            inc rsi
            inc rdi
            jmp .compare
        .not_equal:
            ret
        .equal:
            xor rax, rax
            ret
    