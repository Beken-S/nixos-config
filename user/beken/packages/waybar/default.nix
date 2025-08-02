{ config, pkgs, ... }: {
    catppuccin.waybar = {
        enable = true;
	    flavor = "frappe";
    };

    programs.waybar= {
        enable = true;
        style = ''
            * {
                font-family: FiraCode Nerd Font;
		        font-size: 16px;
	        }

            button {
                border: none;
                background: none;
                box-shadow: none;
                color: inherit;
            }

            button:hover {
                text-shadow: none;
                box-shadow: none;
                border: none;
                background: none;
            }

	        #waybar {
                background: @base;
                color: @text;
	        }

            #language,
            #pulseaudio,
            #battery,
            #network,
            #cpu,
            #memory,
            #custom-lock,
            #clock,
            #workspaces {
                background-color: @surface1;
            }


            #workspaces {
                margin: 8px;
                border-radius: 1rem;
            }

            #workspaces button {
                padding: 0.3rem 0.6rem;
                border-radius: 2rem;
            }

            #workspaces button.active {
                color: @sky;
            }

            #workspaces button:hover {
                background-color: @overlay0;
            }

            #clock {
                margin: 8px;
                padding: 0.3rem 1rem;
                border-radius: 1rem;
            }

            #language {
                margin: 8px;
                padding: 0.3rem 1rem;
                border-radius: 1rem;
            }

            #network {
                margin: 8px 0 8px 8px;
                padding: 0.3rem 0.6rem;
                border-radius: 1rem 0 0 1rem;
            }

            #pulseaudio {
                margin: 8px 0;
                padding: 0.3rem 0.6rem;
            }

            #cpu {
                margin: 8px 0;
                padding: 0.3rem 0.6rem;
            }

            #memory {
                margin: 8px 0;
                padding: 0.3rem 0.6rem;
            }

            #battery {
                margin: 8px 8px 8px 0;
                padding: 0.3rem 0.6rem;
                border-radius: 0 1rem 1rem 0;
            }

            #custom-lock {
                margin: 8px;
                padding: 0.3rem 0.6rem;
                border-radius: 2rem;
            }

            #custom-lock:hover {
                background-color: @overlay0;
            }
        '';
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                modules-left = [ "niri/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "niri/language" "network" "pulseaudio" "cpu" "memory" "battery" "custom/lock" ];

	            "niri/workspaces" = {
		            format = "{icon}";
                    format-icons = { default = " "; };
	                on-click = "activate";
	                sort-by-number = true;
	            };

                clock = {
                    format = "{:%d %B  %H:%M  }";
		            tooltip = false;
		        };

                "niri/language" = {
	                format-en = " en";
	                format-ru = " ru";
	            };

                network = {
                    interface = "wlp3s0";
                    format-wifi = "{icon} {signalStrength}%";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
                    format-disabled = "󰤮";
                    format-disconnected = " ";
                    format-ethernet = "󰈀 ";
                    tooltip = false;
                };

                pulseaudio = {
                    format = "{icon} {volume}%";
                     format-muted = "";
                    format-icons = {
                        default = [""  ""  " "];
                    };
                };

                cpu = {
                    format = " {usage}%";
                };

                memory = {
                    format = " {percentage}%";
                };

                battery = {
                    interval = 10;
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    format = "{icon} {capacity}%";
                    format-charging = "󰂄 {capacity}%";
                    format-plugged = "󰂄 {capacity}%";
                    format-icons = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
                };

                "custom/lock" = {
                    format = " ";
                    on-click = "";
                    tooltip = false;
                };
            };
        };
    };
}
