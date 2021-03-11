alias ls='exa'
alias ll='ls -lFh'
alias la='ls -a'
alias l='ls -CF'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gco='git checkout'

alias anywhere='http-server'

alias dc="docker-compose"

alias jdk8="export JAVA_HOME='$(/usr/libexec/java_home -v 1.8)'"
alias jdk11="export JAVA_HOME='$(/usr/libexec/java_home -v 11)'"
alias jdk15="export JAVA_HOME='$(/usr/libexec/java_home -v 15)'"
jdk11

alias drone="DRONE_SERVER=https://ci.ilio.tech DRONE_TOKEN=3Y3L6ldYf2Gl4337cywjCTs0jWHNEFeW drone"

alias docker-shell="docker run -it --rm --privileged --pid=host busybox nsenter -t 1 -m -u -n -i sh"
alias docker-alpine="docker run -it --rm alpine /bin/sh -c \"sed -i 's/https/http/g' /etc/apk/repositories && apk --no-cache add ca-certificates && /bin/sh\""
alias docker-alpine-mirror="docker run -it --rm alpine /bin/sh -c \"sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && /bin/sh\""
function docker-attach() {
    docker exec -it $1 /bin/sh
}
