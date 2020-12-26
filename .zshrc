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
zinit snippet OMZP::sudo
zinit snippet OMZP::fzf				# requires fzf installed
zinit snippet OMZP::autojump			# requires autojump installed
zinit snippet OMZP::golang 			# requires golang installed
zinit snippet OMZP::git				# requires git installed
zinit snippet OMZP::rsync			# requires rsync installed
if [[ `uname` == "Darwin" ]]; then
    # macOS specific
    zinit snippet OMZP::sublime 		# made macOS specific since I barely use Linux GUI
    zinit snippet OMZP::vscode 			# made macOS specific since I barely use Linux GUI
    zinit ice svn; zinit snippet OMZP::osx	# use svn ice to obtain all sources for plugin
elif [[ `uname` == "Linux" ]]; then
    # Arch Linux specific
    # This is the wrong way but Arch Linux is the default Linux distro for me
    zinit snippet OMZP::systemd
else
    echo "Unknown OS"
fi


# standalone plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light 3v1n0/zsh-bash-completions-fallback

# DO make sure syntax highlighting is loaded at last
zinit light zdharma/fast-syntax-highlighting

# Alias
# replace vim with neovim
alias vim="nvim"
# replace ls with exa
alias ls="exa"
alias ll="exa -lgh" 	# long view with group and header
alias la="exa -algh" 	# long view with group and header for all files/directories
# navigation
alias ..="cd .."
alias ...="cd ../.."

# Environment vaiables
# EDITOR
export EDITOR=nvim

# Platform dependent configs
if [[ `uname` == "Darwin" ]]; then
    # macOS specific
    # Homebrew bottles
    # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
elif [[ `uname` == "Linux" ]]; then
    # Arch Linux specific
    # This is the wrong way but Arch Linux is the default Linux distro for me
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

