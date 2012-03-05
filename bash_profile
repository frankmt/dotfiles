# crashplan
crashplan () { 
  case "$1" in
    "load")
      sudo launchctl load /Library/LaunchDaemons/com.crashplan.engine.plist;
      ruby -e "sleep 1";
    ;;
    "unload")
      sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist;
    ;;
    *)
      echo -e "Usage:\n   crashplan load\n   crashplan unload\n";
    ;;
  esac
  echo -e "Current status:";
  ps auxww | head -n 1
  ps auxww | grep -i CrashPlanService | grep ^root;
}

# path
export PATH="/usr/local/bin:$PATH:~/bin"
alias op="open *.tmproj || mate ."

# TextMate
export EDITOR="mate -w"
alias op="open *.tmproj || mate ."

# autotest
alias bat="bundle exec autotest --no-full-after-failed"

# bundler
alias be="bundle exec"
alias bo="bundle open"

# temporary directory
alias tmp="mkdir -p ~/tmp; cd ~/tmp"
 
# Git aliases
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gdm="git diff | mate"

# brew & ruby(gems?)
export RUBYLIB="`brew --prefix`/lib:$RUBYLIB"

# node.js
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

# bash completion (required for __git_ps1 to work)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# color
export CLICOLOR=1

# prompt
color_yellow="\[\e[0;33m\]"
color_green="\[\e[0;32m\]"
color_red="\[\e[0;31m\]"
color_foreground="\[\e[0m\]"
export PS1="${color_yellow}\h${color_foreground}:${color_green}\W${color_red}\$(__git_ps1 '(%s)')${color_foreground}\\$ "

# EC2 API Tools (brew install ec2-api-tools)
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.2.2/jars"

# Ruby Version Machine
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
