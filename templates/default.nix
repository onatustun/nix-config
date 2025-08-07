{lib, ...}: {
  flake.templates = let
    inherit (builtins) readDir;
    inherit (lib) mapAttrs;
  in
    readDir ./.
    |> mapAttrs (name: _: {
      path = ./${name};
      description = name;
    });
}
