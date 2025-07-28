{ config, pkgs, ...}: {
    programs.alacritty = {
        enable = true;
        settings.general.import = [ pkgs.alacritty-theme.catppuccin_latte ];
    };
}