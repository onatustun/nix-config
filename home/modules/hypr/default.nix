{
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./hyprpaper
  ];

  home.packages = with pkgs; [
    hyprshot
    hyprsunset
  ];
}
