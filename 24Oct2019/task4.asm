.model small
.stack 100h
.data
    row db "**********",0Dh,0Ah,"$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    mov cx, 10
    
    loop:
        lea dx, row
        int 21h
        dec cx
        jnz loop
     
    
    mov ax, 4C00h
    int 21h
    
main endp
end main