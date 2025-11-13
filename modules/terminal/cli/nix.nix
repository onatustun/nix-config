{
  flake.modules.homeManager.cli-nix = {inputs', ...}: {
    home.packages = [
      inputs'.alejandra.packages.default
      inputs'.cachix.packages.default
      inputs'.comma.packages.default
      inputs'.deploy-rs.packages.default
      inputs'.determinate.packages.default
      inputs'.nixd.packages.default
      inputs'.nix-melt.packages.default
      inputs'.nixos-anywhere.packages.default
      inputs'.nix-search-cli.packages.default
      inputs'.rip2.packages.default
    ];
  };
}
