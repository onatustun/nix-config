inputs: self: super: let
  fs = import ./fs.nix self;
  keys = import ./keys.nix super;
  sys = import ./sys.nix super inputs self;
  values = import ./values.nix self;
in
  fs
  // keys
  // sys
  // values
