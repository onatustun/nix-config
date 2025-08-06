_: self: _: {
  collectNix = let
    inherit (self) filesystem filter hasSuffix;
    inherit (filesystem) listFilesRecursive;
  in
    path:
      path
      |> listFilesRecursive
      |> filter (hasSuffix ".nix");
}
