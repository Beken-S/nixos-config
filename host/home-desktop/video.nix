{ config, pkgs, ... }: {
    boot.kernelModules = [ "nouveau" ];

    services.xserver.videoDrivers = [ "nouveau" ];

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            mesa
            libvdpau-va-gl
        ];
    };
}
