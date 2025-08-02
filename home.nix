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
		".config/git".source = ./home/dotflies/git;
		".config/gtk-3.0".source = ./home/dotflies/gtk-3.0;
		".config/gtk-4.0".source = ./home/dotflies/gtk-4.0;
		".config/kitty".source = ./home/dotflies/kitty;
		".config/qt6ct".source = ./home/dotflies/qt6ct;
		".config/rofi".source = ./home/dotflies/rofi;
		".config/Vencord".source = ./home/dotflies/Vencord;
		".config/xsettingsd".source = ./home/dotflies/xsettingsd;
		".config/yazi".source = ./home/dotflies/yazi;
		};
}
