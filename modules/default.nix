{
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./gdm.nix
    ./graphics.nix
    ./locale.nix
    ./nix.nix
  ];

  environment.systemPackages = with pkgs; [
    git
  ];
}
