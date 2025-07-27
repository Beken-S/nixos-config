{ config, pkgs, ... }: {
    networking = {
        hostName = "omega";
        networkmanager.enable = true;
    };

    hardware.bluetooth.enable = true;
}