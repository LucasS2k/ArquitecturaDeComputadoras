EOI EQU 20H
IMR EQU 21H
int1 equ 25h ;timer
cont equ 10h ;contador
comp equ 11h ;comparador
n_timer equ 10

org 40
id_timer dw rut_timer

org 1000h
msj db "vamos las interrupciones"
fin db ?
org 3000h
rut_timer: mov bx, offset msj
mov al, offset fin - offset msj
int 7
mov al, eoi
out eoi,al
mov al,0
out cont,al
iret
ORG 2000H
cli
mov al, 11111101b
out imr,al
mov al, n_timer
out int1, al
mov al,2
out comp,al
mov al, 0
out cont,al
sti
lazo: jmp lazo
int 0
END