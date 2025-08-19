{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      lldb
      zls
    ]
    ++ (with inputs; [
      zon2nix.packages.${pkgs.stdenv.hostPlatform.system}.zon2nix
      zig.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]);
}
