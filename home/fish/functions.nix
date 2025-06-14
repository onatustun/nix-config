{
  cpp = "cp -prv $argv ..";
  flakeinit = "nix flake init -t '/home/onat/nix#'\$argv";
  mvp = "mv -v $argv ..";
  rebuild = "sudo nixos-rebuild switch --flake ~/nix#$argv";
}
