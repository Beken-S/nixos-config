{ config, pkgs, ... }: {
    stylix.targets.waybar.enable = false;

    programs.waybar= let
        color = config.lib.stylix.colors.withHashtag;
    in {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";

                modules-left = [ "niri/workspaces" ];
                modules-center = [
                    "clock"
                    "custom/divider"
                    "custom/swaync"
                ];
                modules-right = [
                    "niri/language"
                    "custom/divider"
                    "battery"
                    "network"
                    "bluetooth"
                    "custom/divider"
                    "wireplumber#sink"
                    "wireplumber#source"
                    "custom/divider"
                    "group/group-power"
                ];

                "niri/workspaces" = {
                    format = "{index}";
                    sort-by-number = true;
                };

                clock = {
                    interval = 1;
                    format = "{:%d %b %H:%M:%S}";
                    tooltip-format = "<tt><small>{calendar}</small></tt>";
                    calendar = {
                        mode= "month";
                        mode-mon-col = 3;
                        on-scroll = 1;
                        on-click-right = "mode";
                        format = {
                            months = "<span color='${color.base05}'><i>{}</i></span>";
                            weekdays = "<span color='${color.base04}'><i>{}</i></span>";
                            days = "<span color='${color.base05}'>{}</span>";
                            today = "<span color='${color.base08}'><b>{}</b></span>";
                        };
                    };
                    actions = {
                        on-click-right = "mode";
                        on-click-forward = "tz_up";
                        on-click-backward = "tz_down";
                        on-scroll-up = "shift_down";
                        on-scroll-down = "shift_up";
                    };
                };

                "custom/swaync" = {
                    tooltip = false;
                    format = "{icon}";
                    format-icons = {
                        notification = "<span foreground='${color.base08}'><sup></sup></span>";
                        none = "";
                        dnd-notification = "<span foreground='${color.base08}'><sup></sup></span>";
                        dnd-none = " ";
                        inhibited-notification = "<span foreground='${color.base08}'><sup></sup></span>";
                        inhibited-none = " ";
                        dnd-inhibited-notification = " <span foreground='${color.base08}'><sup></sup></span>";
                        dnd-inhibited-none = " ";
                    };
                    return-type = "json";
                    exec-if = "which swaync-client";
                    exec = "swaync-client -swb";
                    on-click = "swaync-client -t -sw";
                    on-click-right = "swaync-client -d -sw";
                    escape = true;
                };

                "niri/language" = {
                    format-en = "  en";
                    format-ru = "  ru";
                };

                network = {
                    format-wifi = "{icon}";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
                    format-disconnected = "";
                    format-ethernet = "󰈀";
                    tooltip-format = "{ifname}";
                    tooltip-format-wifi = "{essid}\t{signalStrength}%";
                };

                bluetooth = {
                    format = "";
                    format-on = "󰂯";
                    format-off = "󰂲";
                    format-connected = "󰂱";
                    tooltip-format = "";
                    tooltip-format-connected = "{device_enumerate}";
                    tooltip-format-enumerate-connected = "{device_alias}";
                    tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
                };

                "wireplumber#sink" = {
                    format = "{icon} {volume}%";
                    format-muted = "";
                    format-icons = [""  ""  " "];
                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                };

                "wireplumber#source" = {
                    node-type = "Audio/Source";
                    format = "󰍬 {volume}%";
                    format-muted = "󰍭";
                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                };

                battery = {
                    interval = 5;
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    format = "{icon}";
                    format-charging = "{icon}󱐋";
                    format-icons = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
                    tooltip-format = "{capacity}%";
                };

                "group/group-power" = {
                    orientation = "inherit";
                    drawer = {
                        transition-duration = 500;
                        children-class = "not-power";
                        transition-left-to-right = false;
                    };
                    modules = [
                        "custom/power"
                        "custom/quit"
                        "custom/lock"
                        "custom/suspend"
                        "custom/reboot"
                    ];
                };

                "custom/quit" = {
                    format = "󰗼";
                    on-click = "niri msg action quit -s";
                    tooltip-format = "Quit";
                };

                "custom/lock" = {
                    format = "󰍁";
                    on-click = "swaylock";
                    tooltip-format = "Lock";
                };

                "custom/reboot" = {
                    format = "󰜉";
                    on-click = "reboot";
                    tooltip-format = "Reboot";
                };

                "custom/power" = {
                    format ="";
                    on-click = "poweroff";
                    tooltip-format = "Poweroff";
                };

                "custom/suspend" = {
                    format = "󰤄";
                    on-click = "systemctl suspend";
                    tooltip-format = "Suspend";
                };

                "custom/divider" = {
                    format = "|";
                    tooltip = false;
                };
            };
        };

        style = ''
            * {
                font-family: Ubuntu Nerd Font;
                font-size: ${toString config.stylix.fonts.sizes.desktop}pt;
                font-weight: normal;
            }

            .test {
                color: ${color.base0D};
            }

            window#waybar {
                background: transparent;
            }

            window#waybar > box {
                border-bottom: 1px solid ${color.base03};
                background: ${color.base00};
                color: ${color.base05};
            }

            button {
                border-radius: 0;
                padding: 0.1em 0.4em;
            }

            button:hover {
                background: ${color.base02};
            }

            button:active {
                background: ${color.base03};
            }

            tooltip {
                border: none;
                border-radius: 6px;
                border: 2px solid ${color.base0D};
                background: ${color.base00};
            }

            tooltip label {
                padding: 0.1em 0.6em;
                color: ${color.base05};
                text-shadow: none;
            }

            #workspaces button.active {
                background: ${color.base02};
            }

            #custom-divider {
                color: ${color.base03};
            }

            #clock,
            #language,
            #battery,
            #network,
            #bluetooth,
            #wireplumber,
            #custom-swaync,
            #custom-quit,
            #custom-lock,
            #custom-reboot,
            #custom-power,
            #custom-suspend {
                padding: 0.1em 0.6em;
                min-width: 1em;
            }

            #clock:hover,
            #wireplumber:hover,
            #custom-swaync:hover,
            #custom-quit:hover,
            #custom-lock:hover,
            #custom-reboot:hover,
            #custom-power:hover,
            #custom-suspend:hover {
                background-color: ${color.base02};
            }
        '';
    };
}

