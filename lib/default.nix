inputs: self: super: let
  keys = import ./keys.nix;
  sys = import ./sys.nix super inputs self;
  values = import ./values.nix self;
in
  keys
  // sys
  // values
