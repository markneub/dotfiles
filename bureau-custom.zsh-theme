# oh-my-zsh Bureau Theme
# customized by MAN to
# - simplify prompt
# - remove right-side statuses
# - remove newline at each new prompt

if [[ $EUID -eq 0 ]]; then
  _LIBERTY="%{$fg[red]%}#"
else
  _LIBERTY="%{$fg[green]%}$"
fi
_LIBERTY="$_LIBERTY%{$reset_color%}"

bureau_precmd () {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}

setopt prompt_subst
PROMPT='$_LIBERTY '

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
