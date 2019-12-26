.model small
.stack 100h
.code

main proc
    mov al, 75d
    
    mov cx, 8
    jmp loop
    
loop:
    shr al, 1
    rcl ah, 1
    dec cx
    jnz loop    
    
mov al, ah
    
    mov ax, 4Ch
    int 21h
    
main endp
end main