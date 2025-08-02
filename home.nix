{ config, pkgs, lib, inputs, ... }:

{
		home.username = "bannaa";
		home.homeDirectory = "/home/bannaa";

		imports = [
		];

		home.stateVersion = "25.05";

		programs.home-manager.enable = true;

		# symlink .dotfiles
		home.file.".config".source = ./home/dotfiles;
}
