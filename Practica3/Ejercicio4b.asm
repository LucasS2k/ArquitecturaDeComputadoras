EOI EQU 20H
IMR EQU 21H
INT0 EQU 24h
N_F10 EQU 15

org 60 
idf10 dw rut_f10 ;15*4 = 60
org 1000h
msj db "vamos las interrupciones"
fin db ?
cant db 0
org 3000h
rut_f10: mov bx, offset msj
mov al, offset fin - offset msj
int 7 ;imprime lo que apunta bx con la cantidad en al
inc cl
cmp cant, 5
jnz sigo
mov al,11111111b ;desactivo
out imr,al
sigo: mov al, eoi ;primer paso para finalizar la interrupcion
out eoi,al ;segundo paso (SIEMPRE)
iret ;para volver de una interrupcion (SIEMPRE)
ORG 2000H
mov cl, cant
cli
mov al, 11111110b ;activamos f10
out imr,al ;comunicamos al imr
mov al, n_f10 ;linkeamos mandando el 15
out int0,al ;mandamos link
sti
loop: cmp cant, 5
jnz loop ;loop infinito

int 0
END