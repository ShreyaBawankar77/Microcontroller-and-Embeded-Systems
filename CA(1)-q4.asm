ORG 0000H            ; Program start address

; -------- Generate first two digits: 86 --------
CLR A                ; A = 00

MOV R0, #080H        ; Upper nibble = 8
ORL A, R0            ; A = 80H

MOV R1, #006H        ; Lower nibble = 6
ORL A, R1            ; A = 86H (BCD)

MOV R7, A            ; Store 86 in R7

; -------- Generate last two digits: 84 --------
CLR A                ; A = 00

MOV R2, #080H        ; Upper nibble = 8
ORL A, R2            ; A = 80H

MOV R3, #004H        ; Lower nibble = 4
ORL A, R3            ; A = 84H (BCD)

; -------- End of program --------
SJMP $               ; Stop execution

END