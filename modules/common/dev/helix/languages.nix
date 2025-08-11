{
  inputs,
  pkgs,
  isDarwin,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.helix.languages = {
        language = [
          {
            name = "tsx";
            auto-format = true;

            formatter = {
              command = "prettier";

              args = [
                "--parser"
                "typescript"
              ];
            };

            language-servers = [
              "tailwindcss-ls"
              "typescript-language-server"
              "uwu-colors"
            ];
          }

          {
            name = "jsx";
            auto-format = true;

            formatter = {
              command = "prettier";

              args = [
                "--parser"
                "typescript"
              ];
            };

            language-servers = [
              "tailwindcss-ls"
              "typescript-language-server"
              "uwu-colors"
            ];
          }

          {
            name = "html";
            auto-format = true;

            formatter = {
              command = "prettier";

              args = [
                "--parser"
                "html"
              ];
            };

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

            formatter = {
              command = "prettier";

              args = [
                "--parser"
                "css"
              ];
            };

            language-servers = [
              "tailwindcss-ls"
              "vscode-css-language-server"
              "uwu-colors"
            ];
          }

          {
            name = "typst";
            auto-format = true;
            formatter.command = "typstyle";

            language-servers = [
              "tinymist"
              "uwu-colors"
            ];
          }

          {
            name = "nix";
            auto-format = true;
            formatter.command = "alejandra";

            language-servers = [
              "nixd"
              "uwu-colors"
            ];
          }
        ];

        language-server = {
          uwu-colors.command = "${inputs.uwu-colors.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/uwu_colors";

          nixd.command =
            if isDarwin
            then "${pkgs.nixd}/bin/nixd"
            else "${inputs.nixd.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nixd";
        };
      };
    }
  ];
}
