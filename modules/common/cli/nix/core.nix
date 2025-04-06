{
  inputs,
  pkgs,
  isDarwin,
  ...
}: {
  environment.systemPackages = with inputs;
    [
      alejandra.packages.${pkgs.stdenv.hostPlatform.system}.default
      cachix.packages.${pkgs.stdenv.hostPlatform.system}.default
      comma.packages.${pkgs.stdenv.hostPlatform.system}.default
      deadnix.packages.${pkgs.stdenv.hostPlatform.system}.default
      deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
      devenv.packages.${pkgs.stdenv.hostPlatform.system}.default
      devshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-melt.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixos-anywhere.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixos-generators.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-search-cli.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-search-tv.packages.${pkgs.stdenv.hostPlatform.system}.default
      statix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ (
      if !isDarwin
      then [inputs.nixd.packages.${pkgs.stdenv.hostPlatform.system}.default]
      else [pkgs.nixd]
    );
}
