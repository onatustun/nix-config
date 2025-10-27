{
  inputs',
  pkgs,
  isDarwin,
  ...
}: {
  environment.systemPackages = with inputs';
    [
      alejandra.packages.default
      cachix.packages.default
      comma.packages.default
      deadnix.packages.default
      deploy-rs.packages.default
      determinate.packages.default
      disko.packages.default
      home-manager.packages.default
      nix-index.packages.default
      nix-melt.packages.default
      nixos-anywhere.packages.default
      nix-search-cli.packages.default
      rip2.packages.default
      scooter.packages.default
    ]
    ++ (
      if !isDarwin
      then [inputs'.nixd.packages.default]
      else [pkgs.nixd]
    );
}
