{
  flake.modules = {
    nixos = {
      helix = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.helix'];
        home-manager.sharedModules = [self.modules.homeManager.helix];
      };

      helix' = {
        config,
        username,
        ...
      }: {
        nix.settings = {
          extra-substituters = ["https://helix.cachix.org"];
          extra-trusted-public-keys = ["helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="];
        };

        environment.sessionVariables = {inherit (config.home-manager.users.${username}.home.sessionVariables) EDITOR VISUAL;};
      };
    };

    homeManager.helix = {
      inputs',
      config,
      homeDir,
      pkgs,
      lib,
      ...
    }: let
      package =
        inputs'.helix.packages.default.overrideAttrs
        (prevAttrs: {
          cargoBuildFeatures =
            prevAttrs.cargoBuildFeatures or []
            ++ ["steel"];
        });

      smooth-scroll = pkgs.stdenvNoCC.mkDerivation {
        pname = "smooth-scroll";
        version = "0.1.0";

        src = pkgs.fetchFromGitHub {
          owner = "thomasschafer";
          repo = "smooth-scroll.hx";
          rev = "1ed8b088e465fb139389c36ad158ba4a2d9e1bbc";
          sha256 = "sha256-4lxGZrT4cEcg3jqae3uJGGGCSy4WeVZeJ0hIApMb7jY=";
        };

        postPatch = ''
          substituteInPlace smooth-scroll.scm \
            --replace-fail '(require "src/utils.scm")' \
                           '(require "smooth-scroll/src/utils.scm")'
        '';

        installPhase = ''
          mkdir -p $out/share/steel/cogs/smooth-scroll
          cp -r . $out/share/steel/cogs/smooth-scroll
        '';
      };
    in {
      xdg = {
        configFile = {
          "helix/helix.scm".source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/nix/modules/terminal/tui/helix/steel/helix.scm";
          "helix/init.scm".source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/nix/modules/terminal/tui/helix/steel/init.scm";
        };

        dataFile."steel/cogs/smooth-scroll" = {
          source = "${smooth-scroll}/share/steel/cogs/smooth-scroll";
          recursive = true;
        };
      };

      home = {
        packages = [
          inputs'.nixd.packages.default
          package
          pkgs.racket
          pkgs.steel
          pkgs.uwu-colors
        ];

        sessionVariables = {
          EDITOR = lib.meta.getExe' package "hx";
          VISUAL = config.home.sessionVariables.EDITOR;
        };
      };

      programs = {
        nushell.environmentVariables = {inherit (config.home.sessionVariables) EDITOR VISUAL;};

        helix = {
          enable = true;
          inherit package;

          settings = {
            editor = {
              default-yank-register = "+";
              line-number = "relative";
              idle-timeout = 0;
              bufferline = "multiple";
              end-of-line-diagnostics = "warning";
              lsp.display-inlay-hints = true;
              cursor-shape.insert = "bar";
              auto-save = false;
              inline-diagnostics.cursor-line = "warning";
              jump-label-alphabet = "jkl;hfdsagbceimnopqrtuvwxyz";

              statusline = {
                left = [
                  "mode"
                  "spinner"
                  "file-name"
                  "read-only-indicator"
                  "file-modification-indicator"
                ];

                right = [
                  "version-control"
                  "diagnostics"
                  "selections"
                  "position"
                  "total-line-numbers"
                ];

                mode = {
                  normal = "N";
                  insert = "I";
                  select = "S";
                };
              };

              whitespace = {
                render.tab = "all";
                characters.tab = "→";
              };

              indent-guides = {
                render = true;
                character = "▏";
                skip-levels = 1;
              };

              gutters = {
                layout = [
                  "diagnostics"
                  "spacer"
                  "line-numbers"
                  "spacer"
                  "diff"
                ];

                line-numbers.min-width = 1;
              };
            };

            keys = {
              normal = {
                C-d = ":half-page-down-smooth";
                C-u = ":half-page-up-smooth";

                x = "select_line_below";
                X = "select_line_above";

                G = {
                  j = "@vgj<esc>";
                  k = "@vgk<esc>";
                };

                g = {
                  j = "goto_last_line";
                  k = "goto_file_start";
                };

                space.B = ":sh git show -s --date=format-local:%%d/%%m/%%y --format=\"%%h (%%cn %%cd) %%s\" (git blame -L %{cursor_line},%{cursor_line} --porcelain %{buffer_name} | lines | first | split words | first)";
              };

              select = {
                x = "select_line_below";
                X = "select_line_above";

                g = {
                  j = "goto_last_line";
                  k = "goto_file_start";
                };
              };
            };
          };

          languages = {
            language = [
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
              uwu-colors.command = "${lib.meta.getExe' pkgs.uwu-colors "uwu_colors"}";
              nixd.command = "${lib.meta.getExe inputs'.nixd.packages.default}";
            };
          };

          ignores = [
            ".direnv/"
            "node_modules/"
            ".pre-commit-config.yaml"
            "result/"
            "target/"
          ];
        };
      };
    };
  };
}
