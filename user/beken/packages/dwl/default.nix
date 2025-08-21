{ config, pkgs, ... }:
let
    my_dwl = (pkgs.dwl.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
            ./patches/gaps.patch
        ];
        buildInputs = (old.buildInputs or []) ++ [];
    })).override {
        configH = ''

        '';
    };
in {
    home.packages = with pkgs; [ 
        my_dwl
        swaybg
        wl-clipboard
    ];
}

