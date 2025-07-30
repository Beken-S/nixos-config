{ config, pkgs, ... }: {
    home.pointerCursor = {
        name = "catppuccin-latte-light-cursors";
        package = pkgs.catppuccin-cursors.latteLight;
    };
}

