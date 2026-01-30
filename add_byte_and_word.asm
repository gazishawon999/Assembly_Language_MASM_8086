; Program 1: Add byte variable with word variable

.MODEL SMALL
.STACK 100H

.DATA
    byteVar  DB 5        ; Byte variable initialized to 5
    wordVar  DW 1        ; Word variable initialized to 1
    result   DW ?        ; Word variable to store result

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Load word value into AX
    MOV AX, wordVar

    ; Load byte value into BL
    MOV BL, byteVar
    MOV BH, 0            ; Extend byte to word

    ; Add byte and word
    ADD AX, BX

    ; Store result
    MOV result, AX

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

