{ config, pkgs, ... }: {
    home.sessionVariables = {
        MOZ_ENABLE_WAYLAND = "1";
    };

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

