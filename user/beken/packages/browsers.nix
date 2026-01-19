{ config, pkgs, ... }:
{
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  home.packages = with pkgs; [
    tor-browser
  ];

  programs = {
    firefox = {
      enable = true;
      policies = {
        DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
      };
    };

    chromium = {
      enable = true;
    };
  };
}
