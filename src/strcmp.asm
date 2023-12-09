global _ft_strcmp

_ft_strcmp:
    mov     rax, 0
_strcmp_loop:

    cmp     byte[rsi], 0
    movzx     r8 , byte[rsi]            ; clears the r8 before setting that shit me thinks
    movzx     r9 , byte[rdi]            ; clears the r9 before setting that shit me thinks
    jz      _check_char_null            ; compares byte[rsi] its EQUALS to 0,

    ; cmp     byte [rdi], byte [rsi]    ; Check if the current byte is null (end of string) doesnt work
    cmp     byte r8b, byte r9b          ; Check if char are the same (r8b and r9b are the byte 0 of r8 and r9)
    jne      _strcmp_does_not_equal     ; jump if char is not the same
    inc     rsi                         ; src character move 1 char ->
    inc     rdi                         ; dst character move 1 char ->
    jmp     _strcmp_loop                ; Continue looping

_check_char_null:
    mov     rax, r9         ; Store the length (counter) in rax, since r8 = 0,
                            ; r9 due to obtaining the difference in value
    ret                     ; Return from the function

_strcmp_does_not_equal:
    sub     r9,  r8
    mov     rax, r9         ; Store the length (counter) in rax
    ret                     ; Return from the function
