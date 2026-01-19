{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nautilus
  ];

  services.swww.enable = true;

  programs.niri = {
    settings = {
      hotkey-overlay.skip-at-startup = true;
      clipboard.disable-primary = true;
      prefer-no-csd = true;

      spawn-at-startup = [
        { command = [ "waybar" ]; }
        {
          command = [
            "swww"
            "img"
            "${config.stylix.image}"
          ];
        }
      ];

      input = {
        mod-key = "Super";

        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:win_space_toggle,ctrl:nocaps,shift:both_capslock";
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          accel-speed = 0.4;
        };
      };

      cursor.hide-after-inactive-ms = 5000;

      layout = with config.lib.stylix.colors.withHashtag; {
        gaps = 3;
        background-color = "transparent";
        focus-ring.enable = false;
        always-center-single-column = true;

        border = {
          enable = true;
          width = 2;
          active.color = base0D;
          inactive.color = "transparent";
          urgent.color = base08;
        };

        tab-indicator = {
          gap = 3;
          gaps-between-tabs = 10;
          width = 6;
          place-within-column = true;
          corner-radius = 3;
          length.total-proportion = 0.1;
          inactive.color = base02;
        };

        default-column-width.proportion = 1.0 / 2.0;

        preset-column-widths = [
          { proportion = 1.0 / 2.0; }
          { proportion = 3.0 / 4.0; }
          { proportion = 1.0; }
        ];

        preset-window-heights = [
          { proportion = 1.0 / 4.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 3.0 / 4.0; }
          { proportion = 1.0; }
        ];
      };

      window-rules = [
        {
          clip-to-geometry = true;

          geometry-corner-radius =
            let
              radius = 6.0;
            in
            {
              top-left = radius;
              top-right = radius;
              bottom-right = radius;
              bottom-left = radius;
            };
        }
        {
          matches = [ { is-floating = true; } ];
          default-column-width.proportion = 3.0 / 4.0;
          default-window-height.proportion = 3.0 / 4.0;
        }
      ];

      layer-rules = [
        {
          matches = [ { namespace = "^swww-daemon$"; } ];
          place-within-backdrop = true;
        }
        {
          matches = [ { namespace = "^notifications$"; } ];
          block-out-from = "screencast";
        }

      ];

      overview = {
        workspace-shadow.enable = false;
        zoom = 0.9;
      };

      screenshot-path = "${config.xdg.userDirs.pictures}/screenshots/%Y-%m-%d %H-%M-%S.png";

      binds = {
        "Mod+Ctrl+Slash".action.show-hotkey-overlay = [ ];

        "Mod+Return".action.spawn = "alacritty";
        "Mod+P".action.spawn = "fuzzel";

        "Mod+O" = {
          action.toggle-overview = [ ];
          repeat = false;
        };

        "Mod+Q" = {
          action.close-window = [ ];
          repeat = false;
        };

        "Mod+K".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+H".action.focus-column-left = [ ];
        "Mod+Home".action.focus-column-first = [ ];
        "Mod+End".action.focus-column-last = [ ];
        "Mod+Ctrl+WheelScrollUp" = {
          action.focus-column-left = [ ];
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          action.focus-column-right = [ ];
          cooldown-ms = 150;
        };

        "Mod+Shift+K".action.move-window-up = [ ];
        "Mod+Shift+L".action.move-column-right = [ ];
        "Mod+Shift+J".action.move-window-down = [ ];
        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+Home".action.move-column-to-first = [ ];
        "Mod+Shift+End".action.move-column-to-last = [ ];

        "Mod+Shift+1".action.move-column-to-index = 1;
        "Mod+Shift+2".action.move-column-to-index = 2;
        "Mod+Shift+3".action.move-column-to-index = 3;
        "Mod+Shift+4".action.move-column-to-index = 4;
        "Mod+Shift+5".action.move-column-to-index = 5;
        "Mod+Shift+6".action.move-column-to-index = 6;
        "Mod+Shift+7".action.move-column-to-index = 7;
        "Mod+Shift+8".action.move-column-to-index = 8;
        "Mod+Shift+9".action.move-column-to-index = 9;

        "Mod+Ctrl+Shift+L".action.move-column-to-monitor-right = [ ];
        "Mod+Ctrl+Shift+H".action.move-column-to-monitor-left = [ ];

        "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
        "Mod+BracketRight".action.consume-or-expel-window-right = [ ];
        "Mod+Comma".action.consume-window-into-column = [ ];
        "Mod+Period".action.expel-window-from-column = [ ];

        "Mod+R".action.switch-preset-column-width = [ ];
        "Mod+Shift+R".action.switch-preset-window-height = [ ];
        "Mod+Ctrl+R".action.reset-window-height = [ ];
        "Mod+F".action.maximize-column = [ ];
        "Mod+Shift+F".action.fullscreen-window = [ ];

        "Mod+Ctrl+F".action.expand-column-to-available-width = [ ];

        "Mod+C".action.center-column = [ ];
        "Mod+Ctrl+C".action.center-visible-columns = [ ];

        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";

        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";

        "Mod+V".action.toggle-window-floating = [ ];
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];

        "Mod+W".action.toggle-column-tabbed-display = [ ];

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Tab".action.focus-workspace-previous = [ ];

        "Mod+Ctrl+K".action.focus-workspace-up = [ ];
        "Mod+Ctrl+J".action.focus-workspace-down = [ ];
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = [ ];
          cooldown-ms = 150;
        };
        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = [ ];
          cooldown-ms = 150;
        };

        "Mod+Ctrl+Shift+K".action.move-workspace-up = [ ];
        "Mod+Ctrl+Shift+J".action.move-workspace-down = [ ];

        "Mod+Ctrl+L".action.focus-monitor-right = [ ];
        "Mod+Ctrl+H".action.focus-monitor-left = [ ];

        "Mod+Shift+S".action.screenshot = [ ];
        "Print".action.screenshot-screen = [ ];
        "Mod+Print".action.screenshot-window = [ ];

        "Mod+Escape" = {
          action.toggle-keyboard-shortcuts-inhibit = [ ];
          allow-inhibiting = false;
        };

        "Ctrl+Alt+Delete".action.quit = [ ];

        "Mod+Shift+P".action.power-off-monitors = [ ];

        "XF86AudioRaiseVolume" = {
          action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.01+"
          ];
          allow-when-locked = true;
        };
        "XF86AudioLowerVolume" = {
          action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.01-"
          ];
          allow-when-locked = true;
        };
        "XF86AudioMute" = {
          action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
          allow-when-locked = true;
        };
        "XF86AudioMicMute" = {
          action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];
          allow-when-locked = true;
        };
      };
    };
  };
}
