PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h
ORG 2000h
mov al, 0FFh ; PA entradas (Micro-commutadores)
out CA, al
mov al, 0
out CB, al ; PB salidas (Luces)
poll: in al, PA
out PB, al
jmp poll
int 0
end