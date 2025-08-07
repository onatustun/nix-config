{
  nix = {
    settings = {
      auto-optimise-store = true;
      fallback = true;
      max-jobs = "auto";
      sandbox = true;
    };

    optimise.automatic = true;
  };
}
