_: self: super: let
  inherit (self.filesystem) listFilesRecursive;
  inherit (self) filter hasSuffix;
in {
  collectNix = path: path |> listFilesRecursive |> filter (hasSuffix ".nix");
}
