.MODEL SMALL
.STACK 100H
.DATA
    ch1 DB ?
    ch2 DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Input first character
    MOV AH, 01H
    INT 21H
    MOV ch1, AL

    ; Input second character
    MOV AH, 01H
    INT 21H
    MOV ch2, AL

    ; New line
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Compare characters
    MOV AL, ch1
    CMP AL, ch2
    JLE PRINT      ; if ch1 <= ch2

    ; Swap if ch1 > ch2
    MOV AL, ch1
    MOV BL, ch2
    MOV ch1, BL
    MOV ch2, AL

PRINT:
    ; Print first character
    MOV AH, 02H
    MOV DL, ch1
    INT 21H

    ; Print space
    MOV DL, ' '
    INT 21H

    ; Print second character
    MOV DL, ch2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
