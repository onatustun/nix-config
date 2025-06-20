{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./themes
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = import ./languages.nix {inherit inputs pkgs;};

    settings = {
      theme = "${config.stylix.base16Scheme.polarity}";
      editor = import ./editor.nix;
      keys = import ./keys.nix;
    };
  };
}
