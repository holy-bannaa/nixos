{
	description = "I'm flaking";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
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
