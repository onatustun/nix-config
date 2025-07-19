{lib, ...}: let
  inherit (lib) mapAttrs;
  inherit (builtins) readDir;
in {
  templates =
    readDir ./.
    |> mapAttrs (name: _type: {
      path = ./${name};
      description = name;
    });
}
