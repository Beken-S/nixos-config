{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      russian-tls-certificates = prev.callPackage ../pkgs/russian_tls_certs { };
    })
    (final: prev: {
      proton-cachyos = prev.callPackage ../pkgs/proton-cachyos { };
    })
    (final: prev: {
      check-disk-activity = prev.callPackage ../pkgs/check-disk-activity { };
    })
  ];
}
