/*
 * main.c
 *
 *  Created on: Sep 20, 2017
 *      Author: Jeffery Fonda
 */

#include "xparameters.h"
#include "xil_types.h"

// Macro that stores the base address of your controller
#define LED_BASEADDR XPAR_MYLED_0_S_AXI_BASEADDR

int main()
{
    // Declare volatile integer i
    volatile int i = 0;

    // Turn off all LEDs
    *((u32 *) LED_BASEADDR) = 0x03;

    // Infinite loop
    while (1) {

        // Flip LED Status
        *((u32 *) LED_BASEADDR) = ~ *((u32 *) LED_BASEADDR);

        // Delay Function
        for (i = 0; i < 100000000; i++);
    }
    return 1;
}


