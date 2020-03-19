// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vaccumulator_H_
#define _Vaccumulator_H_

#include "verilated.h"

class Vaccumulator__Syms;

//----------

VL_MODULE(Vaccumulator) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    // Begin mtask footprint all: 
    VL_IN8(i_CLK,0,0);
    VL_IN8(i_CLK_EN,0,0);
    VL_IN8(i_RST,0,0);
    VL_IN8(i_SUMMAND,7,0);
    VL_OUT8(o_ACCUMULATION,7,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    // Begin mtask footprint all: 
    VL_SIG8(__Vclklast__TOP__i_CLK,0,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vaccumulator__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vaccumulator);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vaccumulator(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vaccumulator();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vaccumulator__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vaccumulator__Syms* symsp, bool first);
  private:
    static QData _change_request(Vaccumulator__Syms* __restrict vlSymsp);
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vaccumulator__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vaccumulator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vaccumulator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(Vaccumulator__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
