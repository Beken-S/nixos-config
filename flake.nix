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

        catppuccin.url = "github:catppuccin/nix/release-25.05";

        wallpaper ={
            url = "https://upload.wikimedia.org/wikipedia/commons/5/57/Levitan_Zolotaya_Osen.jpg";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, disko, home-manager, catppuccin, wallpaper, ... }:
    let
        my-utils = import ./utils { inherit (nixpkgs) lib; };
    in
    {
        nixosConfigurations.thinkpad-t510 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit my-utils disko catppuccin wallpaper; };
            modules = [
                disko.nixosModules.disko
                home-manager.nixosModules.home-manager
                ./overlays
                ./system
                ./host/thinkpad-t510
                ./user/beken
            ];
        };
    };
}

