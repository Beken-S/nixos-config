{ config, pkgs, username, ... }: {
    imports = [./packages]

    home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
    };
}
