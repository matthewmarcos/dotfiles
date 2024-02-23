# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SERVICE_ACCOUNTS_FOLDER="/Users/matthew/helpers/service_account_keys"


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export UPDATE_ZSH_DAYS=30

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
    auto-notify
    brew
    colorize
    command-not-found
    copyfile
    cp
    direnv
    dotenv
    extract
    git
    history
    history-substring-search
    npm
    macos
    rsync
    safe-paste
    vi-mode
    zsh-nvm
)

# Auto Notify settings
# Set threshold to 20seconds
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! \`%command\` has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
export ZSH_COLORIZE_TOOL=chroma
AUTO_NOTIFY_IGNORE+=("docker" "git" "python" "docker-compose" "man" "sleep" "htop" "yarn" "node" "npm" "yarn" "tmux" "vim")


export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.tmux:$PATH"

export TERM=xterm-256color
[ -n "$TMUX"  ] && export TERM=screen-256color

# Preferred editor for local and remote sessions
export EDITOR='vim'

alias work="cd $HOME/Code"
alias remote="cd $HOME/remote"
alias wget="wget -c"
alias vs="code"
alias vimrc="vim $HOME/.vimrc"
alias vimsrc="vim $HOME/shortcuts.vimrc"
alias zshrc="vim $HOME/.zshrc && source $HOME/.zshrc"
alias zshsrc="source $HOME/.zshrc"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CFA'
alias ls='ls -lah'
alias c='clear'
alias tmux="tmux -2"
alias setclip='pbcopy'
alias getclip='pbpaste'
alias getpwd='pwd | setclip'
alias v='vim'
alias sa="conda activate"
alias sd="conda deactivate"
alias conda-ls="conda info --envs"
alias nopasswd="eval $(ssh-agent)"
alias dup="docker-compose up -d"
alias ddown="docker-compose down"
alias drs="docker-compose restart"
alias gbrd="git branch | grep -v "master" | xargs git branch -D"
alias docker-rb='docker-compose -f docker-compose.yml build --force-rm'
alias savessh='ssh-add ~/.ssh/id_rsa'
alias ytd="yt-dlp"
alias ytdp="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\""
alias ytdm='yt-dlp -ci -f "bestaudio[ext=m4a]"'
alias portblocker="lsof -i"  # portblocker <portNumber>
alias helpers="cd ~/helpers"
alias db="pushd ~/helpers/database-containers && dup || popd"
alias dbd="pushd ~/helpers/database-containers && ddown || popd"
alias sshconfig="vim $HOME/.ssh/config"


function mcd() {
    mkdir $1 && cd $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export HH_CONFIG=hicolor        # get more colors

export LC_ALL=en_US.UTF-8

##############################################################################
# History Configuration
##############################################################################
export HISTTIMEFORMAT="%d/%m/%y %T"
export HISTSIZE=5000               #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history     #Where to save history to disk
export SAVEHIST=50000               #Number of history entries to save to disk
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killedpath=(~/.zsh/completion $fpath)
setopt completealiases

source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

