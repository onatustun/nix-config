inputs: self: super: let
  fs = import ./filesystem.nix inputs self super;
  sys = import ./system.nix inputs self super;
in
  fs // sys
