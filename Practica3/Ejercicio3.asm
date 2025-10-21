EOI EQU 20H
IMR EQU 21H
INT0 EQU 24h
N_F10 EQU 15
ORG 60
IP_F10 DW RUT_F10
ORG 2000H
CLI
MOV AL, 0FEH ; (1111 1110) habilito le interrupcion del f10
OUT IMR, AL ;se la paso al imr
MOV AL, N_F10 ; vinculo
OUT INT0, AL ; la interrupcion
MOV DX, 0 ;inicializo en 0
STI
LAZO:JMP LAZO ;loop infinito
ORG 3000H
RUT_F10:PUSH AX ;salvamos registro
INC DX ;incrementa con cada f10
MOV AL, EOI ;siempre para salir de la interrupcion
OUT EOI, AL ;lo mandamos
POP AX ;recuperamos registro
IRET
END