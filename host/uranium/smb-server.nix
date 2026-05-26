{ config, lib, ... }:
let
  cfg = config.myNas;
in
{
  options.myNas = {
    enable = lib.mkEnableOption "SMB server for NAS";

    name = lib.mkOption {
      type = lib.types.str;
      default = "Nas";
      description = "NetBIOS name for server";
    };

    user = {
      id = lib.mkOption {
        type = lib.types.int;
        default = 500;
        description = "UID for NAS share user";
      };

      name = lib.mkOption {
        type = lib.types.str;
        default = "smb-share";
        description = "System user name for SMB share";
      };
    };

    group = {
      id = lib.mkOption {
        type = lib.types.int;
        default = 500;
        description = "GID for NAS share group";
      };

      name = lib.mkOption {
        type = lib.types.str;
        default = "smb-share";
        description = "System group name for SMB share";
      };
    };

    device = {
      uuid = lib.mkOption {
        type = lib.types.str;
        description = "Device UUID for NAS";
      };

      fsType = lib.mkOption {
        type = lib.types.enum [
          "ntfs3"
          "ntfs"
          "ext4"
          "btrfs"
          "xfs"
          "vfat"
          "f2fs"
        ];
        default = "ext4";
        description = "Filesystem type of the NAS disk";
      };

      mountPoint = lib.mkOption {
        type = lib.types.str;
        default = "/mnt/nas";
        description = "Mount point for the NAS disk";
      };
    };

    share = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "nas";
        description = "SMB share name";
      };

      path = lib.mkOption {
        type = lib.types.str;
        description = "Path to export via SMB (defaults to /export/<name>)";
      };

      network = lib.mkOption {
        type = lib.types.str;
        default = "192.168.1.0/24";
        description = "Network allowed to access SMB share";
      };
    };

    wol = {
      enable = lib.mkEnableOption "Wake-on-LAN for NAS";
      interface = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Network interface for Wake-on-LAN";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    myNas.share.path = lib.mkDefault "/export/${cfg.share.name}";

    fileSystems."${cfg.device.mountPoint}" = {
      device = "/dev/disk/by-uuid/${cfg.device.uuid}";
      fsType = cfg.device.fsType;
      options = [
        "uid=${toString cfg.user.id}"
        "gid=${toString cfg.group.id}"
        "umask=000"
        "nofail"
      ];
    };

    fileSystems."${cfg.share.path}" = {
      device = cfg.device.mountPoint;
      options = [
        "bind"
        "nofail"
      ];
    };

    users.groups."${cfg.group.name}" = {
      gid = cfg.group.id;
    };
    users.users."${cfg.user.name}" = {
      isSystemUser = true;
      uid = cfg.user.id;
      group = cfg.group.name;
    };

    services = {
      samba-wsdd = {
        enable = true;
        openFirewall = true;
      };

      samba = {
        enable = true;
        openFirewall = true;
        settings = {
          global = {
            "server min protocol" = "SMB2_02";
            "hosts allow" = cfg.share.network;
            "workgroup" = "WORKGROUP";
            "netbios name" = cfg.name;
          };
          "${cfg.share.name}" = {
            path = cfg.share.path;
            browseable = "yes";
            "read only" = "no";
            "guest ok" = "no";
            "valid users" = cfg.user.name;
            "force user" = cfg.user.name;
            "force group" = cfg.group.name;
          };
        };
      };
    };

    networking = lib.mkIf cfg.wol.enable {
      interfaces."${cfg.wol.interface}".wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };
  };
}
