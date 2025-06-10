{
  pkgs,
  ...
}: {
  imports = [
    ./shortcuts.nix
    ./init.nix
  ];

  programs.command-not-found.enable = true;

  programs.fish = {
    enable = true;  
    functions = import ./functions.nix;

    plugins = import ./plugins.nix { inherit
      pkgs; 
    };    
  };
}
