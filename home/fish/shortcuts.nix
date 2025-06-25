{
  programs.fish = {
    shellAbbrs = {
      c = "clear";
      cp = "cp -prv";
      ff = "fastfetch";
      find = "fd";
      lg = "lazygit";
      md = "mkdir -pv";
      mv = "mv -v";
      ns = "nix-search";
      rm = "rm -rv";
      s = "sudo -E";
      sx = "sudo -E hx";
      syz = "sudo -E yazi";
      x = "hx";
      yz = "yazi";
    };

    shellAliases = {
      cat = "prettybat";
      cff = "clear && fastfetch";
      cl = "clear && eza -al";
      grep = "rg";
      ls = "eza -al";
      man = "batman";
      nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ping = "prettyping";
      sl = "eza -al";
    };
  };
}
