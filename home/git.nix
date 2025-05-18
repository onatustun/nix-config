{
  programs = {
    git = {
      enable = true;
      userName = "onatustun";
      userEmail = "onatustun@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "~/nix";
      };
    };

    lazygit.enable = true;
  };
}
