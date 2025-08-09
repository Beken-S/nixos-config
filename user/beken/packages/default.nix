{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./dwl
        ./alacritty
        ./nvim
        ./browsers.nix
    ];
}

