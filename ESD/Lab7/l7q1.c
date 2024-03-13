//1Write a C program for 4 digit BCD up/down counter on seven segment using a switch and timer with a delay of 1-second between each count.

#include <LPC17xx.h>
#include<stdio.h>
#define FIRST_SEG 0xF87FFFFF
#define SECOND_SEG 0xF8FFFFFF
#define THIRD_SEG 0xF97FFFFF
#define FOURTH_SEG 0xF9FFFFFF
#define DISABLE_ALL 0xFA7FFFFF
 
unsigned char dec[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int n = 0;
int i = 0;

void delay_ms(uint32_t ms) {

    uint32_t i, j;

    for (i = 0; i < ms; i++)

        for (j = 0; j < 12000; j++); 

}

int main(void) {

    SystemInit();
	SystemCoreClockUpdate();
 
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 = 0;
	LPC_PINCON->PINSEL3 = 0;
	LPC_GPIO0->FIODIR = 0XFF<<4;
	LPC_GPIO1->FIODIR = 0XF<<23;

    while(1){

        n = (n+1)%100;

        // Display first digit

        LPC_GPIO1->FIOPIN = 0<<23;  
        LPC_GPIO1->FIOMASK = 0XF<<23;
		LPC_GPIO0->FIOPIN = dec[n%10]<<4;
 

        delay_ms(500); // Delay after updating the first digit

        // Display second digit

        LPC_GPIO1->FIOMASK = 0;
		LPC_GPIO1->FIOPIN = 1<<23;
		LPC_GPIO0->FIOPIN = dec[n/10]<<4 ;

        delay_ms(500); // Delay after updating the second digit

        delay_ms(50); // Small delay within the loop 

    }   
}