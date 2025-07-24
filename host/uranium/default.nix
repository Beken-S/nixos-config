{ config, pkgs, ... }: {
    imports = [ ./disko-config.nix ];

    networking.hostName = "uranium";

    boot = {
        initrd.kernelModules = [ "i915" ];
        kernelModules = [ "nouveau" ];
    };

    hardware.cpu.intel.updateMicrocode = true;

    hardware.graphics.extraPackages = with pkgs; [
        vaapiIntel
        vaapiVdpau
    ];

    services.xserver.videoDrivers = [ "nouveau" ];
}

