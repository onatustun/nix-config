{inputs, ...}: {
  nixpkgs = {
    overlays = [inputs.self.overlays.default];

    config = {
      allowUnfree = true;
      allowBroken = true;
      allowUnfreePredicate = _: true;
    };
  };
}
