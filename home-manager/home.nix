{ config, pkgs, lib, ... }:

{
	home.username = "bannaa";
	home.homeDirectory = "/home/bannaa";

	imports = [
		./shell.nix
		./git.nix
		./colors.nix
	];

	home.stateVersion = "25.05";

	programs.home-manager.enable = true;
}

