{ config, pkgs, ... }: {
    home.packages = with pkgs; [
        gimp3
        kdePackages.okular
        zotero
        obsidian
    ];    

    programs = {
        mpv = with pkgs; {
            enable = true;

            package = (mpv-unwrapped.wrapper {
                scripts = with mpvScripts; [
                    mpv-osc-modern
                ];

                mpv = mpv-unwrapped;
            });

            config = {
                osc = "no";
            };

            profiles = {
                Idle = {
                    profile-cond = "p[\"idle-active\"]";
                    profile-restore = "copy-equal";
                    title = " ";
                    keepaspect = "no";
                    background = "1";
                };
            };
        };

        swayimg = {
            enable = true;

            settings = with config.lib.stylix.colors.withHashtag; let
                transparent = "#00000000";
            in {
                font = {
                    name = config.stylix.fonts.sansSerif.name;
                    size = config.stylix.fonts.sizes.desktop;
                    color = base05;
                    shadow = transparent;
                };
                viewer = {
                    window = base00;
                };
                gallery = {
                    window = base00;
                    select = base0D;
                    border = base0D;
                    shadow = transparent;
                };
                "keys.viewer" = {
                    f = "fullscreen";
                    m = "mode";
                    l = "next_file";
                    h = "prev_file";
                    "Alt+k" = "step_up";
                    "Alt+l" = "step_right";
                    "Alt+j" = "step_down";
                    "Alt+h" = "step_left";
                    "Alt+Shift+l" = "rotate_right";
                    "Alt+Shift+h" = "rotate_left";
                    "ScrollUp" = "zoom -10";
                    "ScrollDown" = "zoom +10";
                };
                "keys.gallery" = {
                    f = "fullscreen";
                    m = "mode";
                    k = "step_up";
                    l = "step_right";
                    j = "step_down";
                    h = "step_left";
                };
            };
        };
    };
}

