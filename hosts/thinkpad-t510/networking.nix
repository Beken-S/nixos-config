{ config, pkgs, ... }: {
    networking.hostName = "omega";
    hardware.bluetooth.enable = true;
}