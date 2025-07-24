{ config, pkgs, ... }: {
    networking = {
        hostName = "omega";
        networkmanager.enable = true;

        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 80 443 ];
            allowedUDPPorts = [ 53 ];
            allowPing = false;
        };
    };

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };

    hardware.bluetooth.enable = true;
}