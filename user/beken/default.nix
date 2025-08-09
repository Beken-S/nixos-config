{ config, pkgs, catppuccin, ... }:
let
    username = "beken";
    homePath = "/home/${username}";
in {
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };

    
    home-manager.users.${username} = {
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
            download = "${homePath}/downloads";
        };

        programs.home-manager.enable = true;
    };
}
