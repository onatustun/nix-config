{
  pkgs,
  ...
}: {
  imports = [
    ./shortcuts.nix
    ./init.nix
  ];

  programs.fish = {
    enable = true;  
    functions = import ./functions.nix;

    plugins = import ./plugins.nix { inherit
      pkgs; 
    };    
  };
}
