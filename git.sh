#!/bin/bash
alias apply='git cherry-pick'

function pull()
{
    GIT_BRANCH="$(git branch --show-current)"
    [[ -z "$GIT_BRANCH" ]] || git pull origin "$GIT_BRANCH"
    git submodule update --init --recursive
}

function push()
{
    GIT_BRANCH="$(git branch --show-current)"
    if [[ "$(echo "$GIT_BRANCH" | grep -cP '^(develop|main|master)$')" == '1' && "$1" != "$GIT_BRANCH" ]]; then
        printf "\e[31mERROR: Yer on $GIT_BRANCH"'!\e[0m\n'
        echo "If you really want to push to $GIT_BRANCH, show you mean it:"
        echo "$ push $GIT_BRANCH"
        return 1
    fi
    git push $([[ "$(echo $1 | grep -cP '^-*f(orce)?$')" != '0' ]] && echo '--force ')origin "$(git branch --show-current)"
}

alias staged='git diff --staged'
alias status='git status'
