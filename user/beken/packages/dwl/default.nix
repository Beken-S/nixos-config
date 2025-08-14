{ config, pkgs, ... }:
let
    my_dwl = (pkgs.dwl.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
            ./patches/gaps.patch
        ];
        buildInputs = (old.buildInputs or []) ++ [];
    })).override {
        configH = ./config.h;
    };
in {
    home.packages = with pkgs; [ 
        my_dwl
        wl-clipboard
    ];
}

