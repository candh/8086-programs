org 100h
.stack 100h
.model small
.data
    input db 127 dup(?)  ; 25 char buffer
    output db 128 dup(?) ; one more for '$'
    crlf db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea di, input
    cld
    mov cx, 25
    mov dx, 0
    mov ah, 1
inputl:
    int 21h
    cmp al, 0Dh
    je endinput
    stosb
    inc dx
    loop inputl
    
endinput:
    dec di
    mov cx, dx
    lea si, output
copy:
    mov al, [di]
    mov [si], al
    inc si
    dec di
    loop copy
    
    mov [si], '$'
    
    mov ah, 9
    lea dx, crlf   ;newline
    int 21h
    
    lea dx, output ;output
    int 21h
     
    mov ax, 4Ch
    int 21h

main endp
end main