{
	description = "I'm flaking";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		stylix = {
			url = "github:nix-community/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.greg = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./nixos/configuration.nix 
				inputs.stylix.nixosModules.stylix
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
