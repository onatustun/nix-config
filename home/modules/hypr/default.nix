{
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./hyprlock.nix
    ./hyprpaper
  ];

  home.packages = with pkgs; [
    hyprshot
    hyprsunset
    hyprpaper
  ];
}
