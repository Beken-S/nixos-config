{ config, pkgs, ... }: {
    imports = [
        ./disko-config.nix
        ./networking.nix
        ./video.nix
        ./audio.nix
    ];
}