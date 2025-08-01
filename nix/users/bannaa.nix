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
			steamtinkerlaunch
			lutris
			fastfetch
			tmux
			btop
			qbittorrent-enhanced
			protonplus
			nicotine-plus
			mpv
			vpv
			feh
			peazip
			thunar
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
		shellAbbrs = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
			gd = "git diff";
			n = "nvim";
			nixup = "sudo nixos-rebuild switch --flake ~/.config/nixos#greg-butterscotch";
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

}
