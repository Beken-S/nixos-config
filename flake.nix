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

        catppuccin.url = "github:catppuccin/nix";
    };

    outputs = { self, nixpkgs, disko, home-manager, catppuccin, ... }@inputs: {
        nixosConfigurations.thinkpad-t510 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs catppuccin; };
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
