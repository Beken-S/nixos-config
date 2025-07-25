{ config, pkgs, disko, ... }: {
    imports = [ disko.nixosModules.disko ];

    disko.devices = {
        disk = {
            main = {
                type = "disk";
                device = "/dev/disk/by-id/some-disk-id";
                content = {
                    type = "gpt";
                    partitions = {
                        boot = {
                            size = "1G";
                            type = "EF00";
                            content = {
                                type = "filesystem";
                                format = "vfat";
                                mountpoint = "/boot";
                                mountOptions = [ "umask=0077" ];
                            };
                        };
                        lvm = {
                            size = "100%";
                            content = {
                                type = "lvm_pv";
                                vg = "vg_main";
                            };
                        };
                    };
                };
            };
        };
        lvm_vg = {
            vg_main = {
                type = "lvm_vg";
                lvs = {
                    swap = {
                        size = "10GB";
                        content = {
                            type = "swap";
                            resumeDevice = true;
                        };
                    };
                    root = {
                        size = "100%FREE";
                        content = {
                            type = "filesystem";
                            format = "ext4";
                            mountpoint = "/";
                        };
                    };
                };
            };
        };
    };
}