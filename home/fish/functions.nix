{
  rebuild = "sudo nixos-rebuild switch --flake ~/nix#$argv";
  flakeinit = "nix flake init -t '/home/onat/nix#'\$argv";
}
