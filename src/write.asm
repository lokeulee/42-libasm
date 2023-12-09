
global _ft_write

section .data
    input_string db 'Hello, Assembly!', 0    ; Null-terminated string to be written
    input_length equ $ - input_string        ; Length of the string
    custom_fd equ 1                           ; Custom file descriptor (e.g., stdout)


_ft_write:
    ; You can input your own values here
    ; For example:
    ; mov rdi, custom_fd          ; Set your own file descriptor
    ; mov rsi, input_string       ; Set the pointer to your own string
    ; mov rdx, input_length       ; Set the length of your own string

    ; For demonstration, using the predefined values
    mov rdi, 1                   ; file descriptor 1 (stdout)
    mov rsi, input_string        ; pointer to the buffer
    mov rdx, input_length        ; length of the buffer

    ; Arguments for write syscall
    mov rax, 1                   ; syscall number for write

    ; Invoke syscall
    syscall

    ; Exit the program
    mov rax, 60                  ; syscall number for exit
    xor rdi, rdi                 ; exit code 0
    syscall