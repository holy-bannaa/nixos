{ config, lib, inputs, ... }:

{
		home.username = "bannaa";
		home.homeDirectory = "/home/bannaa";

		imports = [
		];

		home.stateVersion = "25.05";

		programs.home-manager.enable = true;

		home.activation.sym = lib.hm.dag.entryAfter ["writeBoundary"] ''
			ln -sf ~/.config/nixos/home/dotfiles/* .			
			'';
}

