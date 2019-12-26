org 100h
.stack 100h
.model small
.data
.code
main proc
    mov ax, 256
    
    cmp ax, 0
    jl minus
    jmp endif_minus
minus:
    mov ah, 2
    mov dl, '-'
    int 21h
    neg ax   ; 2's complement
endif_minus:
    mov cx, 0
    
convert:
    ; ax / 10
    mov dl, 10
    div dl
    
    ; mov quotient to dl
    mov dl, al
    ; mov remainder to al
    mov al, ah
    ; clear ah
    and ax, 00FFh
    ; push remainder
    push ax
    ; increment
    inc cx
    ; clear ax
    xor ax, ax
    ; put quotient back
    mov al, dl
 
    ; loop while quotient > 0   
    cmp al, 0
    jnz convert              
    
printdgt:
    pop ax
    add ax, 30h
    mov ah, 2
    mov dl, al
    int 21h
    loop printdgt
 
    ; ---------
    mov ax, 4Ch
    int 21h
          
main endp
end main