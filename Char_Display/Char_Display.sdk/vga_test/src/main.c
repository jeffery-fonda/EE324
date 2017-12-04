/*
 * main.c
 *
 *  Created on: Nov 16, 2017
 *      Author: jfonda
 */

#include "xparameters.h"
#include "xil_io.h"
#include "platform.h"

#define CLK_WIZ 0x43C10000

#define R_ADDR      0x43C10000 //slvreg0
#define G_ADDR      0x43C10004 //slvreg1, background
#define B_ADDR      0x43C10008 //slvreg2, foreground
#define H1_ADDR     0x43C1000C //slvreg3, hcount1
#define H2_ADDR     0x43C10010 //slvreg4, hcount2
#define V1_ADDR     0x43C10014 //slvreg5, vcount1
#define V2_ADDR     0x43C10018 //slvreg6, vcount2
#define Hbound      0x43C1001C //slvreg7, const for horizontal counter
#define Vbound      0x43C10020 //slvreg8, const for vertical counter
#define Hporch      0x43C10024 //slvreg9
#define Vporch      0x43C10028 //slvreg10
#define dispx1		0x43C1002C //slvreg11
#define dispx2		0x43C10030 //slvreg12
#define dispy1		0x43C10034 //slvreg13
#define dispy2		0x43C10038 //slvreg14
#define ascii       0x43C1003C //slvreg15, ascii
#define locx        0x43C10040 //slvreg16, loc_x
#define locy        0x43C10044 //slvreg17, loc_y

#define hRes0   800
#define vRes0   525
#define hs0  	 96
#define vs0 	  2

#define hdmix1  144
#define hdmix2  784
#define hdmiy1   35
#define hdmiy2  515

void setRes(u32 thisResh, u32 thisResv, u32 hs, u32 vs, u32 hdx1, u32 hdx2, u32 hdy1, u32 hdy2);
void letter ( char alpha , u32 x, u32 y);
void canvas1 ( u32 x1, u32 x2, u32 y1, u32 y2);

void setRes(u32 thisResh, u32 thisResv, u32 hs, u32 vs, u32 hdx1, u32 hdx2, u32 hdy1, u32 hdy2)
{

	*((u32*)Hbound) = thisResh - 1;
	*((u32*)Vbound) = thisResv - 1;

	*((u32*)Hporch) = hs;
	*((u32*)Vporch) = vs;
	*((u32*)dispx1) = hdx1;
	*((u32*)dispx2) = hdx2;
	*((u32*)dispx1) = hdy1;
	*((u32*)dispy2) = hdy2;

}

void canvas1 ( u32 x1, u32 x2, u32 y1, u32 y2)
{
	*((u32*)H1_ADDR)  = x1+144;
	*((u32*)H2_ADDR)  = x2+144;
	*((u32*)V1_ADDR)  = y1+35;
	*((u32*)V2_ADDR)  = y2+35;
}

void letter ( char alpha , u32 x, u32 y)
{
	*((u32*)ascii)      = alpha;
	*((u32*)locx)       = x+144;
	*((u32*)locy)       = y+35;
}

int main (void)
{
	setRes(hRes0, vRes0, hs0, vs0, hdmix1, hdmix2, hdmiy1, hdmiy2);

	*((u32*)0x43C10004) = 0xFFFF; //background
	*((u32*)0x43C10008) = 0x07E0; //foreground
	canvas1 (160, 480, 120, 360);

	while(1)
	{
		letter('D', 312, 232);
	}
}


