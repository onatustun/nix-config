{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) concatLists enabled;
in {
  environment.systemPackages = concatLists [
    (with pkgs; [
      csharp-ls
      csharprepl
      omnisharp-roslyn
      roslyn
      unityhub
    ])

    (with pkgs; [
      gradle
      jdk
      jdt-language-server
      maven
    ])
  ];

  programs.vscode = enabled {
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      ms-dotnettools.csharp
      vscjava.vscode-java-pack
    ];
  };
}
