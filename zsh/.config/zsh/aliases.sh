# All custom aliases

# Apt
alias aptud="sudo apt update"
alias aptug="sudo apt upgrade"
alias aptudg="sudo apt update && sudo apt upgrade"

# Pacman
alias pacview="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

# Paru
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print $2}\")' | xargs -ro paru -S"

