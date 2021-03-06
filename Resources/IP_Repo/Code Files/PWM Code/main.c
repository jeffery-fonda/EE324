#include "xparameters.h"
#include "xil_types.h"

//#define LED_BASEADDR XPAR_MYLED_0_S_AXI_BASEADDR
//#define SW_BASEADDR 0x43C10000 //base address of slv_reg0

//Macro that stores the base address of your controller
//This value is found in the Address editor tab in Vivado (next to Diagram tab)
#define MY_PWM_BASEADDR 0x43C00000

void PWM_Enable(u32 baseAddr)
{
    // Enable PWM Controller
	if(channel == 0)
	{
		*((u32 *) MY_PWM_BASEADDR) = 0x01;
	}
	else if (channel == 1)
	{
		*((u32 *) MY_PWM_BASEADDR + 0x01) = 0x01;
	}
	else if (channel == 2)
	{
		*((u32 *) MY_PWM_BASEADDR + 0x02) = 0x01;
	}
	else if (channel == 3)
	{
		*((u32 *) MY_PWM_BASEADDR + 0x03) = 0x01;
	}
}

void PWM_Disable(u32 baseAddr)
{
    // Disable PWM Controller
	*((u32 *) MY_PWM_BASEADDR) = 0x00;
	*((u32 *) MY_PWM_BASEADDR + 0x01) = 0x00;
	*((u32 *) MY_PWM_BASEADDR + 0x02) = 0x00;
	*((u32 *) MY_PWM_BASEADDR + 0x03) = 0x00;

}

void PWM_SetValue(u32 baseAddr, int channel, u32 pwmValue)
{
    // Set PWM Value
	*((u32) *) MY_PWM_BASEADDR + channel) = pwmValue;
}

int msleep(u32 msec)
{
    volatile u32 i = 0;
    for(i = 0; i < msec * 1000000; i++);
}

void main()
{
    volatile u32 j = 0;

    PWM_Enable(MY_PWM_BASEADDR);
    while(1)
    {
        if (j > 0x3FFUL)
        {
        	j = 0;
        }
        PWM_SetValue(MY_PWM_BASEADDR, 0, j);
        msleep(10);
        j = j + 0x20;
    }
}
