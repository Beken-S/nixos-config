{ config, pkgs, ... }: {
    disko.devices = {
        disk = {
            main = {
                type = "disk";
                device = "/dev/disk/by-id/ata-INTEL_SSDSC2CW180A3_CVCV246304YM180EGN";
                content = {
                    type = "gpt";
                    partitions = {
                        MBR = {
                            size = "1M";
                            type = "EF02"; # for grub MBR
                        };
                        boot = {
                            size = "512M";
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
            extend-1 = {
                type = "disk";
                device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_500GB_S7HTNJ0W504974W";
                content = {
                    type = "gpt";
                    partitions = {
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

