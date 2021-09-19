# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_MODE="awesome-patched"

DEFAULT_USER=$USER

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs custom_kube_ps1)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# run this script for colors:
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
# getColorCode foreground
# getColorCode background

# `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='035'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='035'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='215'

# `dir` color customization
POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_BACKGROUND='025'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='025'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='025'
POWERLEVEL9K_DIR_ETC_FOREGROUND='255'
POWERLEVEL9K_DIR_ETC_BACKGROUND='025'

POWERLEVEL9K_DIR_PATH_SEPARATOR="  "

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions docker z fzf kubectl brew kube-ps1)

source $ZSH/oh-my-zsh.sh

# User configuration

source ~/.bash_profile

#unsetopt inc_append_history
#unsetopt share_history
setopt share_history
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


bindkey "\e\eOD" backward-word 
bindkey "\e\eOC" forward-word
bindkey '^[^M' self-insert-unmeta

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}

pastefinish() {
    zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

autoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd v edit-command-lineautoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd v edit-command-line