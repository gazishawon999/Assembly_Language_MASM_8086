.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter a character: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Read character
    MOV AH, 01H
    INT 21H
    MOV BL, AL          ; Store in BL

    ; Check if uppercase (ASCII 65 to 90)
    CMP BL, 'A'
    JB  EXIT            ; if < 'A', exit
    CMP BL, 'Z'
    JA  EXIT            ; if > 'Z', exit

    ; It is uppercase, display it
    MOV DL, BL
    MOV AH, 02H
    INT 21H
    JMP DONE

EXIT:
    MOV AH, 4CH         ; DOS terminate function
    INT 21H

DONE:
    MOV AH, 4CH         ; Normal termination
    INT 21H
MAIN ENDP
END MAIN
