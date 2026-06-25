{
  config,
  pkgs,
  hostName,
  ...
}:
{
  imports = [
    ./disko-config.nix
    ./smb-server.nix
  ];

  networking.hostName = hostName;

  boot = {
    initrd.kernelModules = [ "i915" ];
    extraModprobeConfig = ''
      options snd_hda_intel model=no-front-hp
    '';
  };

  nixpkgs.config.nvidia.acceptLicense = true;

  hardware = {
    cpu.intel.updateMicrocode = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
      modesetting.enable = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    graphics.extraPackages = with pkgs; [ intel-vaapi-driver ];
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  myNas = {
    enable = true;
    name = "Files";
    device = {
      uuid = "A88CDF9B8CDF627C";
      fsType = "ntfs3";
    };
  };
}
