{ config, pkgs, ... }: {
    home-manager.programs.waybar= {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                modules-left = [ "sway/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "pulseaudio" "network" "battery" ];
            };
        };
    };
}
