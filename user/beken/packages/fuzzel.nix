{ config, pkgs, ... }: {
    catppuccin.fuzzel.enable = true;

    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "FiraCode Nerd Font Mono:size=14";
                dpi-aware = "no";
                image-size-ratio=0.2;
            };
            border = {
                width = 4;
                radius = 0;
            };
        };
    };
}

