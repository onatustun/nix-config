{
  pkgs,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprland
    ./hyprlock.nix
    ./hyprpaper
  ];

  home.packages = with pkgs; [
    hyprcursor
    hyprpaper
    hyprshot
    hyprsunset
  ];
}
