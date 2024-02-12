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
    MOV R0, #0x32          ; Example ASCII unpacked form (change as needed)

    ; Convert the first ASCII digit to hexadecimal
    MOV R1, R0              ; Move the first ASCII digit to R1
    SUB R1, R1, #'0'       ; Convert ASCII to binary digit

    ; Shift the first hexadecimal digit to the higher nibble
    LSL R1, R1, #4          ; Shift left by 4 bits

    ; Convert the second ASCII digit to hexadecimal
    MOV R2, R0, LSR #8      ; Move the second ASCII digit to R2
    SUB R2, R2, #'0'       ; Convert ASCII to binary digit

    ; Combine the two hexadecimal digits
    ORR R1, R1, R2          ; Combine R1 and R2

STOP
    B STOP

END

