let
  inherit (builtins) attrValues;

  keys = {
    nixos-desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS o@ust.sh";
    nixos-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp onat@nixos";
    nixos-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoYZPPyxyApJNi2gk+3eQOhdO4s3x6G24Xof7vcOagz onat@server";
  };
in
  keys
  // {
    nixos = [
      keys.nixos-desktop
      keys.nixos-laptop
      keys.nixos-server
    ];

    # darwin = [];
    # windows = [];

    # desktop = [];
    # laptop = [];
    # mini = [];
    # wsl = [];

    all = attrValues keys;
  }
