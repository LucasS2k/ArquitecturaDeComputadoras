EOI EQU 20H
IMR EQU 21H
int0 equ 24h
int1 equ 25h 
cont equ 10h
comp equ 11h 

n_f10 equ 10
n_timer equ 15
org 40
id_f10 dw rut_f10
org 60 
id_timer dw rut_timer

org 1000h
contador db 9
final db ?

org 3000h
rut_f10: mov al, 111101b ;se desactiva f10
out imr , al
mov al,0
out cont,al
mov al, 1
out comp, al
mov al, eoi
out eoi,al
iret

org 3200h
rut_timer: mov bx, offset contador
mov al,1
int 7
cmp contador, 0
jnz sigue
mov al,11111111b
out imr, al
mov final, 1
sigue: dec contador
mov al,0
out cont,al
mov al, eoi
out eoi,al
iret

org 3400h
leer: mov bx, offset contador
otro: int 6
mov al,contador
cmp al,0
js otro
ret
ORG 2000H
call leer
cli 
mov al, 11111100b
out imr,al
mov al,n_f10
out int0,al
mov al, n_timer
out int1, al
sti
loop: cmp final,0
jz loop
int 0
END