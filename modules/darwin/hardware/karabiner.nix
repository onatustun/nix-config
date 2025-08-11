{username, ...}: {
  home-manager.users.${username} = {
    xdg.configFile."karabiner/karabiner.json".text = builtins.toJSON {
      global = {
        check_for_updates_on_startup = true;
        show_in_menu_bar = true;
        show_profile_name_in_menu_bar = false;
      };
      profiles = [
        {
          name = "Linux/Windows Style";
          selected = true;
          complex_modifications = {
            rules = [
              {
                description = "Linux/Windows modifier keys";
                manipulators = [
                  {
                    type = "basic";
                    from.key_code = "left_command";
                    to = [{key_code = "left_control";}];
                  }
                  {
                    type = "basic";
                    from.key_code = "right_command";
                    to = [{key_code = "right_control";}];
                  }
                  {
                    type = "basic";
                    from.key_code = "left_control";
                    to = [{key_code = "left_command";}];
                  }
                  {
                    type = "basic";
                    from.key_code = "right_control";
                    to = [{key_code = "right_command";}];
                  }
                ];
              }
            ];
          };
          devices = [];
          fn_function_keys = [];
          simple_modifications = [];
          virtual_hid_keyboard = {
            country_code = 0;
            indicate_sticky_modifier_keys_state = true;
            mouse_key_xy_scale = 100;
          };
        }
      ];
    };
  };
}
