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
        "typescript-language-server"
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
