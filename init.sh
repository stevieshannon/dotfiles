if command -v git &> /dev/null; then
    git_installed=true
else
    git_installed=false
fi

# Check if zsh is installed
if command -v zsh &> /dev/null; then
    zsh_installed=true
else
    zsh_installed=false
fi

if [ "$git_installed" = true ] && [ "$zsh_installed" = true ]; then  
  if [ ! -f "$HOME/.oh-my-zsh" ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
elif [ "$git_installed" = false ]; then
  echo "You must install git."
elif [ "$zsh_installed" = false ]; then
  echo "You must install zsh."
else
  echo "You must install git and zsh."
fi