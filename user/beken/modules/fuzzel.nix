{ config, lib, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Adwaita Sans:size=14";
        image-size-ratio = 0.4;
        inner-pad = 10;
        icon-theme = "Tela-circle";
        vertical-pad = 20;
      };

      border = {
        width = 2;
        radius = 6;
      };

      colors =
        let
          color = config.lib.stylix.colors.withHashtag;
        in
        {
          selection = lib.mkForce "${color.base02}ff";
        };
    };
  };
}
