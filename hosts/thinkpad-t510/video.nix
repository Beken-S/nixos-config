{ config, pkgs, ... }: {
    config = {
        services.xserver.videoDrivers = [ "nvidia" ];
        boot.blacklistedKernelModules = [ "nouveau" ];
        boot.kernelParams = [ "nvidia-drm.modeset=1" ];

        hardware.graphics = {
            enable = true;
            extraPackages = with pkgs; [
                nvidia-vaapi-driver
                ocl-icd
            ];
        };

        hardware.nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
            modesetting.enable = true;
            open = false;
            nvidiaSettings = true;
        };

        nvidia.acceptLicense = true;
    };
}
