{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [pkgs.zls]
    ++ (with inputs; [
      zig.packages.${pkgs.stdenv.hostPlatform.system}.default
      zon2nix.packages.${pkgs.stdenv.hostPlatform.system}.zon2nix
    ]);
}
