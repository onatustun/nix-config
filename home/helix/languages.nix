{
  inputs,
  pkgs,
  ...
}: {
  language = [
    {
      name = "tsx";
      auto-format = true;
      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
      ];
    }

    {
      name = "html";
      auto-format = true;
      language-servers = [
        "tailwindcss-ls"
        "vscode-html-language-server"
        "vscode-css-language-server"
        "typescript-language-server"
        "uwu-colors"
      ];
    }

    {
      name = "css";
      auto-format = true;
      language-servers = [
        "tailwindcss-ls"
        "vscode-css-language-server"
        "uwu-colors"
      ];
    }

    {
      name = "typst";
      auto-format = true;
      language-servers = [
        "tinymist"
        "uwu-colors"
      ];
    }

    {
      name = "nix";
      auto-format = true;
      language-servers = [
        "nil"
        "uwu-colors"
      ];
    }
  ];

  language-server = {
    uwu-colors = {
      command = "${inputs.uwu-colors.packages.${pkgs.system}.default}/bin/uwu_colors";
    };
  };
}
