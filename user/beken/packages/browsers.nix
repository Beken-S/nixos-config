{ config, pkgs, ... }:
let
    downloadPath = "${config.home.homeDirectory}/downloads";
in
{
    programs.firefox = {
        enable = true;
        policies = {
           DefaultDownloadDirectory = downloadPath;
        };
    };
}

