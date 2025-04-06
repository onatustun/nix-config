self: let
  inherit (self) filesystem filter hasSuffix;
  inherit (filesystem) listFilesRecursive;
in {
  collectNix = path:
    path
    |> listFilesRecursive
    |> filter (hasSuffix ".nix");
}
