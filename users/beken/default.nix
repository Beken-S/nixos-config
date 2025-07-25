{ config, pkgs, ... }:
let
    username = "beken";
in {
    _module.args = { inherit username };
    imports = [ ./home ];

    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
    };
}
