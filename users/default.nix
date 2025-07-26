{ config, pkgs, home-manager, ... }: {
    imports = [
        home-manager.nixosModules.home-manager
        ./beken
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };
}
