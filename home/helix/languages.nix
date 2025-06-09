{
  pkgs,
  inputs,
  ...
}: {
  language = [
    {
      name = "typescript";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
        "vscode-css-language-server"
        "vscode-html-language-server"
      ];
    }

    {
      name = "tsx";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
        "vscode-css-language-server"
        "vscode-html-language-server"
      ];
    }

    {
      name = "javascript";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
        "vscode-css-language-server"
        "vscode-html-language-server"
      ];
    }

    {
      name = "jsx";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
        "vscode-css-language-server"
        "vscode-html-language-server"
      ];
    }

    {
      name = "html";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "typescript-language-server"
        "uwu-colors"
        "vscode-css-language-server"
        "vscode-html-language-server"
      ];
    }

    {
      name = "css";
      auto-format = true;

      language-servers = [
        "tailwindcss-ls"
        "uwu-colors"
        "vscode-css-language-server"
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
      auto-format = false;

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
