.model small
.stack 100h
.code      
main proc
    mov al, 70h
    cmp al, 0
    jl then
    jmp else      
then:
    mov ah, 0FFh
    jmp endif    
else:
    mov ah, 0
endif:
    int 21h   
main endp
end main 
