; Problem 3: Conditional Jump - JNE (Jump if Not Equal)
; Objective: Check if a password is correct using JNE
; Task: Compare user input with stored value and validate

.MODEL SMALL
.STACK 100H

.DATA
    correct_code DB 7   ; Correct code is 7
    user_input DB 7     ; Change this to test (simulate user input)
    
    msg_success DB 'Access GRANTED!', 0DH, 0AH, '$'
    msg_denied DB 'Access DENIED!', 0DH, 0AH, '$'

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Load values
    MOV AL, user_input
    MOV BL, correct_code
    
    ; Compare input with correct code
    CMP AL, BL
    
    ; Jump if NOT equal (ZF = 0)
    JNE ACCESS_DENIED   ; Jump if AL != BL
    
    ; If equal, grant access
    LEA DX, msg_success
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
ACCESS_DENIED:
    ; Display denied message
    LEA DX, msg_denied
    MOV AH, 09H
    INT 21H
    
EXIT:
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN

; ==================== LEARNING NOTES ====================
; JNE (Jump if Not Equal) / JNZ (Jump if Not Zero):
; - Jumps if Zero Flag (ZF) = 0
; - Opposite of JE/JZ
; - Used for validation and error checking
;
; Test cases:
; - user_input = 7 → Access GRANTED
; - user_input = 5 → Access DENIED
; - user_input = 9 → Access DENIED
