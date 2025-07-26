{ config, pkgs, home-manager, ... }: {
    imports = [
        home-manager.nixosModules.home-manager
        ./beken
    ];
}
