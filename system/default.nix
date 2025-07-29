{ config, pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";

    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "ru_RU.UTF-8";


    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };

    networking= {
        networkmanager.enable = true;

        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 80 443 ];
            allowedUDPPorts = [ 53 ];
            allowPing = false;
        };
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };

    nixpkgs.config.allowUnfree = true;
}