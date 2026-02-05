

ORG 0000H

START:
        MOV R0, #50H     ; Pointer to first number
        MOV R1, #51H     ; Pointer to second number

        MOV A, @R0       ; Load value at 50H into A
        MOV B, @R1       ; Load value at 51H into B

        ; --- Equality Check ---
        MOV R2, A        ; Copy A
        DEC R2           ; Decrement until zero
EQ_LOOP: JZ EQ_DONE      ; If A was zero, check equality
        DEC R2
        JNZ EQ_LOOP
EQ_DONE:
        ; Instead of SUBB, we simulate equality by decrementing both
        MOV R2, A
        MOV R3, B
        CLR C            ; Clear carry for logic
CHECK_EQ:
        DEC R2
        DEC R3
        JNZ CHECK_EQ     ; Loop until one hits zero
        JZ EQUAL         ; If both hit zero together ? Equal

        ; --- Greater or Less Check ---
        ; If R2 hits zero first ? A < B
        ; If R3 hits zero first ? A > B

        JZ LESS          ; If A exhausted first
        ; Otherwise B exhausted first
GREATER: MOV A, #01H     ; Result = 01H (A > B)
         SJMP STORE

LESS:    MOV A, #0FFH    ; Result = FFH (A < B)
         SJMP STORE

EQUAL:   MOV A, #00H     ; Result = 00H (A = B)

STORE:   MOV 52H, A      ; Store result at 52H

        SJMP $           ; End program (infinite loop)

END
