{ config, pkgs, ...}: {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
        liberation_ttf
        nerd-fonts.fira-code
    ];
}