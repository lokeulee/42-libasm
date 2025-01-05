global ft_write

section .data
    WRITE equ 1

section .text
    ; Parameters are already in the correct registers:
    ; rdi = fd
    ; rsi = buffer
    ; rdx = count
ft_write:
    push    rbp             ; Save base pointer
    mov     rbp, rsp        ; Set base pointer to stack pointer
    mov     rax, WRITE      ; Syscall number for write
    syscall                 ; Perform the syscall

    test    rax, rax
    js      set_error         ; Jump if sign flag is set (negative result)

    pop     rbp             ; Restore base pointer
    ret                     ; Return the number of bytes written

set_error:
  	neg     rax               ; Get positive error code
    mov     rdi, rax         ; Save error code (if you need to set errno)
    mov     rax, -1         ; Return -1 on error
    pop     rbp             ; Restore base pointer
    ret