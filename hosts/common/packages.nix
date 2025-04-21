{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    direnv
    git
  ];
}
