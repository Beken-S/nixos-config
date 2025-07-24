{ config, pkgs, ... }: {
    programs.git = {
        enable = true;
        userName = "Beken Sarsenbaev";
        userEmail = "sbeken6@gmail.com";
    };
}
