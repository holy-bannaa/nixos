{ config, pkgs, lib, ... }:

{
	home.username = "bannaa";
	home.homeDirectory = "/home/bannaa";

		programs.fish = {
		enable = true;
		generateCompletions = true;
		shellAliases = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
			n = "nivm";
		};
		shellAbbrs = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
		};
	};

	fonts.fontconfig = {
		enable = true;

		defaultFonts = {
			emoji = [ "Noto Color Emoji" ];
			monospace = [ "JetBrainsMono NF" "Noto Sans Mono" ];
			sansSerif = [ "Noto Sans" ];
		};
	};

	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
		iconTheme = {
			name = "MoreWaita";
			package = pkgs.morewaita-icon-theme;
		};
	};

	qt = {
		enable = true;
		platformTheme.name = "gtk";
		style = {
			name = "adwaita-dark";
			package = pkgs.adwaita-qt;
		};
	};

	programs.git = {
		enable = true;
		userEmail = "holy-bannaa@proton.me";
		userName = "bannaa";

		diff-highlight.enable = true;
	};

	home.shell.enableShellIntegration = true;


	home.stateVersion = "25.05";

	programs.home-manager.enable = true;
}

