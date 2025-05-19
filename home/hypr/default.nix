{
  pkgs,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprland
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    hyprcursor
    hyprshot
    hyprsunset
  ];
}
