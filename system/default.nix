{ config, pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";

    time.timeZone = "Europe/Moscow";

    i18n = {
        defaultLocale = "ru_RU.UTF-8";
        extraLocales = [ "en_US.UTF-8/UTF-8" ];
        extraLocaleSettings = {
            LC_NUMERIC = "en_US.UTF-8";
        };
    };

    console = {
        earlySetup = true;
        font = "${pkgs.terminus_font}/share/consolefonts/ter-v22n.psf.gz";
        packages = [ pkgs.terminus_font ];
        keyMap = "us";
    };



    services = {
        openssh = {
            enable = true;
            settings = {
                PermitRootLogin = "no";
                PasswordAuthentication = false;
            };
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
    hardware.enableRedistributableFirmware = true;
}
