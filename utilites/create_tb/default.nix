let 
pkgs = import <nixpkgs> {};
in
pkgs.python3Packages.buildPythonApplication rec{
	pname = "createtb";
	name = "${pname}-${version}";
	version = "0.1.0";
	src = ./create_tb.py;
	dontUnpack= true;
	dontBuild = true;
	dontInstall = true;
	doInstallCheck = false;
	dontCopyDist= true;
	meta = with pkgs.stdenv.lib; {
		description = "A script to aid in HDL testbench creation";
	};
}
