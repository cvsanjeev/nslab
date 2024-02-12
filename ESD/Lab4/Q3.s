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
    MOV R0, #0x3F          ; Example hexadecimal number (change as needed)

    ; Extract the first digit
    MOV R1, R0              ; Move the hexadecimal number to R1
    MOV R2, #10             ; Set R2 to 10 for division
    SDIV R1, R1, R2         ; Divide by 10 to get the first digit
    MUL R1, R1, R2          ; Multiply by 10 to get the first digit (remainder)
    SUB R1, R0, R1          ; Subtract the remainder from the original number to get the first digit
    
    ; Extract the second digit
    MOV R2, R0              ; Move the hexadecimal number to R2
    MOV R3, #10             ; Set R3 to 10 for division
    SDIV R2, R2, R3         ; Divide by 10 to get the second digit

    ; Convert the digits to BCD
    LSL R1, R1, #4          ; Shift the first digit to the higher nibble
    ADD R1, R1, R2          ; Combine the digits

STOP
    B STOP

END

