# All custom aliases

# Apt
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptupdg="sudo apt update && sudo apt upgrade"
alias aptrm="sudo apt remove"
alias aptin="sudo apt install"
alias aptar="sudo apt autoremove"

# Pacman
alias pacview="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pacup="sudo pacman -Syu"

# Paru
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print $2}\")' | xargs -ro paru -S"

# Git
function gsq() {
  git reset --soft HEAD~$1
  git commit --amend --no-edit
}

function gcsq() {
  git commit -m "Throwaway message"
  gsq $1
}

function gdd() {
  nvim -c "DiffviewOpen -- $1"
}

# Python
penv() {
  source .venv/bin/activate
}

penvm() {
  source $HOME/.venv/main/bin/activate
}


# Java
alias gw="./gradlew"
