{
  lib,
  inputs,
  ...
}: let
  inherit (lib) collectNix remove foldl';
in {
  flake.deploy.nodes =
    collectNix ./.
    |> remove ./default.nix
    |> foldl'
    (acc: path:
      acc // (import path {inherit inputs;})) {};
}
