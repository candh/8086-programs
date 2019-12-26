org 100h
.stack 100h
.model small
.data
    str db 128 dup(?) ; 128 buffer size
    max db 0
    min db 7Ah
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea di, str
    mov cx, 128
    mov ah, 1

input:
    int 21h
    cmp al, 0Dh
    je endl
    
    cmp al, max
    jl endmax     
    mov max, al
endmax:
    cmp al, min
    jg endmin    
    mov min, al
endmin:
    stosb
    loop input
endl:
    mov [di], '$'
    
    mov ax, 4Ch
    int 21h    
main endp
end main