#!/run/current-system/sw/bin/bash
git diff -U0 *.nix
echo "NixOS is Rebuilding..."
sudo nixos-rebuild switch --flake ~/.config/nixos#greg-butterscotch &>~/logs/nixos-switch.log 
cat ~/logs/nixos-switch.log | grep --color error
git add ~/.config/nixos
gen=$(nixos-rebuild list-generations | grep current)
git commit -m "$gen"
