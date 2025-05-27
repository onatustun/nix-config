{
  programs = {
    git = {
      enable = true;
      userName = "onatustun";
      userEmail = "onat@ustun.uk";

      ignores = [
        ".direnv"
        ".envrc"
      ];

      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "~/nix";
      };
    };

    lazygit.enable = true;
  };
}
