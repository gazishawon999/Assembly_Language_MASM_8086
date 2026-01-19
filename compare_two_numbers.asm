; Problem 2: Conditional Jump - JE (Jump if Equal)
; Objective: Compare two numbers and jump if they are equal
; Task: Check if two numbers are equal and display appropriate message

.MODEL SMALL
.STACK 100H

.DATA
    num1 DB 5
    num2 DB 5           ; Change this to test different cases
    
    msg_equal DB 'Numbers are EQUAL!', 0DH, 0AH, '$'
    msg_not_equal DB 'Numbers are NOT EQUAL!', 0DH, 0AH, '$'


.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Load numbers into registers
    MOV AL, num1
    MOV BL, num2
    
    ; Compare the numbers
    CMP AL, BL          ; Compare AL with BL
    
    ; Conditional jump - jump if equal (ZF = 1)
    JE EQUAL            ; Jump if AL == BL
    
    ; If not equal, display "not equal" message
    LEA DX, msg_not_equal
    MOV AH, 09H
    INT 21H
    JMP EXIT            ; Jump to exit
    
EQUAL:
    ; Display "equal" message
    LEA DX, msg_equal
    MOV AH, 09H
    INT 21H
    
EXIT:
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN

; ==================== LEARNING NOTES ====================
; JE (Jump if Equal) / JZ (Jump if Zero):
; - Jumps if Zero Flag (ZF) = 1
; - Used after CMP instruction
; - CMP performs subtraction without storing result
; - If operands are equal, result is 0, so ZF = 1
;
; Related Instructions:
; - JNE/JNZ: Jump if Not Equal / Not Zero
;
; Try changing num1 and num2 to test:
; - num1 = 5, num2 = 5  → EQUAL
; - num1 = 5, num2 = 3  → NOT EQUAL
