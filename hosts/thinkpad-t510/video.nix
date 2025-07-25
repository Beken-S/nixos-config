{ config, pkgs, ... }: {
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            nvidia-vaapi-driver
            nvidia-opencl
        ];
    };
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
    };

    boot.blacklistedKernelModules = [ "nouveau" ];
    boot.kernelParams = [ "nvidia-drm.modeset=1" ];
}
