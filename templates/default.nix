{inputs, ...}: let
  inherit (inputs.nixpkgs.lib) mapAttrs;
  inherit (builtins) readDir;
in {
  flake.templates =
    readDir ./.
    |> mapAttrs (name: _type: {
      path = ./${name};
      description = name;
    });
}
