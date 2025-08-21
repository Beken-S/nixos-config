{ config, pkgs, my-utils, wallpaper, ... }:
let
    palette = import ./palette.nix;
    color = palette.${config.catppuccin.flavor};
    accentColor = color.${config.catppuccin.accent};

    fonts = {
        names = [ "FiraCode Nerd Font" ];
        style = "Regular";
        size = 14.0;
    };

    transparentize = my-utils.transparentize 20;
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
            inherit fonts;
            colors = {
                focused = rec {
                    background = transparentize accentColor;
                    border = background;
                    childBorder = background;
                    indicator = background;
                    text = color.base;
                };
                unfocused = rec {
                    background = transparentize color.surface0;
                    border = background;
                    childBorder = background;
                    indicator = background;
                    text = color.text;
                };
                urgent = rec {
                    background = transparentize color.red;
                    border = background;
                    childBorder = background;
                    indicator = background;
                    text = color.base;
                };
            };
            gaps = {
                inner = 6;
            };
            window = {
                border = 3;
            };
            floating = {
                border = 3;
            };
            focus = {
                followMouse = false;
            };
            bars = [{
                inherit fonts;
                position = "top";
                colors = {
                    focusedWorkspace = {
                        border = transparentize color.mantle;
                        background = accentColor;
                        text = color.base;
                    };
                    activeWorkspace = {
                        border = transparentize color.mantle;
                        background = color.surface0;
                        text = color.text;
                    };
                    inactiveWorkspace = {
                        border = transparentize color.mantle;
                        background = transparentize color.mantle;
                        text = color.text;
                    };
                    urgentWorkspace = {
                        border = transparentize color.mantle;
                        background = color.red;
                        text = color.base;
                    };
                    bindingMode = {
                        border = transparentize color.mantle;
                        background = color.red;
                        text = color.base;
                    };
                    background = transparentize color.mantle;
                    separator = color.text;
                    statusline = color.text;
               };
               extraConfig = ''
                   workspace_min_width 34
                   status_edge_padding 6
               '';
            }];
            terminal = "alacritty";
            modifier = "Mod1";
            defaultWorkspace = "workspace number 1";
            input = {
                "*" = {
                    xkb_layout = "us,ru";
                    xkb_options = "grp:win_space_toggle,ctrl:nocaps";
                };
            };
            output = {
                "*" = {
                    bg = "${wallpaper} fill";
                };
            };
        };
    };
}

