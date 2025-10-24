#!/usr/bin/env bash

# shortenings
SPOTIFY_APP="com.spotify.Client"


# simple stuff aliases
alias cls="clear" # tehehe
alias sd="echo 'Shutting down . . .'; sudo shutdown -h now"
alias rs="echo 'Restarting . . .'; sudo shutdown -r now"

alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'


# nix aliases
rebuild() {
    if sudo nixos-rebuild switch --flake $HOME/flake#evren; then
        rm -f $HOME/.cache/tofi-drun
        echo "Rebuild successful :)"
    else
        echo "Rebuild failed!"
        return 1
    fi
}

alias tidy="nix-collect-garbage --delete-older-than 7d"
alias up="nix flake update && rebuild"
alias rb="rebuild"


# flatpak
flatpak_reinstall() {
    flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo

    # packages, hopefully won't end up with more here
    flatpak install flathub $SPOTIFY_APP -y
}

alias flatup="flatpak update -y"
alias flatre="flatpak_reinstall"
alias spotify="flatpak run $SPOTIFY_APP"


# git
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias grs='git restore --staged .'

gc() {
    if [ -z "$1" ]; then
        echo "Please provide a commit message."
        return 1

    else
        git commit -m "$1"
        git push
    fi
}

gd() {
    if [ -z "$1" ]; then
        git diff

    else
        git diff "$@"

    fi
}

ga() {
    if [ -z "$1" ]; then
        git add .

    else
        git add "$@"

    fi
}

gacp() {
    if [ -z "$1" ]; then
        echo "Please provide a commit message."
        return 1

    elif [ -z "$2" ]; then
        echo "Please provide a file to add."
        return 1

    else
        git add "${@:2}" # allow multiple files
        git commit -m "$1"
        git push
    fi
}
