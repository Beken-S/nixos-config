{ config, pkgs, ...}: {
    programs.allacritty = {
        enable = true;
        settings.general.import = [ pkgs.alacritty-theme.catppuccin_latte ];
    };
}