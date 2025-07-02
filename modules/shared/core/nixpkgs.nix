{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };

  home-manager.sharedModules = [
    {
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
        allowUnfreePredicate = _: true;
      };
    }
  ];
}
