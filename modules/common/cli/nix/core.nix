{
  inputs,
  pkgs,
  isDarwin,
  ...
}: {
  environment.systemPackages = with inputs;
    [
      agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
      alejandra.packages.${pkgs.stdenv.hostPlatform.system}.default
      cachix.packages.${pkgs.stdenv.hostPlatform.system}.default
      comma.packages.${pkgs.stdenv.hostPlatform.system}.default
      deadnix.packages.${pkgs.stdenv.hostPlatform.system}.default
      deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
      determinate.packages.${pkgs.stdenv.hostPlatform.system}.default
      disko.packages.${pkgs.stdenv.hostPlatform.system}.default
      home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-index.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-melt.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixos-anywhere.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-search-cli.packages.${pkgs.stdenv.hostPlatform.system}.default
      rip2.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    ++ (
      if !isDarwin
      then [inputs.nixd.packages.${pkgs.stdenv.hostPlatform.system}.default]
      else [pkgs.nixd]
    );
}
