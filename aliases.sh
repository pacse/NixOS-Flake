#!/usr/bin/env bash

# simple stuff aliases
alias cls="clear"; # tehehe
alias shutdown="sudo shutdown -h now";
alias restart="sudo shutdown -r now";

alias ll='ls -la --color=auto';
alias la='ls -A --color=auto';


# nix aliases
rebuild() {
    sudo nixos-rebuild switch --flake /home/evren/flake#evren \
        && rm /home/evren/.cache/tofi-drun;
}

alias tidy="nix-collect-garbage --delete-older-than 7d";
alias update="nix flake update && rebuild";


# flatpak
alias flatup="flatpak update -y";
alias spotify="flatpak run com.spotify.Client";

flatpak_reinstall() {
    flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo;

    # packages, hopefully won't end up with more here
    flatpak install flathub com.spotify.Client -y;
}

# git
alias gs='git status';
alias gp='git pull';

gc() {
    git commit -m "$1";
}
