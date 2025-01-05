extern malloc
extern ft_strlen
extern ft_strcpy
global ft_strdup
ft_strdup:
    push    rbp             ; Save base pointer
    mov     rbp, rsp        ; Create new stack frame
    
    push    rdi             ; Save source string pointer
    push    rbx             ; Save rbx as we will use it to save length of string
    
   
    test    rdi, rdi  	    ; Verify input string isn't NULL
    jz      strdup_error
    
    call    ft_strlen       ; Length will be in rax
    mov     rbx, rax  	    ; Save length
    inc     rax 		    ; Adding additional length of 1 for null terminator
    
    mov     rdi, rax        
    call    malloc          ; Call malloc with length in rdi as rdi is malloc's argument (rax will be malloc-ed)
    test    rax, rax        ; Check if malloc failed
    jz      strdup_error
    
	; passing source and destination to ft_strcpy
    mov     rdi, rax        ; now that we malloc-ed rax, we pass it as the destination string in ft_strcpy 
    pop     rbx             ; Restore rbx
    pop     rsi             ; source string
    
    push    rax             ; Save malloc-ed pointer
    call    ft_strcpy      
    pop     rax             
    pop     rbp
    ret

strdup_error:
    pop     rbx            ; Restore rbx
    pop     rdi            ; Restore stack
    pop     rbp
    xor     rax, rax       ; Return NULL
    ret