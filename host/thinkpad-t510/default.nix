{ config, pkgs, ... }: {
    imports = [
        ./disko-config.nix
        ./thinkpad-keys.nix
        ./networking.nix
        ./video.nix
        ./audio.nix
    ];
}

