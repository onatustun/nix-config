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
          cmake
          cppcheck
          gdb
          gnumake
          lld_17
          lldb_17
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
