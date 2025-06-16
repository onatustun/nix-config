{inputs, ...}: {
  nixpkgs = {
    overlays = [
      inputs.self.overlays.default
      inputs.niri.overlays.niri
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;

      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than-5d";
    };

    optimise.automatic = true;
  };
}
