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

        wallpaper ={
            url = "https://clck.ru/3NnARR";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, disko, home-manager, niri, stylix, wallpaper, ... }: {
	    nixosConfigurations.uranium = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit disko niri stylix wallpaper; };
            modules = [
                disko.nixosModules.disko
                home-manager.nixosModules.home-manager
                niri.nixosModules.niri
                ./overlays
                ./system
                ./host/uranium
                ./user/beken
            ];
        };
    };
}

