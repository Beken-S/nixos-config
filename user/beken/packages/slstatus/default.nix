{ config, pkgs, ... }:
let
    slstatus = (pkgs.slstatus.overrideAttrs(old: {
        patches = (old.patches or []) ++ [
            ./patches/battery.patch
        ];
    })).override {
        conf = ./config.h;         
    };
in
{
    home.packages = [ slstatus ];
}

