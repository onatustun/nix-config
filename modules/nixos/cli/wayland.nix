{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system};
    [
      grim
      slurp
    ]
    ++ (with pkgs; [
      wlr-randr
      wlrctl
      wvkbd
    ]);
}
