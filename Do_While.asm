.MODEL SMALL
.STACK 100H

.DATA
    msg_inicial DB 'Digite uma string: $'
    msg_final  DB 0Dh, 0Ah, 'Resultado: $'
    CONTADOR DB 0


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,09H
    LEA DX, msg_inicial
    INT 21H ;imprimir msg inicial na tela "Digite uma String"

    leitura_loop:
        MOV AH, 01H
        INT 21H
        
        INC CONTADOR ;se JE nao funcionar, incrementa 1 em contador
        

        CMP AL,0DH ;comparar o que foi lido com CR
        JE fim_leitura ;se houver CR ele pula para o fim da leitura
        JMP leitura_loop ;volta pro looping
        
    fim_leitura:
    MOV AH,09H 
    LEA DX, msg_final ;imprimir msg final
    INT 21H
    
    MOV CX, 0 ;inicializando contador
    MOV CL, CONTADOR ;jogando o valor de contador para cl

    CMP CL,0 ;se cl for 0 nao há oq imrpimir, logo jump if equal para o fim do programa
    JE fim_programa

    imprimir:
        MOV AH,02H
        MOV DL, '*'
        INT 21H
    LOOP imprimir

    fim_programa:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

