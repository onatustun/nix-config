{
  perSystem = {
    pkgs,
    inputs',
    config,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "c/c++";
      formatter = inputs'.alejandra.packages.default;
      shellHook = config.pre-commit.installationScript;

      packages = with pkgs;
        [
          bear
          clang_17
          cmake
          cppcheck
          gnumake
          lld_17
          ninja
        ]
        ++ (with llvmPackages_17; [
          clang-tools
          libcxx
        ])
        ++ (with inputs'; [
          alejandra.packages.default
          deadnix.packages.default
        ]);
    };
  };
}
