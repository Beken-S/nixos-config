{
  pkgs,
  hostName,
  userName,
  fullUserName,
  userEmail,
  niri,
  stylix,
  wallpaper,
  nvim-spell-ru-utf8-dictionary,
  nvim-spell-ru-utf8-suggestions,
  ...
}:
let
  homePath = "/home/${userName}";
in
{

  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit
        hostName
        userName
        fullUserName
        userEmail
        nvim-spell-ru-utf8-dictionary
        nvim-spell-ru-utf8-suggestions
        ;
    };

    users.${userName} = {
      imports = [
        stylix.homeModules.stylix
        niri.homeModules.stylix
        ./packages
      ];

      home = {
        username = userName;
        homeDirectory = homePath;
        stateVersion = "25.11";
      };

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "${homePath}/desktop";
        documents = "${homePath}/documents";
        download = "${homePath}/downloads";
        music = "${homePath}/audio";
        videos = "${homePath}/videos";
        pictures = "${homePath}/pictures";
        publicShare = "${homePath}/public";
        templates = "${homePath}/temp";
      };

      stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow.yaml";
        image = wallpaper;
        polarity = "light";

        fonts = {
          sizes = {
            desktop = 12;
            applications = 12;
          };

          serif = {
            package = pkgs.adwaita-fonts;
            name = "Adwaita Sans";
          };

          sansSerif = {
            package = pkgs.adwaita-fonts;
            name = "Adwaita Sans";
          };

          monospace = {
            package = pkgs.nerd-fonts.fira-code;
            name = "FiraCode Nerd Font";
          };

          emoji = {
            package = pkgs.noto-fonts;
            name = "Noto Color Emoji";
          };
        };

        cursor = {
          package = pkgs.phinger-cursors;
          name = "phinger-cursors-light";
          size = 24;
        };

        targets.gtk.extraCss = ''
          .titlebar,
          .titlebar .background,
          decoration,
          window,
          window.background {
              border-radius: 0;
          }
        '';
      };
    };
  };
}
