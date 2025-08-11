{
  pkgs,
  inputs,
  isDarwin,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      home-manager
      nixos-rebuild
      nix-search-cli
      nix-search-tv
    ]
    ++ (with inputs; [
      alejandra.packages.${pkgs.stdenv.hostPlatform.system}.default
      comma.packages.${pkgs.stdenv.hostPlatform.system}.default
      deploy-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
      nix-melt.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixos-anywhere.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
    ++ (
      if !isDarwin
      then [inputs.nixd.packages.${pkgs.stdenv.hostPlatform.system}.default]
      else [pkgs.nixd]
    );
}
