bits 64

section .data
 
 ; dans cette section comme dans le resumé on à des variables local ou global initialisé 
 message: db 'bonjour votre nom',10
 msg_len equ $-message
print: db 'votre nom est : '
print_len: equ $-print
max_len equ 10

section .bss
name resb max_len

section .text
global _start
    _start:
        ;ici on affiche le message pour l'entrée utilisateur 
        mov rax, 0x01
        mov rdi, 1
        mov rsi, message
        mov rdx, msg_len
        syscall

        ; on lit avec l'appelle system read 0x00 en hexa
        mov rax, 0x00
        mov rdi, 0
        mov rsi, name
        mov rdx, max_len
        syscall
        mov rbx, rax; on recupère le retour de sys_read qui est stoké dans rax

        ;on affiche va variable print et ensuite le nom
        mov rax, 0x01
        mov rdi, 1
        mov rsi, print
        mov rdx, print_len
        syscall

        mov rax, 0x01
        mov rdi, 1
        mov rsi, name
        mov rdx, rbx ; ici on donne directement à rdx le nbre de caractère lu
        syscall

        ; ici on quitte le programme avec un exit(0)
        mov rax, 0x3c
        mov rdi, 0
        syscall