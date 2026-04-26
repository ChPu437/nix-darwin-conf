{ pkgs, ... }: {
  xdg.configFile."karabiner/karabiner.json".text = builtins.toJSON {
    global = {
       check_for_updates_on_startup = true;
       show_in_menu_bar = false;
       show_profile_name_in_menu_bar = false;
    };
    profiles = [
      {
        name = "Default";
        virtual_hid_keyboard = { "keyboard_type_v2" = "ansi"; };
        complex_modifications = {
          rules = [
            {
              description = "Caps Lock -> Hyper Key (Cmd+Shift+Opt+Ctrl), if alone -> Escape";
              manipulators = [
                {
                  from = {
                    key_code = "caps_lock";
                    modifiers = { optional = [ "any" ]; };
                  };
                  to = [
                    {
                      key_code = "left_shift";
                      modifiers = [ "left_command" "left_control" "left_option" ];
                    }
                  ];
                  # 如果你只是按了一下 Caps Lock 就松开，它会变成 Escape，这对 Vim 非常有用
                  to_if_alone = [ { key_code = "escape"; } ];
                  type = "basic";
                }
              ];
            }
          ];
        };
      }
    ];
  };
}