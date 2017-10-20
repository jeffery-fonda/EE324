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
#define SW_BASEADDR 0x43C10000 //base address of slv_reg0

int main()
{
    // Declare volatile integer i
    volatile int i = 0;

    // Turn off all LEDs
    *((u32 *) LED_BASEADDR) = 0x00;

    // Infinite loop
    while (1) {

        // Flip LED Status
        *((u32 *) LED_BASEADDR) = *((u32 *) SW_BASEADDR);
    }
    return 1;
}


