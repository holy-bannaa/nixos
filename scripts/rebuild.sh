#!/run/current-system/sw/bin/bash
git diff -U0 *.nix
echo "NixOS is Rebuilding..."
sudo nixos-rebuild switch --flake ~/.config/nixos#greg-butterscotch &>~/logs/nixos-switch.log || ( cat nixos-switch.log | grep --color error && false )
gen=$(nixos-rebuild list-generations | grep current)
git add .
git commit -m "$gen"
