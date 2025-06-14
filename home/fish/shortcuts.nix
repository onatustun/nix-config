{
  programs.fish = {
    shellAbbrs = {
      c = "clear";
      cp = "cp -prv";
      ff = "fastfetch";
      lg = "lazygit";
      md = "mkdir -pv";
      mkdir = "mkdir -pv";
      mv = "mv -v";
      rmf = "rm -frv";
      rm = "rm -rv";
      s = "sudo -E";
      "sx." = "sudo -E hx .";
      sx = "sudo -E hx";
      syz = "sudo -E yazi";
      "x." = "hx .";
      x = "hx";
      yz = "yazi";
    };

    shellAliases = {
      cat = "prettybat";
      grep = "rg";
      h = "cd ~";
      ls = "eza -al";
      man = "batman";
      q = "exit";
      sl = "eza -al";
      tree = "eza -T";
    };
  };
}
