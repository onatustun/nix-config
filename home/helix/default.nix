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

    extraPackages = with pkgs; [
      markdown-oxide
    ];

    languages = import ./languages.nix { inherit
      pkgs
      lib
      inputs;
    };
              
    settings = {
      theme = "${config.stylix.base16Scheme.name}";
      editor = import ./editor.nix;
    };
  };
}
