{
  perSystem = {pkgs, ...}: {
    formatter = pkgs.alejandra;

    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
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
