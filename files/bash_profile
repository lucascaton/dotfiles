export CLICOLOR="auto"
export EDITOR="mvim"
export GEM_EDITOR="mvim"
export ARCHFLAGS="-arch x86_64"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;37;41"

export BLUE="\[\033[0;34m\]"
export NO_COLOR="\[\e[0m\]"
export GRAY="\[\033[1;30m\]"
export GREEN="\[\033[0;32m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export LIGHT_RED="\[\033[1;31m\]"
export RED="\[\033[0;31m\]"
export WHITE="\[\033[1;37m\]"
export YELLOW="\[\033[0;33m\]"
export CYAN="\[\033[0;36m\]"
export PURPLE="\[\033[0;35m\]"

# rvm
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

# enable programmable completion features (you don't need to enable this, if it's
# already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi

# personal_configs
if [[ -s $HOME/.personal_configs ]] ; then source $HOME/.personal_configs ; fi

# git
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %Cblue%an%Creset - %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias gs='git status'
alias gd='git diff'
alias gds='git diff HEAD^ HEAD'
alias gm='git merge'
alias ga='git add'
alias gr='git rm'
alias gp='git pull --rebase'

# ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# rails 2 aliases
alias ss='script/server'
alias ssd='script/server --debugger'
alias sc='script/console'
alias scs='script/console --sandbox'
alias sg='script/generate'

# rails 3 aliases
alias rs='rails s'
alias rsd='rails s --debugger'
alias us='unicorn_rails --port 3000'
alias usd='unicorn_rails --port 3000 --debug'
alias rc='rails c'
alias rg='rails g'

# rails 3.1 aliases
alias bassets='bundle exec rake assets:clean assets:precompile'
alias bassetsc='bundle exec rake assets:clean'

# others aliases
alias duh='du -h -d=1'
alias annotate='bundle exec annotate -p before'

# bundle
alias brake='bundle exec rake'
alias bspec='bundle exec spec'
alias brspec='bundle exec rspec'

# psql
export PGHOST=localhost

# iterm2
export LC_CTYPE=utf-8

# prompt
custom_prompt () {
  history -a
  history -c
  history -r

  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=`git status 2> /dev/null | grep "On branch" | sed 's/# On branch //'`
  fi

  local RUBY_VERSION=`ruby -e "puts RUBY_VERSION"`

  if [ -f Gemfile.lock ]; then
    local RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  local RUBY_PROMPT=""
  local STATUS=`git status 2>/dev/null`
  local PROMPT_COLOR=$GREEN
  local STATE=" "
  local NOTHING_TO_COMMIT="# Initial commit"
  local BEHIND="# Your branch is behind"
  local AHEAD="# Your branch is ahead"
  local UNTRACKED="# Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="# Changed but not updated"
  local TO_BE_COMMITED="# Changes to be committed"
  local CHANGES_NOT_STAGED="# Changes not staged for commit"
  local LOG=`git log -1 2> /dev/null`

  if [[ "$RAILS_VERSION" ]]; then
    local RAILS_PROMPT="${RAILS_VERSION}@"
  fi

  RUBY_PROMPT="${GRAY}[${RAILS_PROMPT}${RUBY_VERSION}]${NO_COLOR} "

  if [ "$STATUS" != "" ]; then
    if [[ "$STATUS" =~ "$CHANGES_NOT_STAGED" ]]; then
      PROMPT_COLOR=$RED
      STATE="*"
    elif [[ "$STATUS" =~ "$NOTHING_TO_COMMIT" ]]; then
      PROMPT_COLOR=$RED
      STATE="*"
    elif [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR=$RED
      STATE="*"
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR=$RED
      STATE="*"
    else
      PROMPT_COLOR=$GREEN
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE="${STATE}${YELLOW}*${NO_COLOR}"
    fi

    PS1="${RUBY_PROMPT}${YELLOW}\w${NO_COLOR} (${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}${NO_COLOR})\n\$ "
  else
    PS1="${RUBY_PROMPT}${YELLOW}\w${NO_COLOR}\n\$ "
  fi
}

PROMPT_COMMAND=custom_prompt
