.model small
.stack 100h
.code      
main proc
    mov ax, 5
    mov bx, 4
    mov cx, 3
    cmp ax, bx
    jge else
    mov ax, 0
    jmp end
else:
    cmp bx, cx
    jge _else
    mov bx, 0
    jmp end
_else:
    mov cx, 0
end:
    mov ax, 4Ch
    int 21h
     
main endp
end main 
