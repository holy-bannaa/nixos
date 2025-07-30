{ config, pkgs, inputs, ... }:

{
	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		noto-fonts-color-emoji
		noto-fonts
	];

}
