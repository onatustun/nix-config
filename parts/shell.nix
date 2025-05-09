{
  perSystem = { 
    pkgs, 
    ... 
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        home-manager
        nix
        vim
      ];
    };
  };
}
