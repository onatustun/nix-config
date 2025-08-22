let
  inherit (builtins) attrValues;

  keys = {
    nixos-desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS o@ust.sh";
    nixos-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp onat@nixos";
    nixos-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoYZPPyxyApJNi2gk+3eQOhdO4s3x6G24Xof7vcOagz onat@server";
    # nixos-wsl-desktop = "";
    # nixos-wsl-laptop = "";
    # darwin-mini = "";
    # windows-desktop = "";
    # windows-laptop = "";
  };
in
  keys
  // {
    nixos = [
      keys.nixos-desktop
      keys.nixos-laptop
      keys.nixos-server
      # keys.nixos-wsl-desktop
      # keys.nixos-wsl-laptop
    ];

    # darwin = [keys.darwin-mini];

    # windows = [
    #   keys.windows-desktop
    #   keys.windows-laptop
    # ];

    # desktop = [
    #   keys.nixos-desktop
    #   keys.nixos-wsl-desktop
    #   keys.windows-desktop
    # ];

    # laptop = [
    #   keys.nixos-laptop
    #   keys.nixos-wsl-laptop
    #   keys.windows-laptop
    # ];

    # mini = [keys.darwin-mini];

    # wsl = [
    #   keys.nixos-wsl-desktop
    #   keys.nixos-wsl-laptop
    # ];

    all = attrValues keys;
  }
