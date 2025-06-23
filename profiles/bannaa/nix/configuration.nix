{ config, pkgs, inputs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./apps.nix
			./nvidia.nix
			./env.nix
			inputs.home-manager.nixosModules.home-manager
		];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking.hostName = "greg-butterschotch";


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

	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	users.users.bannaa = {
		isNormalUser = true;
		description = "bannaa";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		packages = with pkgs; [];
	};


	nixpkgs.config.allowUnfree = true;


	networking.networkmanager.enable = true;


	#sddm
	services.displayManager.sddm = {
		enable = true;
		package = pkgs.kdePackages.sddm;
		theme = "sddm-astronaut-theme";
		extraPackages = [ pkgs.sddm-astronaut ];
	};

	services.xserver.enable = true;

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		noto-fonts-color-emoji
		noto-fonts
	];

	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	system.stateVersion = "25.05"; # Did you read the comment?

}
