global ft_strlen
ft_strlen:
    mov     rax, 0
    push    rcx             ; Save and clear out the counter
    xor     rcx, rcx        ; Initialize the counter to zero

strlen_next:
    cmp     byte [rdi], 0   ; Check if the current byte is null (end of string)
    jz      strlen_done     ; jump if equals to 0
    inc     rcx             ; Increment the counter
    inc     rdi             ; Move to the next character in the string
    jmp     strlen_next     ; Continue looping

strlen_done:
    mov     rax, rcx        ; Store the length (counter) in rax
    pop     rcx             ; Restore the original value of rcx
    ret                     ; Return from the function
