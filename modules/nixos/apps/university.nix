{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) concatLists;
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

  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      ms-dotnettools.csdevkit
      ms-dotnettools.csharp
      visualstudiotoolsforunity.vstuc
      vscjava.vscode-java-pack
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-6.0.36"
    "dotnet-sdk-6.0.428"
    "libxml2-2.13.8"
  ];
}
