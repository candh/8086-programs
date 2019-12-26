.model small
.stack 100h
.code      
main proc
    mov ax, 1
    mov bx, 3
    mov cx, 3
    cmp ax, bx
    jge end
    cmp bx, cx
    jge _else
    mov ax, 0
    jmp end
_else:
    mov bx, 0
end:
    mov ax, 4Ch
    int 21h
     
main endp
end main 
