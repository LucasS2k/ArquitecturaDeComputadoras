PB equ 31h
CB equ 33h


        org 1000h


        org 2000h
        mov al, 0
        out CB,al ;todos en 0 habilita todas las luces
        mov al, 11000011b
        out pb, al ;prende las luces guardada en AL
        int 0
        END