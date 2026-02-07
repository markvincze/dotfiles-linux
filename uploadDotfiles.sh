echo "Creating folders"
mkdir -p .config/ghostty
mkdir -p .config/sway
mkdir -p .config/nvim

echo "Copying configs"
cp -f -r ~/.config/ghostty ./.config/
cp -f -r ~/.config/sway ./.config/
cp -f -r ~/.config/nvim ./.config/
cp ~/.zshrc .

git add .
git commit --allow-empty -m "Update config"
git push origin main
