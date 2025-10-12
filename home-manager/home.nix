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
    spotify
    prismlauncher


    vscode
    python3
    gh

    _1password
    _1password-gui

    just

    hyprpaper

    # fonts
    noto-fonts-emoji
    nerd-fonts.geist-mono
    nerd-fonts.fira-code
    fira-code-symbols
  ];


  # waybar config
  programs.waybar.enable = true;


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

  # Mouse stuff
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
      };
      gtk3.extraConfig = {
        "gtk-cursor-theme-name" = "Bibata-Modern-Classic";
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-cursor-theme-name=Bibata-Modern-Classic
        '';
      };
    };


  home.stateVersion = "25.05";

}
