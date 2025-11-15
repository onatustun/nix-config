{
  flake.modules.homeManager.nh = {homeDir, ...}: {
    programs.nh = {
      enable = true;
      flake = "${homeDir}/nix";

      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
    };
  };
}
