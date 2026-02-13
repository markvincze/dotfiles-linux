echo "Creating folders"
rm -rf .config/ghostty
rm -rf .config/sway
rm -rf .config/waybar
rm -rf .config/nvim

mkdir -p .config/ghostty
mkdir -p .config/sway
mkdir -p .config/waybar
mkdir -p .config/nvim

echo "Copying configs"
cp -f -r ~/.config/ghostty ./.config/
cp -f -r ~/.config/sway ./.config/
cp -f -r ~/.config/waybar ./.config/
cp -f -r ~/.config/nvim ./.config/
rm -rf ./.config/nvim/.git
cp ~/.zshrc .

git add .
git commit --allow-empty -m "Update config"
git push origin main

