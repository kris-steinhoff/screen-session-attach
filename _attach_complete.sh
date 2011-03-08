#!/bin/bash

_attach_complete ()
{
    screens=`screen -ls | while read s dump; do echo $s | grep '[0-9]\..*' &> /dev/null; rc=$?; if [ ${rc} -eq 0 ]; then echo $s | awk -F. '{ print $2 }'; fi; done`
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W "${screens}" -- $curw))
    return 0
}

complete -F _attach_complete attach
