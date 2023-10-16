global _start

section .data
    hello db 'Hello, World!',0x0a    ; Null-terminated string to print
    len equ $ - hello             ; Calculate string length

section .text
    ; global _start

_start:
    ; syscall number for write (1)
    mov eax, 4
    ; file descriptor for stdout (1)
    mov ebx, 1
    ; pointer to the message to print
    mov ecx, hello
    ; message length
    mov edx, len
    ; make syscall
    int 0x80

    ; Exit the program (syscall number 60)
    mov eax, 1
    mov ebx, 0
    int 0x80
