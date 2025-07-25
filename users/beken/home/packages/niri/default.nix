{ config, pkgs, ... }: {
    sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager = {
        packages = with pkgs; [
            niri
            libnotify
            wl-clipboard
        ];

        xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
}
