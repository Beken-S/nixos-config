{ config, pkgs, ... }: {
    programs.git = {
        enable = true;
        userName = "BekenSarsenbaev";
        userEmail = "sbeken6@gmail.com";
        aliases = {
            history  = ''log --graph --date=format:"%d.%m.%y" --format=format:"%C(bold yellow)%h%C(reset) - %s%C(red bold)%d%C(reset) %C(brightblack italic)-- %an %ar%C(reset)%n" --all'';
        };
        extraConfig = {
            core.editor = "nvim";
        };
    };
}

