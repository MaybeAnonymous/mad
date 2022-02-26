# config.fish
#   __ _     _
#  / _(_)___| |__
# | |_| / __| '_ \
# |  _| \__ \ | | |
# |_| |_|___/_| |_|

# Variables {
    # EDITOR
    set -U EDITOR nvim
    # Other
    set -U MICRO_TRUECOLOR 1
    # Fish
        set fish_greeting
        # Colour
            # Pager
                set fish_pager_color_completion green # pager autocompletion
                set fish_pager_color_description yellow
            # Other
                set fish_color_comment black # comment
                set fish_color_error red # unknown command
                set fish_color_command green # known command
                set fish_color_autosuggestion brblack
                set fish_color_quote yellow
                set fish_color_param cyan
                set fish_color_operator brcyan
                set fish_color_end green
        # Other
# }

# TTY {
    if test "$TERM" = "linux" 
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
        set fish_greeting "This is TTY!"
    end
# }

# Functions {
    # Any
        function pacman; sudo pacman $argv; end
    # List
        function ls; exa $argv; end
        function l; exa -l -a $argv; end
        function la; exa -a $argv; end
    # Clearing
        function clr; builtin history --clear && clear; end
    # Memes / Unnecessary
        function lolsans; echo "'sup i'm sans undertale, i will your mom"; end
        function hello; echo "Hello, world!"; end
    # Spleling
        function pamcna; pacman $argv; end
        function pacmna; pacman $argv; end


    function fish_prompt -d "Write out the prompt"
        # This shows up as USER@HOST /home/user/ >, with the directory colored
        # $USER and $hostname are set by fish, so you can just use them
        # instead of using `whoami` and `hostname`
        printf '%s %s%s : ' (set_color blue) (prompt_pwd) (set_color red)
    end

    
# }

# Start up {
    ufetch # Run ufetch
    if status is-interactive
        # Commands to run in interactive sessions can go here
    end
# } 
