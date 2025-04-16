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

    settings = let
      binds = import ./binds.nix;
      env = import ./env.nix;
      exec = import ./exec.nix;
      misc = import ./misc.nix;
      ricing = import ./ricing.nix;
      rules = import ./rules.nix;
    in binds 
    // env 
    // exec 
    // misc 
    // ricing 
    // rules {      
      cursor.no_hardware_cursors = "true";
      input.kb_layout = "us";
    };
  };
}
