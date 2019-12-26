.model small
.stack 100h
.code      
main proc 
    
    mov ax, 5
    mov bx, 4
    mov cx, 3
    
    cmp ax, bx
    jl then
    cmp bx, cx
    jl then
    jmp else
    
then:
    mov dx, 0
    jmp endif
else:
    mov dx, 1
endif:
    mov ax, 4Ch
    int 21h   
main endp
end main 