global _ft_strcmp

_ft_strcmp:
    mov     rax, 0
_strcmp_loop:

    cmp     byte[rsi], 0
    jz      _check_null

    movzx     r8 , byte[rsi]            ; clears the r8 before setting that shit me thinks
    movzx     r9 , byte[rdi]            ; clears the r8 before setting that shit me thinks
    ; cmp     byte [rdi], byte [rsi]    ; Check if the current byte is null (end of string) doesnt work
    cmp     byte r8b, byte r9b          ; Check if char are the same
    jne      _strcmp_done               ; jump if char is not the same
    inc     rsi                         ; src character move 1 char ->
    inc     rdi                         ; dst character move 1 char ->
    jmp     _strcmp_loop                ; Continue looping

_check_null:
    cmp     byte[rdi], 0
    jne      _return             ; jump if not 0

_return:
    ret

_strcmp_done:
    sub     r8, r9
    mov     rax, r8        ; Store the length (counter) in rax
    ret                     ; Return from the function
