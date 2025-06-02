{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./themes
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = import ./languages.nix { inherit
      inputs
      lib
      pkgs;
    };

    settings = {
      theme = "${config.stylix.base16Scheme.name}";
      editor = import ./editor.nix;

      keys.normal.C-g = [
        ":write-all"
        ":new"
        ":insert-output lazygit"
        ":buffer-close!"
        ":redraw"
        ":reload-all"
      ];
    };
  };
}
