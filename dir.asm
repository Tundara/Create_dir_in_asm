BITS 64

;Created by Tundara

global _start

section .rodata 
    ask db "Choose a folder name : "
    ask_len equ $-ask

section .bss
    pathname resb 16

section .text


_start:

    call _ask_name_string
    call _ask_fold_name
    call _create_folder

    mov rax, 60
    mov rdi, 0
    syscall

_ask_name_string:
    mov rax, 1
    mov rdi, 1
    mov rsi, ask
    mov rdx, ask_len
    syscall
    ret

_create_folder:
    mov rax, 83
    mov rdi, pathname
    syscall
    ret

_ask_fold_name:
    mov rax, 0
    mov rdi, 0
    mov rsi, pathname
    mov rdx, 16
    syscall
    ret
