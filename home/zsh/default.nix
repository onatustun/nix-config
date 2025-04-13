{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    history.ignoreAllDups = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = import ./shell-aliases.nix;
    initExtra = import ./init-extra.nix;
    oh-my-zsh = import ./oh-my-zsh.nix;
  };
}
