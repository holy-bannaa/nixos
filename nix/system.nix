{ config, pkgs, inputs, ... }:

{
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot/efi";
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";
		};
	};

	environment = {
		systemPackages = with pkgs; [
			gcc
			git
			unzip
			rar
			nh
			eza
			fzf
			wineWowPackages.stable
			kitty
			rustup
			kdePackages.qtmultimedia
			kdePackages.breeze
			sddm-astronaut
			gnome-themes-extra
			morewaita-icon-theme
			adwaita-qt6
			adwaita-icon-theme
			adwaita-qt
		];

		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
		variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			NIXOS_OZONE_WL = "1";
			MOZ_ENABLE_WAYLAND = "1";
			MANPAGER = "nvim +Man!";
			QT_QPA_PLATFORMTHEME = "qt6ct";
			QT_QPA_PLATFORM = "wayland";
		};
	};

	services.xserver.enable = true;

	#sddm
	services.displayManager.sddm = {
		enable = true;
		package = pkgs.kdePackages.sddm;
		extraPackages = pkgs.sddm-astronaut;
		theme = "sddm-astronaut-theme";
		settings = {
			Theme = {
				Current = "sddm-astronaut-theme";
			};
		};
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
