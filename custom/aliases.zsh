# SHORTCUTS

alias src='cd ~/Source'
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'

# APPLICATIONS

# Visual Studio Code (code)
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# JetBrains Rider (rider)
alias rider='/Applications/Rider.app/Contents/MacOS/rider'

# Firefox Developer Edition (ff)
alias ff='/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox'

# UTILITIES

_kill_process_by_port() {
  port="$1"
  process=$(lsof -ti:$port)

  if [[ -n "$process" ]]; then
    kill -9 "$process"
  fi
} 
alias pk=_kill_process_by_port

_remove_bin_and_obj_dirs() {
  directories=$(find . -type d \( -name "bin" -o -name "obj" \))

  if [[ -z "$directories" ]]; then
    echo "No 'bin' or 'obj' directories found."
    exit 0
  fi

  # Display found directories
  echo "Found the following directories:"
  echo "$directories"

  # Confirm before deleting
  echo
  echo "Do you want to delete all these directories? [y/N]"
  read -r response

  case "$response" in
    [yY][eE][sS]|[yY])
      while IFS= read -r dir; do
        rm -rf "$dir"
        echo "Deleted $dir"
      done <<< "$directories"
      echo "All specified directories have been deleted."
      ;;
    *)
      echo "Operation canceled. No directories were deleted."
      ;;
  esac
}
alias rm_bin=_remove_bin_and_obj_dirs

alias guid=uuidgen