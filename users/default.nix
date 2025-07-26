{ config, pkgs, inputs, ... }: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./beken
    ];
}
