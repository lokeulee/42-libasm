global ft_write

section .data
    WRITE equ 1

section .text
ft_write:
    push    rbp             ; Save base pointer
    mov     rbp, rsp        ; Set base pointer to stack pointer
    mov     rax, WRITE      ; Syscall number for write
    syscall                 ; Perform the syscal
    jc      set_error       ; Jump if error occurred

    pop     rbp             ; Restore base pointer
    ret                     ; Return the number of bytes written

set_error:
    mov     rax, -1         ; Return -1 on error
    pop     rbp             ; Restore base pointer
    ret