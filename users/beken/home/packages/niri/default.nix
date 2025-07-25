{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        niri
        libnotify
        wl-clipboard
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
