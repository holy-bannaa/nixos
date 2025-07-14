{ config, pkgs, inputs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./users/bannaa.nix
			./nvidia.nix
			./system.nix
			./hyprland.nix
			inputs.home-manager.nixosModules.home-manager
		];

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.05";
}
