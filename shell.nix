{ pkgs ? import <nixpkgs> { } }:
let
  hsEnv = pkgs.haskellPackages.ghcWithPackages (ps:
    with ps; [
      clash-ghc
      ghc-typelits-natnormalise
      ghc-typelits-knownnat
      ghc-typelits-extra
      haddock
    ]);
in pkgs.mkShell {
  buildInputs = with pkgs; [
    z3
    yices
    boolector
    symbiyosys
    yosys
    gtkwave
    verilator
    verilog
    #    ghdl
    cmake
    ninja
    python38Packages.pylint
    ormolu
    hsEnv
  ];
}
