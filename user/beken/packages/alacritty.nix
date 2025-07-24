{ config, pkgs, ...}: {
    programs.alacritty = {
        enable = true;

        settings = {
            env.TERM = "xterm-256color";

            window = {
                padding.x = 8;
                padding.y = 8;
                decorations = "None";
            };

            selection = {
                save_to_clipboard = true;
            };
        };
    };
}

