timestamp=$(date +%s)
install_dir=$(pwd)

## zshenv

if [ -f "$HOME/.zshenv" ]; then
  mv "$HOME/.zshenv" "$HOME/.zshenv.backup-$timestamp"
fi
echo "export PHRISK_DOTFILES=$install_dir" > "$HOME/.zshenv"


## zshrc

if [ -f "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup-$timestamp"
fi
cp .zshrc "$HOME/.zshrc"

## pk10.zsh

if [ -f "$HOME/.p10k.zsh" ]; then
  mv "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.backup-$timestamp"
fi
cp .p10k.zsh "$HOME/.p10k.zsh"

## install plugins

update_or_clone() {
  local REPO_URL="$1"
  local TARGET_DIR="$2"

  # Check if the directory exists
  if [ -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR already exists. Updating repository..."
    # Navigate to the repository directory
    cd "$TARGET_DIR" || exit
    # Fetch the latest changes
    git pull
    # Return to the previous directory
    cd - > /dev/null
  else
    echo "Directory $TARGET_DIR does not exist. Cloning repository..."
    # Clone the repository into the target directory
    git clone "$REPO_URL" "$TARGET_DIR"
  fi
}

update_or_clone https://github.com/zsh-users/zsh-autosuggestions custom/plugins/zsh-autosuggestions
update_or_clone https://github.com/zsh-users/zsh-syntax-highlighting custom/plugins/zsh-syntax-highlighting
update_or_clone https://github.com/romkatv/powerlevel10k custom/themes/powerlevel10k