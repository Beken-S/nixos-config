{ config, pkgs, inputs, ... }: {
    config = {
        imports = [
            inputs.home-manager.nixosModules.home-manager
            ./beken
        ];

        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
        };
    };
}
