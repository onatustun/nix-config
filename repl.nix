{system ? builtins.currentSystem}: let
  self = builtins.getFlake (toString ./.);
  inherit (self.inputs.nixpkgs) lib;

  outputs = [
    "apps"
    "packages"
    "legacyPackages"
    "checks"
    "devShells"
  ];

  mergeOutput = value: let
    systemValue = value.${system} or null;
  in
    if systemValue != null
    then lib.recursiveUpdate value systemValue
    else value;

  mergeFlakeOutputs = flake:
    flake
    // lib.genAttrs
    (lib.filter (output:
      lib.hasAttr output flake)
    outputs)
    (output:
      mergeOutput flake.${output});

  mergedOutputs = lib.listToAttrs (lib.concatMap (output: let
    value = self.${output};
    merged = mergeOutput value;
  in
    if merged != value
    then [
      {
        name = output;
        value = merged;
      }
    ]
    else [])
  outputs);

  inputs =
    lib.mapAttrs (lib.const mergeFlakeOutputs)
    self.inputs;

  pkgs = import self.inputs.nixpkgs {
    inherit system;
    overlays = lib.attrValues self.overlays;
  };
in
  self
  // mergedOutputs
  // {inherit lib self system inputs pkgs;}
