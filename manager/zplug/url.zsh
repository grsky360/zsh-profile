__zplug::sources::url::check()
{
    local    repo="$1"
    local -A tags

    __zplug::core::tags::parse "$repo"
    tags=( "${reply[@]}" )

    tags[dir]="$( echo $tags[dir] | sed -e "s#$tags[name]#${tags[name]:t:r}#" )"

    [[ -n $tags[dir] ]] && [[ -d $tags[dir] ]]
    return $status
}

__zplug::sources::url::install()
{
    local repo="$1"
    local -A tags
    local cmd url

    __zplug::core::tags::parse "$repo"
    tags=( "${reply[@]}" )
    tags[dir]="$( echo $tags[dir] | sed -e "s#$tags[name]#${tags[name]:t:r}#" )"

    # Already downloaded
    if __zplug::sources::url::check "$repo"; then
        return 0
    fi

    if (( $+commands[curl] )); then
        cmd="curl -s -L"
        if [[ -n $tags[rename-to] ]]; then
            cmd+=" -o $tags[rename-to]"
        else
            cmd+=" -O"
        fi
    elif (( $+commands[wget] )); then
        cmd="wget ${tags[rename-to]:+-O ${tags[rename-to]}}"
    fi
    url="$tags[name]"

    (
    __zplug::utils::shell::cd \
        --force \
        "$tags[dir]"

    eval "$cmd $url" \
        2> >(__zplug::io::log::capture) >/dev/null

    for file in *
    do
        case "$file" in
            *.zip)
                cmd="unzip"
                ;;
            *.tar.gz)
                cmd="tar xzvf"
                ;;
            *.tar.bz)
                cmd="tar xjvf"
                ;;
            *.rar)
                cmd="unrar e"
                ;;
        esac
        eval "$cmd $file" 2> >(__zplug::io::log::capture) >/dev/null
    done
    )

    return $status
}

__zplug::sources::url::update()
{
    __zplug::sources::url::install "$1"
    return $status
}

__zplug::sources::url::load_plugin()
{
    # TODO
}

__zplug::sources::url::load_command()
{
    local    repo="$1"
    local -A tags
    local -a sources
    local    dst
    local -a load_fpaths load_commands

    __zplug::core::tags::parse "$repo"
    tags=( "${reply[@]}" )
    tags[dir]="$( echo $tags[dir] | sed -e "s#$tags[name]#${tags[name]:t:r}#" )"

    dst=${${tags[rename-to]:+$ZPLUG_HOME/bin/$tags[rename-to]}:-"$ZPLUG_HOME/bin"}

    sources=( ${(@f)"$( \
        __zplug::utils::shell::expand_glob "$tags[dir]/${tags[use]}" "(N-)"
    )"} )

    for src in "${sources[@]}"
    do
        load_commands+=("$src\0$dst")
    done

    reply=()
    [[ -n $load_fpaths ]] && reply+=( load_fpaths "${(F)load_fpaths}" )
    [[ -n $load_commands ]] && reply+=( load_commands "${(F)load_commands}" )

    return 0
}
