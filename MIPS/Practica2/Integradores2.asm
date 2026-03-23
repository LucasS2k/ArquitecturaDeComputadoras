PA EQU 30h ;llaves
PB EQU 31h ;luces
CA EQU 32h ;todos en 1
CB equ 33h ;todos en 0
org 1000h
clave db 11001100b
ganaste db "ganaste"
org 3000h
config:
 mov al, 00000000b
 out cb,al
 mov al,11111111b
 out ca,al
 ret
org 2000h
call config
loop: in al, pa;
      xor al,clave ;bits iguales retornan 0
      not al ;se niegan todos los bits
      out pb,al
      cmp al,11111111b ;al ser todos iguales (todos son 0) y negarlos (todos son 1) la comparacion surte efecto
      jnz loop
      ;si se sale del loop significa que la condicion se cumplio
      mov bx, offset ganaste
      mov al, 7
      int 7 ;imprime lo de bx con la cantidad en al
      int 0
end