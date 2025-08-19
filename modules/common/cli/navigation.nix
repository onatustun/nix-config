{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs = {
        skim = enabled;
        ripgrep = enabled;
        fd = enabled;
        fzf = enabled;
      };
    }
  ];
}
