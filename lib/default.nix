inputs: final: prev: {
  mkNixos = import ./mkNixos.nix {
    inherit inputs;
    lib = final;
  };
}
