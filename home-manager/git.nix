{ config, pkgs, lib, ... }:

{
	programs.git = {
		enable = true;
		userEmail = "holy-bannaa@proton.me";
		userName = "bannaa";

		diff-highlight.enable = true;
	};
}
