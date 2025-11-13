{
  flake.modules.homeManager.lazygit = {inputs', ...}: {
    home.packages = [inputs'.lazygit.packages.default];
  };
}
