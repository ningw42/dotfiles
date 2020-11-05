### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Plugins
# powerlevel10k prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# snippets from OhMyZsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found
zinit snippet OMZP::fzf			# requires fzf installed
zinit snippet OMZP::autojump		# requires autojump installed
zinit snippet OMZP::golang
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# standalone plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light 3v1n0/zsh-bash-completions-fallback

# DO make sure syntax highlighting is loaded at last
zinit light zdharma/fast-syntax-highlighting

# Alias
# replace vim with neovim
alias vim=nvim
# replace ls with exa
alias ls=exa
alias ll="exa -lh"
alias la="exa -lah"
# navigation
alias ..="cd .."
alias ...="cd ../.."

# Environment vaiables
# EDITOR
export EDITOR=nvim

# Platform dependent plugins/configs
if [[ `uname` == "Darwin" ]]; then
    # macOS specific

    # Homebrew bottles
    # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
    # fzf managed by Homebrew
    # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # autojump managed by Homebrew
    # [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
elif [[ `uname` == "Linux" ]]; then
    # Arch Linux specific

    # fzf managed by pacman
    # [[ -s /usr/share/fzf/key-bindings.zsh ]] && [[ -s /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh
    # autojump managed by yay
    # [[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
else
    echo "Unknown OS"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH options
# enable zsh history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# enable auto cd
setopt auto_cd
# restore emacs key bindings
bindkey -e

# Generate completions
autoload -Uz compinit; compinit

# Post-load config
# Make sure 'safari' theme is choosen for fast-syntax-highlighting
fast-theme safari > /dev/null

