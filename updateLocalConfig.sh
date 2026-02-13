echo "Removing config folders"
rm -rf ~/.config/ghostty
rm -rf ~/.config/sway
rm -rf ~/.config/waybar
rm -rf ~/.config/nvim

echo "Copying config files"
cp -f -r .config/ghostty ~/.config/
cp -f -r .config/sway ~/.config/
cp -f -r .config/waybar ~/.config/
cp -f -r .config/nvim ~/.config/
cp -f .zshrc ~/

