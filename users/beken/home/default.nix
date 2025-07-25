{ config, pkgs, username, ... }: {
    imports = [ ./packages ];

    home-manager.home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
    };
}
