{ config, pkgs, ... }:
let
    username="beken";
in {
  imports=[(import ./home { inherit username; }) ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
