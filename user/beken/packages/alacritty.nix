{ config, pkgs, ...}: {
    programs.allacritty = {
        enable = true;
        settings.general.import = [ pkgs.alacritty-theme.cyber_punk_neon ];
    };
}