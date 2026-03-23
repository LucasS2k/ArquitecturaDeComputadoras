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
finmsj db ?
cant db 1
org 3000h
rut_timer: mov bx, offset msj
mov al, offset finmsj - offset msj
int 7
inc cant
cmp cant,255
jz fin
mov al, cant
out comp, al
mov al,eoi
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
mov al,cant
out comp,al
mov al, 0
out cont,al
inc cant
sti
lazo: jmp lazo
fin: mov al,255
out imr,al
int 0
END