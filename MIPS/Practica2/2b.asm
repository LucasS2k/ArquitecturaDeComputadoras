CA EQU 32h
PA EQU 30h
ORG 1000h ; Memoria de datos
prendida db "Llave prendida"
apagada db "Llave apagada"
fin_apagada db ?
ORG 2000h ; Prog principal
mov al, 0ffh
out CA, al
in al, PA ; poner en 0 todos los bits menos el más sig
and al, 80h ; 1000 0000
cmp al, 0 ; si es 0
jz esta_apagada
; esta prendida
mov bx, offset prendida
mov al, OFFSET apagada - OFFSET prendida
jmp fin
esta_apagada: mov bx, offset apagada
mov al, OFFSET fin_apagada - OFFSET apagada
fin: int 7 ; imprimir
int 0
END