/*
 * main.c
 *
 *  Created on: Nov 16, 2017
 *      Author: jfonda
 */

#include "xparameters.h"
#include "xil_io.h"
#include "platform.h"

#define MY_VGA 0x43C00000
#define CLK_WIZ 0x43C10000

#define REGISTER_1_OFFSET 0x00
#define REGISTER_2_OFFSET 0x04
#define REGISTER_3_OFFSET 0x08
#define REGISTER_4_OFFSET 0x0C
#define REGISTER_5_OFFSET 0x10
#define REGISTER_6_OFFSET 0x14
#define REGISTER_7_OFFSET 0x18
#define REGISTER_8_OFFSET 0x1C
#define REGISTER_9_OFFSET 0x20

void set_resolution_480p();
void set_resolution_720p();
void set_resolution_768p();
void set_custom_ip_register(int baseaddr, int offset, int value);
int get_custom_ip_register(int baseaddr, int offset);

void set_resolution_480p()
{
	set_custom_ip_register(CLK_WIZ, 0x208, 0x0001810F);
	set_custom_ip_register(CLK_WIZ, 0x214, 0x00004D03);
	set_custom_ip_register(CLK_WIZ, 0x25c, 0x00000003);

	set_custom_ip_register(MY_VGA, REGISTER_3_OFFSET, 800); // total horizontal time
	set_custom_ip_register(MY_VGA, REGISTER_4_OFFSET, 525); // total vertical time
	set_custom_ip_register(MY_VGA, REGISTER_5_OFFSET, 96); // horizontal sync time
	set_custom_ip_register(MY_VGA, REGISTER_6_OFFSET, 2); // vertical sync time
}

void set_resolution_720p()
{
	set_custom_ip_register(CLK_WIZ, 0x208, 0x0001810F);
	set_custom_ip_register(CLK_WIZ, 0x214, 0x00004D03);
	set_custom_ip_register(CLK_WIZ, 0x25c, 0x00000003);

	set_custom_ip_register(MY_VGA, REGISTER_3_OFFSET, 1650);
	set_custom_ip_register(MY_VGA, REGISTER_4_OFFSET, 750);
	set_custom_ip_register(MY_VGA, REGISTER_5_OFFSET, 40);
	set_custom_ip_register(MY_VGA, REGISTER_6_OFFSET, 5);
}

void set_resolution_768p()
{
	set_custom_ip_register(CLK_WIZ, 0x208, 0x0001810F);
	set_custom_ip_register(CLK_WIZ, 0x214, 0x00004D03);
	set_custom_ip_register(CLK_WIZ, 0x25c, 0x00000003);

	set_custom_ip_register(MY_VGA, REGISTER_3_OFFSET, 1344);
	set_custom_ip_register(MY_VGA, REGISTER_4_OFFSET, 806);
	set_custom_ip_register(MY_VGA, REGISTER_5_OFFSET, 136);
	set_custom_ip_register(MY_VGA, REGISTER_6_OFFSET, 6);
}

void set_custom_ip_register (int baseaddr, int offset, int value)
{
	*((u32*)baseaddr + offset/4) = value;
}

int get_custom_ip_register (int baseaddr, int offset)
{
	int temp = 0;
	temp = *((u32*)baseaddr + offset/4);
	return temp;
}

void letter ( char alpha , u32 x, u32 y)
{
	*((u32*) MY_VGA )      = alpha;
	*((u32*) REGISTER_1_OFFSET )       = x + 144;
	*((u32*) REGISTER_2_OFFSET )       = y + 35;
}

int main (void)
{
	volatile int i = 0;

	//set_resolution_480p();
	//set_custom_ip_register(MY_VGA, REGISTER_1_OFFSET, 0xFFFFFF);
	//set_custom_ip_register(MY_VGA, REGISTER_2_OFFSET, 0xFFFFFF);
	//for (i - 0; i < 1000000000; i++);
	//set_resolution_768p();
	//set_custom_ip_register(MY_VGA, REGISTER_1_OFFSET, 0xFFFFFF);
	//set_custom_ip_register(MY_VGA, REGISTER_2_OFFSET, 0xFFFFFF);
	//for (i - 0; i < 1000000000; i++);
	set_resolution_720p();
	set_custom_ip_register(MY_VGA, REGISTER_1_OFFSET, 0xFFFFFF);
	set_custom_ip_register(MY_VGA, REGISTER_2_OFFSET, 0xFFFFFF);
	for (i - 0; i < 1000000; i++);

	while(1)
	{
		letter('J', 312, 232);
	}
}

