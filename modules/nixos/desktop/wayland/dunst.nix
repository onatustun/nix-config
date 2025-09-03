{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: let
  inherit (lib) enabled;
  package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.dunst;
in {
  environment.systemPackages = [
    package
    pkgs.libnotify
  ];

  home-manager.sharedModules = [
    {
      services.dunst = enabled {
        inherit package;

        settings.global = {
          follow = "none";
          width = 300;
          origin = "bottom-right";
          offset = "(48, 48)";
          scale = 0;
          notification_limit = 5;
          corner_radius = 4;

          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;

          indicate_hidden = "yes";
          transparency = 16;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 0;
          frame_width = 2;
          frame_color = "${config.stylix.base16Scheme.base04}";

          sort = "yes";
          idle_threshold = 0;

          line_height = 0;
          markup = "full";
          format = "<b>%s</b>\\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = true;
          hide_duplicate_count = true;
          show_indicators = "no";

          mouse_left_click = "close_current";
          mouse_middle_click = "do_action, close_current";
          mouse_right_click = "close_all";
        };
      };
    }
  ];
}
