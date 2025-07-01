{ config, pkgs, inputs, ... }:

{
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			efiSupport = true;
			device = "/dev/nvme0n1p1";
	};

	environment = {
		systemPackages = with pkgs; [
			gcc
			git
			hyprpolkitagent
			hyprshot
			unzip
			rar
			steamtinkerlaunch
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

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		noto-fonts-color-emoji
		noto-fonts
	];


	services.xserver.enable = true;
	#sddm
	services.displayManager.sddm = {
		enable = true;
		package = pkgs.kdePackages.sddm;
		theme = "maya";
		extraPackages = [ pkgs.sddm-astronaut ];
	};

	networking = {
		networkmanager.enable = true;
		hostName = "greg-butterschotch";
	};

	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

		services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	time.timeZone = "Europe/Bucharest";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "ro_RO.UTF-8";
		LC_IDENTIFICATION = "ro_RO.UTF-8";
		LC_MEASUREMENT = "ro_RO.UTF-8";
		LC_MONETARY = "ro_RO.UTF-8";
		LC_NAME = "ro_RO.UTF-8";
		LC_NUMERIC = "ro_RO.UTF-8";
		LC_PAPER = "ro_RO.UTF-8";
		LC_TELEPHONE = "ro_RO.UTF-8";
		LC_TIME = "ro_RO.UTF-8";
	};
}
