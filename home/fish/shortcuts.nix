{
  programs.fish = {
    shellAbbrs = {
      c = "clear";
      cp = "cp -prv";
      ff = "fastfetch";
      find = "fd";
      lg = "lazygit";
      md = "mkdir -pv";
      mkdir = "mkdir -pv";
      mv = "mv -v";
      ns = "nix-search";
      rmf = "rm -frv";
      rm = "rm -rv";
      s = "sudo -E";
      "sx." = "sudo -E hx .";
      sx = "sudo -E hx";
      syz = "sudo -E yazi";
      "x." = "hx .";
      x = "hx";
      yz = "yazi";
      z = "cd";
      zi = "cdi";
    };

    shellAliases = {
      cat = "prettybat";
      cff = "clear && fastfetch";
      cl = "clear && eza -al";
      grep = "rg";
      h = "cd ~";
      ls = "eza -al";
      man = "batman";
      nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ping = "prettyping";
      q = "exit";
      sl = "eza -al";
      tree = "eza -T";
    };
  };
}
