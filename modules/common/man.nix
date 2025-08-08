{lib, ...}: let
  inherit (lib) disabled;
in {
  home-manager.sharedModules = [
    {
      manual = {
        html = disabled;
        json = disabled;
        manpages = disabled;
      };
    }
  ];
}
