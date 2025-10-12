# all command shortcuts
# run with `just [command]`

alias r := rebuild
alias u := update
alias t := tidy


rebuild:
    sudo nixos-rebuild switch --flake /home/evren/flake#evren
    rm /home/evren/.cache/tofi-drun

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update
    just r
