{
  stdenvNoCC,
  fetchurl,
  unzip,
}:
stdenvNoCC.mkDerivation {
  pname = "russian-tls-certificates";
  version = "2025-09-26";

  srcs = [
    (fetchurl {
      url = "https://gu-st.ru/content/lending/linux_russian_trusted_root_ca_pem.zip";
      hash = "sha256-ypnKmwAi7IuZ1YIlAs8/ONR5e90CzAmJlneEIdctfiQ=";
      name = "root_ca.zip";
    })
    (fetchurl {
      url = "https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.zip";
      hash = "sha256-NdjOPtB5sc06FlC/LtLYc+7iiHmZJNu+EowXK2XTWU4=";
      name = "sub_ca.zip";
    })
  ];

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    runHook preUnpack

    for archive in $srcs; do
        unzip -o "$archive" -d .
    done

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    is_pem() {
        [ -f "$1" ] && \
        head -n 1 "$1" | grep -q "BEGIN CERTIFICATE" && \
        tail -n 1 "$1" | grep -q "END CERTIFICATE"
    }

    install -d $out/share

    for cert in *.crt; do
        is_pem "$cert" && cat "$cert" >> $out/share/russian-ca-bundle.pem && echo >> $out/share/russian-ca-bundle.pem
    done

    runHook postInstall
  '';

  meta = {
    description = "Russian TLS certificates";
    homepage = "https://www.gosuslugi.ru/crt";
  };
}
