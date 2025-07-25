{ config, pkgs, ... }: {
    imports = [
        ./disko-config.nix
        ./locale.nix
        ./networking.nix
        ./video.nix
        ./audio.nix
    ];
}