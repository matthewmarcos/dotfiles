# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM=xterm-256color
[ -n "$TMUX"  ] && export TERM=screen-256color

export GOPATH="$HOME/go/"  # This is supposed to be the default and is not required

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME=$HOME/Android/Sdk

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.tmux:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/bin/jdk1.8.0_181/bin:$PATH"
export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="$HOME/helpers/bin:$PATH"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$HOME/go/bin"
export HISTTIMEFORMAT="%d/%m/%y %T"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv anaconda dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_TIME_BACKGROUND=green
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_ANACONDA_BACKGROUND='248'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='184'
POWERLEVEL9K_ANACONDA_FOREGROUND='232'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_MODE='nerdfont-complete'

export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# TMUX config things. Please refer to https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux
ZSH_TMUX_FIXTERM_WITH_256COLOR="true"
ZSH_TMUX_AUTOSTART="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    battery
    colorize
    command-not-found
    copyfile
    cp
    direnv
    dotenv
    extract
    gcloud
    git
    history
    npm
    safe-paste
    vi-mode
    # zsh-autosuggestions
    # you-should-use
    # zsh-syntax-highlighting
)

# Auto Notify settings
# Set threshold to 20seconds
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! \`%command\` has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
AUTO_NOTIFY_IGNORE+=("docker" "git" "python" "docker-compose" "man" "sleep" "htop" "yarn" "node" "npm" "yarn" "tmux" "gcloud")

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias work="cd $HOME/Code"
alias notebooks="cd $HOME/Code/notebooks"
alias helpers="cd $HOME/helpers"
alias powerup="sudo apt update -y ; sudo apt upgrade -y"
alias wget="wget -c"
alias vs="code"
alias vimrc="vim $HOME/.vimrc"
alias zshrc="vim $HOME/.zshrc && source $HOME/.zshrc"
alias ll="ls -alFh"
alias la="ls -A"
alias l="ls -CFA"
alias c="clear"
alias tmux="tmux -2"
alias temasek="cd $HOME/Code/temasek"
alias setclip="clip.exe"
alias getclip="powershell.exe Get-Clipboard"
alias getpwd="pwd | setclip"
alias v="vim"
alias sa="source activate"
alias sd="conda deactivate"
alias sv="source venv/bin/activate"
alias conda-ls="conda info --envs"
alias nopasswd="eval $(ssh-agent)"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"
alias drs="docker-compose restart"
alias gbrd="git branch | grep -v "master" | xargs git branch -D"
alias docker-rb="docker-compose -f docker-compose.yml build --force-rm"
alias savessh="ssh-add $HOME/.ssh/id_rsa"
alias ytdp="youtube-dl -o \"%(playlist_index)s-%(title)s.%(ext)s\""
alias sshconfig="vim $HOME/.ssh/config"
alias getrsa="cat $HOME/.ssh/id_rsa.pub | setclip"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=human"
alias glfp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=human --first-parent"

function mcd() {
    mkdir $1 && cd $1
}

function containerize() {
    # $1 should be the container name
    # $2 must ben the env file
    # --env-file /Users/matthewmarcos/helpers/env/$2.env \
    docker run -it \
        --volume=`pwd`:/opt/atlassian/pipelines/agent/build \
        --workdir="/opt/atlassian/pipelines/agent/build" \
        --memory=2048m \
        --env BITBUCKET_CLONE_DIR='/opt/atlassian/pipelines/agent/build' \
        $1\
        /bin/bash
}

bindkey -v
bindkey '^R' history-incremental-search-backward

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# add this configuration to ~/.zshrc
export HISTFILE=$HOME/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors

export LC_ALL=en_US.UTF-8

# Docker compose autocomplete
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killedpath=(~/.zsh/completion $fpath)
setopt completealiases

source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export GOOGLE_APPLICATION_CREDENTIALS=""

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Snowflake SnowSQL installer
export PATH=/home/matthew/bin:$PATH
