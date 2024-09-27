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

alias guid=uuidgen