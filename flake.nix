{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

        disko = {
            url = "github:nix-community/disko/latest";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, disko, ... }@inputs: {
        nixosConfigurations.thinkpad-t510 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                disko.nixosModules.disko
                ./hosts/thinkpad-t510
                ./users/beken
            ];
        };
    };
}
