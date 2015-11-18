# Path to your oh-my-zsh configuration.C-
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:/usr/bin/heroku/bin:/Users/sho/.gvm/bin

export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="/usr/bin/heroku/bin:$PATH"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

alias t-ck='tmux set-option -ag prefix C-b'
alias t-rk='tmux set-option -ag prefix C-t'
eval "$(rbenv init -)"

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

export SECRET_KEY_BASE="ebfad528c4d2bfa572f66d5d2a2a8d3d753654f4f2a55e9ddaa2762613c2d9b3c46c8b12ff07aafa3b29184afecfcd81aee4bd6608a870e629821785d4863488"
#export PATH=~/temp/android-ndk-r10c:$PATH

#for nvm setting
if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/sho/.gvm/bin/gvm-init.sh" ]] &&
source "/Users/sho/.gvm/bin/gvm-init.sh"

#export PATH=~"/.gvm/bin:$PATH"
#[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
#export ANDROID_HOME=/usr/local/Cellar/android-sdk/22.6.2/
export ANDROID_HOME=/Users/sho/Library/Android/sdk/
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java
#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.6"`
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`

#export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH=$PATH:/Users/sho/Library/Android/sdk/platform-tools/

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

export HUBOT_YAHOO_AMAGUMO_APP_ID="dj0zaiZpPU1NVmZobnl4Ulp5dCZzPWNvbnN1bWVyc2VjcmV0Jng9Yjk-"

export ANDROID_HOME=/Users/sho/Library/Android/sdk/
#export ANDROID_NDK_PATH=/Users/sho/Library/Android/ndk/
export ANDROID_NDK_PATH=/Users/sho/Library/Android/android-ndk-r9d
export ANDROID_NDK_ROOT=$ANDROID_NDK_PATH
export PATH=$PATH:$ANDROID_NDK_PATH
