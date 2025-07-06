{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    p7zip
    rar
    unzip
    zip
  ];
}
