{ config, pkgs, my-utils, catppuccin, wallpaper, ... }:
let
    username = "beken";
    homePath = "/home/${username}";
in {
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };

    security.polkit.enable = true;

    home-manager.users.${username} = {
        _module.args = { inherit wallpaper my-utils; };

        imports = [
	        catppuccin.homeModules.catppuccin
	        ./packages
	    ];

        home = {
            inherit username;
            homeDirectory = homePath;
            stateVersion = "25.05";
        };

        xdg.userDirs = {
            enable = true;
            desktop = "${homePath}/desktop";
            documents = "${homePath}/documents";
            download = "${homePath}/downloads";
            music = "${homePath}/audio";
            videos = "${homePath}/videos";
            pictures = "${homePath}/pictures";
        };

        catppuccin = {
            flavor = "latte";
            accent = "sapphire";
        };

        programs.home-manager.enable = true;
    };
}
