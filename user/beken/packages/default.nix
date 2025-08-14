{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./fuzzel.nix
        ./browsers.nix
        ./dwl
        ./yambar
        ./alacritty
        ./nvim
    ];
}

