global _ft_strcpy

_ft_strcpy:
    mov     rax, 0
    mov     rcx, rdi ; Saving initial position of destination

_strcpy_next:
    cmp     byte [rdi], 0             ; Check if the current byte is null (end of string)
    jz      _strcpy_done              ; jump if equals to 0

    mov     byte al, byte [rsi]       ; Load the byte from the source
    mov     byte [rdi], byte al       ; Store it in the destination
    inc     rsi                       ; src character move 1 char ->
    inc     rdi                       ; dst character move 1 char ->
    jmp     _strcpy_next              ; Continue looping

_strcpy_done:
    mov     rax, rcx        ; Store the length (counter) in rax
    ret                     ; Return from the function
