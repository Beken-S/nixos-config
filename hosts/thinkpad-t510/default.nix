{ config, pkgs, ... }: {
    imports = [
        ./disko-config.nix
        ./locale.nix
        ./networking.nix
        ./video.nix
        ./audio.nix
    ];

    boot.loader.grub = {
        enable = true;
        devices = [ "/dev/sda" ];
    };
}