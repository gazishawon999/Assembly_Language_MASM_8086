; Program : Count number of 1-bits in AL

.MODEL SMALL
.STACK 100H

.DATA
    count DB 0           ; Stores number of 1-bits

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Load test value into AL
    MOV AL, 10101101B    ; Example number
    MOV CX, 8            ; 8 bits to check
    MOV BL, 0            ; Counter

COUNT_LOOP:
    SHR AL, 1            ; Shift right, LSB -> CF
    JNC SKIP             ; If no carry, bit was 0
    INC BL               ; If carry, bit was 1

SKIP:
    LOOP COUNT_LOOP

    ; Store result
    MOV count, BL

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

