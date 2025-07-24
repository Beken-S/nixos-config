{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        liberation_ttf
        nerd-fonts.ubuntu
    ];
}

