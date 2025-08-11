{
  nix.settings = {
    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    trusted-users = [
      "@admin"
      "@build"
      "root"
      "@wheel"
    ];

    builders-use-substitutes = true;
    flake-registry = "";
    http-connections = 50;
    lazy-trees = true;
    show-trace = true;
    use-cgroups = true;
    warn-dirty = false;
  };
}
