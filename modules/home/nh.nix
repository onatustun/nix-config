{homeDir, ...}: {
  programs.nh = {
    enable = true;
    flake = "${homeDir}/nix";
  };
}
