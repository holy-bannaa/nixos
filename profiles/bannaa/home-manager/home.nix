{ config, pkgs, ... }:

{
	home.username = "bannaa";
	home.homeDirectory = "/home/bannaa";

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
	};

	qt = {
		enable = true;
		platformTheme.name = "gtk";
		style.name = "adwaita-dark";
	};

	programs.git = {
		enable = true;
		userEmail = "holy-bannaa@proton.me";
		userName = "bannaa";

		diff-highlight.enable = true;
	};

	home.stateVersion = "25.05";

	programs.home-manager.enable = true;
}

