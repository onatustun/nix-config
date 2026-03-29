{
  perSystem.make-shells.default.shellHook = ''
    export RULES="$(git rev-parse --show-toplevel)/secrets.nix"
  '';
}
