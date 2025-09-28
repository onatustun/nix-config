inputs: self: super: let
  keys = import ./keys.nix;
  sys = import ./sys.nix super inputs self;
in
  keys
  // sys
