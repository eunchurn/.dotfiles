#!/bin/bash

# GIT ALIASES
# ===========

alias         g='git'


# Status and Information
alias        gb='LESS="-FRX" git branch'
# alias        gs='git status'
alias       gss='git status -s'
alias       gsh='git show'
alias      gshf='git show --name-only'

alias        gt='git tag'
alias       gtn='git tag -n'
alias        gd='git diff'
alias       gds='git diff --staged'
alias       gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias        gl='git log --decorate --color         --oneline'
alias       glg='git log --decorate --color --graph --oneline'
alias      glga='git log --decorate --color --graph --oneline --all'
alias       gla='git log --decorate --color --graph'
alias      glaa='git log --decorate --color --graph           --all --stat --show-signature'

  # gl="git log --graph --pretty=format:'%C(red)%h - %Creset%s'"
  ## https://coderwall.com/p/euwpig/a-better-git-log


# Staging and Commiting
alias        ga='git add'
alias        gu='git add -u'
alias       gaa='git add -A'
alias       guc='gu  && gc'
alias       gac='gaa && gc'
alias       gst='git stash'
alias      gstm='gst push -m'

  # gc moved to functions.sh


# Branches and Remotes
alias        gm='git merge'
alias       gco='git checkout'
alias      gcob='gco -b'
alias        gr='git remote'
alias       grv='gr -v'
alias       gra='gr add'
alias      grap='gr set-url --add --push'


# Pushing, Pulling and Deploying
alias        gp='git push'
alias       gpp='git push origin $(current_branch)'
alias       gpt='gpp --tags'
alias     gpull='git pull origin $(current_branch)'
alias     gpdep='gpdeploy'
alias     gpher='gpheroku'
alias  gpdeploy='gp && cap production deploy'
alias  gpheroku='gp && gp heroku master'


# Others
alias       grb='git rebase -i'
alias       grt='gitroot'
alias   gitroot='cd "$(git rev-parse --show-toplevel || echo .)"'
alias  gitcount='git rev-list HEAD --count'
alias   gsearch='gitsearch'
alias gitsearch='gla -p -S'
alias gitconfig='less -P "(END)" $(git rev-parse --show-toplevel)/.git/config'


