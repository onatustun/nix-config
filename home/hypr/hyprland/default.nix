{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    dunst
    networkmanagerapplet
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      hyprscroller
    ];

    systemd = {
      enable = true;

      variables = [
        "--all"
      ];
    };

    settings = 
      (import ./binds.nix) //
      (import ./env.nix) //
      (import ./exec.nix) //
      (import ./input.nix) //
      (import ./misc.nix) //
      (import ./ricing.nix) //
      (import ./rules.nix) {
    };  
  };
}
