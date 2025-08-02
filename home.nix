{ config, lib, inputs, ... }:

{
		home.username = "bannaa";
		home.homeDirectory = "/home/bannaa";

		imports = [
		];

		home.stateVersion = "25.05";

		programs.home-manager.enable = true;

		# symlink .dotfiles
		home.file = {
		".config/dconf".source = ./home/dotfiles/dconf;
		".config/git".source = ./home/dotfiles/git;
		".config/Vencord".source = ./home/dotfiles/Vencord;
		".config/gtk-3.0".source = ./home/dotfiles/gtk-3.0;
		".config/gtk-4.0".source = ./home/dotfiles/gtk-4.0;
		".config/kitty".source = ./home/dotfiles/kitty;
		".config/qt6ct".source = ./home/dotfiles/qt6ct;
		".config/rofi".source = ./home/dotfiles/rofi;
		".config/xsettingsd".source = ./home/dotfiles/xsettingsd;
		".config/yazi".source = ./home/dotfiles/yazi;
		};
}
