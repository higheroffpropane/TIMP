Title Сложение двух чисел
.686
.MODEL FLAT, C
.STACK 256
.CODE
EXTRN a_asm : WORD
EXTRN b_asm : WORD
EXTRN c_asm : WORD
PUBLIC C encrypt
    Proc_Add PROC far
    mov ax, a_asm
    mov bx, b_asm
    add ax, bx
    mov c_asm, ax
    retn
    Proc_Add ENDP
PUBLIC C decrypt
    Proc_Add PROC far
    mov ax, a_asm
    mov bx, b_asm
    add ax, bx
    mov c_asm, ax
    retn
    Proc_Add ENDP
END


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


encrypt:
    ; инициализация начальных значений j и ciphertext
    mov j, 0
    mov ciphertext, ""

    ; генерация последовательности Фибоначчи
    mov ecx, n
    mov esi, fib
    xor edx, edx
    mov eax, [esi + edx]
    add edx, 4
    loop1:
        add eax, [esi + edx]
        mov ebx, eax
        mov eax, [esi + edx + 4]
        add edx, 4
        loop loop1

    ; шифрование открытого текста
    mov ecx, message.length()
    mov esi, message
    mov edi, ciphertext
    loop2:
        mov ebx, j
        mov edx, n
        cdq
        idiv edx
        mov gamma, [fib + ebx*4]
        add j, 1
        add edi, byte 1
        add esi, byte 1
        mov al, [esi-1]
        add al, gamma
        mov bl, 256
        xor edx, edx
        div bl
        mov [edi-1], al
        loop loop2

    ; возврат зашифрованного текста
    mov eax, ciphertext
    ret


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


decrypt:
    ; инициализация начальных значений j и message
    mov j, 0
    mov message, ""

    ; генерация последовательности Фибоначчи
    mov ecx, n
    mov esi, fib
    xor edx, edx
    mov eax, [esi + edx]
    add edx, 4
    loop1:
        add eax, [esi + edx]
        mov ebx, eax
        mov eax, [esi + edx + 4]
        add edx, 4
        loop loop1

    ; расшифрование зашифрованного текста
    mov ecx, ciphertext.length()
    mov esi, ciphertext
    mov edi, message
    loop2:
        mov ebx, j
        mov edx, n
        cdq
        idiv edx
        mov gamma, [fib + ebx*4]
        add j, 1
        add edi, byte 1
        add esi, byte 1
        mov al, [esi-1]
        sub al, gamma
        add al, 256
        mov bl, 256
        xor edx, edx
        div bl
        mov [edi-1], al
        loop loop2

    ; возврат расшифрованного текста
    mov eax, message
    ret
