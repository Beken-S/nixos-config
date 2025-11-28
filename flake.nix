{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpaper = {
      url = "https://clck.ru/3NnARR";
      flake = false;
    };

    nvim-spell-ru-utf8-dictionary = {
      url = "https://ftp.nluug.nl/pub/vim/runtime/spell/ru.utf-8.spl";
      flake = false;
    };

    nvim-spell-ru-utf8-suggestions = {
      url = "https://ftp.nluug.nl/pub/vim/runtime/spell/ru.utf-8.sug";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      niri,
      stylix,
      wallpaper,
      nvim-spell-ru-utf8-dictionary,
      nvim-spell-ru-utf8-suggestions,
      ...
    }:
    let
      mkConfig =
        {
          name,
          system,
          user,
          fullName,
          email,
        }:
        {
          inherit name;
          value = (
            nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit
                  disko
                  niri
                  stylix
                  wallpaper
                  nvim-spell-ru-utf8-dictionary
                  nvim-spell-ru-utf8-suggestions
                  ;
                hostName = name;
                userName = user;
                fullUserName = fullName;
                userEmail = email;
              };
              modules = [
                disko.nixosModules.disko
                home-manager.nixosModules.home-manager
                niri.nixosModules.niri
                ./overlays
                ./system
                ./host/${name}
                ./user/${user}
              ];
            }
          );
        };

      hosts = [
        {
          name = "uranium";
          system = "x86_64-linux";
          user = "beken";
          fullName = "Beken Sarsenbaev";
          email = "sbeken6@gmail.com";
        }
      ];

      nixosConfigurations = builtins.listToAttrs (map mkConfig hosts);

    in
    {
      inherit nixosConfigurations;
    };
}
