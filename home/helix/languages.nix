{
  pkgs,
  lib,
  inputs,
  ...
}: {
  language = [
    {
      name = "typescript";
      auto-format = true;

      language-servers = [
        "dprint"
        "typescript-language-server"
        "uwu-colors"
      ];
    }

    {
      name = "typst";
      auto-format = true;

      language-servers = [
        "tinymist"
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
    dprint = {
      command = lib.getExe pkgs.dprint;

      args = [
        "lsp"
      ];
    };

    tinymist = {
      command = lib.getExe pkgs.tinymist;

      config = {
        exportPdf = "onType";
        outputPath = "$root/target/$dir/$name";
        formatterMode = "typstyle";
        formatterPrintWidth = 80;
      };
    };
  
    typescript-language-server = {
      command = lib.getExe pkgs.nodePackages.typescript-language-server;

      args = [
        "--stdio"
      ];

      config = {
        typescript-language-server.source = {
          addMissingImports.ts = true;
          fixAll.ts = true;
          organizeImports.ts = true;
          removeUnusedImports.ts = true;
          sortImports.ts = true;
        };
      };
    };
  
    nil = {
      command = lib.getExe pkgs.nil;
    };

    uwu-colors = {
      command = "${inputs.uwu-colors.packages.${pkgs.system}.default}/bin/uwu_colors";
    };
  };
}
