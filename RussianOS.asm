#make_boot#
putc macro char
    mov ah,0Eh
    mov al,char
    int 10h    
endm
org 7c00h
mov ax,07c0h
mov ss,ax
mov sp,03feh
xor ax,ax
mov ds,ax  
lea si,welcome_m
call print_string   

lea si,load_m
call print_string

mov ax,0800h
mov es,ax   
mov bx,0
mov ah,02h
mov al,10
mov ch,0
mov cl,2
mov dh,0
int 13h  
lea si,jump_m
call print_string
jmp 0800h:0000h



print_string proc
    print:
        mov al,[si] 
        cmp al,0
        jz ret1
        putc al 
        inc si
    jmp print
    ret1:
    ret        
endp     
welcome_m db 'Welcome to RussianOS.',13,10,0
load_m db 'Load kernel...',13,10,0  
jump_m db 'Jump to address 0800h:0000h...',13,10,0
