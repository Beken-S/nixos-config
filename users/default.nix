{ config, pkgs, ... }: {
    imports = [ ./beken ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };
}
