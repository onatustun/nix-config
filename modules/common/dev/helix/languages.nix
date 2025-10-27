{
  pkgs,
  isDarwin,
  lib,
  inputs',
  ...
}: let
  inherit (lib) getExe getExe';
in {
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

          {
            name = "nu";

            indent = {
              tab-width = 2;
              unit = "  ";
            };
          }
        ];

        language-server = {
          uwu-colors.command = "${getExe' inputs'.uwu-colors.packages.default "uwu_colors"}";

          nixd.command =
            if isDarwin
            then "${getExe pkgs.nixd}"
            else "${getExe inputs'.nixd.packages.default}";
        };
      };
    }
  ];
}
