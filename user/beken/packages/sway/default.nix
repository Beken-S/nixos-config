{ config, pkgs, catppuccin-wallpaper, ... }:
let
    palette = import ./palette.nix;
    color = palette.${config.catppuccin.flavor};
    accentColor = color.${config.catppuccin.accent};
in
{
    home = {
        packages = with pkgs; [
            wl-clipboard
        ];
        sessionVariables.MOZ_ENABLE_WAYLAND = "1";
    };

    services.mako.enable = true;
    catppuccin.mako.enable= true;

    wayland.windowManager.sway = {
        enable = true;
        checkConfig = false;
        config = {
            fonts = {
                names = [ "FiraCode Nerd Font" ];
                style = "Regular";
                size = 10.0;
            }; 
            colors = {
                focused = {
                    border = accentColor;
                    background = accentColor;
                    text = color.base;
                    indicator = accentColor;
                    childBorder = accentColor;
                };
                unfocused = {
                    border = color.overlay0;
                    background = color.overlay0;
                    text = color.subtext0;
                    indicator = color.overlay0;
                    childBorder = color.overlay0;
                };
                urgent = {
                    border = color.red;
                    background = color.red;
                    text = color.base;
                    indicator = color.red;
                    childBorder = color.red;
                };
            };
            gaps = {
                outer = 6;
                inner = 6;
            };
            window = {
                border = 3;
                #titlebar = false;
            };
            floating = {
                border = 3;
                #titlebar = false;
            };
            focus = {
                followMouse = false;
            };
            terminal = "alacritty";
            modifier = "Mod1";
            input = {
                "*" = {
                    xkb_layout = "us,ru";
                    xkb_options = "grp:win_space_toggle,ctrl:nocaps";
                };
            };
            output = {
                "*" = {
                    bg = "${catppuccin-wallpaper} fill";
                };
            };
        };
    };
}

