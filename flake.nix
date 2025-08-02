{
	description = "I'm flaking";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.greg-butterscotch = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./nix/greg.nix

				{

				}
			];
		};
	};
}
