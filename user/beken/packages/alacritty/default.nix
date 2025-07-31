{ config, pkgs, ...}: {
    catppuccin.alacritty = {
        enable = true;
        flavor = "latte";
        accent = "sky";
    }

    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = "xterm-256color";

            window = {
                padding.x = 8;
                padding.y = 8;
		decorations = "None";
            };

            font = {
                normal.family = "FiraCode Nerd Font";
                size = 14.0;
            };
        };
    };
}
