{lib, ...}: let
  inherit (lib) genAttrs const;
in {
  home-manager.sharedModules = [
    {
      programs =
        genAttrs [
          "fd"
          "fzf"
          "ripgrep"
          "skim"
        ]
        <| const {enable = true;};
    }
  ];
}
