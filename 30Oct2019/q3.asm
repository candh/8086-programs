.model small
.stack 100h
.code      
main proc
    mov ah, 1
    int 21h
    mov dl, al
    cmp dl, 'A'
    jb end
    cmp dl, 'Z'
    ja end
    mov ah, 2
    int 21h   
end:
    mov ax, 4Ch
    int 21h   
main endp
end main 
