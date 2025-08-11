{ config, pkgs, ... }:
let
    dwl = (pkgs.dwl.overrideAttrs (old: {
        patches = [
            ./patches/bar.patch
            ./patches/gaps.patch
        ];
    })).override {
        configH = ./config.h;
    };
in {
    home.packages = [ dwl ];
}

