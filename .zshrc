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
zinit snippet OMZ::lib/completion.zsh
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting
# sudo with ESC-ESC
zinit light hcgraf/zsh-sudo
# powerlevel10k prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Alias
alias vim=nvim
# replace ls with exa
alias ls=exa
alias ll="exa -lh"
alias la="exa -lah"
# navigation
alias ..="cd .."
alias ...="cd ../.."

# Platform dependent plugins/configs
if [[ `uname` == "Darwin" ]]; then
    # macOS specific

    # Homebrew bottles
    # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
    # fzf managed by Homebrew
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # autojump managed by Homebrew
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
elif [[ `uname` == "Linux" ]]; then
    # Arch Linux specific

    # fzf managed by pacman
    [[ -s /usr/share/fzf/key-bindings.zsh ]] && [[ -s /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh
    # autojump managed by yay
    [[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
else
    echo "Unknown OS"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
