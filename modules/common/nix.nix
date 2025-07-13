{
  nix = {
    settings = {
      extra-substituters = [
        "https://alejandra.cachix.org"
        "https://cache.garnix.io"
        "https://flake-parts.cachix.org"
        "https://ghostty.cachix.org"
        "https://helix.cachix.org"
        "https://hyprland.cachix.org"
        "https://niri.cachix.org"
        "https://nix-community.cachix.org"
        "https://nix-darwin.cachix.org"
        "https://pre-commit-hooks.cachix.org"
        "https://stylix.cachix.org"
        "https://system-manager.cachix.org"
      ];

      extra-trusted-public-keys = [
        "alejandra.cachix.org-1:NjZ8kI0mf4HCq8yPnBfiTurb96zp1TBWl8EC54Pzjm0="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "flake-parts.cachix.org-1:IlewuHm3lWYND+tOeQC9nySl7JpzTZ4sqkb1eJMafow="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
        "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
        "stylix.cachix.org-1:iTycMb+viP8aTqhRDvV5qjs1jtNJKH9Jjvqyg4DYxhw="
        "system-manager.cachix.org-1:9ey5QCB09mkShIdY7nKIOj9Gpdzgtd0ssFeq18eCGns="
      ];

      trusted-users = [
        "@admin"
        "@build"
        "root"
        "@wheel"
      ];

      experimental-features = [
        "cgroups"
        "flakes"
        "nix-command"
        "pipe-operators"
      ];

      auto-optimise-store = true;
      builders-use-substitutes = true;
      fallback = true;
      flake-registry = "";
      http-connections = 50;
      lazy-trees = true;
      max-jobs = "auto";
      sandbox = true;
      show-trace = true;
      use-cgroups = true;
      warn-dirty = false;
    };

    optimise.automatic = true;
  };
}
