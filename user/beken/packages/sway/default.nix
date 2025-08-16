{ config, pkgs, ... }: {
    environment.sessionVariables = { MOZ_ENABLE_WAYLAND = "1"; };
    security.polkit.enable = true;

    home.packages = with pkgs; [
        wl-clipboard
    ];
    services.mako.enable = true;
    wayland.windowManager.sway.enable = true;

    xdg.configFile."sway/config".source = ./config;
}

