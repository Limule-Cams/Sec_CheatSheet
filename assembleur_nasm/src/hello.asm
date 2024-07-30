bits 64


section .data

message: db 'Hello github',10
msg_len: equ $-message



section .text
global _start
    _start:
        mov rax,0x01
        mov rdi,1
        mov rsi,message
        mov rdx, msg_len
        syscall

        mov rax,0x3c
        mov rdi, 0
        syscall