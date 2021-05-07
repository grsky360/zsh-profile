alias ls='exa'
alias ll='ls -lFhg'
alias la='ls -a'
alias l='ls -CF'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gco='git checkout'
alias gitc='git checkout'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias anywhere='http-server'

alias dc="docker-compose"

function jdk() {
    version=$1
    if [ $# = 0 ]; then
        version=1.8
    fi
    export JAVA_HOME="$(/usr/libexec/java_home -v ${version})"
}
alias jdk8="jdk 1.8"
alias jdk11="jdk 11"
jdk 1.8

alias sdkmanager="jdk8 && sdkmanager"

alias drone="DRONE_SERVER=https://ci.ilio.tech DRONE_TOKEN=3Y3L6ldYf2Gl4337cywjCTs0jWHNEFeW drone"

alias docker-shell="docker run -it --rm --privileged --pid=host busybox nsenter -t 1 -m -u -n -i sh"
alias docker-alpine="docker run -it --rm alpine /bin/sh -c \"sed -i 's/https/http/g' /etc/apk/repositories && apk --no-cache add ca-certificates && /bin/sh\""
alias docker-alpine-mirror="docker run -it --rm alpine /bin/sh -c \"sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && /bin/sh\""

function docker-attach() {
    docker exec -it $1 /bin/sh
}

function docker-attach-new() {
    docker run -it --rm $@
}


alias gradlew="./gradlew"
