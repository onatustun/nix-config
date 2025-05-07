{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;

    settings = {
      add_newline = false;
      format = "$directory$nix_shell$fill$git_branch$git_status$line_break$character";
      hostname.ssh_only = false;
      nix_shell.format = "via [$state( \($name\))]($style)";
      username.show_always = true;

      directory = {
        truncation_symbol	= "../";
        truncate_to_repo	= false;
      };
    };
  };
}
