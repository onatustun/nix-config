{pkgs, ...}: {
  services.resolved.enable = true;

  environment.systemPackages = with pkgs; [
    geteduroam
    geteduroam-cli
    networkmanagerapplet
  ];

  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
      dns = "systemd-resolved";
    };

    firewall.checkReversePath = "loose";
  };
}
