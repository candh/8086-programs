.model small
.stack 100h
.data
    msg1 db "Enter a hex digit: $"
    msg2 db 0Dh, 0Ah, "In decimal it is $"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h 
    mov cl, al
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 2
    mov dl, '1'
    int 21h
    
    ; doing the actual math stuff
    sub cl, 'A'
    add cl, 48
    mov dl, cl
    int 21h
    
    
    mov ax, 4C00h
    int 21h
    
main endp
end main