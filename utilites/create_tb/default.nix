
with import <nixpkgs> {};
python3Packages.buildPythonPackage rec {
	name = "${pname}-${version}";
	pname = "createtb";
	version = "0.1.0";
	src = ./create_tb.py;
	buildInputs = [ python3 ];

	phases = "installPhase";

	installPhase = ''
		mkdir -p $out/bin
		cp ${src} $out/bin/${pname}
		chmod +x $out/bin/${pname}
		'';
}
