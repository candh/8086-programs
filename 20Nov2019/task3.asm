.stack 100h
.model small
.data
    msg1 db "Enter byte number in hex: $"
    addm db "Addition is = $"
    subm db "Subtraction is = $"
    crlf db 0Dh, 0Ah, "$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bl, 0 ; clear bits
    
    mov cx, 2 ; get two numbers
get_two_num:

    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1    
    mov dx, 2 ; for inner loop
    
char_input_loop:
    int 21h
    ; if char between 30h to 39h then
    ; it is a digit
    cmp al, 30h
    jl else
    cmp al, 39h
    jg else        
digit:
    and al, 0Fh ; converts to binary
    jmp endif
else:
    ; it is a character (A - F)
    ; check if char between A and F
    
    cmp al, 'A'
    jl exit
    cmp al, 'F'
    jg exit ; invalid char
    
    ; convert to binary
    sub al, 'A'
    add al, 10
endif:
    ; left shift bx 4 times
    shl bl, 4
    or bl, al
    
    dec dx
    jnz char_input_loop
    ; loop char_input_loop
    
    ; push num to stack
    push bx
    ; clear bx
    mov bx, 0
    
    mov ah, 9
    lea dx, crlf
    int 21h
    
    loop get_two_num
    
    
    ; new line
    mov ah, 9
    lea dx, crlf
    int 21h
    
    lea dx, addm
    int 21h
    
    pop ax
    pop bx
    
    ; add
    mov cx, ax
    add cx, bx
     
    push ax
    push bx
    
    mov bx, cx
    ; display that
    mov cx, 2 ; setup counter
    mov ah, 2 ; output mode
print_loop00:
    mov dl, bl
    shr dl, 4  
    cmp dl, 10
    jl then00
    jmp else00
then00:
    add dl, 30h
    jmp endif00
else00:
    add dl, 37h
endif00:
    int 21h
    rol bx, 4 
    
    loop print_loop00

exit:
    mov ax, 4Ch
    int 21h
    
main endp
end main