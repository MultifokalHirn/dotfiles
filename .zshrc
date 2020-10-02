# timer=$(($(gdate +%s%N) / 1000000))
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# zmodload zsh/zprof
fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="/Users/lw/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship" #robbyrussell"

SPACESHIP_KUBECONTEXT_SHOW=false # nondefault
SPACESHIP_JOBS_SHOW=false        # nondefault
SPACESHIP_EXIT_CODE_SHOW=true    # nondefault
SPACESHIP_BATTERY_SHOW=false     # nondefault
SPACESHIP_VI_MODE_SHOW=false     # nondefault
SPACESHIP_EMBER_SHOW=false       # nondefault
SPACESHIP_DOTNET_SHOW=false      # nondefault
SPACESHIP_CONDA_SHOW=false       # nondefault
SPACESHIP_AWS_SHOW=false         # nondefault
SPACESHIP_JULIA_SHOW=false       # nondefault
SPACESHIP_RUST_SHOW=false        # nondefault
SPACESHIP_SWIFT_SHOW_LOCAL=false # nondefault
SPACESHIP_GOLANG_SHOW=false      # nondefault
SPACESHIP_PHP_SHOW=false         # nondefault
SPACESHIP_ELIXIR_SHOW=false      # nondefault
SPACESHIP_HG_SHOW=false          # nondefault
SPACESHIP_TIME_SHOW=true         # nondefault

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-interactive-cd)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# source ~/.local/share/icons-in-terminal/icons_bash.sh
export HOMEBREW_NO_ANALYTICS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH=/usr/local/sbin:$PATH
export PATH="$PATH:/usr/local/opt/ncurses/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# python
export BETTER_EXCEPTIONS=1
export PIPENV_VENV_IN_PROJECT=1
eval "$(pyenv init -)"
# export PATH=$PATH:/Users/lw/Library/Python/2.7/bin
# export PATH=$PATH:/Users/lw/Library/Python/3.7/bin
# tkinter
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# haskell
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# export PATH=$PATH:/Users/lw/.local/bin:$HOME/.cabal/bin:/Users/lw/.ghcup/bin/
# export PATH=$PATH:~/.roswell/bin

# ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# eval "$(rbenv init -)"

# java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-14.jdk/Contents/Home

# google-cloud
# source /Users/lw/google-cloud-sdk/completion.zsh.inc
# source /Users/lw/google-cloud-sdk/path.zsh.inc
prod_flask() {
  kubectl exec -it $(kubectl get pods | grep dashboard | head -n 1 | awk '{print $1}') -- flask shell
}
# alias prod_flask="kubectl exec -it $(kubectl get pods | grep dashboard | head -n 1 | awk '{print $1}') -- flask shell"

# eval $(thefuck --alias --enable-experimental-instant-mode)
# zprof

alias findpid="ps axww -o pid,user,%cpu,%mem,start,time,command | selecta | sed 's/^ *//' | cut -f1 -d' '"
alias pid=findpid

change-project() {
  cd $(find ~/Documents/GitHub -maxdepth 1 -type d | selecta)
}

show-file() {
  cat $(ls | selecta)
}

auto-retry() {
  false
  while [ $? -ne 0 ]; do
    "$@" || (
      sleep 1
      false
    )
  done
}

# chpwd() ls -a

# source $HOME/.aliases
alias p="change-project"
alias s="show-file"
alias la="ls -lah"
alias ls=lsd
alias lw="ssh lw"
alias update="brew update; brew upgrade" # update brew apps/libs

#################

# now=$(($(gdate +%s%N) / 1000000))
# elapsed=$(($now - $timer))
# echo $elapsed":" $plugin

# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
# autoload -Uz compinit
#if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
#	compinit;
#else
#	compinit -C;
#fi;


