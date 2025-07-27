{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        niri
        libnotify
        wl-clipboard
    ];

    xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
