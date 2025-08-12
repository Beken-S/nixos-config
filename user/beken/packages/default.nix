{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./fuzzel.nix
        ./dwl
        ./slstatus
        ./alacritty
        ./nvim
        ./browsers.nix
    ];
}

