{ config, pkgs, inputs, ... }:

{

	environment = {
		systemPackages = with pkgs; [
			hyprpolkitagent
			hyprshot
			rofi-wayland
			swww
			wl-clipboard-rs
			playerctl
			pavucontrol
			wallust
			dunst
		];
	};

	# hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

}
