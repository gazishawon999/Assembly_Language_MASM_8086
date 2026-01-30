; Program : Check first letter of name

.MODEL SMALL
.STACK 100H

.DATA
    myName DB 'SHAWON$', 0

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Read a character from keyboard
    MOV AH, 01H
    INT 21H              ; Character stored in AL

    ; Compare with first letter 'S'
    CMP AL, 'S'
    JNE EXIT             ; If not equal, exit

    ; Display name
    LEA DX, myName
    MOV AH, 09H
    INT 21H

EXIT:
    ; Terminate program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

