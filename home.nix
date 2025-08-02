{ config, lib, inputs, ... }:

{
		home.username = "bannaa";
		home.homeDirectory = "/home/bannaa";

		imports = [
		];

		home.stateVersion = "25.05";

		programs.home-manager.enable = true;

		# symlink .dotfiles
#	home.file = {
#	".config/dconf" = {source = ./home/dotfiles/dconf; recursive = true;};
#	".config/git" = {source = ./home/dotfiles/git; recursive = true;};
#	".config/Vencord" = {source = ./home/dotfiles/Vencord; recursive = true;};
#	".config/gtk-3.0" = {source = ./home/dotfiles/gtk-3.0; recursive = true;};
#	".config/gtk-4.0" = {source = ./home/dotfiles/gtk-4.0; recursive = true;};
#	".config/kitty" = {source = ./home/dotfiles/kitty; recursive = true;};
#	".config/qt6ct" = {source = ./home/dotfiles/qt6ct; recursive = true;};
#	".config/rofi" = {source = ./home/dotfiles/rofi; recursive = true;};
#	".config/xsettingsd" = {source =  ./home/dotfiles/xsettingsd; recursive = true;};
#	".config/yazi" = {source = ./home/dotfiles/yazi; recursive = true;};
#};

		home.activation.sym = lib.hm.dag.entryAfter ["writeBoundary"] ''
			ln -sf ~/.config/nixos/home/dotfiles/* .			
			'';
}

