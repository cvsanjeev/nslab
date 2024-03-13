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
    MOV R0, #0x32          ; Example BCD number (change as needed)
    
    ; Extract the first digit
    MOV R1, R0              ; Move the BCD number to R1
    AND R1, R1, #0xF0       ; Mask out the lower nibble
    LSR R1, R1, #4          ; Shift right to get the first digit

    ; Extract the second digit
    MOV R2, R0              ; Move the BCD number to R2
    AND R2, R2, #0x0F       ; Mask out the upper nibble

    ; Convert the BCD digits to hexadecimal
    LSL R1, R1, #4          ; Shift the first digit to the higher nibble
    ADD R0, R1, R2          ; Combine the digits

STOP
    B STOP

END

