inputs:
inputs.flake-parts.lib.mkFlake {inherit inputs;} {
  systems = import inputs.systems;

  imports = let
    inherit (inputs.nixpkgs.lib.filesystem) listFilesRecursive;
    inherit (inputs.nixpkgs.lib) filter hasSuffix;
  in
    [
      ./dev-shell.nix
      ./hosts
      ./pre-commit-hooks.nix
      ./templates
    ]
    ++ (listFilesRecursive ./lib |> filter (hasSuffix ".nix"));
}
