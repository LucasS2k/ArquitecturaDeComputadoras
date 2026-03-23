PA EQU 30h

CA EQU 32h 

org 1000h
mensaje db "ACTIVADO"
fin db ?
patron db 10000001b
org 3000h
config: mov al,11111111b ;configuro todas las llaves como entrada
out ca,al
ret
org 2000h
call config ;llamo a la configuracion de las llaves
mov bx,offset mensaje ;para imprimir
loop: in al,pa ;me traigo la data de las llaves
cmp al, patron ;comparo
jnz loop ;si no da 0 sigo
mov al,offset fin - offset mensaje
int 7 ;imprime lo de bx con la cantidad guardada en al
jmp loop
int 0

end