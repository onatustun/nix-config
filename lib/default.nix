inputs: self: super: let
  fs = import ./fs.nix inputs self super;
  sys = import ./sys.nix inputs self super;
  values = import ./values.nix inputs self super;
in
  fs
  // sys
  // values
