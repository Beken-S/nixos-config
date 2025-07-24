{ config, pkgs, ... }: {
    nixpkgs.overlays = [
        (final: prev: {
            russian-tls-certificates = prev.callPackage ../pkgs/russian_tls_certs { };
        })
    ];
}

