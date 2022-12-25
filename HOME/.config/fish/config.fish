
#   __ _     _         O
#  / _(_)___| |__ o
# | |_| / __| '_ \ <>< o O
# |  _| \__ \ | | |  O  o
# |_| |_|___/_| |_| ><>   .
# friendly interactive shell

#--------------#
# My Variables #
#--------------#
set EDITOR nvim

#----------------#
# Fish Variables #
#----------------#
set fish_color_autosuggestion -i brblack
set fish_color_command brgreen # known command
set fish_color_comment black # comment
set fish_color_end green
set fish_color_error -o brred # unknown command
set fish_color_operator brcyan
set fish_color_param normal
set fish_color_quote yellow
set fish_color_redirection -u brblue
set fish_greeting
set fish_pager_color_completion -o cyan # pager autocompletion
set fish_pager_color_description yellow

#----------------------------#
# Functions && Abbreviations #
#----------------------------#
abbr "clr" "builtin history --clear && clear"
abbr "l" "exa -l -a"
abbr "la" "exa -a"
abbr "ls" "exa"
abbr "pacman" "sudo pacman"
abbr "pacmna" "pacman"
abbr "pamcna" "pacman"
abbr "sue" "EDITOR=nvim sudoedit"
abbr "yt-wav" "yt-dlp -x --format wav" 
function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s %s%s%s%s ><> ' (set_color red) (prompt_pwd) (set_color yellow) (fish_vcs_prompt) (set_color -o brgreen)
end

#-------------------#
# Git Abbreviations #
#-------------------#
abbr "ga" "git add ."
abbr "gcm" "git commit -m"
abbr "gpu" "git push"

#----------#
# Start up #
#----------#
if status is-interactive
    if test "$TERM" != "linux" 
        ufetch
    end
    # Commands to run in interactive sessions can go here
end
