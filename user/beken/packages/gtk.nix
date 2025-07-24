{ config, pkgs, ... }: {
    gtk = {
        iconTheme = {
            name = "Tela-circle";
            package = pkgs.tela-circle-icon-theme;
        };
    };
}

