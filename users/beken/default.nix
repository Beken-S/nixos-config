{ config, pkgs, ... }:
let
    username = "beken";
in {
    nixpkgs.config.allowUnfree = true;

    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };

    home-manager.users.${username} = {
        imports = [ ./packages ];

        useGlobalPkgs = true;
        useUserPackages = true;

        home = {
            inherit username;
            homeDirectory = "/home/${username}";
            sessionVariables.NIXOS_OZONE_WL = "1";
            stateVersion = "25.05";
        };
    };
}
