_: self: _: {
  collectNix = let
    inherit (self.filesystem) listFilesRecursive;
    inherit (self) filter hasSuffix;
  in
    path:
      path
      |> listFilesRecursive
      |> filter (hasSuffix ".nix");
}
