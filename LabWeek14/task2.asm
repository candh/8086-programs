org 100h
.stack 100h
.model small
.data
    str db 'abcdef$'
    n dw 6 ; length
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bx, 0
    
    mov ah, 2 
    mov cx, n
print:
    dec cx
    mov bx, cx
   
    mov dl, str[bx]
    int 21h
    jnz print
    
    mov ax, 4Ch
    int 21h
        
main endp
end main