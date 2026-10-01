# ~/.zshrc

ssh-add ~/.ssh/id_ed25519 2>/dev/null

# ---------------------------------------------------------------------------
# Zinit
# ---------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Completions must be on fpath before compinit
zinit light zsh-users/zsh-completions

# OMZ snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------
[[ -r "$HOME/.dircolors" ]] && eval "$(dircolors -b "$HOME/.dircolors")"

autoload -Uz compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd --color=always $realpath'

# fzf-tab: after compinit, before widget-wrapping plugins
zinit light Aloxaf/fzf-tab

# Deferred (turbo) – syntax highlighting last
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# ---------------------------------------------------------------------------
# Prompt: Oh My Posh (binary managed by zinit)
#   update:   zinit update JanDeDobbeleer/oh-my-posh
#   arm64:    use posh-linux-arm64 in bpick/mv
# ---------------------------------------------------------------------------
zinit ice as"program" from"gh-r" \
  bpick"posh-linux-amd64" mv"posh-linux-amd64 -> oh-my-posh" \
  atclone"chmod +x oh-my-posh" atpull"%atclone" \
  atload'eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.json)"'
zinit light JanDeDobbeleer/oh-my-posh

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ls='lsd --color=auto'
alias grep='grep --color=auto'

alias icat='kitten icat'
alias s='kitten ssh'

alias fzf="fzf --preview 'bat --color=always {} 2>/dev/null || cat {}'"

alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias mkdir='mkdir -v'

alias lg='lazygit'
alias v='nvim'
alias g='git'
alias cs='cowsay'
alias nf='neofetch'
alias ff='fastfetch'

# Bookmarks
alias work='cd ~/work && ls -lA'
alias dotfiles='cd ~/dotfiles && ls -lA'
alias dl='cd ~/Downloads && ls -lA'

# Typos
alias :q='exit'
alias help='man'
alias quit='exit'

# ---------------------------------------------------------------------------
# Shell integrations
# ---------------------------------------------------------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# ---------------------------------------------------------------------------
# Env / PATH
# ---------------------------------------------------------------------------
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH:$HOME/.cargo/bin"

# Vivado
export XILINX_VIVADO=/opt/Xilinx/2026.1/Vivado
export PATH="$XILINX_VIVADO/bin:$PATH"

