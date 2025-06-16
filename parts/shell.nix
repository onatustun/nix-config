{
  perSystem = { 
    pkgs, 
    ... 
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        home-manager
        nh
        nil
        nix
        vim
      ];
    };
  };
}
