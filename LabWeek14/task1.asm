org 100h
.stack 100h
.model small
.data
    str1 db 'abc de','$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    xor cx, cx      ; clear counter
    xor bx, bx      ; clear index
    lea si, str1
count:  
    mov al, str1[bx]
    cmp al, '$'
    je exit
    inc cx
    inc bx
    jmp count
    
exit:
    mov ax, 4Ch
    int 21h
main endp
