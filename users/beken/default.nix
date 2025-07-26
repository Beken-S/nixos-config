{ config, pkgs, ... }:
let
    username = "beken";
in {
    config.nixpkgs.config.allowUnfree = true;

    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };

    home-manager.users.${username} = {
        imports = [ ./packages ];

        home = {
            inherit username;
            homeDirectory = "/home/${username}";
            sessionVariables.NIXOS_OZONE_WL = "1";
            stateVersion = "25.05";
        };
    };
}
