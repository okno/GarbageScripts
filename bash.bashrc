# Colori, Grazie Staz404! 
# Al TPO ti sei fatto valere! #zapolandia #forzachiara
GREEN_BOLD='\[\033[1;92m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
LIGHT_RED_BOLD='\[\033[1;91m\]'
LIGHT_BLUE='\[\033[0;94m\]'
WHITE_BOLD='\[\033[1;97m\]'
RESET_COLOR='\[\033[0m\]'

# Prematurato il prompt? 
PS1="${YELLOW}[\$(date '+%Y-%m-%d %H:%M')]${RESET_COLOR} ${LIGHT_RED_BOLD}\h${RESET_COLOR}:${LIGHT_BLUE}\w${RESET_COLOR}"
PS1+="\n\[\033[1;97m\]\[\033[1m\]▼ ${GREEN_BOLD}\u${RESET_COLOR} $>_\[\033[0m\] "

# Antani Alias dalla Germania
alias dmesg="dmesg -TL -wx --follow"
alias ls="ls --color"
alias tailf="tail -f"
alias ll="ls -al"
alias torarm="sudo -u debian-tor arm"
alias maps="telnet mapscii.me"
alias mioip="curl --socks5 127.0.0.1:9050 http://checkip.amazonaws.com/"

# Stuzzica?! Lo vede il dito?
echo "set -g mouse on" > ~/.tmux.conf

# Cos'è il Genio? 
clean_ram() {
    echo "############### RAM CLEAN ###############"
    free -m
    echo "# START Cleaning"
    sync; echo 3 > /proc/sys/vm/drop_caches
    echo 1 > /proc/sys/vm/drop_caches
    sync; echo 2 > /proc/sys/vm/drop_caches
    swapoff -a && sudo swapon -a
    echo "# DONE!"
    free -m
}

# È fantasia, intuizione, decisione e velocità d'esecuzione
via() {
tmux new-session -d -s mysession
tmux split-window -h
tmux split-window -v
tmux send-keys -t mysession:0.1 "ping 1.1.1.1" C-m
tmux send-keys -t mysession:0.2 "htop" C-m
tmux select-layout -t mysession main-vertical
tmux attach-session -t mysession
}

# La cacatella longa, longa longa... 
echo -ne "\033]0;$(whoami)@$(hostname)\007"
echo "# Ambiente avviato"
echo "> clean_ram(root),torarm(root),via,maps,mioip"
