inputs:
inputs.flake-parts.lib.mkFlake {inherit inputs;} {
  systems = import inputs.systems;

  imports = let
    inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;
    inherit (inputs.nixpkgs.lib) filter hasSuffix;
  in
    filter (file: !(builtins.elem file [./flake.nix ./shell.nix])) (filter (hasSuffix ".nix") (listFilesRecursive ./.));
}
