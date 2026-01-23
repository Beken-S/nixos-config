{ pkgs, ... }:
{
  programs = {
    anki = {
      enable = true;
      language = "ru_RU";
      style = "native";
      addons = [
        (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
          pname = "FSRS4Anki";
          version = "v6.1.3";
          src = pkgs.fetchFromGitHub {
            owner = "open-spaced-repetition";
            repo = "fsrs4anki";
            rev = finalAttrs.version;
            hash = "sha256-fpBLCkiB1OKNhGAMdaKpV8u2eYZy+ufv6RJE8DJO2ZE=";
          };
        }))
      ];
    };
  };
}
