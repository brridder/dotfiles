# Configuration Files

This repository contains various configuration files that are shared between
multiple systems.

Installation is straightforward; symbolic links are created in the current
user's home directory for each file tracked. Existing symbolic links will be
overwritten; however, if a normal file or directory exists a warning will be
issued and no action will be taken.

    % git clone git://github.com/brridder/dotfiles.git && cd dotfiles
    % sh install.sh

Relies on updated versions of:
* ctags
* vim

Need to run installation commands for `command-t` explicitly.
<p align="center">
    <img src="https://raw.githubusercontent.com/sstallion/dotfiles/master/emacs.jpg"/>
</p>
