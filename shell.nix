{ pkgs ? import <nixpkgs> { } }:
let
  hsEnv = pkgs.haskellPackages.ghcWithPackages (ps:
    with ps; [
      #clash-ghc
      ghc-typelits-natnormalise
      ghc-typelits-knownnat
      ghc-typelits-extra
      #haddock
    ]);
in pkgs.mkShell {
  buildInputs = with pkgs; [
    z3
    z3-tptp
    vampire
    eprover
    cvc4
    yices
    boolector
    symbiyosys
    yosys
    gtkwave
    verilator
    verilog
    #    ghdl
    ddd
    gdb
    cmake
    ninja
    python38Packages.pylint
    ormolu
    hsEnv
    bluespec
    coq
    coqPackages.coqhammer
  ];
}
