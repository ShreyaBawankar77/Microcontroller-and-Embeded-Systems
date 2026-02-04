; Generate 1120 using ADD, INC, MUL
; Result stored in R7:R6 (AX equivalent)

ORG 0000H

START:  
        ; Step 1: Build 112 using ADD + INC
        MOV A, #100      ; Load 100
        ADD A, #10       ; A = 100 + 10 = 110
        INC A            ; A = 111
        INC A            ; A = 112

        ; Step 2: Multiply to scale up
        MOV B, #10       ; Load 10
        MUL AB           ; A = 112 * 10 = 1120 (low byte in A, high byte in B)

        ; Step 3: Store result in R7:R6
        MOV R6, A        ; Low byte of 1120
        MOV R7, B        ; High byte of 1120

        SJMP $           ; Infinite loop (end program)

END
