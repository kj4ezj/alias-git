#!/bin/bash
alias apply='git cherry-pick'

function pull()
{
    git pull origin "$(git branch --show-current)"
    git submodule update --init --recursive
}

function push()
{
    git push "$([[ "$(echo $1 | grep -cP '^-*f(orce)?$')" != '0' ]] && echo '--force ')"origin "$(git branch --show-current)"
}

alias status='git status'
