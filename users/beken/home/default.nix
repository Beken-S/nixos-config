{ config, pkgs, username, ... }: {
    imports = [ ./packages ];

    home-manager = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
    };
}
