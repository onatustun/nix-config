{
  pkgs,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprland
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    hyprcursor
    hyprpaper
    hyprshot
    hyprsunset
  ];
}
