global _ft_write

section .data
    WRITE equ 0x2000004

section __TEXT,__text
_ft_write:
    push    rbp             ; push base pointer
    mov     rbp, rsp        ; set base pointer into stack pointer 

    mov     rax, WRITE      ; syscall number
    syscall

    jc set_error            ; if error, set errno and return -1

    mov     rax, 0          ; return value for success
    pop     rbp             ; restore base pointer
    ret

set_error:
    mov     [rax], rax      ; Set errno to the error value
    mov     rax, -1         ; return value for error
    pop     rbp             ; restore base pointer
    ret