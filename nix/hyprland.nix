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
			polkit_gnome
			qt6ct
		];
	};

	# hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

}
