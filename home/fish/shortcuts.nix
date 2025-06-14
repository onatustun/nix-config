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
      rmf = "rm -frv";
      rm = "rm -rv";
      "sx." = "sudo -E hx .";
      sx = "sudo -E hx";
      syz = "sudo -E yazi";
      "x." = "hx .";
      x = "hx";
      s = "sudo -E";
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
      ping = "prettyping";
      q = "exit";
      sl = "eza -al";
      tree = "eza -T";
    };
  };
}
