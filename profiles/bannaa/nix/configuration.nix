{ config, pkgs, inputs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./users/bannaa.nix
			./nvidia.nix
			./system.nix
			inputs.home-manager.nixosModules.home-manager
		];

	system.stateVersion = "25.05"; # Did you read the comment?
}
