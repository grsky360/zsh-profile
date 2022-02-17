ZPLUG_HOME=~/.zplug

if [ ! -d ${ZPLUG_HOME} ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source $ZPLUG_HOME/init.zsh

# [ ! -f $ZPLUG_HOME/base/sources/url.zsh ] && cp ~/.zsh-profile/manager/zplug/url.zsh $ZPLUG_HOME/base/sources/url.zsh
