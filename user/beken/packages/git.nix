{ config, pkgs, fullUserName, userEmail, ... }: {
    programs.git = {
        enable = true;
        userName = fullUserName;
        inherit userEmail;
        aliases = {
            history  = ''log --graph --date=format:"%d.%m.%y" --format=format:"%C(bold yellow)%h%C(reset) - %s%C(red bold)%d%C(reset) %C(brightblack italic)-- %an %ar%C(reset)%n" --all'';
        };
        extraConfig = {
            core.editor = "nvim";
        };
    };
}

