; Initialization
MOV R0, #40H          ; R0 = Write Pointer (start of range)
MOV R1, #40H          ; R1 = Read Pointer (start of range)

SCAN_LOOP:
    CJNE R1, #60H, CHECK_VAL ; Loop until R1 exceeds the 40H-5FH range
    SJMP FILL_ZEROS          ; Once done scanning, fill the remaining space

CHECK_VAL:
    MOV A, @R1               ; Get value from Read Pointer
    CJNE A, #0FFH, KEEP_VAL  ; If value != FFH, it's valid data
    INC R1                   ; Else, it's FFH: skip it (increment Read Pointer)
    SJMP SCAN_LOOP

KEEP_VAL:
    MOV @R0, A               ; Copy valid data to Write Pointer position
    INC R0                   ; Increment Write Pointer
    INC R1                   ; Increment Read Pointer
    SJMP SCAN_LOOP

FILL_ZEROS:
    CJNE R0, #60H, ZERO_NEXT ; Fill from current Write Pointer to end of range
    RET                     

ZERO_NEXT:
    MOV @R0, #00H            ; Overwrite old data/FFH with 00H
    INC R0
    SJMP FILL_ZEROS