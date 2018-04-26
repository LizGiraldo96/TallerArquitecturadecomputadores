/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Liz/Desktop/para liz/datapath/UC.vhd";



static void work_a_2425904575_2759040872_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5198);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB5:
LAB4:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 5296);
    t3 = (t0 + 3336);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast(t3);

LAB2:    t1 = (t0 + 3240);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(26, ng0);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 5200);
    t8 = 1;
    if (6U == 6U)
        goto LAB10;

LAB11:    t8 = 0;

LAB12:    if (t8 != 0)
        goto LAB7;

LAB9:
LAB8:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5212);
    t8 = 1;
    if (6U == 6U)
        goto LAB19;

LAB20:    t8 = 0;

LAB21:    if (t8 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5224);
    t8 = 1;
    if (6U == 6U)
        goto LAB28;

LAB29:    t8 = 0;

LAB30:    if (t8 != 0)
        goto LAB25;

LAB27:
LAB26:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5236);
    t8 = 1;
    if (6U == 6U)
        goto LAB37;

LAB38:    t8 = 0;

LAB39:    if (t8 != 0)
        goto LAB34;

LAB36:
LAB35:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5248);
    t8 = 1;
    if (6U == 6U)
        goto LAB46;

LAB47:    t8 = 0;

LAB48:    if (t8 != 0)
        goto LAB43;

LAB45:
LAB44:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5260);
    t8 = 1;
    if (6U == 6U)
        goto LAB55;

LAB56:    t8 = 0;

LAB57:    if (t8 != 0)
        goto LAB52;

LAB54:
LAB53:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5272);
    t8 = 1;
    if (6U == 6U)
        goto LAB64;

LAB65:    t8 = 0;

LAB66:    if (t8 != 0)
        goto LAB61;

LAB63:
LAB62:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5284);
    t8 = 1;
    if (6U == 6U)
        goto LAB73;

LAB74:    t8 = 0;

LAB75:    if (t8 != 0)
        goto LAB70;

LAB72:
LAB71:    goto LAB2;

LAB6:;
LAB7:    xsi_set_current_line(27, ng0);
    t12 = (t0 + 5206);
    t14 = (t0 + 3336);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t12, 6U);
    xsi_driver_first_trans_fast(t14);
    goto LAB8;

LAB10:    t9 = 0;

LAB13:    if (t9 < 6U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t10 = (t6 + t9);
    t11 = (t5 + t9);
    if (*((unsigned char *)t10) != *((unsigned char *)t11))
        goto LAB11;

LAB15:    t9 = (t9 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(30, ng0);
    t7 = (t0 + 5218);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB17;

LAB19:    t9 = 0;

LAB22:    if (t9 < 6U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB20;

LAB24:    t9 = (t9 + 1);
    goto LAB22;

LAB25:    xsi_set_current_line(33, ng0);
    t7 = (t0 + 5230);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB26;

LAB28:    t9 = 0;

LAB31:    if (t9 < 6U)
        goto LAB32;
    else
        goto LAB30;

LAB32:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB29;

LAB33:    t9 = (t9 + 1);
    goto LAB31;

LAB34:    xsi_set_current_line(36, ng0);
    t7 = (t0 + 5242);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB35;

LAB37:    t9 = 0;

LAB40:    if (t9 < 6U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB38;

LAB42:    t9 = (t9 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(39, ng0);
    t7 = (t0 + 5254);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB44;

LAB46:    t9 = 0;

LAB49:    if (t9 < 6U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB47;

LAB51:    t9 = (t9 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(42, ng0);
    t7 = (t0 + 5266);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB53;

LAB55:    t9 = 0;

LAB58:    if (t9 < 6U)
        goto LAB59;
    else
        goto LAB57;

LAB59:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB56;

LAB60:    t9 = (t9 + 1);
    goto LAB58;

LAB61:    xsi_set_current_line(45, ng0);
    t7 = (t0 + 5278);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB62;

LAB64:    t9 = 0;

LAB67:    if (t9 < 6U)
        goto LAB68;
    else
        goto LAB66;

LAB68:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB65;

LAB69:    t9 = (t9 + 1);
    goto LAB67;

LAB70:    xsi_set_current_line(48, ng0);
    t7 = (t0 + 5290);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 6U);
    xsi_driver_first_trans_fast(t11);
    goto LAB71;

LAB73:    t9 = 0;

LAB76:    if (t9 < 6U)
        goto LAB77;
    else
        goto LAB75;

LAB77:    t5 = (t2 + t9);
    t6 = (t1 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB74;

LAB78:    t9 = (t9 + 1);
    goto LAB76;

}

static void work_a_2425904575_2759040872_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 3400);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 6U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3256);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2425904575_2759040872_init()
{
	static char *pe[] = {(void *)work_a_2425904575_2759040872_p_0,(void *)work_a_2425904575_2759040872_p_1};
	xsi_register_didat("work_a_2425904575_2759040872", "isim/datapath_tb_isim_beh.exe.sim/work/a_2425904575_2759040872.didat");
	xsi_register_executes(pe);
}
