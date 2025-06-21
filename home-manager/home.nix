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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

