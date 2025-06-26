{pkgs, ...}: {
  imports = [
    ./shortcuts.nix
    ./init.nix
  ];

  programs = {
    command-not-found.enable = true;

    fish = {
      enable = true;
      plugins = import ./plugins.nix {inherit pkgs;};
    };
  };
}
