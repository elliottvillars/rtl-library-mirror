/*
 * Generated by Bluespec Compiler (build 0000000)
 * 
 * On Sun Nov 22 18:09:59 PST 2020
 * 
 */
#include "bluesim_primitives.h"
#include "model_mkTB.h"

#include <cstdlib>
#include <time.h>
#include "bluesim_kernel_api.h"
#include "bs_vcd.h"
#include "bs_reset.h"


/* Constructor */
MODEL_mkTB::MODEL_mkTB()
{
  mkTB_instance = NULL;
}

/* Function for creating a new model */
void * new_MODEL_mkTB()
{
  MODEL_mkTB *model = new MODEL_mkTB();
  return (void *)(model);
}

/* Schedule functions */

static void schedule_posedge_CLK(tSimStateHdl simHdl, void *instance_ptr)
       {
	 MOD_mkTB &INST_top = *((MOD_mkTB *)(instance_ptr));
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_switch;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_switch;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_anode;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_anode;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_switch_current;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_switch_current;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_cathode;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_cathode;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_d0;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_d0;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_digit;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_digit;
	 tUInt8 DEF_INST_top_DEF_CAN_FIRE_RL_run;
	 tUInt8 DEF_INST_top_DEF_WILL_FIRE_RL_run;
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_anode = (tUInt8)1u;
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_anode = DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_anode;
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_cathode = (tUInt8)1u;
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_cathode = DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_cathode;
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_digit = (tUInt8)1u;
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_digit = DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_digit;
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_switch_current = (tUInt8)1u;
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_switch_current = DEF_INST_top_DEF_CAN_FIRE_RL_dut_switch_current;
	 DEF_INST_top_DEF_CAN_FIRE_RL_run = (tUInt8)1u;
	 DEF_INST_top_DEF_WILL_FIRE_RL_run = DEF_INST_top_DEF_CAN_FIRE_RL_run;
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_anode)
	   INST_top.RL_dut_drive_anode();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_cathode)
	   INST_top.RL_dut_drive_cathode();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_switch_current)
	   INST_top.RL_dut_switch_current();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_digit)
	   INST_top.RL_dut_inc_digit();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_run)
	   INST_top.RL_run();
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_d0 = INST_top.INST_dut_dr_en.METH_whas() && INST_top.INST_dut_dr_en.METH_wget();
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_d0 = DEF_INST_top_DEF_CAN_FIRE_RL_dut_drive_d0;
	 DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_switch = INST_top.INST_dut_sw_en.METH_whas() && INST_top.INST_dut_sw_en.METH_wget();
	 DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_switch = DEF_INST_top_DEF_CAN_FIRE_RL_dut_inc_switch;
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_drive_d0)
	   INST_top.RL_dut_drive_d0();
	 if (DEF_INST_top_DEF_WILL_FIRE_RL_dut_inc_switch)
	   INST_top.RL_dut_inc_switch();
	 INST_top.INST_dut_dr_en.clk((tUInt8)1u, (tUInt8)1u);
	 INST_top.INST_dut_sw_en.clk((tUInt8)1u, (tUInt8)1u);
	 if (do_reset_ticks(simHdl))
	 {
	   INST_top.INST_dut_anodes.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_cathodes.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_d_switch.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_current_digit.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_digits_0.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_digits_1.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_digits_2.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_dut_digits_3.rst_tick__clk__1((tUInt8)1u);
	   INST_top.INST_counter.rst_tick__clk__1((tUInt8)1u);
	 }
       };

/* Model creation/destruction functions */

void MODEL_mkTB::create_model(tSimStateHdl simHdl, bool master)
{
  sim_hdl = simHdl;
  init_reset_request_counters(sim_hdl);
  mkTB_instance = new MOD_mkTB(sim_hdl, "top", NULL);
  bk_get_or_define_clock(sim_hdl, "CLK");
  if (master)
  {
    bk_alter_clock(sim_hdl, bk_get_clock_by_name(sim_hdl, "CLK"), CLK_LOW, false, 0llu, 5llu, 5llu);
    bk_use_default_reset(sim_hdl);
  }
  bk_set_clock_event_fn(sim_hdl,
			bk_get_clock_by_name(sim_hdl, "CLK"),
			schedule_posedge_CLK,
			NULL,
			(tEdgeDirection)(POSEDGE));
  (mkTB_instance->INST_dut_sw_en.set_clk_0)("CLK");
  (mkTB_instance->INST_dut_dr_en.set_clk_0)("CLK");
  (mkTB_instance->set_clk_0)("CLK");
}
void MODEL_mkTB::destroy_model()
{
  delete mkTB_instance;
  mkTB_instance = NULL;
}
void MODEL_mkTB::reset_model(bool asserted)
{
  (mkTB_instance->reset_RST_N)(asserted ? (tUInt8)0u : (tUInt8)1u);
}
void * MODEL_mkTB::get_instance()
{
  return mkTB_instance;
}

/* Fill in version numbers */
void MODEL_mkTB::get_version(unsigned int *year,
			     unsigned int *month,
			     char const **annotation,
			     char const **build)
{
  *year = 0u;
  *month = 0u;
  *annotation = NULL;
  *build = "0000000";
}

/* Get the model creation time */
time_t MODEL_mkTB::get_creation_time()
{
  
  /* Mon Nov 23 02:09:59 UTC 2020 */
  return 1606097399llu;
}

/* Control run-time licensing */
tUInt64 MODEL_mkTB::skip_license_check()
{
  return 0llu;
}

/* State dumping function */
void MODEL_mkTB::dump_state()
{
  (mkTB_instance->dump_state)(0u);
}

/* VCD dumping functions */
MOD_mkTB & mkTB_backing(tSimStateHdl simHdl)
{
  static MOD_mkTB *instance = NULL;
  if (instance == NULL)
  {
    vcd_set_backing_instance(simHdl, true);
    instance = new MOD_mkTB(simHdl, "top", NULL);
    vcd_set_backing_instance(simHdl, false);
  }
  return *instance;
}
void MODEL_mkTB::dump_VCD_defs()
{
  (mkTB_instance->dump_VCD_defs)(vcd_depth(sim_hdl));
}
void MODEL_mkTB::dump_VCD(tVCDDumpType dt)
{
  (mkTB_instance->dump_VCD)(dt, vcd_depth(sim_hdl), mkTB_backing(sim_hdl));
}