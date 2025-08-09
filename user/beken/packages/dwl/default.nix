{ config, pkgs, ... }:
let
    dwl = pkgs.dwl.override {
        configH = ./config.h;
    };
in {
    home.packages = [ dwl ];
}

