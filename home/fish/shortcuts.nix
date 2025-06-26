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
      rmf = "rm -frv";
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
      clt = "clear && eza -T";
      grep = "rg";
      ls = "eza -al";
      man = "batman";
      nsf = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ping = "prettyping";
      sl = "eza -al";
      tree = "eza -T";
    };

    functions = {
      cpp = "cp -prv $argv ..";
      flakeinit = "nix flake init -t '/home/onat/nix#'\$argv";
      mvp = "mv -v $argv ..";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#$argv";
      shot = "grim -g \"$(slurp)\" /home/onat/Pictures/$argv.png";
    };
  };
}
