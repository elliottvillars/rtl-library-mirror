// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vaccumulator.h for the primary calling header

#include "Vaccumulator.h"
#include "Vaccumulator__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vaccumulator) {
    Vaccumulator__Syms* __restrict vlSymsp = __VlSymsp = new Vaccumulator__Syms(this, name());
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vaccumulator::__Vconfigure(Vaccumulator__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vaccumulator::~Vaccumulator() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vaccumulator::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vaccumulator::eval\n"); );
    Vaccumulator__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("accumulator.v", 23, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vaccumulator::_eval_initial_loop(Vaccumulator__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("accumulator.v", 23, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

//--------------------
// Internal Methods

VL_INLINE_OPT void Vaccumulator::_sequent__TOP__1(Vaccumulator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_sequent__TOP__1\n"); );
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->o_ACCUMULATION = ((IData)(vlTOPp->i_RST)
                               ? 0U : (0xffU & ((IData)(vlTOPp->i_CLK_EN)
                                                 ? 
                                                ((IData)(vlTOPp->o_ACCUMULATION) 
                                                 + (IData)(vlTOPp->i_SUMMAND))
                                                 : (IData)(vlTOPp->o_ACCUMULATION))));
}

void Vaccumulator::_eval(Vaccumulator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_eval\n"); );
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->i_CLK) & (~ (IData)(vlTOPp->__Vclklast__TOP__i_CLK)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__i_CLK = vlTOPp->i_CLK;
}

void Vaccumulator::_eval_initial(Vaccumulator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_eval_initial\n"); );
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__i_CLK = vlTOPp->i_CLK;
}

void Vaccumulator::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::final\n"); );
    // Variables
    Vaccumulator__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vaccumulator::_eval_settle(Vaccumulator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_eval_settle\n"); );
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

VL_INLINE_OPT QData Vaccumulator::_change_request(Vaccumulator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_change_request\n"); );
    Vaccumulator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vaccumulator::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((i_CLK & 0xfeU))) {
        Verilated::overWidthError("i_CLK");}
    if (VL_UNLIKELY((i_CLK_EN & 0xfeU))) {
        Verilated::overWidthError("i_CLK_EN");}
    if (VL_UNLIKELY((i_RST & 0xfeU))) {
        Verilated::overWidthError("i_RST");}
}
#endif // VL_DEBUG

void Vaccumulator::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vaccumulator::_ctor_var_reset\n"); );
    // Body
    i_CLK = VL_RAND_RESET_I(1);
    i_CLK_EN = VL_RAND_RESET_I(1);
    i_RST = VL_RAND_RESET_I(1);
    i_SUMMAND = VL_RAND_RESET_I(8);
    o_ACCUMULATION = VL_RAND_RESET_I(8);
}
