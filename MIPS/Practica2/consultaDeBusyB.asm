PA EQU 30h
CA EQU 32h
ORG 1000h
no db “Libre”
ORG 2000H
mov al, 0FDh ;11111101
out CA, al
poll: in al, PA
and al,1
jnz poll ;si no da 0 loopeo
mov bx, offset no ;direccion del mensaje
mov al, 5 ; cantidad
int 7 ;imprimo lo de bx
int 0
end
