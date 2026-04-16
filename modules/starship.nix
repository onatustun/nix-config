{
  flake.modules.homeManager.starship.programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      fill.symbol = " ";
      format = "$directory$nix_shell$direnv$fill$git_branch$git_status$line_break$character";
      nix_shell.format = "via [$state nix-shell]($style)";
      command_timeout = 1000;
      scan_timeout = 50;

      direnv = {
        disabled = false;
        format = " [$symbol]($style) ";
      };

      directory = {
        truncation_symbol = "../";
        truncate_to_repo = false;
      };
    };
  };
}
