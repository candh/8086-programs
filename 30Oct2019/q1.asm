.model small
.stack 100h
.code      
main proc
    mov ax, 8000h
    cmp ax, 0
    jl then
    jmp endif      
then:
    mov bx, -1    
endif:
    mov ax, 4Ch
    int 21h   
main endp
end main 