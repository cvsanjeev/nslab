
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
    MOV R0, #0x2A          ; Example hexadecimal number (change as needed)
    MOV R1, #10            ; Load base 10 into R1 (for division)
    MOV R2, #0             ; Initialize R2 to store the first digit
    MOV R3, #0             ; Initialize R3 to store the second digit

    ; Extracting first digit
    LSR R2, R0, #4         ; Shift right to get the first digit
    AND R2, R2, #0xF       ; Mask out all but the first 4 bits (digit)
    ADD R2, R2, #'0'       ; Convert digit to ASCII (add '0')

    ; Extracting second digit
    AND R3, R0, #0xF       ; Mask out all but the last 4 bits (digit)
    ADD R3, R3, #'0'       ; Convert digit to ASCII (add '0')

    ; Print the ASCII representation of the digits
    ; Here, you can use your specific output routine, such as UART or console output
    ; For demonstration, let's assume we print to console using SWI
    MOV R7, #4             ; SWI code for "Write to STDOUT"
    MOV R0, #1             ; File descriptor for "STDOUT"
    MOV R2, #1             ; Length of the string to print (1 character)
    SWI 0

    MOV R7, #4             ; SWI code for "Write to STDOUT"
    MOV R0, #1             ; File descriptor for "STDOUT"
    MOV R2, #1             ; Length of the string to print (1 character)
    SWI 0

STOP
    B STOP

END
