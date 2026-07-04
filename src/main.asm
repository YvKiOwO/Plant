; src/main.asm
section .data
    cmd_send    db "/usr/local/bin/plant-engine", 0 
    arg_send    db "send", 0
    arg_recv    db "receive", 0
    
    err_msg     db "Error: Exec failed. Check path.", 10
    err_len     equ $ - err_msg

section .text
    global _start

_start:
    pop rax
    cmp rax, 3
    jl exit

    pop rdi             ; skip ./plant
    pop rsi             ; command ("send" or "recv")
    pop rdx             ; filename or code

    mov al, [rsi]
    cmp al, 's'
    je do_send
    cmp al, 'r'
    je do_recv
    jmp exit

do_send:
    mov rdi, cmd_send
    push 0
    push rdx            ; filename
    push arg_send       ; "send"
    push cmd_send       ; binary path
    mov rsi, rsp        ; argv
    mov rax, 59         ; sys_execve
    xor rdx, rdx        ; envp
    syscall
    jmp print_error     ; If it hits here, it failed

do_recv:
    mov rdi, cmd_send
    push 0
    push rdx            ; code
    push arg_recv       ; "receive"
    push cmd_send       ; binary path
    mov rsi, rsp        ; argv
    mov rax, 59         ; sys_execve
    xor rdx, rdx        ; envp
    syscall
    jmp print_error

print_error:
    mov rax, 1
    mov rdi, 1
    mov rsi, err_msg
    mov rdx, err_len
    syscall

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
