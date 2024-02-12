AREA RESET, CODE, READONLY
EXPORT __Vectors
__Vectors
    DCD 0x10001000         ; stack pointer value when stack is empty
    DCD Reset_Handler      ; reset vector

ALIGN

AREA mycode, CODE, READONLY
ENTRY
EXPORT Reset_Handler

Reset_Handler
    ; Example unpacked form (change as needed)
    MOV R0, #0x12345678      ; Example 32-bit number in unpacked form
    
    ; Convert each digit from unpacked form to packed form
    MOV R1, R0, LSR #8       ; Extract the second digit
    AND R1, R1, #0xFF        ; Mask out the higher byte
    MOV R2, R0, LSR #16      ; Extract the third digit
    AND R2, R2, #0xFF        ; Mask out the higher byte
    MOV R3, R0, LSR #24      ; Extract the fourth digit

    ; Pack the digits into a single 32-bit word
    ORR R0, R0, R1, LSL #8   ; Pack the second digit
    ORR R0, R0, R2, LSL #16  ; Pack the third digit
    ORR R0, R0, R3, LSL #24  ; Pack the fourth digit

STOP
    B STOP

END

