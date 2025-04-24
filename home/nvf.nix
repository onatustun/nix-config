{
  programs.nvf = {
    enable = true;

    settings.vim = {
      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      binds.whichKey.enable = true;
      git.enable = true;
      lsp.formatOnSave = true;
      mini.statusline.enable = true;
      spellcheck.enable = true;
      telescope.enable = true;
      viAlias = true;
      vimAlias = true;

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        css.enable = true;
        html.enable = true;
        nix.enable = true;
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
	      name = "base16";
	    };

      treesitter = {
        enable = true;
          
        context = {
          enable = true;
          setupOpts.separator = null;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
      };

      visuals = {
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };
  };
}
