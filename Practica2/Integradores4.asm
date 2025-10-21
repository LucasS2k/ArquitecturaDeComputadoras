PA Equ 30h
CA EQU 31H
PB EQU 32H
CB EQU 33h

org 1000h
msj db "Fin de programa"
finmsj db ?
msj2 db "Arquitectura de Computadoras: ACTIVADA"
finmsj2 db ?
org 3000h
config: mov al, 0 ;luces en salida
out cb,al
mov al,255 ;llaves en entrada
out ca,al
ret
org 2000h
call config
loop: in al,pa
cmp al, 00000000b ;inciso A
jz fin

push ax ;inicio inciso B
not al
out pb,al
pop ax

push ax
and al, 10000000b
jnz loop
mov bx,offset msj2
mov al, offset msj2 - offset finmsj2
int 7

fin: int 0
end