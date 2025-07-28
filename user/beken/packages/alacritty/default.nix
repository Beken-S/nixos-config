{ config, pkgs, ...}: {
    programs.alacritty = {
        enable = true;
        settings = {
            general.import = [ pkgs.alacritty-theme.catppuccin_latte ];

            env.TERM = "xterm-256color";

            window = {
                padding.x = 8;
                padding.y = 8;
            };

            font = {
                normal.family = "FiraCode Nerd Font";
                size = 14.0;
            };
        };
    };
}