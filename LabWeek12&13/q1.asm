org 100h
.stack 100h
.model small
.data
    total dw 0
    msg1 db 'Enter decimal digits = $'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, msg1
    int 21h
    
    xor bx, bx  ; bx acts as total
getchar:
    mov ah, 1
    int 21h
    cmp al, 0Dh
    je endgc
    ; else  
    and al, 0Fh ; convert to binary
    mov cl, al
    ; total = total * 10 + value
    mov al, bl
    mov ah, 10
    mul ah
    mov bx, ax
    add bl, cl
    jmp getchar
endgc:
    mov total, bx
    
    mov ax, 4Ch
    int 21h
main endp
end main