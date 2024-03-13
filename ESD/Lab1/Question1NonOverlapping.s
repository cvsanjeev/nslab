	AREA    RESET, DATA, READONLY
	EXPORT  __Vectors
__Vectors 
	DCD  0x10001000     ; stack pointer value when stack is empty
	DCD  Reset_Handler  ; reset vector
	
	ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =SRC0; 	Load address of SRC into R0
	LDR R1, =DST0; 	Load the address of DST onto R1 
	MOV R2, #0x0A; Counter
	
label LDR R3,[R0],#4
	STR R3,[R1],#4
	SUB R2,R2,#1
	CMP R2,#00
	BNE label	

STOP
	B STOP
	
	
SRC0 DCD 0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x00000000A
	AREA DATASEG, DATA, READWRITE

DST0 DCD 0		;DST location in Data segment
	END
