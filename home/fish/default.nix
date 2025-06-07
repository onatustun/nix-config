{
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    imports = [
      ./shortcuts.nix
      ./init.nix
    ];

    functions = import ./functions.nix;

    plugins = import ./plugins.nix { inherit
      pkgs; 
    };    
  };
}
