{ config, pkgs, ... }: {
    catppuccin.fuzzel = {
        enable = true;
        accent = "lavender";
        flavor = "latte";
    };

    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = "FiraCode Nerd Font Mono:size=14";
            };
            border = {
                width = 4;
                radius = 0;
            };
        };
    };
}

