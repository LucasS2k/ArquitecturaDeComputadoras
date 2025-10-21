PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h
ORG 1000h; Memoria de datos
CHAR DB "A"
ORG 3000h
ini_pio: mov al, 0FDh ; strobe salida (0), busy entrada (1)
out CA, al
mov al, 0 ; puerto de datos todo salida
out CB, al
ret
ORG 3100h
poll: in al, PA
and al,1
jnz poll
ret
ORG 3200h
flanco_ascendente: in al, PA ; primero envio 0, luego 1
and al, 0FDh ;11111101
out PA, al ;0
in al, PA
or al, 02h ;00000010
out PA, al
ret
ORG 3300h
imprimir_caracter: push ax
call poll
pop ax
out PB, al
call flanco_ascendente
ret
ORG 2000h ; Prog principal
call ini_pio
mov al, CHAR
call imprimir_caracter
int 0
end