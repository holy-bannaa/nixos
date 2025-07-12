{
	description = "I'm flaking";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.greg-butterscotch = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./nix/greg.nix

				inputs.home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.bannaa = import ./home-manager/home.nix;
					home-manager.extraSpecialArgs = {inherit inputs;};
				}
			];
		};
	};
}
