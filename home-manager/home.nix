{ inputs, pkgs, ... }:
{
  imports = [
    ./modules
  ];

  home = {
    username = "evren";
    homeDirectory = "/home/evren";
  };

  home.packages = with pkgs; [
    btop
    tofi
    mako

    firefox
    vesktop
    cloudflare-warp
    prismlauncher


    vscode
    python3
    sqlite
    evtest

    gh

    neofetch
    cmatrix

    pavucontrol  # GUI audio control


    _1password-gui

    hyprpaper

    # fonts
    noto-fonts-emoji
    nerd-fonts.geist-mono
    nerd-fonts.fira-code
    fira-code-symbols

    # cursor
    bibata-cursors
  ];


  # get tofi to recognise spotify, that was a bit annoying
  # Not sure I need this, I think it works fine without,
  # was causing a problem. prolly useful just in case
  #
  #home.file.".local/share/applications/com.spotify.Client.desktop".source =
  #  "${pkgs.writeShellScriptBin "resolve-flatpak-path" ''
  #    echo /var/lib/flatpak/exports/share/applications/com.spotify.Client.desktop
  #  ''}";

  # alacritty config
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      general.import = [ pkgs.alacritty-theme.nightfox ];
      window.opacity = 0.8;
    };
  };

  # Bash aliases & functions
  programs.bash = {
    enable = true;
    initExtra = ''
      source /home/evren/flake/aliases.sh
    '';
  };

  home.stateVersion = "25.05";

}
