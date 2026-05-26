{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "proton-cachyos";
  version = "11.0-20260506";

  src = fetchurl {
    url = "https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${version}-slr/proton-cachyos-${version}-slr-x86_64.tar.xz";
    hash = "sha256-Yy9Npm5J/O1x0DyHROPRkhREa27pHihqZvL4fRtNQ9A=";
  };

  dontUnpack = true;
  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    out_dir="$out/share/steam/compatibilitytools.d/proton-cachyos"

    mkdir -p "$out_dir"
    tar -xf $src -C "$out_dir" --strip-components=1

    substituteInPlace "$out_dir/compatibilitytool.vdf" \
      --replace-fail "proton-cachyos-${version}-slr-x86_64" "Proton-CachyOS-${lib.versions.major version}"
  '';

  meta = {
    description = "Proton-CachyOS";
    homepage = "https://github.com/CachyOS/proton-cachyos";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
