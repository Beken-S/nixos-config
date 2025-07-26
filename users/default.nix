{ config, pkgs, inputs, ... }: {
    imports = [ ./beken ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };
}
