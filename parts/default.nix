{inputs, ...}: {
  debug = true;
  systems = import inputs.systems;

  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.flake-root.flakeModule
  ];
}
