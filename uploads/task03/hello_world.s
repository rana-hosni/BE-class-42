section .data
    msg     db "Hello, World!", 0x0A  ; The message with newline
    len     equ $ - msg               ; Length of the message

section .text
    global _start

_start:
    ; syscall: write(fd=1, buf=msg, count=len)
  
    mov     rax, 1          ; syscall number for sys_write
    mov     rsi, msg        ; pointer to message
    mov     rdx, len        ; message length
    mov     rdi, 1          ; file descriptor 1 (stdout)
    syscall                 ; invoke kernel

    ; syscall: exit(status=0)
    mov     rax, 60         ; syscall number for sys_exit
    mov     rdi, 4242        ; status = 0
    syscall
