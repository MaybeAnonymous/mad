#             _|      _|  _|
#   _|_|_|  _|_|_|_|      _|    _|_|
# _|    _|    _|      _|  _|  _|_|_|_|
# _|    _|    _|      _|  _|  _|
#   _|_|_|      _|_|  _|  _|    _|_|_|
#       _| tiling window managers are great
#       _|


from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
#from libqtile.utils import guess_terminal

mod = "mod4"

#----------#
# Commands #
#----------#
terminal = "alacritty"
menu = "dmenu_run"
run = "rofi -show run -show-icons"
drun = "rofi -show drun -show-icons"
emoji = "rofi -show emoji"
fshot = "sh -c 'maim | xclip -selection clipboard -t image/png'"
shot = "sh -c 'maim -s -u | xclip -selection clipboard -t image/png'"
browser = "chromium"
files = "thunar"

#---------------#
# More Commands #
#---------------#
raisevol = "pamixer -i5"
lowervol = "pamixer -d5"
togglevol = "pamixer -t"
raisebr = "brightnessctl s 5%+"
lowerbr = "brightnessctl s 5%-"

import os
import subprocess

from libqtile import hook

#@hook.subscribe.startup_once
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    #------------------#
    # Window Switching #
    #------------------#
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    #-------#
    # Menus #
    #-------#
    Key([mod], "p", lazy.spawn(menu), desc="Launch dmenu"),
    Key([mod, "shift"], "d", lazy.spawn(drun)),
    Key([mod, "control"], "d", lazy.spawn(run)),
    Key([mod], "period", lazy.spawn(emoji)),

    #---------#
    # Layouts #
    #---------#
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "e", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    #-------------#
    # Screenshots #
    #-------------#
    Key([mod, "shift"], "z", lazy.spawn(fshot), desc="Take a full screenshot"),
    Key([mod, "shift"], "s", lazy.spawn(shot), desc="Take a selected screenshot"),

    #-----------#
    # Utilities #
    #-----------#
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "Return", lazy.spawn(files), desc="Launch file browser"),
    Key([mod], "c", lazy.spawn(browser), desc="Launch the web browser"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(raisevol)),
    Key([], "XF86AudioLowerVolume", lazy.spawn(lowervol)),
    Key([], "XF86AudioMute", lazy.spawn(togglevol)),
    Key([], "XF86MonBrightnessUp", lazy.spawn(raisebr)),
    Key([], "XF86MonBrightnessDown", lazy.spawn(lowerbr)),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

def init_basic_layout():
    return {
            "margin": 4,
            "border_width": 2,
            "border_focus": "#f2cdcd",
            "border_normal": "#6e6c7e"
    }
basic_layout = init_basic_layout()

layouts = [
    layout.RatioTile(**basic_layout),
    layout.Columns(**basic_layout),
    layout.Max(**basic_layout),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    layout.Bsp(**basic_layout),
    layout.Matrix(**basic_layout),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Jetbrains Mono",
    fontsize=14,
    padding=5,
)
extension_defaults = widget_defaults.copy()

flamingo = "#f2cdcd" # flamingo colour catppuccin

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(foreground=flamingo),
                widget.GroupBox(active="#f5e0dc", inactive="#6e6c7e", highlight_method="block", block_highlight_text_color="#161320", this_screen_border=flamingo, 
                    this_current_screen_border=flamingo, rounded=False, padding=6),
                widget.Prompt(foreground=flamingo),
                widget.WindowName(background=flamingo, foreground="#161320"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("| vol", foreground=flamingo),
                widget.Volume(foreground=flamingo),
                widget.TextBox("| BAT", foreground=flamingo),
                widget.Battery(charge_char="^", discharge_char="v", empty_char="x", notify_below=15, notification_timeout=5, update_interval=2,
                    foreground=flamingo),
                widget.TextBox("|", foreground=flamingo),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Clock(format="%Y-%m-%d %a %H:%M", foreground=flamingo),
                widget.QuickExit(foreground="#ff8888"),
                widget.Systray(),
            ],
            32,
            background="#161320",
            margin=[4,4,0,4],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=2,
    border_focus="#f2cdcd",
    border_normal="#6e6c7e",
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Be careful here, I got this from
# https://github.com/qtile/qtile/issues/1771
# It swallows! I don't know how but it works I guess
import psutil

@hook.subscribe.client_new
def _swallow(window):
    pid = window.window.get_net_wm_pid()
    ppid = psutil.Process(pid).ppid()
    cpids = {c.window.get_net_wm_pid(): wid for wid, c in window.qtile.windows_map.items()}
    for i in range(5):
        if not ppid:
            return
        if ppid in cpids:
            parent = window.qtile.windows_map.get(cpids[ppid])
            if parent.window.get_wm_class()[0] != "Alacritty":
                return
            parent.minimized = True
            window.parent = parent
            return
        ppid = psutil.Process(ppid).ppid()

@hook.subscribe.client_killed
def _unswallow(window):
    if hasattr(window, 'parent'):
        window.parent.minimized = False





# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
