{
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./gdm.nix
    ./locale.nix
  ];

  environment.systemPackages = with pkgs; [
    direnv
    git
  ];
}
