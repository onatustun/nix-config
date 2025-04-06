{
  programs.nvf = {
    enable = true;

    settings.vim = {
      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        css.enable = true;
        html.enable = true;
        markdown.enable = true;
        nix.enable = true;
        rust.enable = true;
        tailwind.enable = true;
        ts.enable = true;
      };

      options = {
        shiftwidth = 2;
        tabstop = 2;

        backup = false;
        writebackup = false;
      };

      theme = {
	      enable = true;
	      name = "gruvbox";
        style = "dark";
	    };

      treesitter = {
        enable = true;
          
        context = {
          enable = true;
          setupOpts.separator = null;
        };
      };

      ui = {
        noice.enable = true;
        borders.enable = true;
      };

      visuals = {
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };

      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      dashboard.alpha.enable = true;
      filetree.neo-tree.enable = true;
      git.enable = true;
      lsp.formatOnSave = true;
      spellcheck.enable = true;
      statusline.lualine.enable = true;
      telescope.enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
