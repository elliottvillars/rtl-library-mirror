{ pkgs ? import <nixpkgs> {} }:
	pkgs.mkShell {
		buildInputs = [pkgs.z3 pkgs.yices pkgs.boolector pkgs.symbiyosys pkgs.yosys pkgs.gtkwave pkgs.verilator];
	}