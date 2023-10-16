global _start
section .data
	WRITE:	equ 0x2000004
	EXIT:	equ 0x2000001
    STDOUT: equ 1

	hello_str:	db "Hello world!",10
	len:	equ $ - hello_str

section .text
_start:

	mov rax, WRITE  	; syscall for sys_write
	mov rdi, STDOUT     ; mov fd 1 to rdi register
	mov rsi, hello_str	; mov hello_str to rsi register 
	mov rdx, len		; mov the strlen to rdx register
	syscall				; execute sys_write syscall
    mov rax, EXIT 		; syscall for sys_exit
	mov rdi, 0			; move exit code to rdi register
	syscall				; execute sys_exit syscall
