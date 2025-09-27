{
  services.aerospace = {
    enable = true;

    settings = {
      after-login-command = [];
      after-startup-command = [];
      start-at-login = false;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      automatically-unhide-macos-hidden-apps = false;
      key-mapping.preset = "qwerty";

      gaps = {
        inner = {
          horizontal = 6;
          vertical = 6;
        };

        outer = {
          left = 6;
          bottom = 6;
          top = 6;
          right = 6;
        };
      };

      workspace-to-monitor-force-assignment = {
        "1" = [
          "built-in"
          "main"
        ];

        "2" = [
          "built-in"
          "main"
        ];

        "3" = ["main"];
        "4" = ["main"];
        "5" = ["main"];
        "6" = ["main"];
        "7" = ["main"];
        "8" = ["main"];

        "9" = [
          "secondary"
          "main"
        ];

        "0" = [
          "secondary"
          "main"
        ];
      };

      mode.main.binding = {
        alt-s = "layout tiles horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-left = "focus left";
        alt-down = "focus down";
        alt-up = "focus up";
        alt-right = "focus right";

        alt-ctrl-h = "move left";
        alt-ctrl-j = "move down";
        alt-ctrl-k = "move up";
        alt-ctrl-l = "move right";
        alt-ctrl-left = "move left";
        alt-ctrl-down = "move down";
        alt-ctrl-up = "move up";
        alt-ctrl-right = "move right";

        alt-ctrl-shift-h = "resize width -50";
        alt-ctrl-shift-j = "resize height +50";
        alt-ctrl-shift-k = "resize height -50";
        alt-ctrl-shift-l = "resize width +50";
        alt-ctrl-shift-left = "resize width -50";
        alt-ctrl-shift-down = "resize height +50";
        alt-ctrl-shift-up = "resize height -50";
        alt-ctrl-shift-right = "resize width +50";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 0";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-0 = "move-node-to-workspace 0";

        alt-tab = "workspace-back-and-forth";

        cmd-h = [];
        cmd-alt-h = [];
      };
    };
  };
}
