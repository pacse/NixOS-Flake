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
    gh

    _1password-gui

    hyprpaper

    # fonts
    noto-fonts-emoji
    nerd-fonts.geist-mono
    nerd-fonts.fira-code
    fira-code-symbols

    # cursor
    bibata-cursors

    # alacritty themes
    alacritty-theme
  ];


  # get tofi to recognise spotify,
  # that was a bit annoying
  home.file.".local/share/applications/com.spotify.Client.desktop".source =
    "${pkgs.writeShellScriptBin "resolve-flatpak-path" ''
      echo /var/lib/flatpak/exports/share/applications/com.spotify.Client.desktop
    ''}";

  # alacritty config
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      general.import = [ "${pkgs.alacritty-theme}/nightfox.toml" ];
      window.opacity = 0.8;
    };
  };

  home.stateVersion = "25.05";

}
