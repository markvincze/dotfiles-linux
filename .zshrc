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
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

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
plugins=(git kubectl docker golang python ssh node)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

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

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
export HSTR_CONFIG=raw-history-view
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$( { </dev/tty hstr ${BUFFER}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
bindkey '\C-r' hstr_no_tiocsti
export HSTR_TIOCSTI=n

alias zshc="nvim ~/.zshrc"
alias swayc="nvim ~/.config/sway/config"
alias ghosttyc="nvim ~/.config/ghostty/config"
alias sshpc="ssh mark@192.168.0.4"
alias dpss="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.State}}\""
alias k=kubectl
alias wolpc="wol 70:85:c2:6f:ab:63"
#alias nvimc="nvim ~/.config/nvim/init.lua"
alias nvimc='nvim -c "cd ~/.config/nvim" ~/.config/nvim/init.lua'
alias cdp="cd ~/Workspaces/GitLab/refurbed/platform"
alias grebm='curr=$(git_current_branch) && git co $(git_main_branch) && git pull && git co $curr && git rebase $(git_main_branch)'

# https://github.com/eza-community/eza
__is_available eza \
&& alias ls='eza  --time-style=relative --git --octal-permissions --icons \
  --color=auto --binary -lg' \
&& alias ll='eza  --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -la' \
&& alias la='eza  --time-style=long-iso --git --octal-permissions         \
  --color=auto --binary --changed -lahHgnuU' \
&& alias l='eza   --time-style=long-iso --git                     --icons \
  --color=auto --binary -l --no-time' \
&& alias lls='eza --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -las modified' \
&& alias l1='eza  -1 --icons=never --color=auto'

# Make ctrl+backspace delete a hole word
bindkey '^H' backward-kill-word

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/Tools
export PATH=$PATH:~/Tools/protoc/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/Tools/golangci-lint/bin

export GOPRIVATE=gitlab.com/refurbed/engineering/*
export GONOSUMDB=gitlab.com/refurbed/engineering/*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -z "$SSH_AGENT_PID" ] &&
export SSH_AGENT_PID=$(ps ux | grep -w ssh-agent | grep -vwE 'defunct|grep' | grep -wm1 "$SSH_AUTH_SOCK" | awk '{print $2}')

[ -n "$SSH_AGENT_PID" ] && [ -z "$SSH_AUTH_SOCK" ] &&
export SSH_AUTH_SOCK=$( (ps "$SSH_AGENT_PID" | grep -w -- '-a' | sed "s/.* -a //;s/ .*//" | grep -- /) || (find /tmp/ssh-* -name \*$(($SSH_AGENT_PID-1)) -o -name \*$(($SSH_AGENT_PID-2)) -type s 2> /dev/null) )

( [ -z "$SSH_AGENT_PID" ] || [ -z "$SSH_AUTH_SOCK" ] ) &&
eval $(ssh-agent $([ -n "$SSH_AUTH_SOCK" ] && rm -f "$SSH_AUTH_SOCK" && echo -n "-a $SSH_AUTH_SOCK") -s) 1> /dev/null

ssh-add ~/.ssh/id_ed25519 2>/dev/null
#
### Change terminal background color whether in active SSH session or not
# Function to set background
function set_bg() {
    printf "\033]11;%s\007" "$1"
}

# Function to get current background (if supported)
function get_bg() {
    # Use default fallback if detection fails
    echo "${CURRENT_BG:-#1e1e2e}"
}

# Wrapper for ssh
function ssh() {
    # Save current background dynamically
    DEFAULT_BG="#011627"
    CURRENT_BG="$DEFAULT_BG"  # fallback in case detection fails

    # Try to read current background via escape sequence
    # Some terminals (like Terminator) may not report it, so fallback is used
    # You could manually override DEFAULT_BG if you know your usual color

    # Change to SSH background
    set_bg "#330000"

    # Run actual ssh
    command ssh "$@"

    # Restore original background
    set_bg "$(get_bg)"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mark/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mark/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mark/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mark/Tools/google-cloud-sdk/completion.zsh.inc'; fi

#eval "$(starship init zsh)"
