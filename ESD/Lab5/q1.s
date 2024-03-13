AREA RESET, CODE, READONLY
EXPORT __Vectors
__Vectors
    DCD 0x10001000         ; stack pointer value when stack is empty
    DCD Reset_Handler      ; reset vector

ALIGN

AREA mycode, CODE, READONLY
ENTRY
EXPORT Reset_Handler

; Define array size and elements
NUM_ELEMENTS EQU 5
array DCD 40, 10, 30, 20, 50   ; Example array (change as needed)

Reset_Handler
    MOV R0, #0                 ; Initialize outer loop index (i)

outer_loop
    CMP R0, #(NUM_ELEMENTS - 1); Check if i < (array size - 1)
    BGE done_outer_loop        ; If not, outer loop is finished

    MOV R1, R0                 ; Initialize inner loop index (j) with i

    MOV R2, R0                 ; Initialize min_index with i
    LDR R3, =array             ; Load the base address of the array

inner_loop
    ADD R3, R3, R1, LSL #2     ; Calculate the address of array[j]
    LDR R4, [R3]               ; Load array[j] into R4

    ADD R5, R3, #4             ; Calculate the address of array[min_index]
    LDR R6, [R5]               ; Load array[min_index] into R6

    CMP R4, R6                 ; Compare array[j] with array[min_index]
    BGE update_min_index       ; If array[j] < array[min_index], update min_index

    MOV R2, R1                 ; Update min_index with j

update_min_index
    ADD R1, R1, #1             ; Increment j
    CMP R1, #NUM_ELEMENTS      ; Check if j < array size
    BLT inner_loop             ; If yes, continue inner loop

    CMP R2, R0                 ; Check if min_index != i
    BEQ skip_swap              ; If min_index == i, no need to swap

    LDR R4, =array             ; Load the base address of the array
    ADD R4, R4, R0, LSL #2     ; Calculate the address of array[i]
    LDR R5, [R4]               ; Load array[i] into R5

    LDR R6, =array             ; Load the base address of the array
    ADD R6, R6, R2, LSL #2     ; Calculate the address of array[min_index]
    LDR R7, [R6]               ; Load array[min_index] into R7

    STR R7, [R4]               ; Store array[min_index] in array[i]
    STR R5, [R6]               ; Store array[i] in array[min_index]

skip_swap
    ADD R0, R0, #1             ; Increment i
    B outer_loop               ; Continue outer loop

done_outer_loop

    ; End of the program
    ; You can add code here to further process the sorted array or halt the processor

END

