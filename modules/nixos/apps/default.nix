{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nicotine-plus
    obsidian
  ];
}
