global ft_read

section .data
    READ equ 1
section .text

    ; Parameters are already in correct registers for syscall:
    ; rdi = fd
    ; rsi = buffer
    ; rdx = bytes to read
ft_read:
    push    rbp             ; save base pointer
    mov     rbp, rsp        ; set up new stack frame
    
    mov     rax, READ          ; syscall for reading
    syscall
    
    ; Check for error (negative return value)
    test    rax, rax
    js      set_error
    
    ; Success path
    pop     rbp             ; restore base pointer
    ret

set_error:
    mov     rdi, rax        ; set errno
    mov     rax, -1         ; return -1 to indicate error
    pop     rbp             ; restore base pointer
    ret