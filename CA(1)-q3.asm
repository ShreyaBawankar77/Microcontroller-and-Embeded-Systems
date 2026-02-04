ORG 0000H


MOV 25H, #60H      ; RAM[25H] = 60H (pointer)
MOV 60H, #0A5H     ; RAM[60H] = A5H 
; DIRECT ADDRESSING

MOV A, 25H         ; A ? RAM[25H] = 60H
MOV 26H, A         ; Store direct result in RAM[26H]

; INDIRECT ADDRESSING

MOV R0, #25H       ; R0 points to address 25H
MOV A, @R0         ; A ? RAM[ RAM[25H] ] = RAM[60H] = A5H
MOV 27H, A         ; Store indirect result in RAM[27H]

; END PROGRAM
SJMP $             ; Infinite loop

END