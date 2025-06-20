section .data
    msg     db "Hello World!", 0x0A  
    len     equ $ - msg               

section .text
    global _start

_start:
    ; syscall: write(fd=1, buf=msg, count=len)
  
    mov     rax, 1          
    mov     rsi, msg       
    mov     rdx, len        
    mov     rdi, 1          
    syscall                

    ; syscall: exit(status=0)
    mov     rax, 60        
    mov     rdi, 4242        
    syscall
