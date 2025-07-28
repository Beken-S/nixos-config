{ config, pkgs, ...}: {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
        croscore
        nerd-fonts.fira-code
    ];
}