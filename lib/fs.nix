super: let
  inherit (super) filesystem filter hasSuffix;
  inherit (filesystem) listFilesRecursive;
in {
  collectNix = path:
    listFilesRecursive path
    |> filter (hasSuffix ".nix");
}
