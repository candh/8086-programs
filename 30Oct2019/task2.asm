.model small
.stack 100h
.data
    cr db "Carriage Return$"
    lf db "Line Feed$"
.code      
main proc
    ; init ds
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov cl, al
    
    cmp cl, 'A'
    je print_cr
    cmp cl, 'B'
    je print_lf
    jmp exit

print_cr:
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov ah, 9
    lea dx, cr
    int 21h
    jmp exit
print_lf:
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov ah, 9
    lea dx, lf
    int 21h
exit:
    mov ax, 4Ch
    int 21h
    
main endp
end main