# oh-my-zsh Bureau Theme
# customized by MAN to
# - simplify prompt
# - remove right-side statuses
# - remove newline at each new prompt

_PATH="%{$fg_bold[white]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"

_1LEFT="$_USERNAME $_PATH"

bureau_precmd () {
  # https://stackoverflow.com/a/42509260
  if [[ "$NEW_LINE" = true ]] then
      if [[ "${ADD_NEW_LINE}" = true ]] then
          _1LEFT=$'\n'"${_1LEFT}"
          ADD_NEW_LINE=false
      fi
  else
      _1LEFT="${_1LEFT}"
      NEW_LINE=true
      ADD_NEW_LINE=true
  fi
  print -rP "$_1LEFT"
}

setopt prompt_subst
PROMPT='$_LIBERTY '
RPROMPT=''

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
