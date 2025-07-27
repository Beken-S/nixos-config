{ config, pkgs, ... }: {
    system.stateVersion = "25.05";

    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };

    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 22 80 443 ];
        allowedUDPPorts = [ 53 ];
        allowPing = false;
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };

    nixpkgs.config.allowUnfree = true;
}