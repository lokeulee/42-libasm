section .text
extern malloc
extern ft_strlen
extern ft_strcpy
global ft_strdup

ft_strdup:
    push rbp                    ; Save base pointer
    mov rbp, rsp               ; Create new stack frame
    push rdi                   ; Save source string pointer
    push rbx                   ; Save rbx as we will use it to save length of string
    
    test rdi, rdi             ; Verify input string isn't NULL
    jz strdup_error
    
    call ft_strlen wrt ..plt   ; Call ft_strlen through PLT
    mov rbx, rax              ; Save length
    inc rax                   ; Adding additional length of 1 for null terminator
    
    mov rdi, rax
    call malloc wrt ..plt     ; Call malloc through PLT
    test rax, rax            ; Check if malloc failed
    jz strdup_error
    
    mov rdi, rax             ; Set destination string
    pop rbx                  ; Restore rbx
    pop rsi                  ; Get source string
    push rax                 ; Save malloc-ed pointer
    
    call ft_strcpy wrt ..plt ; Call ft_strcpy through PLT
    pop rax
    pop rbp
    ret

strdup_error:
    pop rbx                  ; Restore rbx
    pop rdi                  ; Restore stack
    pop rbp
    xor rax, rax            ; Return NULL
    ret