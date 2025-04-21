{ 
  pkgs, 
  ... 
}: pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    home-manager
    nixd
    nixfmt-rfc-style
    vim
  ];

  shellHook = ''
    echo "nixos dev shell"
  '';
}
