inputs: self: super: let
  fs = import ./fs.nix super;
  keys = import ./keys.nix;
  sys = import ./sys.nix super inputs self;
in
  fs
  // keys
  // sys
