{ 
  pkgs, 
  ... 
}: pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    home-manager
    vim
  ];
}
