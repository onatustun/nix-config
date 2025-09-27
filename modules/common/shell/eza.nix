{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.eza = {
        enable = true;
        package = inputs.eza.packages.${pkgs.stdenv.hostPlatform.system}.default;
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}
