{
  lib,
  inputs,
  ...
}: let
  inherit (lib) filesystem filter hasSuffix remove foldl';
  inherit (filesystem) listFilesRecursive;
in {
  flake.deploy.nodes =
    listFilesRecursive ./.
    |> filter (hasSuffix ".nix")
    |> remove ./default.nix
    |> foldl'
    (acc: path:
      acc
      // (import path {inherit inputs;})) {};
}
