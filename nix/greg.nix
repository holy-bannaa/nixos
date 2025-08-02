{ config, pkgs, inputs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./users/bannaa.nix
			./nvidia.nix
			./system.nix
			./hyprland.nix
			./colors.nix
		];

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.05";
}
