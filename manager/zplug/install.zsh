zplug romkatv/powerlevel10k, as:theme, depth:1

zplug "ogham/exa", from:gh-r, as:command, rename-to:exa, use:"*macos*x86_64*"
zplug "junegunn/fzf", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
zplug "Aloxaf/fzf-tab", depth:1, use:"fzf-tab.plugin.zsh", defer:2

zplug "lib/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", defer:2

zplug "junegunn/fzf", defer:2, use:"completion.zsh"
zplug "junegunn/fzf", defer:2, use:"key-bindings.zsh"
zplug "ogham/exa", defer:2, use:"completions/zsh/_exa"
zplug "plugins/gradle", from:oh-my-zsh, defer:2

[ -f ~/.zsh-profile/env.profile ] && source ~/.zsh-profile/env.profile
[ -f ~/.zsh-profile/alias.profile ] && source ~/.zsh-profile/alias.profile

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
