
	AREA RESET, DATA, READONLY

    EXPORT  __Vectors

__Vectors 

	DCD  0x40001000    

    DCD  Reset_Handler  

    ALIGN

	AREA mycode, CODE, READONLY

	ENTRY

	EXPORT Reset_Handler

Reset_Handler

	LDR R0,=INPUT      

	LDR R1,=POSITION  

	MOV R3, #10         

	MOV R4, #91 

	MOV R6, #1			

	MOV R7, #0			

LOOP       

	LDR R5,[R0],#4    

	ADD R7,#1 		

	CMP R4,R5			

	BEQ FOUND			

	SUBS R3,#1

	BNE LOOP

	B STOP

FOUND 

	STR R6,[R1], #4 

    STR R7,[R1]		
 
STOP

	B STOP			
 
INPUT DCD 23,67,89,45,21,80,76,45,34,9  	
 
	AREA mycode,DATA,READWRITE

POSITION DCD 0                          

	END