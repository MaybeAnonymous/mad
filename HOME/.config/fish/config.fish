
#   __ _     _         O
#  / _(_)___| |__ o
# | |_| / __| '_ \ <>< o O
# |  _| \__ \ | | |  O  o
# |_| |_|___/_| |_| ><>   .
# friendly interactive shell

# > Variables
set EDITOR nvim

# > Fish Variables
set fish_color_autosuggestion -i brblack
set fish_color_command brgreen # Known command
set fish_color_comment brblack # Comment
set fish_color_end green
set fish_color_error -o brred # Unknown command
set fish_color_operator brcyan
set fish_color_param normal
set fish_color_quote yellow
set fish_color_redirection -u brblue
set fish_greeting
set fish_pager_color_completion -o cyan # Pager autocompletion
set fish_pager_color_description yellow

# > Abbreviations
abbr "clr" "builtin history --clear && clear"
abbr "l" "exa -l -a"
abbr "la" "exa -a"
abbr "ls" "exa"

# >> Pacman abbreviations
#   These are for Arch-based distros only.
abbr "pacman" "sudo pacman"
abbr "pacmna" "sudo pacman"
abbr "pamcna" "sudo pacman"

# >> Git Abbreviations
abbr "ga" "git add ."
abbr "gcm" "git commit -m"
abbr "gpu" "git push"

# > Prompt
function fish_prompt -d "Write out the prompt"
    printf '%s %s%s%s%s ><> ' (set_color red) (prompt_pwd) (set_color blue) (fish_vcs_prompt) (set_color -o bryellow)
end


# > Start up
# If in interactive session:
if status is-interactive
    # If not in TTY:
    if test "$TERM" != "linux"
        ufetch
    end
end
