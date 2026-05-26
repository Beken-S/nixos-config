{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      russian-tls-certificates = prev.callPackage ../pkgs/russian_tls_certs { };
    })
    (final: prev: {
      proton-cachyos = prev.callPackage ../pkgs/proton-cachyos { };
    })
  ];
}
