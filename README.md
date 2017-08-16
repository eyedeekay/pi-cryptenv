Post-Installation Encrypted Home Environment
============================================

Post-Install script to set up encrypted sub-directories for a user's $HOME
directory. Disk encryption is awesome, but it only protects your data when the
disk is off. This provides additional protection for the files in your $HOME
directory, using the gocryptfs system to provide an encrypted FUSE volume, and
using xset to provide rules for when to force all the folders to unmount and
lock. By doing this, your personal documents can be kept safe even when your
laptop is powered on.

Big Red Warning Sign:
---------------------

Lots of programs will create working copies of files in directories other than
the one where you're editing the files. So if you've got files open, then there
just might be a copy in $HOME/.cache or someplace like that.

How it works:
=============

First, it works best if you do this on a freshly installed GNU/Linux system with
more-or-less common default folders in $HOME. To use it, you'll need to create
a configuration file called: /etc/default/home-defaults which contains the
following variables:

        #! /usr/bin/env sh
        export FIREAXE_documents_folder="$HOME/Documents"
        export FIREAXE_documents_cryptfolder="$HOME/.gocrypt/Documents"
        export FIREAXE_pictures_folder="$HOME/Pictures"
        export FIREAXE_pictures_cryptfolder="$HOME/.gocrypt/Pictures"
        export FIREAXE_music_folder="$HOME/Music"
        export FIREAXE_music_cryptfolder="$HOME/.gocrypt/Music"
        export FIREAXE_videos_folder="$HOME/Videos"
        export FIREAXE_videos_cryptfolder="$HOME/.gocrypt/Videos"
        export FIREAXE_notes_folder="$HOME/Notes"
        export FIREAXE_notes_cryptfolder="$HOME/.gocrypt/Notes"
        export FIREAXE_downloads_folder="$HOME/Downloads"
        export FIREAXE_downloads_cryptfolder="$HOME/.gocrypt/Downloads"
        export FIREAXE_messaging_folder="$HOME/Messaging"
        export FIREAXE_messaging_cryptfolder="$HOME/.gocrypt/Messaging"
        export FIREAXE_mail_folder="$HOME/Mail"
        export FIREAXE_mail_cryptfolder="$HOME/Mail"
        export FIREAXE_ratox_folder="$FIREAXE_messaging_folder/Tox"
        export FIREAXE_ratox_cryptfolder="$FIREAXE_messaging_folder/.gocrypt/Tox"
        export FIREAXE_maillink_folder="$FIREAXE_messaging_folder/Mail"
        export FIREAXE_desktop_folder="$HOME/Desktop"
        export FIREAXE_desktop_cryptfolder="$HOME/.gocrypt/Desktop"
        export FIREAXE_projects_folder="$HOME/Projects"
        export FIREAXE_projects_cryptfolder="$HOME/.gocrypt/Projects"

Or, at least some of them. You don't have to use them all. Each one has a
documents folder and a gocryptfs folder. Then there's a collection of wrapper
scripts.

**for example:** /usr/local/bin/unlock-Documents will do one of three things. If
there are already documents in an unencrypted $HOME/Documents directory, it will
move them to a temporary folder and will initialize the gocryptfs volume and
mount point. If there isn't anything in the $HOME/Documents folder then it will
just initialize the gocryptfs volume and mount point. If a gocryptfs volume has
already been initialized, it will prompt for the volume password.

