{ config, pkgs, inputs, ... }:

{
	users.users.bannaa = {
		isNormalUser = true;
		description = "bannaa";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.fish;
		packages = with pkgs; [
			(discord.override {
				withVencord = true;
			})
			rustup
			neovim
			lutris
			kitty
			wallust
			rofi-wayland
			fastfetch
			tmux
			swww
			wl-clipboard-rs
			playerctl
			btop
			pavucontrol
			nh
			zoxide
			eza
			dunst
			fzf
			wineWowPackages.stable
			qbittorrent-enhanced
			protonplus
		];
	};

	#zoxide
	programs.zoxide = {
		enable = true;
		enableFishIntegration = true;
		enableZshIntegration = true;
	};

	# zsh
	programs.zsh = {
		enable = true;
		ohMyZsh = {
			enable = true;
			theme = "bureau";
		};
	};

	programs.fish = {
		enable = true;
	};

	# firefox
	programs.firefox = {
		enable = true;
	};

	# steam
	programs.steam = {
		enable = true;
	};

	# hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
}
