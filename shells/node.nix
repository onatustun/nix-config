{ 
  pkgs, 
  ... 
}: pkgs.mkShell {
  buildInputs = with pkgs; [
    nodePackages.nodejs
    nodejs
    pnpm
  ];
}
