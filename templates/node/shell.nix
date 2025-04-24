{ 
  pkgs, 
  ... 
}: pkgs.mkShell {
  buildInputs = with pkgs; [
    corepack
    nodejs
  ];
}
