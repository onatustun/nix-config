{  
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    functions = import ./functions.nix;
    interactiveShellInit = import ./interactiveShellInit.nix;
    loginShellInit = import ./loginShellInit.nix;

    plugins = import ./plugins.nix { 
      inherit pkgs; 
    };

    shellAbbrs = import ./shellAbbrs.nix;
    shellAliases = import ./shellAliases.nix;
    shellInit = import ./shellInit.nix;
    shellInitLast = import ./shellInitLast.nix;
  };
}
