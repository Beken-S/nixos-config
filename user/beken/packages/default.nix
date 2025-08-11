{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./fuzzel.nix
        ./dwl
        ./alacritty
        ./nvim
        ./browsers.nix
    ];
}

