{
  perSystem = { 
    pkgs, 
    ... 
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        home-manager
        nil
        nix
        vim
      ];
    };
  };
}
