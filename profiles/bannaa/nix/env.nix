{
	environment = {
		systemPackages = with pkgs; [
			gcc
			git
			hyprpolkitagent
			hyprshot
			unzip
		];

		sessionVariables.NIXOS_OZONE_WL = "1";

		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			NIXOS_OZONE_WL = "1";
			MOZ_ENABLE_WAYLAND = "1";
			MANPAGER = "nvim +Man!";
		};
	};

}
