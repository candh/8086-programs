.model small
.stack 100
.code
main proc
    mov bx, 0A4CDh
    
    mov cx, 4 ; setup counter
    mov ah, 2 ; output mode
print_loop:
    mov dl, bh
    shr dl, 4
    cmp dl, 10
    jl then
    jmp else
then:
    add dl, 30h
    jmp endif
else:
    add dl, 37h
endif:
    int 21h
    rol bx, 4 
    
    loop print_loop
    
main endp
end main