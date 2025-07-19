inputs: self: super: {
  mkNixos = import ./mkNixos.nix inputs self super;
}
