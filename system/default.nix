{
  lib,
  pkgs,
  ...
}:
{
  system.stateVersion = "26.05";

  nix = {
    settings = {
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org/"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "btusb.enable_autosuspend=0"
    ];
    supportedFilesystems = [ "ntfs" ];
  };

  console = with pkgs; {
    colors = [
      "2d2d2d"
      "ff7f7b"
      "beda78"
      "ffbf70"
      "90bee1"
      "efb3f7"
      "bed6ff"
      "cccccc"
      "515151"
      "ff93b3"
      "beda78"
      "ffd67c"
      "90bee1"
      "efb3f7"
      "bed6ff"
      "e0e0e0"
    ];
    font = "ter-v20n";
    packages = [ terminus_font ];
    keyMap = "us";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  hardware = {
    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ mesa ];
    };

    bluetooth.enable = true;
    opentabletdriver.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    pki.certificateFiles = [
      "${pkgs.russian-tls-certificates}/share/russian-ca-bundle.pem"
    ];
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command =
            let
              tuigreet = lib.getExe pkgs.tuigreet;
              niri-session = lib.getExe' pkgs.niri "niri-session";
            in
            "${tuigreet} --time --window-padding 1 --cmd ${niri-session}";
        };
      };
    };

    gnome.gnome-keyring.enable = lib.mkForce false;

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        X11Forwarding = false;
        AllowAgentForwarding = false;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    ratbagd.enable = true;

    flatpak.enable = true;
  };

  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        52448
      ];
      allowedUDPPorts = [
        52448
      ];
      allowPing = false;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
      russian-tls-certificates
      tela-circle-icon-theme
    ];
  };

  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
  };

  programs = {
    xwayland.enable = true;
    niri.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-cachyos
        proton-ge-bin
      ];
    };
  };
}
