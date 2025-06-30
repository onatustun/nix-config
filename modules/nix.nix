{inputs, ...}: {
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

  home-manager.sharedModules = [
    {
      programs.nh = {
        enable = true;
        flake = "/home/onat/nix";
      };
    }
  ];
}
