{ config, pkgs, inputs, ... }:

{
	programs.fish = {
		enable = true;
		generateCompletions = true;
		shellAbbrs = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
		};
	};
}
