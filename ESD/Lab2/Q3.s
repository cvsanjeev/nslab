AREA RESET, DATA, READONLY
EXPORT __Vectors
__Vectors
    DCD 0x10001000         ; stack pointer value when stack is empty
    DCD Reset_Handler      ; reset vector

ALIGN

AREA mycode, CODE, READONLY
ENTRY
EXPORT Reset_Handler

Reset_Handler
    LDR R0, =Num1           ; Load address of the first 128-bit number (Num1) into R0
    LDR R1, =Num2           ; Load address of the second 128-bit number (Num2) into R1
    LDR R2, =Result         ; Load address of the result (Result) into R2

    MOV R3, #1              ; Set borrow flag to 1

sub_loop
    LDR R4, [R0], #4        ; Load a word from Num1 and update the address
    LDR R5, [R1], #4        ; Load a word from Num2 and update the address
    SBCS R6, R4, R5, R3     ; Subtract the words along with borrow
    STR R6, [R2], #4        ; Store the result word and update the address
    MOV R3, R6, ASR #32     ; Extract the borrow from the result
    CMP R0, =Num1 + 16      ; Check if we've processed all words
    BCC sub_loop            ; Branch if there are more words to process

STOP
    B STOP

AREA DATASEG, DATA, READWRITE
Num1 DCD 0x12345678, 0x87654321, 0xABCDEFAB, 0xDCBADCFE ; First 128-bit number
Num2 DCD 0x11111111, 0x22222222, 0x33333333, 0x44444444 ; Second 128-bit number
Result DCD 0, 0, 0, 0     ; Result storage for the subtraction
END

