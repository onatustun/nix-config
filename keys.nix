let
  inherit (builtins) attrValues;

  keys = {
    nixos-desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS o@ust.sh";
  };
in
  keys
  // {
    all = attrValues keys;
  }
