#         _________  _   _ ____   ____
#        |__  / ___|| | | |  _ \ / ___|
#         / /\___ \| |_| | |_) | |
#       / /_ ___) |  _  |  _ <  |___
# [ ] /____|____/|_| |_|_| \_\\____|
# Oh. My. ZSH! What is THIS?

#-----------#
# Variables #
#-----------#
export MICRO_TRUECOLOR=1
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

#-----#
# OMZ #
#-----#
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
#ZSH_THEME="bira"

#-----#
# TTY #
#-----#
if [ "$TERM" = "linux" ]; then
    setfont /usr/share/kbd/consolefonts/viscii10-8x16.psfu.gz
    echo -en "\e]P0161320" #black
    echo -en "\e]P86e6c7e" #darkgrey
    echo -en "\e]P1f28fad" #darkred
    echo -en "\e]P9f28fad" #red
    echo -en "\e]P2abe9b3" #darkgreen
    echo -en "\e]PAabe9b3" #green
    echo -en "\e]P3f5e0dc" #brown
    echo -en "\e]PBfae3b0" #yellow
    echo -en "\e]P496cdfb" #darkblue
    echo -en "\e]PC89dceb" #blue
    echo -en "\e]P5ddb6f2" #darkmagenta
    echo -en "\e]PDf5c2e7" #magenta
    echo -en "\e]P6b5e8e0" #darkcyan
    echo -en "\e]PEb5e8e0" #cyan
    echo -en "\e]P7c3bac6" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
    echo "This is TTY!"
fi

#----------#
# Start up #
#----------#
ufetch

#--------#
# Prompt #
#--------#
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %s(%F{yellow}%b%f)'
PS1='%F{magenta}[%~]%f$(tput bold) $vcs_info_msg_0_%F{red}&%f$(tput sgr0) '

#---------#
# Aliases #
#---------#
alias clr='echo > ~/.zsh_history && history -c && clear'
alias ga='git add .'
alias gco='gcc -o'
alias gitc='git commit -m'
alias gitpo='git push origin'
alias gpo='g++ -o'
alias grep='grep --color=auto'
alias l='exa -l -a'
alias la='exa -a'
alias ls='exa'
alias pac='pacman'
alias pacman='sudo pacman'
alias pca='pacman'
alias please='sudo'
alias pls='sudo'
alias sue='sudoedit'
alias update='paru -Syu'
alias ytwav='yt-dlp -x --audio-format wav'

#-------#
# Typso #
#-------#
alias pacmn='pacman'
alias pacmna='pacman'
alias pacmsn='pacman'
alias pamcan='pacman'
alias pamcna='pacman'
alias ppacman='pacman'

#-----------#
# Functions #
#-----------#
mkcd () { mkdir -p "$@" && cd "$@"; }
