{ config, pkgs, inputs, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    config.home-manager = {
        imports = [ ./beken ];
        useGlobalPkgs = true;
        useUserPackages = true;
    };
}
