// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef _Vaccumulator__Syms_H_
#define _Vaccumulator__Syms_H_

#include "verilated.h"

// INCLUDE MODULE CLASSES
#include "Vaccumulator.h"

// SYMS CLASS
class Vaccumulator__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Vaccumulator*                  TOPp;
    
    // CREATORS
    Vaccumulator__Syms(Vaccumulator* topp, const char* namep);
    ~Vaccumulator__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(64);

#endif  // guard
