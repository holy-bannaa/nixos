{ config, pkgs, lib, ... }:

{
	fonts.fontconfig = {
		enable = true;

		defaultFonts = {
			emoji = [ "Noto Color Emoji" ];
			monospace = [ "JetBrainsMono NF" "Noto Sans Mono" ];
			sansSerif = [ "Noto Sans" ];
		};
	};
}
