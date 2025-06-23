{
	users.users.bannaa = {
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
		];
	};

	programs.zsh = {
		enable = true;
		ohMyZsh = {
			enable = true;
			theme = "bureau";
		};
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
