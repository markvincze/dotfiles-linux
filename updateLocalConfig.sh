echo "Removing config folders"
rm -rf ~/.config/ghostty
rm -rf ~/.config/sway
rm -rf ~/.config/nvim
rm -rf ~/.config/noctalia/

echo "Copying config files"
cp -f -r .config/ghostty ~/.config/
cp -f -r .config/sway ~/.config/
cp -f -r .config/nvim ~/.config/
cp -f -r .config/noctalia ~/.config/
cp -f .zshrc ~/

