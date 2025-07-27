{pkgs, ...}: {
  environment.systemPackages = [pkgs.github-desktop];

  services = {
    gnome.gnome-keyring.enable = true;
    dbus.packages = [pkgs.gnome-keyring];
  };

  home-manager.sharedModules = [
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        userName = "onatustun";
        userEmail = "o@ust.sh";

        ignores = [
          ".direnv"
          ".envrc"
        ];

        extraConfig = {
          init.defaultBranch = "main";
          safe.directory = "~/nix";
        };
      };
    }
  ];
}
