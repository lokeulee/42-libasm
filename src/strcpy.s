global ft_strcpy

ft_strcpy:
    mov     rcx, rdi                  ; Save the original destination pointer

strcpy_next:
    mov     al, byte [rsi]            ; Load the byte from the source string
    mov     byte [rdi], al            ; Store the byte in the destination string

	cmp     byte [rdi], 0             ; Check if the current byte is null (end of string)
    jz      strcpy_done               ; jump if equals to 0

    inc     rsi                       ; Move to the next byte in the source
    inc     rdi                       ; Move to the next byte in the destination
    jmp     strcpy_next               ; Continue looping
strcpy_done
 	mov     byte [rdi], 0             ; Null-terminate the destination string
    mov     rax, rcx                  ; Return the original destination pointer
    ret								  ; Return from the function