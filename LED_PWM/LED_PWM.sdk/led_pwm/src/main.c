#include "xparameters.h"
#include "xil_types.h"

//#define LED_BASEADDR XPAR_MYLED_0_S_AXI_BASEADDR
//#define SW_BASEADDR 0x43C10000 //base address of slv_reg0

//Macro that stores the base address of your controller
//This value is found in the Address editor tab in Vivado (next to Diagram tab)
#define MYPWM_BASEADDR 0x43C00000

void PWM_Enable(u32 baseAddr, u32 channel)
{
    *((u32 *) baseAddr) = channel;
}

void PWM_Disable(u32 baseAddr, u32 channel)
{
    // Disable PWM Controller
	*((u32 *) baseAddr + channel) = 0;
}

void PWM_SetValue(u32 baseAddr, u32 channel, u32 pwmValue)
{
    // Set PWM Value
	*((u32 *) baseAddr + channel) = pwmValue;
}

int msleep(u32 msec)
{
    volatile u32 i = 0;
    for(i = 0; i < msec * 1000000; i++);
}

void main()
{
    volatile u32 j = 0;
    int k = 0;

    while(1)
    {
        k = 0;
        for(k = 0; k < 4; k++)
        {
            PWM_Enable(MYPWM_BASEADDR, k);
            while(1) {
                if (j > 0x3FFUL) {
                    j = 0;
                    break;
                }
                PWM_SetValue(MYPWM_BASEADDR, k, j);
                msleep(10);
                j = j + 0x20;
            }
            PWM_Disable(MYPWM_BASEADDR, k);
        }
    }
}
