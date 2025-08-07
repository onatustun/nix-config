{lib, ...}: let
  inherit (builtins) readDir;
  inherit (lib) mapAttrs;
in {
  flake.templates =
    readDir ./.
    |> mapAttrs (name: _: {
      path = ./${name};
      description = name;
    });
}
