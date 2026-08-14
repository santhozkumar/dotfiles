# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# tat function to attach to tmux session
function tat {
  name=$(basename $(pwd) | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}

alias cl='clear'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gpl='git pull'
alias gps='git push'

#log
alias gl='git log'
alias glg='git log --graph --oneline --all'
alias gll='git log --oneline --decorate --all --graph'
alias gd='git diff'

alias gb='git branch'
alias gba='git branch -a'
alias gcan='git commit --amend --no-edit'
alias gcan!='git commit --amend --no-edit && git push --force-with-lease'

function jqplay {
  printf '' | fzf --print-query \
    --query='.' \
    --preview "jq -C {q} '$1' 2>&1" \
    --preview-window=up:80%
}

function showcommit {
  commit=${1:-HEAD}
  git show --stat=120 --format="" "$commit" |
    grep '|' |
    fzf --ansi \
      --disabled \
      --bind 'j:down,k:up,q:abort' \
      --preview="echo {} | sed 's/ *|.*//' | xargs -I% git show --color=always $commit -- %" \
      --preview-window=right:60%
}

function ek {
  export KUBECONFIG=$(readlink -f $1)
}
