inputs: self: super: let
  fs = import ./fs.nix self;
  keys = import ./keys.nix;
  sys = import ./sys.nix inputs self super;
  values = import ./values.nix self;
in
  fs
  // keys
  // sys
  // values
