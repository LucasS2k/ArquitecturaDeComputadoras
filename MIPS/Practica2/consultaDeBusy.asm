PA EQU 30h
CA EQU 32h
ORG 1000h
si db "Ocupada"
no db "Libre"
ORG 2000H
mov al, 0FDh ; 11111101
out CA, al
in al, PA
and al,1 
jnz ocupada
mov bx, offset no
mov al, 5 ;cantidad de letras a imprimir
int 7 ;imprime lo que esta en bx
jmp fin
ocupada: mov bx, offset si
mov al, 7 ;cantidad de letras a imprimir
int 7 ;imprime lo que esta en bx
fin: int 0
end