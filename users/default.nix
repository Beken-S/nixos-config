{ config, pkgs, inputs, ... }: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./beken
    ];

    config.home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
    };
}
