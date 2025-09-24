.MODEL SMALL
.STACK 100H

.DATA 
    mensagem_inicial DB 'Digite um numero de 0-9: $'
    impar DB 0DH, 0AH, 'Numero digitado eh impar. $'
    par DB 0DH, 0AH, 'Numero digitado eh par. $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, mensagem_inicial
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0' ;transformar caractere em numero real

    AND AL, 1 ;se numero é par al vira 0 se for impar, 1
    JZ eh_par ;JUMP IF ZERO

    MOV AH, 09H
    LEA DX, impar
    INT 21H
    JMP fim
    eh_par:
    mov AH, 09H
    LEA DX, par
    INT 21H

    fim:
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN
