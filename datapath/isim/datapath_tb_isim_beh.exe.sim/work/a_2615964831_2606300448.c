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
static const char *ng0 = "C:/Users/Liz/Desktop/para liz/datapath/Register_File.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2615964831_2606300448_p_0(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
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
    int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6212U);
    t5 = (t0 + 8444);
    t7 = (t15 + 0U);
    t10 = (t7 + 0U);
    *((int *)t10) = 0;
    t10 = (t7 + 4U);
    *((int *)t10) = 4;
    t10 = (t7 + 8U);
    *((int *)t10) = 1;
    t16 = (4 - 0);
    t9 = (t16 * 1);
    t9 = (t9 + 1);
    t10 = (t7 + 12U);
    *((unsigned int *)t10) = t9;
    t3 = ieee_std_logic_unsigned_greater_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t15);
    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 6180U);
    t16 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t1);
    t17 = (t16 - 63);
    t9 = (t17 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t16);
    t19 = (32U * t9);
    t20 = (0 + t19);
    t6 = (t2 + t20);
    t7 = (t0 + 3776);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 32U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 6196U);
    t16 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t1);
    t17 = (t16 - 63);
    t9 = (t17 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t16);
    t19 = (32U * t9);
    t20 = (0 + t19);
    t6 = (t2 + t20);
    t7 = (t0 + 3840);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 32U);
    xsi_driver_first_trans_fast_port(t7);
    t1 = (t0 + 3632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(27, ng0);
    t1 = xsi_get_transient_memory(2048U);
    memset(t1, 0, 2048U);
    t5 = t1;
    t6 = (t0 + 8412);
    t8 = (32U != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 3712);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 2048U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t9 = (2048U / 32U);
    xsi_mem_set_data(t5, t6, 32U, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);
    t10 = (t0 + 1512U);
    t11 = *((char **)t10);
    t10 = (t0 + 1352U);
    t12 = *((char **)t10);
    t10 = (t0 + 6212U);
    t17 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t12, t10);
    t18 = (t17 - 63);
    t9 = (t18 * -1);
    t19 = (32U * t9);
    t20 = (0U + t19);
    t13 = (t0 + 3712);
    t14 = (t13 + 56U);
    t21 = *((char **)t14);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 32U);
    xsi_driver_first_trans_delta(t13, t20, 32U, 0LL);
    goto LAB3;

}


extern void work_a_2615964831_2606300448_init()
{
	static char *pe[] = {(void *)work_a_2615964831_2606300448_p_0};
	xsi_register_didat("work_a_2615964831_2606300448", "isim/datapath_tb_isim_beh.exe.sim/work/a_2615964831_2606300448.didat");
	xsi_register_executes(pe);
}
