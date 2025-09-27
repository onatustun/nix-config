inputs: self: super: let
  keys = import ./keys.nix super;
  sys = import ./sys.nix super inputs self;
  values = import ./values.nix self;
in
  keys
  // sys
  // values
