{ config, pkgs, inputs, ... }:

{
	programs.fish = {
		enable = true;
		generateCompletions = true;
		shellAliases = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
			n = "nivm";
		};
		shellAbbrs = {
			gs = "git status";
			ga = "git add";
			gc = "git commit -m";
		};
	};
}
