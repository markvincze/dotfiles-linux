# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export OS="$(uname | tr '[:upper:]' '[:lower:]')"

function __is_available {
  prog="${1}"
  os="${2}"

  if [ "${os}" != "" ] && [ "${os}" != "${OS}" ]
  then 
    return 1
  fi

  type "${prog}" > /dev/null 
  return "$?"
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="lambda-gitster"
ZSH_THEME="pi"
# ZSH_THEME="geometry"
# ZSH_THEME="agnoster"
# ZSH_THEME="headline"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

bindkey '^H' backward-kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=$PATH:~/Tools
export PATH=$PATH:~/Tools/protoc/bin
export PATH=$PATH:~/Tools/golangci-lint/bin

export GOPRIVATE=gitlab.com/refurbed/engineering/*
export GONOSUMDB=gitlab.com/refurbed/engineering/*

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshc="nvim ~/.zshrc"
alias swayc="nvim ~/.config/sway/config"
alias ghosttyc="nvim ~/.config/ghostty/config.ghostty"
alias cdp="cd ~/Workspaces/GitLab/refurbed/platform"
alias dpss="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.State}}\""
alias k=kubectl
alias wolpc="wol 70:85:c2:6f:ab:63"
alias nvimc='nvim -c "cd ~/.config/nvim" ~/.config/nvim/init.lua'
alias grebm='curr=$(git_current_branch) && git co $(git_main_branch) && git pull && git co $curr && git rebase $(git_main_branch)'
alias cls=clear
alias pacman-full-updaet='pacman -Syu'

function refb_db_proxy {
  project="${1}"
  db_name="${2}"

  # while true
  #   do
  gcloud pam grants create --location=global --project=${project} --entitlement=grant-platform-database-access --requested-duration=1800s --justification="I need to check the addon configuration" || true
      # timeout 1800s
  cloud-sql-proxy ${project}:europe-west3:${db_name} --port 2222 --auto-iam-authn
    # done
}

alias dbprev='refb_db_proxy refb-platform-preview platform-8f4c-15'
alias dbprod='refb_db_proxy refb-platform-production platform-19af-15'

# https://github.com/eza-community/eza
__is_available eza \
&& alias ls='eza  --time-style=relative --git --octal-permissions --icons \
  --color=auto --binary -lag' \
&& alias ll='eza  --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -la' \
&& alias la='eza  --time-style=long-iso --git --octal-permissions         \
  --color=auto --binary --changed -lahHgnuU' \
&& alias l='eza   --time-style=long-iso --git                     --icons \
  --color=auto --binary -l --no-time' \
&& alias lls='eza --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -las modified' \
&& alias l1='eza  -1 --icons=never --color=auto'

# Completion for eza
export FPATH="~/Workspaces/GitHub/eza-community/eza/completions/zsh:$FPATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Checking to start ssh-agent"
# Start ssh-agent if it's not running yet.
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    echo "ssh-agent is not running, starting"
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    #ssh-add ~/.ssh/id_ed25519 2>/dev/null
    ssh-add ~/.ssh/id_ed25519
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    echo "Doing some ssh-agent env stuff"
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
export HSTR_CONFIG=raw-history-view
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$( { </dev/tty hstr -- ${BUFFER}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
bindkey '\C-r' hstr_no_tiocsti
export HSTR_TIOCSTI=n

. "$HOME/.local/bin/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mark/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mark/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mark/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mark/Tools/google-cloud-sdk/completion.zsh.inc'; fi
