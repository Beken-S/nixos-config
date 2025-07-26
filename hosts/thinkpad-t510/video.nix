{ config, pkgs, ... }: {
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            nvidia-vaapi-driver
            ocl-icd
        ];
    };
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
    };

    config = {
        nix.nvidia.acceptLicense = true;
        boot.blacklistedKernelModules = [ "nouveau" ];
        boot.kernelParams = [ "nvidia-drm.modeset=1" ];
    };
}
