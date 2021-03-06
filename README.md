# MaybeAnonymous' Dotfiles

### Hello! Backup your dotfiles, and make sure you know what you're doing!

<img src="https://user-images.githubusercontent.com/89218161/155859733-59d2fe19-0573-4080-94c4-768a75310412.png" alt="my profile picture" width="200" height="200">

i am not responsible for problems you may get while installing this, and know that this isn't complete

use **[ufetch](https://gitlab.com/jschx/ufetch)** *( or the one in usr/local/bin )*

**[zsh:](https://zsh.org)** plugins are [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) and [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

I recently switched to [fish](https://fishshell.com)

# Before installation

   >!C means closed source/proprietary!!
   >
   >;; means it is pre-installed and you should not worry
   >
   >|| means or
   >
   >\+ means and
   >
   >!w means Work In Progress


Also, remember that this is a work in progress, if anything important is missing, tell me!

I do not plan on making an installation script, and **make sure you know what you're doing.**

These dotfiles contain 2 shells + 4 window managers \( [zsh](https://www.zsh.org/) || [fish](https://fishshell.com) + [dwm](https://dwm.suckless.org) || [bspwm](https://github.com/baskerville/bspwm) || [qtile](https://www.qtile.org) || [i3-gaps](https://github.com/Airblader/i3) || [leftwm](https://leftwm.org) \)

Beware that all of them are configured for Xorg!

# Requirements

* **you must have [THIS](https://github.com/uditkarode/libxft-bgra) for DWM**

* **Shell:**

   >**zsh** + [oh-my-zsh](https://ohmyz.sh) || [fish](https://fishshell.com) + [bass;;](https://github.com/edc/bass)

* **Display Manager:**
   
   >[lightdm](https://github.com/canonical/lightdm) + [catppuccin gtk theme](https://github.com/catppuccin/gtk)  

* **Any WM:**

   >**Applets>** nm-applet, blueman-applet, xfce4-clipman
   >
   >**fonts>** [JetBrains Mono](https://www.jetbrains.com/lp/mono/), Siji, Powerline Fonts, [Symbols Nerd Fonts](https://www.nerdfonts.com/), Ubuntu Font
   >
   >[alacritty](https://alacritty.org)
   >
   >[brightnessctl](https://github.com/Hummer12007/brightnessctl)
   >
   >[conky](https://github.com/brndnmtthws/conky)
   >
   >[dmenu](https://tools.suckless.org/dmenu/) || \( [rofi](https://github.com/davatorium/rofi) + [emoji rofi](https://github.com/Mange/rofi-emoji) \)
   >
   >[maim](https://github.com/naelstrof/maim)
   >
   >[neovim](https://neovim.io/) + [vim-plug;;](https://github.com/junegunn/vim-plug) || [helix](https://helix-editor.com)
   >
   >[nitrogen](https://github.com/l3ib/nitrogen)
   >
   >[picom-jonaburg-fix](https://github.com/Arian8j2/picom-jonaburg-fix)
   >
   >[xsecurelock](https://github.com/google/xsecurelock)

* **[bspwm](https://github.com/baskerville/bspwm)** + [fork of bspswallow](https://github.com/MaybeAnonymous/bspswallow)

* **[dwm:](https://dwm.suckless.org)**

   > [flexipatch;;](https://github.com/bakkeby/dwm-flexipatch) + [finalizer;;](https://github.com/bakkeby/flexipatch-finalizer)

* **[qtile](https://www.qtile.org)**

* **[i3](https://github.com/Airblader/i3)**

* **[leftwm](https://leftwm.org)**

* **optional:**
   > [glava](https://github.com/jarcode-foss/glava), [neovide](https://github.com/neovide/neovide), [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium), [ufetch](https://gitlab.com/jschx/ufetch)

# After Installing

   >To configure **NeoVim** you must open it and run `:PlugInstall`
   >
   >To build **dwm, dmenu, and dwmblocks** you must run `cd ~/.config/dwm && sudo make install; cd ~/.config/dmenu && sudo make install; cd ~/.config/dwmblocks && sudo make install`
   >
   >To apply the **leftwm** theme you should run `ln -s ~/.config/leftwm/themes/custom ~/.config/leftwm/themes/current`, [see this](https://github.com/leftwm/leftwm#theming)
   >
   >Have fun!

# More Info

   >colourscheme: [catppuccin](https://github.com/catppuccin/catppuccin)


# bspwm:
![image](https://user-images.githubusercontent.com/89218161/152661623-bfa0f2dc-43dc-46a2-85b0-fa6ce60b243a.png)

# dwm:

i have not taken a picture yet as i am procastinating

# qtile:

![image](https://user-images.githubusercontent.com/89218161/156469155-253b4e20-133d-499c-b425-fc39c6aeb7fa.png)

---

# wallpaper

<img src="HOME/Pictures/Backgrounds/wallpaper.png">

<img src="HOME/Pictures/Backgrounds/wallpaper-alt.png">

Text is in [Comic Neue](http://www.comicneue.com/)



