# REF https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion

GIT_AHEAD="%F{magenta}%B↑%b"
GIT_BEHIND="%F{green}%B↓%b"
GIT_STAGED="%F{green}%B●%b"
GIT_UNSTAGED="%F{yellow}%B●%b"
GIT_UNTRACKED="%F{white}%B●%b"
GIT_UNMERGED="%F{red}%B✕%b"

function get_git_path() {
  echo $(git rev-parse --show-toplevel 2> /dev/null)
}

function git_prompt() {
  if [ -z "$(get_git_path)" ]; then
    return
  fi

  git_status=$(git status -sb)
  header=$(echo $git_status | sed '1p;d')
  files=$(echo $git_status | sed 1d | cut -c1-2)

  STATUS=""

  # Ahead
  if [[ "$(echo $header)" =~ "\[.*ahead.*\]" ]]; then
    STATUS="$STATUS$GIT_AHEAD"
  fi

  # Behind
  if [[ "$(echo $header)" =~ "\[.*behind.*\]" ]]; then
    STATUS="$STATUS$GIT_BEHIND"
  fi

  # Staged
  if [[ "$(echo $files)" =~ "([MDTARC][ MTD])" ]] then
    STATUS="$STATUS$GIT_STAGED"
  fi

  # Unstaged
  if [[ "$(echo $files)" =~ "([ MTARC][MTDRC])" ]] then
    STATUS="$STATUS$GIT_UNSTAGED"
  fi

  # Untracked
  if [[ "$(echo $files)" =~ "\?\?" ]] then
    STATUS="$STATUS$GIT_UNTRACKED"
  fi

  # Unmerged
  if [[ "$(echo $files)" =~ "(A[AU]|D[DU]|U[DAU])" ]] then
    STATUS="$STATUS$GIT_UNMERGED"
  fi
  
  if [[ ! -z "$STATUS" ]]; then
    STATUS=" $STATUS"
  fi

  echo "%F{white}< %F{yellow}$(git_current_branch)${STATUS}%F{white} > "
}

TIME="%F{blue}%*"

function get_dir_path() {
  DIR_PATH="%F{green}"
  git_path=$(get_git_path)
  if [ -z "$git_path" ]; then
    echo "$DIR_PATH%~"
    return
  fi

  cur_dir=$(pwd)
  final_dir="> $(basename $git_path)${cur_dir/$git_path/}"

  echo "$DIR_PATH$final_dir"
}

ICON_EMOJI="%F{white}🌷"
if [ "$(whoami)" = "root" ]; then
    ICON_EMOJI='🌱'
fi

USER_NAME="%F{magenta}%n%F"
DOCKER_PROMPT=""

if test -f /.dockerenv; then
	PROMPT_DOCKER=" 🐋"
fi

PROMPT='$TIME $(get_dir_path) $ICON_EMOJI '
RPROMPT='$(git_prompt)$USER_NAME$DOCKER_PROMPT'
