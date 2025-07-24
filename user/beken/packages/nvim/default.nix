{ config, pkgs, ...}: {
    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
    };

    programs.neovim.enable = true;
}

