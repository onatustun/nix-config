{
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

    optimise.automatic = true;
  };
}
