.stack 100h
.model small
.code
main proc
    mov bx, 0 ; clear bits
    mov ah, 1 ; input mode
input_loop:
    int 21h
    cmp al, 0Dh
    je exit
    ; if char between 30h to 39h then
    ; it is a digit
    cmp al, 30h
    jl else
    cmp al, 39h
    jg else        
digit:
    and al, 0Fh ; converts to binary
    jmp endif
else:
    ; it is a character (A - F)
    ; check if char between A and F
    
    cmp al, 'A'
    jl exit
    cmp al, 'F'
    jg exit
    
    ; convert to binary
    sub al, 'A'
    add al, 10

endif:
    ; left shift bx 4 times
    shl bx, 4
    or bl, al          
    
    jmp input_loop     
exit:      
    mov ax, 4Ch
    int 21h
main endp
end main