# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Base Config
zinit light Aloxaf/fzf-tab
zinit light paulirish/git-open

zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# OMZ Config
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# Binary support
zinit as="null" wait="1" lucid from="gh-r" for \
    mv="exa* -> exa" sbin="bin/exa" ogham/exa \
    mv="*/rg -> rg"  sbin           BurntSushi/ripgrep \
    mv="fd* -> fd"   sbin="fd/fd"   @sharkdp/fd \
    sbin="fzf"       junegunn/fzf


zinit ice mv="*.zsh -> _fzf" as="completion"
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
zinit ice as="completion"
zinit snippet 'https://github.com/ogham/exa/blob/master/completions/zsh/_exa'
zinit ice as="completion"
zinit snippet 'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker'
zinit ice as="completion"
zinit snippet 'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose'
zinit ice wait lucid atload"zicompinit; zicdreplay" atclone'./zplug.zsh'
zinit light g-plane/zsh-yarn-autocompletions
zinit ice lucid nocompile as'completion' pick'null' wait
zinit snippet OMZ::plugins/gradle

[ -f ~/.zsh-profile/env.profile ] && source ~/.zsh-profile/env.profile
[ -f ~/.zsh-profile/alias.profile ] && source ~/.zsh-profile/alias.profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

