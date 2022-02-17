export MANAGER=zplug

[ -f ~/.zsh-profile/manager/$MANAGER/pre-install.zsh ] && source ~/.zsh-profile/manager/$MANAGER/pre-install.zsh
source ~/.zsh-profile/manager/$MANAGER/install.zsh
[ -f ~/.zsh-profile/manager/$MANAGER/post-install.zsh ] && source ~/.zsh-profile/manager/$MANAGER/post-install.zsh
