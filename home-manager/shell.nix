{ config, pkgs, lib, ... }:

{
	home.shell.enableShellIntegration = true;

	programs.fish = {
		enable = true;
		generateCompletions = true;
		shellAbbrs = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
			n = "nvim";
			upnix = "sudo nixos-rebuild switch --flake ~/.config/nixos#greg-butterscotch";
		};
	};
}
