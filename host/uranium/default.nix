{
  pkgs,
  hostName,
  ...
}:
{
  imports = [ ./disko-config.nix ];

  networking.hostName = hostName;

  boot = {
    initrd.kernelModules = [ "i915" ];
    kernelModules = [ "nouveau" ];
  };

  hardware.cpu.intel.updateMicrocode = true;

  hardware.graphics.extraPackages = with pkgs; [
    intel-vaapi-driver
    libva-vdpau-driver
  ];

  services.xserver.videoDrivers = [ "nouveau" ];
}
